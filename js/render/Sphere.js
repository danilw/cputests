Sphere.prototype.center = new Array(3);
Sphere.prototype.radius = 1;
Sphere.prototype.material;

function Sphere(x, y, z, radius, material) {

    this.center = new Array(3);
    Vec.assign(this.center, x, y, z);
    this.radius = radius;
    this.material = material;
}
Sphere.prototype.intersect = function (
        o, d, primaryRay, maxTime,
        temps,
        intersection) {
    Vec.subtract(temps[0], o, this.center);
    var B = 2.0 * Vec.dot(d, temps[0]);

    var C = Vec.magnitude2(temps[0]) - this.radius * this.radius;

    var square = B * B - 4 * C;

    if (square >= 0) {
        var js_sqrt = Math.sqrt(square);
        var t1 = 0.5 * (-B - js_sqrt);
        var t2 = 0.5 * (-B + js_sqrt);
        var intersected = false;

        if (t1 >= Main.EPSILON && t1 <= maxTime) {
            intersected = true;
            intersection.time = t1;

        } else if (t2 >= Main.EPSILON && t2 <= maxTime) {
            intersected = true;
            intersection.time = t2;
        }
        if (primaryRay && intersected) {
            Vec.ray(intersection.hit, o, d, intersection.time);
            Vec.constructUnitVector(intersection.normal, intersection.hit, this.center);
            intersection.material = this.material;
        }
        if (intersected) {
            return true;
        }
    }

    return false;
}