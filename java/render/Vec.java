public final class Vec {

  public static final double TINY = 1e-9;

  private Vec() {
  }

  // a += b
  public static void add(double[] a, double[] b) {
    for(int i = 0; i < 3; i++) {
      a[i] += b[i];
    }
  }

  // a = b + c
  public static void add(double[] a, double[] b, double[] c) {
    for(int i = 0; i < 3; i++) {
      a[i] = b[i] + c[i];
    }
  }

  // a -= b
  public static void subtract(double[] a, double[] b) {
    for(int i = 0; i < 3; i++) {
      a[i] -= b[i];
    }
  }

  // a = b - c
  public static void subtract(double[] a, double[] b, double[] c) {
    for(int i = 0; i < 3; i++) {
      a[i] = b[i] - c[i];
    }
  }

  // a *= s
  public static void scale(double[] a, double s) {
    for(int i = 0; i < 3; i++) {
      a[i] *= s;
    }
  }

  // a = b * s
  public static void scale(double[] a, double[] b, double s) {
    for(int i = 0; i < 3; i++) {
      a[i] = b[i] * s;
    }
  }

  // a /= s
  public static void divide(double[] a, double s) {
    double inverse = 1.0 / s;
    for(int i = 0; i < 3; i++) {
      a[i] *= inverse;
    }
  }

  // a = b / s
  public static void divide(double[] a, double[] b, double s) {
    double inverse = 1.0 / s;
    for(int i = 0; i < 3; i++) {
      a[i] = b[i] * inverse;
    }
  }

  // a = b
  public static void assign(double[] a, double[] b) {
    for(int i = 0; i < 3; i++) {
      a[i] = b[i];
    }
  }

  // a = (x, y, z)
  public static void assign(double[] a, double x, double y, double z) {
    a[0] = x;
    a[1] = y;
    a[2] = z;
  }

  // |v|
  public static double magnitude(double[] v) {
    return Math.sqrt(v[0] * v[0] + v[1] * v[1] + v[2] * v[2]);
  }

  // |v|^2
  public static double magnitude2(double[] v) {
    return v[0] * v[0] + v[1] * v[1] + v[2] * v[2];
  }

  // |a - b|
  public static double distance(double[] a, double[] b) {
    double x = a[0] - b[0];
    double y = a[1] - b[1];
    double z = a[2] - b[2];
    return Math.sqrt(x * x + y * y + z * z);
  }

  // |a - b|^2
  public static double distance2(double[] a, double[] b) {
    double x = a[0] - b[0];
    double y = a[1] - b[1];
    double z = a[2] - b[2];
    return x * x + y * y + z * z;
  }

  // a = a / |a|
  public static void normalize(double[] a) {
    double s = 1.0 / Math.sqrt(a[0] * a[0] + a[1] * a[1] + a[2] * a[2]);
    for(int i = 0; i < 3; i++) {
      a[i] *= s;
    }
  }

  // a = b / |b|
  public static void normalize(double[] a, double[] b) {
    double s = 1.0 / Math.sqrt(b[0] * b[0] + b[1] * b[1] + b[2] * b[2]);
    for(int i = 0; i < 3; i++) {
      a[i] = b[i] * s;
    }
  }

  // a = -a
  public static void negate(double[] a) {
    for(int i = 0; i < 3; i++) {
      a[i] = -a[i];
    }
  }

  // a = -b
  public static void negate(double[] a, double[] b) {
    for(int i = 0; i < 3; i++) {
      a[i] = -b[i];
    }
  }

  // a += b * s
  public static void ray(double[] a, double[] b, double s) {
    for(int i = 0; i < 3; i++) {
      a[i] += b[i] * s;
    }
  }

  // a = b + c * s
  public static void ray(double[] a, double[] b, double[] c, double s) {
    for(int i = 0; i < 3; i++) {
      a[i] = b[i] + c[i] * s;
    }
  }

  // a . b
  public static double dot(double[] a, double[] b) {
    return a[0] * b[0] + a[1] * b[1] + a[2] * b[2];
  }

  // a . -b
  public static double dotNegative(double[] a, double[] b) {
    return a[0] * -b[0] + a[1] * -b[1] + a[2] * -b[2];
  }

  // b = b x c
  public static void cross(double[] b, double[] c) {
    double x = b[1] * c[2] - b[2] * c[1];
    double y = b[2] * c[0] - b[0] * c[2];
    double z = b[0] * c[1] - b[1] * c[0];
    b[0] = x;
    b[1] = y;
    b[2] = z;
  }

  // a = b x c
  public static void cross(double[] a, double[] b, double[] c) {
    double x = b[1] * c[2] - b[2] * c[1];
    double y = b[2] * c[0] - b[0] * c[2];
    double z = b[0] * c[1] - b[1] * c[0];
    a[0] = x;
    a[1] = y;
    a[2] = z;  
  }
  
  // p = o + p[0] u + p[1] v + p[2] w
  public static void transform(
      double[] p, double[] o, double[] u, double[] v, double[] w) {
    double x = o[0] + p[0] * u[0] + p[1] * v[0] + p[2] * w[0];
    double y = o[1] + p[0] * u[1] + p[1] * v[1] + p[2] * w[1];
    double z = o[2] + p[0] * u[2] + p[1] * v[2] + p[2] * w[2];
    p[0] = x;
    p[1] = y;
    p[2] = z;    
  }

  // q = o + p[0] u + p[1] v + p[2] w
  public static void transform(
      double[] q, double[] p, double[] o, double[] u, double[] v, double[] w) {
    double x = o[0] + p[0] * u[0] + p[1] * v[0] + p[2] * w[0];
    double y = o[1] + p[0] * u[1] + p[1] * v[1] + p[2] * w[1];
    double z = o[2] + p[0] * u[2] + p[1] * v[2] + p[2] * w[2];
    q[0] = x;
    q[1] = y;
    q[2] = z;
  }

  // p = o + p[0] u + p[1] v
  public static void map(
      double[] p, double[] o, double[] u, double[] v) {
    double x = o[0] + p[0] * u[0] + p[1] * v[0];
    double y = o[1] + p[0] * u[1] + p[1] * v[1];
    double z = o[2] + p[0] * u[2] + p[1] * v[2];
    p[0] = x;
    p[1] = y;
    p[2] = z;
  }

  // q = o + p[0] u + p[1] v
  public static void map(
      double[] q, double[] p, double[] o, double[] u, double[] v) {
    double x = o[0] + p[0] * u[0] + p[1] * v[0];
    double y = o[1] + p[0] * u[1] + p[1] * v[1];
    double z = o[2] + p[0] * u[2] + p[1] * v[2];
    q[0] = x;
    q[1] = y;
    q[2] = z;
  }

  // q = o + x u + y v
  public static void map(
      double[] q, double[] o, double[] u, double[] v, double x, double y) {
    double i = o[0] + x * u[0] + y * v[0];
    double j = o[1] + x * u[1] + y * v[1];
    double k = o[2] + x * u[2] + y * v[2];
    q[0] = i;
    q[1] = j;
    q[2] = k;
  }

  // v = ( head - tail ) / | head - tail |
  public static void constructUnitVector(
      double[] v, double[] head, double[] tail) {
    for(int i = 0; i < 3; i++) {
      v[i] = head[i] - tail[i];
    }
    double s = 1.0 / Math.sqrt(v[0] * v[0] + v[1] * v[1] + v[2] * v[2]);
    for(int i = 0; i < 3; i++) {
      v[i] = v[i] * s;
    }
  }

  // head = ( head - tail ) / | head - tail |
  public static void constructUnitVector(
      double[] head, double[] tail) {
    for(int i = 0; i < 3; i++) {
      head[i] = head[i] - tail[i];
    }
    double s = 1.0 / Math.sqrt(
        head[0] * head[0] + head[1] * head[1] + head[2] * head[2]);
    for(int i = 0; i < 3; i++) {
      head[i] = head[i] * s;
    }
  }

  // a == b
  public static boolean equals(double[] a, double[] b) {
    for(int i = 0; i < 3; i++) {
      if (Math.abs(a[i] - b[i]) > TINY) {
        return false;
      }
    }
    return true;
  }

  // v == (x, y, z)
  public static boolean equals(double[] v, double x, double y, double z) {
    return Math.abs(v[0] - x) <= TINY
        && Math.abs(v[1] - y) <= TINY
        && Math.abs(v[2] - z) <= TINY;
  }

  // w -> u, v
  public static void onb(double[] u, double[] v, double[] w) {
    if (equals(w, 0, 1, 0)) {
      assign(u, 1, 0, 0);
      assign(v, 0, 0, -1);
    } else if (equals(w, 0, -1, 0)) {
      assign(u, 1, 0, 0);
      assign(v, 0, 0, 1);
    } else {
      assign(u, w[2], 0, -w[0]);
      cross(v, w, u);
    }
  }
}
