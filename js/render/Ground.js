function Ground(squareSide, material1, material2) {


    this.squareSize = squareSide;
    this.material1 = material1;
    this.material2 = material2;

    this.inverseSquareSize = 1.0 / this.squareSize;

}
Ground.prototype.squareSize;
Ground.prototype.inverseSquareSize;
Ground.prototype.material1;
Ground.prototype.material2;
Ground.prototype.intersect = function (o, d, primaryRay,
        maxTime, temps, intersection) {

    if (d[1] == 0) {
        return false;
    }

    intersection.time = -o[1] / d[1];

    if (intersection.time >= Main.EPSILON && intersection.time <= maxTime) {

        if (!primaryRay) {
            return true;
        }
        Vec.assign(intersection.hit, o[0] + d[0] * intersection.time, 0,
                o[2] + d[2] * intersection.time);
        Vec.assign(intersection.normal, 0, 1, 0);

        var a = (Math.floor(intersection.hit[0] * this.inverseSquareSize)) & 1;
        var b = (Math.floor(intersection.hit[2] * this.inverseSquareSize)) & 1;
        intersection.material = (((a + b) & 1) == 0) ? this.material1 : this.material2;

        return true;
    }

    return false;
}