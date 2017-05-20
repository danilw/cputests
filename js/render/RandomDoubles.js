RandomDoubles.prototype.values = null;

RandomDoubles.prototype.index;


function RandomDoubles() {


    if (this.values == null) {
        this.values = new Array(70001);
        for (var i = this.values.length - 1; i >= 0; i--) {
            this.values[i] = Math.random();

        }
    }
    this.index = (Math.random() * this.values.length);


}
RandomDoubles.prototype.random = function () {
    if (this.index >= this.values.length) {
        this.index = 0;
    }
    return this.values[(this.index++ | 0)];
}

