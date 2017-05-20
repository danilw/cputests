RandomRays.prototype.rays = null;

RandomRays.prototype.index;

function RandomRays() {



    if (this.rays == null) {
        this.rays = createArray(24001, 3);
        for (var i = this.rays.length - 1; i >= 0; i--) {
            do {
                for (var j = 0; j < 3; j++) {
                    this.rays[i][j] = 2.0 * Math.random() - 1.0;
                }
            } while (Vec.magnitude2(this.rays[i]) > 1.0);
            Vec.normalize(this.rays[i]);
        }
    }
    this.index = (Math.random() * this.rays.length);

}
RandomRays.prototype.randomRay = function (ray) {
    if (this.index >= this.rays.length) {
        this.index = 0;
    }
    Vec.assign(ray, this.rays[(this.index++ | 0)]);
}