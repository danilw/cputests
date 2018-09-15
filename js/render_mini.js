	const {sqrt, max, min, abs, round, floor} = Math;
	class Vec {

		constructor(x, y, z) {
			this.x = x
			this.y = y
			this.z = z
			this.length = sqrt(x * x + y * y + z * z)
		}
		dotProduct(v) {
            return this.x * v.x + this.y * v.y + this.z * v.z
        }

        add(v) {
            return new Vec(this.x + v.x, this.y + v.y, this.z + v.z)
        }

        subtract(v) {
            return new Vec(this.x - v.x, this.y - v.y, this.z - v.z)
        }

        multiply(a) {
            return new Vec(this.x * a, this.y * a, this.z * a)
        }

        normalise() {
            const a = (1.0 / this.length)
            return new Vec(this.x * a, this.y * a, this.z * a)
        }

        crossProduct(v) {
            return new Vec(this.y * v.z - this.z * v.y, this.z * v.x - this.x * v.z, this.x * v.y - this.y * v.x)
        }
	}



function Gg2() {

}

Gg2.key_1 = 49;
Gg2.key_2 = 50;
Gg2.key_Q = 113;
Gg2.key_E = 101;
Gg2.key_W = 119;
Gg2.key_A = 97;
Gg2.key_S = 115;
Gg2.key_D = 100;

Gg2.speed = 0.12;
Gg2.leftm = 0;
Gg2.rightm = 0;
Gg2.zz = 0;
Gg2.wlight = [0, 0, 0];
Gg2.wlightstate = [false, false, false];
Gg2.wlightprgrs = [false, false, false];
Gg2.maxinverval = 3.5;
Gg2.disable_ani = false; //set true to disable animation
Gg2.inverval = Gg2.maxinverval;
Gg2.invervalt = [Gg2.maxinverval, Gg2.maxinverval, 1];
Gg2.invert = false;

Gg2.currcolor = [true, true, false];

Gg2.lastatime = 1000;
Gg2.viewWidth = 300;
Gg2.viewHeight = 200;
Gg2.viewScaleX = 3;
Gg2.viewScaleY = 3;

Gg2.mat_blue = 0x0000ff;
Gg2.mat_yellow = 0xffff00;

Gg2.pixels = new Array(Gg2.viewWidth * Gg2.viewHeight);

Gg2.frameRateSmoothing = 1.0;
Gg2.milsPerSecond = 1000;


Gg2.maxViewDist = 100;
Gg2.primaryRayStepThreshold = 0.01;
Gg2.noIntersection = -1.0;

Gg2.scene = 1;

Gg2.keyDown = new Array(65536);

Gg2.frame_timetocalc = 0;
Gg2.min_timetocalc = 1000000000;
Gg2.max_timetocalc = 0;

Gg2.getDistToSphere = function (pt, radius) {
    return pt.length - radius;
}

Gg2.getDistToBox = function (pt, halfSize) {
    return new Vec(Math.max(0, Math.abs(pt.x) - halfSize.x),
            Math.max(0, Math.abs(pt.y) - halfSize.y),
            Math.max(0, Math.abs(pt.z) - halfSize.z)).length;
}

Gg2.tilePrimitive = function (pt, tileSize) {

    var halfTileSize = tileSize / 2.0;
    return new Vec(pt.x % tileSize - halfTileSize,
            pt.y % tileSize - halfTileSize,
            pt.z % tileSize - halfTileSize);
}

Gg2.getSphereNormal = function (pt) {
    return pt.normalise();
}

Gg2.worldGetDist = function (pt) {

    var tileSize = 3.0;
    pt = Gg2.tilePrimitive(pt, tileSize);

    switch (Gg2.scene) {
        case 1:
            return Gg2.getDistToSphere(pt, 1);
        case 2:
            return Gg2.getDistToBox(pt, new Vec(0.5, 0.5, 0.5));
        default:
            return Gg2.getDistToSphere(pt, 1);
    }
}

Gg2.worldGetNormal = function (pt) {

    var tileSize = 3.0;
    pt = Gg2.tilePrimitive(pt, tileSize);
    return Gg2.getSphereNormal(pt);
}

Gg2.worldIntersect = function (rayStart, rayDir, maxDist, rayStepThreshold) {

    var pt = rayStart;
    var rayLen = 0.0;

    var dist;

    while ((dist = Gg2.worldGetDist(pt)) > rayStepThreshold) {
        rayLen += dist;
        if (rayLen > maxDist) {
            rayLen = Gg2.noIntersection;
            break;
        }

        pt = pt.add(rayDir.multiply(dist));
    }

    return rayLen;
}

Gg2.putpixel = function (x, y, color) {
    if (x < 0 || x >= Gg2.viewWidth || y < 0 || y >= Gg2.viewHeight) {
        return;
    }

    Gg2.pixels[y * Gg2.viewWidth + x] = color;
}

Gg2.start = function () {
    //while (true)
    Gg2.run();
}
var numFrames = 0;
var fps = 0;
var lastFpsTime = 0;
Gg2.run = function () {
    Gg2.frame_timetocalc = Date.now();

    Gg2.lastatime += Gg2.speed;


    var moveDir = new Vec(1.5, Gg2.zz, 0.8);
    var cameraPos = moveDir.multiply(Gg2.lastatime);
    var cameraLookAt = cameraPos.add(moveDir).add(new Vec(0 + Gg2.rightm, 0.8 - Gg2.zz * 500, 0.5 + Gg2.leftm));
    var cameraUp = new Vec(0 + Gg2.rightm / 3, 1.0, 0 + Gg2.leftm / 3);
    var cameraForward = cameraLookAt.subtract(cameraPos).normalise();
    var cameraRight = cameraForward.crossProduct(cameraUp);
    cameraUp = cameraRight.crossProduct(cameraForward);

    if (!(Gg2.wlightprgrs[0] || Gg2.wlightprgrs[1] || Gg2.wlightprgrs[2])) {
        Gg2.wlightprgrs[0] = true;
    }
    for (var ij = 0; ij < 3; ij++) {
        if (Gg2.wlightprgrs[ij]) {
            if (Gg2.wlightstate[ij]) {
                Gg2.wlight[ij] -= 0.05;
                if (Gg2.wlight[ij] < 0.1) {
                    Gg2.wlight[ij] = 0.05;
                    Gg2.wlightstate[ij] = false;
                    Gg2.wlightprgrs[ij] = false;
                    if (ij != 2) {
                        Gg2.wlightprgrs[ij + 1] = true;
                    }
                }
            } else {
                Gg2.wlight[ij] += 0.05;
                if (Gg2.wlight[ij] > 1) {
                    Gg2.wlight[ij] = 1;
                    Gg2.wlightstate[ij] = true;
                    Gg2.wlightprgrs[ij] = false;
                    if (ij != 2) {
                        Gg2.wlightprgrs[ij + 1] = true;
                    }
                }
            }
            break;
        }
    }
    if (!Gg2.disable_ani) {
        if (Gg2.inverval + 0.05 > Gg2.maxinverval) {
            Gg2.inverval = Gg2.maxinverval;
            Gg2.invert = true;
        }
        if (Gg2.invert) {
            Gg2.inverval -= 0.05;
            if (Gg2.currcolor[0] && Gg2.currcolor[1]) {
                Gg2.invervalt[0] -= 0.05;
                Gg2.invervalt[2] += 0.05;
            } else if (Gg2.currcolor[1] && Gg2.currcolor[2]) {
                Gg2.invervalt[1] -= 0.05;
                Gg2.invervalt[0] += 0.05;
            } else if (Gg2.currcolor[2] && Gg2.currcolor[0]) {
                Gg2.invervalt[2] -= 0.05;
                Gg2.invervalt[1] += 0.05;
            }
        } else {
            Gg2.inverval += 0.05;
            if (Gg2.currcolor[0] && Gg2.currcolor[1]) {
                Gg2.invervalt[0] += 0.05;
                Gg2.invervalt[1] -= 0.05;
            } else if (Gg2.currcolor[1] && Gg2.currcolor[2]) {
                Gg2.invervalt[1] += 0.05;
                Gg2.invervalt[2] -= 0.05;
            } else if (Gg2.currcolor[2] && Gg2.currcolor[0]) {
                Gg2.invervalt[2] += 0.05;
                Gg2.invervalt[0] -= 0.05;
            }
        }
        if (Gg2.inverval - 0.04 > 1) {

        } else {
            Gg2.invert = false;
            Gg2.inverval = 1;

            if (Gg2.currcolor[0] && Gg2.currcolor[1]) {
                Gg2.inverval = Gg2.maxinverval;
                Gg2.currcolor[0] = false;
                Gg2.currcolor[2] = true;
            } else if (Gg2.currcolor[1] && Gg2.currcolor[2]) {
                Gg2.inverval = Gg2.maxinverval;
                Gg2.currcolor[1] = false;
                Gg2.currcolor[0] = true;
            } else if (Gg2.currcolor[2] && Gg2.currcolor[0]) {
                Gg2.inverval = Gg2.maxinverval;
                Gg2.currcolor[2] = false;
                Gg2.currcolor[1] = true;
            }
        }
    } else
        Gg2.inverval = Gg2.invervalt[0] = Gg2.invervalt[1] = Gg2.invervalt[2] = 1;

    for (var row = 0; row < Gg2.viewHeight; row++) {
        for (var col = 0; col < Gg2.viewWidth; col++) {

            var xFrac = (col - Gg2.viewWidth * 0.5) / Gg2.viewWidth;
            var yFrac = (row - Gg2.viewHeight * 0.5) / Gg2.viewWidth;
            var zFrac = 0.5;

            var rayStart = cameraPos;

            var rayDir = cameraRight.multiply(xFrac).add(cameraUp.multiply(yFrac)).add(cameraForward.multiply(zFrac));
            rayDir = rayDir.normalise();
            var depth = Gg2.worldIntersect(rayStart, rayDir, Gg2.maxViewDist, Gg2.primaryRayStepThreshold);

            if (depth == Gg2.noIntersection) {
                if (Gg2.scene == 2) {
                    Gg2.putpixel(col, row, Gg2.mat_yellow);
                } else {
                    Gg2.putpixel(col, row, Gg2.mat_blue);
                }
            } else {

                var dirToLight = new Vec(-1 - Gg2.wlight[1] * 2, 0.5 - Gg2.wlight[1] * 2, -0.7 - Gg2.wlight[2] * 2).normalise();
                var shadowFactor = Gg2.noIntersection;

                var pt = rayStart.add(rayDir.multiply(depth));
                var normal = Gg2.worldGetNormal(pt);


                if (shadowFactor == Gg2.noIntersection) {
                    shadowFactor = 1.0;
                } else {
                    shadowFactor = 1.0 - shadowFactor;
                }

                var normalisedIntensity = Math.min(Math.max(0.0, normal.dotProduct(dirToLight)) * shadowFactor, 1.0);
                var intensity = Math.round(normalisedIntensity * 255.0);

                var intensityr = Math.round(intensity * Gg2.invervalt[0]);
                var intensityg = Math.round(intensity * Gg2.invervalt[1]);
                var intensityb = Math.round(intensity * Gg2.invervalt[2]);
                if (Gg2.scene == 2) {
                    var depthByte = 0;
                    var invMaxViewDist = 1.0 / Gg2.maxViewDist;
                    if (depth != Gg2.noIntersection) {
                        depthByte = ((1.0 - depth * invMaxViewDist) * 255.0);
                        Gg2.putpixel(col, row, (Math.round(depthByte - intensity * 0.5) << 16) + (Math.round(depthByte - intensity * 0.5) << 8) + Math.round(depthByte));
                    }
                } else {

                    Gg2.putpixel(col, row, ((intensityr) << 16) + ((intensityg) << 8) + intensityb);

                }
            }
        }
    }

    Gg2.frame_timetocalc = Date.now() - Gg2.frame_timetocalc;
    if (Gg2.max_timetocalc < Gg2.frame_timetocalc) {
        Gg2.max_timetocalc = Gg2.frame_timetocalc;
    }
    if (Gg2.min_timetocalc > Gg2.frame_timetocalc) {
        Gg2.min_timetocalc = Gg2.frame_timetocalc;
    }
    numFrames++;
    var delta = (Date.now() - lastFpsTime) / Gg2.milsPerSecond;
    if (delta > Gg2.frameRateSmoothing) {
        fps = Math.round(numFrames / delta);
        numFrames = 0;
        lastFpsTime = Date.now();
    }
    //console.log("fps:" + fps + " , timetocalc:" + Gg2.frame_timetocalc + " ,  max:" + Gg2.max_timetocalc + " , min:" + Gg2.min_timetocalc);


}

Gg2.start();
