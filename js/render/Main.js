
Main.prototype.scene = [
    new Ground(25, Materials.YELLOW_MATTE, Materials.GREEN_MATTE),
    new Sphere(0, 0, 0, 1E6, Materials.BLUE_MATTE),
    new Sphere(0, 40, 0, 40, Materials.MIRROR),
    new Sphere(-80, 40, 0, 40, Materials.RED_METAL),
    new Sphere(80, 40, 0, 40, Materials.YELLOW_METAL),
];


function Main() {

    //private int runningCount;
    Main.prototype.rowIndex = 0;




    this.render = function () {

        var u = new Array(3);
        var v = new Array(3);
        var w = new Array(3);
        var c = new Array(3);
        var p = new Array(3);
        var d = new Array(3);
        var l = new Array(3);
        var l2 = new Array(3);
        var light = new Array(3);
        var r = new Array(3);
        var ar = new Array(3);
        var f = new Array(3);
        var o = new Array(3);
        var temps = createArray(16, 3);
        var intersection = new Intersection();
        var bestIntersection = new Intersection();

        Vec.constructUnitVector(w, Main.EYE, Main.LOOK);
        Vec.ray(c, Main.EYE, w, -Main.DISTANCE_TO_VIRTUAL_SCREEN);
        Vec.onb(u, v, w);

        var randomRays = new RandomRays();
        var randomDoubles_js = new RandomDoubles();
        var pixels = new Array(Main.WIDTH);
        var pixel = new Array(3);
        while (true) {

            var y = this.getNextRowIndex();
            if (y >= Main.HEIGHT) {
                return;
            }

            for (var x = 0; x < Main.WIDTH; x++) {

                Vec.assign(pixel, 0, 0, 0);

                for (var i = 0; i < Main.SQRT_SAMPLES; i++) {
                    var b = y + Main.INVERSE_SQRT_SAMPLES * i;
                    if (Main.SQRT_SAMPLES == 1) {
                        b += 0.5;
                    } else {
                        b += randomDoubles_js.random();
                    }


                    b = Main.VIRTUAL_SCREEN_RATIO * (Main.HALF_HEIGHT - b);

                    for (var j = 0; j < Main.SQRT_SAMPLES; j++) {
                        var a = x + Main.INVERSE_SQRT_SAMPLES * j;
                        if (Main.SQRT_SAMPLES == 1) {
                            a += 0.5;
                        } else {
                            a += randomDoubles_js.random();
                        }
                        var a = Main.VIRTUAL_SCREEN_RATIO * (a - Main.HALF_WIDTH);

                        Vec.map(p, c, u, v, a, b);

                        Vec.constructUnitVector(d, p, Main.EYE);

                        Vec.assign(o, Main.EYE);
                        Vec.assign(f, Main.RADIANCE_SCALE, Main.RADIANCE_SCALE, Main.RADIANCE_SCALE);
                        var reflectionLoop = true;
                        for (var m = 0; (m < Main.MAX_DEPTH) && (reflectionLoop); m++) {

                            var hit = false;
                            bestIntersection.time = Number.POSITIVE_INFINITY;
                            for (var k = this.scene.length - 1; k >= 0; k--) {
                                var object = this.scene[k];
                                if (object.intersect(o, d, true, Number.POSITIVE_INFINITY,
                                        temps, intersection)) {

                                    if (intersection.time < bestIntersection.time) {
                                        hit = true;

                                        bestIntersection.time = intersection.time;
                                        Vec.assign(bestIntersection.normal, intersection.normal);
                                        Vec.assign(bestIntersection.hit, intersection.hit);
                                        bestIntersection.material = intersection.material;
                                    }
                                }
                            }

                            if (hit) {

                                if (Vec.dot(bestIntersection.normal, d) >= 0) {
                                    Vec.negate(bestIntersection.normal);
                                }

                                if (bestIntersection.material.ambientWeight > 0) {
                                    var ambientPercent = 1.0;

                                    if (Main.AMBIENT_OCCLUSION
                                            && bestIntersection.material.ambientOcclusionPercent > 0) {

                                        randomRays.randomRay(ar);
                                        if (Vec.dot(ar, bestIntersection.normal) < 0) {
                                            Vec.negate(ar);
                                        }

                                        for (var k = this.scene.length - 1; k >= 0; k--) {
                                            var object = this.scene[k];
                                            if (object.intersect(bestIntersection.hit, ar, false,
                                                    Main.MAX_OCCLUSION_DISTANCE, temps, intersection)) {
                                                ambientPercent = 1.0
                                                        - bestIntersection.material.ambientOcclusionPercent;
                                                break;
                                            }
                                        }
                                    }

                                    for (var k = 0; k < 3; k++) {
                                        pixel[k] += bestIntersection.material.ambientWeight
                                                * bestIntersection.material.diffuseColor[k]
                                                * f[k]
                                                * Main.AMBIENT_COLOR[k]
                                                * ambientPercent;


                                    }
                                }

                                Vec.assign(light, Main.LIGHT);
                                if (Main.LIGHT_RADIUS > 0) {
                                    Vec.subtract(l2, bestIntersection.hit, light);
                                    randomRays.randomRay(l);
                                    if (Vec.dot(l, l2) < 0) {
                                        Vec.negate(l);
                                    }
                                    Vec.ray(light, Main.LIGHT, l, Main.LIGHT_RADIUS);
                                }
                                Vec.constructUnitVector(l, light, bestIntersection.hit);

                                var nDotl = Vec.dot(l, bestIntersection.normal);
                                if (nDotl > 0) {

                                    var maxTime = Vec.distance(bestIntersection.hit, light);

                                    var illuminated = true;
                                    for (var k = this.scene.length - 1; k >= 0; k--) {
                                        var object = this.scene[k];
                                        if (object.intersect(bestIntersection.hit, l, false,
                                                maxTime, temps, intersection)) {
                                            illuminated = false;
                                            break;
                                        }
                                    }

                                    if (illuminated) {


                                        if (bestIntersection.material.diffuseWeight > 0) {
                                            for (var k = 0; k < 3; k++) {
                                                pixel[k] += bestIntersection.material.diffuseWeight
                                                        * bestIntersection.material.diffuseColor[k]
                                                        * f[k]
                                                        * Main.LIGHT_COLOR[k]
                                                        * nDotl;

                                            }
                                        }

                                        if (bestIntersection.material.specularWeight > 0) {

                                            Vec.scale(r, bestIntersection.normal, 2.0 * nDotl);
                                            Vec.subtract(r, l);
                                            var rDotMd = Vec.dotNegative(r, d);
                                            if (rDotMd > 0) {
                                                for (var k = 0; k < 3; k++) {
                                                    pixel[k] += bestIntersection.material.specularWeight
                                                            * Math.pow(rDotMd,
                                                                    bestIntersection.material.shininess)
                                                            * f[k]
                                                            * Main.LIGHT_COLOR[k]
                                                            * nDotl
                                                            * bestIntersection.material.highlightColor[k];

                                                }
                                            }
                                        }
                                    }
                                }

                                if (bestIntersection.material.reflectionWeight > 0) {
                                    var aboveMinColorIntensity = false;
                                    for (var k = 0; k < 3; k++) {
                                        f[k] *= bestIntersection.material.reflectionWeight
                                                * bestIntersection.material.reflectionColor[k];
                                        if (f[k] >= Main.MIN_COLOR_INTENSITY) {
                                            aboveMinColorIntensity = true;
                                        }
                                    }
                                    if (!aboveMinColorIntensity) {
                                        reflectionLoop = false;
                                        break;
                                    }

                                    Vec.ray(d, bestIntersection.normal,
                                            -2 * Vec.dot(bestIntersection.normal, d));
                                    Vec.assign(o, bestIntersection.hit);
                                } else {
                                    reflectionLoop = false;
                                    break;
                                }

                            } else {
                                reflectionLoop = false;
                                break;
                            }
                        }
                    }
                }

                var value = 0;
                for (var i = 0; i < 3; i++) {
                    var intensity = Math.round(255 * Math.pow(pixel[i] * Main.INVERSE_SAMPLES, Main.INVERSE_GAMMA));
                    if (intensity < 0) {
                        intensity = 0;
                    } else if (intensity > 255) {
                        intensity = 255;
                    }
                    value <<= 8;

                    value |= intensity;

                }

                pixels[x] = value;
            }

            this.rowCompleted(y, pixels);
        }
    }

    this.getNextRowIndex = function () {
        return this.rowIndex++;
    }








    this.rowCompleted = function (rowIndex, pixels) {

        for (var i = 0; i < Main.WIDTH; i++) {
            this.image.fillStyle = "rgb("+(pixels[i] >> 16)+","+ ((pixels[i] >> 8)-((pixels[i] >> 16) << 8))+","+ ((pixels[i])-((pixels[i] >> 8) << 8))+")";
            this.image.fillRect(i,rowIndex, 1, 1);
        }
    }


}

Main.SQRT_SAMPLES = 16;

Main.IMAGE_SCALE = 3;
Main.WIDTH = 1920 / Main.IMAGE_SCALE;
Main.HEIGHT = 1080 / Main.IMAGE_SCALE;
Main.VIRTUAL_SCREEN_WIDTH = 100;

Main.EYE = [0, 40, 250];
Main.LOOK = [0, 40, 0];
Main.LIGHT = [500, 500, 500];
Main.LIGHT_COLOR = [1, 1, 1];
Main.LIGHT_RADIUS = 50.0;
Main.AMBIENT_COLOR = [1, 1, 1];
Main.DISTANCE_TO_VIRTUAL_SCREEN = Main.VIRTUAL_SCREEN_WIDTH;

Main.RENDER_IN_WINDOW = true;

Main.GAMMA = 2.2;

Main.SAMPLES = Main.SQRT_SAMPLES * Main.SQRT_SAMPLES;
Main.INVERSE_SQRT_SAMPLES = 1.0 / Main.SQRT_SAMPLES;
Main.INVERSE_SAMPLES = 1.0 / Main.SAMPLES;
Main.INVERSE_GAMMA = 1.0 / Main.GAMMA;
Main.HALF_WIDTH = Main.WIDTH / 2.0;
Main.HALF_HEIGHT = Main.HEIGHT / 2.0;
Main.VIRTUAL_SCREEN_RATIO = Main.VIRTUAL_SCREEN_WIDTH / Main.WIDTH;

Main.AMBIENT_OCCLUSION = true;
Main.MAX_OCCLUSION_DISTANCE = 100.0;
Main.RADIANCE_SCALE = 1.0;
Main.EPSILON = 1E-6;
Main.MAX_DEPTH = 10;
Main.MIN_COLOR_INTENSITY = 1.0 / 256.0;

Main.SECOND_MILLIS = 1000;
Main.MINUTE_MILLIS = 60 * Main.SECOND_MILLIS;
Main.HOUR_MILLIS = 60 * Main.MINUTE_MILLIS;

Main.prototype.image = null;

Main.prototype.launch = function () {
    this.render();
}
