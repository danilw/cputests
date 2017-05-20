

function  Vec() {

}

Vec.TINY = 1e-9;

// a += b
addMethod(Vec, "add", function (a, b) {
    for (var i = 0; i < 3; i++) {
        a[i] += b[i];
    }
})

// a = b + c
addMethod(Vec, "add", function (a, b, c) {
    for (var i = 0; i < 3; i++) {
        a[i] = b[i] + c[i];
    }
})

// a -= b
addMethod(Vec, "subtract", function (a, b) {
    for (var i = 0; i < 3; i++) {
        a[i] -= b[i];
    }
})

// a = b - c
addMethod(Vec, "subtract", function (a, b, c) {
    for (var i = 0; i < 3; i++) {
        a[i] = b[i] - c[i];
    }
})

// a *= s
addMethod(Vec, "scale", function (a, s) {
    for (var i = 0; i < 3; i++) {
        a[i] *= s;
    }
})

// a = b * s
addMethod(Vec, "scale", function (a, b, s) {
    for (var i = 0; i < 3; i++) {
        a[i] = b[i] * s;
    }
})

// a /= s
addMethod(Vec, "divide", function (a, s) {
    var inverse = 1.0 / s;
    for (var i = 0; i < 3; i++) {
        a[i] *= inverse;
    }
})

// a = b / s
addMethod(Vec, "divide", function (a, b, s) {
    var inverse = 1.0 / s;
    for (var i = 0; i < 3; i++) {
        a[i] = b[i] * inverse;
    }
})

// a = b
addMethod(Vec, "assign", function (a, b) {
    for (var i = 0; i < 3; i++) {
        a[i] = b[i];
    }
})

// a = (x, y, z)
addMethod(Vec, "assign", function (a, x, y, z) {
    a[0] = x;
    a[1] = y;
    a[2] = z;
})

// |v|
addMethod(Vec, "magnitude", function (v) {
    return Math.sqrt(v[0] * v[0] + v[1] * v[1] + v[2] * v[2]);
})

// |v|^2
addMethod(Vec, "magnitude2", function (v) {
    return v[0] * v[0] + v[1] * v[1] + v[2] * v[2];
})

// |a - b|
addMethod(Vec, "distance", function (a, b) {
    var x = a[0] - b[0];
    var y = a[1] - b[1];
    var z = a[2] - b[2];
    return Math.sqrt(x * x + y * y + z * z);
})

// |a - b|^2
addMethod(Vec, "distance2", function (a, b) {
    var x = a[0] - b[0];
    var y = a[1] - b[1];
    var z = a[2] - b[2];
    return x * x + y * y + z * z;
})

// a = a / |a|
addMethod(Vec, "normalize", function (a) {
    var s = 1.0 / Math.sqrt(a[0] * a[0] + a[1] * a[1] + a[2] * a[2]);
    for (var i = 0; i < 3; i++) {
        a[i] *= s;
    }
})

// a = b / |b|
addMethod(Vec, "normalize", function (a, b) {
    var s = 1.0 / Math.sqrt(b[0] * b[0] + b[1] * b[1] + b[2] * b[2]);
    for (var i = 0; i < 3; i++) {
        a[i] = b[i] * s;
    }
})

// a = -a
addMethod(Vec, "negate", function (a) {
    for (var i = 0; i < 3; i++) {
        a[i] = -a[i];
    }
})

// a = -b
addMethod(Vec, "negate", function (a, b) {
    for (var i = 0; i < 3; i++) {
        a[i] = -b[i];
    }
})

// a += b * s
addMethod(Vec, "ray", function (a, b, s) {
    for (var i = 0; i < 3; i++) {
        a[i] += b[i] * s;
    }
})

// a = b + c * s
addMethod(Vec, "ray", function (a, b, c, s) {
    for (var i = 0; i < 3; i++) {
        a[i] = b[i] + c[i] * s;
    }
})

// a . b
addMethod(Vec, "dot", function (a, b) {
    return a[0] * b[0] + a[1] * b[1] + a[2] * b[2];
    
})

// a . -b
addMethod(Vec, "dotNegative", function (a, b) {
    return a[0] * -b[0] + a[1] * -b[1] + a[2] * -b[2];
})

// b = b x c
addMethod(Vec, "cross", function (b, c) {
    var x = b[1] * c[2] - b[2] * c[1];
    var y = b[2] * c[0] - b[0] * c[2];
    var z = b[0] * c[1] - b[1] * c[0];
    b[0] = x;
    b[1] = y;
    b[2] = z;
})

// a = b x c
addMethod(Vec, "cross", function (a, b, c) {
    var x = b[1] * c[2] - b[2] * c[1];
    var y = b[2] * c[0] - b[0] * c[2];
    var z = b[0] * c[1] - b[1] * c[0];
    a[0] = x;
    a[1] = y;
    a[2] = z;
})

// p = o + p[0] u + p[1] v + p[2] w
addMethod(Vec, "transform", function (
        p, o, u, v, w) {
    var x = o[0] + p[0] * u[0] + p[1] * v[0] + p[2] * w[0];
    var y = o[1] + p[0] * u[1] + p[1] * v[1] + p[2] * w[1];
    var z = o[2] + p[0] * u[2] + p[1] * v[2] + p[2] * w[2];
    p[0] = x;
    p[1] = y;
    p[2] = z;
})

// q = o + p[0] u + p[1] v + p[2] w
addMethod(Vec, "transform", function (
        q, p, o, u, v, w) {
    var x = o[0] + p[0] * u[0] + p[1] * v[0] + p[2] * w[0];
    var y = o[1] + p[0] * u[1] + p[1] * v[1] + p[2] * w[1];
    var z = o[2] + p[0] * u[2] + p[1] * v[2] + p[2] * w[2];
    q[0] = x;
    q[1] = y;
    q[2] = z;
})

// p = o + p[0] u + p[1] v
addMethod(Vec, "map", function (
        p, o, u, v) {
    var x = o[0] + p[0] * u[0] + p[1] * v[0];
    var y = o[1] + p[0] * u[1] + p[1] * v[1];
    var z = o[2] + p[0] * u[2] + p[1] * v[2];
    p[0] = x;
    p[1] = y;
    p[2] = z;
})

// q = o + p[0] u + p[1] v
addMethod(Vec, "map", function (
        q, p, o, u, v) {
    var x = o[0] + p[0] * u[0] + p[1] * v[0];
    var y = o[1] + p[0] * u[1] + p[1] * v[1];
    var z = o[2] + p[0] * u[2] + p[1] * v[2];
    q[0] = x;
    q[1] = y;
    q[2] = z;
})

// q = o + x u + y v
addMethod(Vec, "map", function (
        q, o, u, v, x, y) {
    var i = o[0] + x * u[0] + y * v[0];
    var j = o[1] + x * u[1] + y * v[1];
    var k = o[2] + x * u[2] + y * v[2];
    q[0] = i;
    q[1] = j;
    q[2] = k;
})

// v = ( head - tail ) / | head - tail |
addMethod(Vec, "constructUnitVector", function (
        v, head, tail) {
    for (var i = 0; i < 3; i++) {
        v[i] = head[i] - tail[i];
    }
    var s = 1.0 / Math.sqrt(v[0] * v[0] + v[1] * v[1] + v[2] * v[2]);
    for (var i = 0; i < 3; i++) {
        v[i] = v[i] * s;
    }
})

// head = ( head - tail ) / | head - tail |
addMethod(Vec, "constructUnitVector", function (
        head, tail) {
    for (var i = 0; i < 3; i++) {
        head[i] = head[i] - tail[i];
    }
    var s = 1.0 / Math.sqrt(
            head[0] * head[0] + head[1] * head[1] + head[2] * head[2]);
    for (var i = 0; i < 3; i++) {
        head[i] = head[i] * s;
    }
})

// a == b
addMethod(Vec, "equals", function (a, b) {
    for (var i = 0; i < 3; i++) {
        if (Math.abs(a[i] - b[i]) > Vec.TINY) {
            return false;
        }
    }
    return true;
})

// v == (x, y, z)
addMethod(Vec, "equals", function (v, x, y, z) {
    return Math.abs(v[0] - x) <= Vec.TINY
            && Math.abs(v[1] - y) <= Vec.TINY
            && Math.abs(v[2] - z) <= Vec.TINY;
})

// w -> u, v
addMethod(Vec, "onb", function (u, v, w) {
    if (Vec.equals(w, 0, 1, 0)) {
        Vec.assign(u, 1, 0, 0);
        Vec.assign(v, 0, 0, -1);
    } else if (Vec.equals(w, 0, -1, 0)) {
        Vec.assign(u, 1, 0, 0);
        Vec.assign(v, 0, 0, 1);
    } else {
        Vec.assign(u, w[2], 0, -w[0]);
        Vec.cross(v, w, u);
    }
})
