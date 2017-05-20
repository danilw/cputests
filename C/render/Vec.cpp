
#ifndef Vec_c
#define Vec_c


#include <math.h>

#include <cstdlib>
#include <cmath>


 class Vec {

 public:
  static const double TINY;

  Vec() {
  }

  // a += b
   static void add(double a[], double b[]) {
    for(int i = 0; i < 3; i++) {
      a[i] += b[i];
    }
  }

  // a = b + c
   static void add(double a[], double b[], double c[]) {
    for(int i = 0; i < 3; i++) {
      a[i] = b[i] + c[i];
    }
  }

  // a -= b
   static void subtract(double a[], double b[]) {
    for(int i = 0; i < 3; i++) {
      a[i] -= b[i];
    }
  }

  // a = b - c
   static void subtract(double a[], double b[], double c[]) {
    for(int i = 0; i < 3; i++) {
      a[i] = b[i] - c[i];
    }
  }

  // a *= s
   static void scale(double a[], double s) {
    for(int i = 0; i < 3; i++) {
      a[i] *= s;
    }
  }

  // a = b * s
   static void scale(double a[], double b[], double s) {
    for(int i = 0; i < 3; i++) {
      a[i] = b[i] * s;
    }
  }

  // a /= s
   static void divide(double a[], double s) {
    double inverse = 1.0 / s;
    for(int i = 0; i < 3; i++) {
      a[i] *= inverse;
    }
  }

  // a = b / s
   static void divide(double a[], double b[], double s) {
    double inverse = 1.0 / s;
    for(int i = 0; i < 3; i++) {
      a[i] = b[i] * inverse;
    }
  }

  // a = b
   static void assign(double a[], const double b[]) {
    for(int i = 0; i < 3; i++) {
      a[i] = b[i];
    }
  }

  // a = (x, y, z)
   static void assign(double a[], double x, double y, double z) {
    a[0] = x;
    a[1] = y;
    a[2] = z;
  }

  // |v|
   static double magnitude(double v[]) {
    return sqrt(v[0] * v[0] + v[1] * v[1] + v[2] * v[2]);
  }

  // |v|^2
   static double magnitude2(double v[]) {
    return v[0] * v[0] + v[1] * v[1] + v[2] * v[2];
  }

  // |a - b|
   static double distance(double a[], double b[]) {
    double x = a[0] - b[0];
    double y = a[1] - b[1];
    double z = a[2] - b[2];
    return sqrt(x * x + y * y + z * z);
  }

  // |a - b|^2
   static double distance2(double a[], double b[]) {
    double x = a[0] - b[0];
    double y = a[1] - b[1];
    double z = a[2] - b[2];
    return x * x + y * y + z * z;
  }

  // a = a / |a|
   static void normalize(double a[]) {
    double s = 1.0 / sqrt(a[0] * a[0] + a[1] * a[1] + a[2] * a[2]);
    for(int i = 0; i < 3; i++) {
      a[i] *= s;
    }
  }

  // a = b / |b|
   static void normalize(double a[], double b[]) {
    double s = 1.0 / sqrt(b[0] * b[0] + b[1] * b[1] + b[2] * b[2]);
    for(int i = 0; i < 3; i++) {
      a[i] = b[i] * s;
    }
  }

  // a = -a
   static void negate(double a[]) {
    for(int i = 0; i < 3; i++) {
      a[i] = -a[i];
    }
  }

  // a = -b
   static void negate(double a[], double b[]) {
    for(int i = 0; i < 3; i++) {
      a[i] = -b[i];
    }
  }

  // a += b * s
   static void ray(double a[], double b[], double s) {
    for(int i = 0; i < 3; i++) {
      a[i] += b[i] * s;
    }
  }

  // a = b + c * s
   static void ray(double a[], const double b[], double c[], const double s) {
    for(int i = 0; i < 3; i++) {
      a[i] = b[i] + c[i] * s;
    }
  }

  // a . b
   static double dot(double a[], double b[]) {
    return a[0] * b[0] + a[1] * b[1] + a[2] * b[2];
  }

  // a . -b
   static double dotNegative(double a[], double b[]) {
    return a[0] * -b[0] + a[1] * -b[1] + a[2] * -b[2];
  }

  // b = b x c
   static void cross(double b[], double c[]) {
    double x = b[1] * c[2] - b[2] * c[1];
    double y = b[2] * c[0] - b[0] * c[2];
    double z = b[0] * c[1] - b[1] * c[0];
    b[0] = x;
    b[1] = y;
    b[2] = z;
  }

  // a = b x c
   static void cross(double a[], double b[], double c[]) {
    double x = b[1] * c[2] - b[2] * c[1];
    double y = b[2] * c[0] - b[0] * c[2];
    double z = b[0] * c[1] - b[1] * c[0];
    a[0] = x;
    a[1] = y;
    a[2] = z;  
  }
  
  // p = o + p[0] u + p[1] v + p[2] w
   static void transform(
      double p[], double o[], double u[], double v[], double w[]) {
    double x = o[0] + p[0] * u[0] + p[1] * v[0] + p[2] * w[0];
    double y = o[1] + p[0] * u[1] + p[1] * v[1] + p[2] * w[1];
    double z = o[2] + p[0] * u[2] + p[1] * v[2] + p[2] * w[2];
    p[0] = x;
    p[1] = y;
    p[2] = z;    
  }

  // q = o + p[0] u + p[1] v + p[2] w
   static void transform(
      double q[], double p[], double o[], double u[], double v[], double w[]) {
    double x = o[0] + p[0] * u[0] + p[1] * v[0] + p[2] * w[0];
    double y = o[1] + p[0] * u[1] + p[1] * v[1] + p[2] * w[1];
    double z = o[2] + p[0] * u[2] + p[1] * v[2] + p[2] * w[2];
    q[0] = x;
    q[1] = y;
    q[2] = z;
  }

  // p = o + p[0] u + p[1] v
   static void map(
      double p[], double o[], double u[], double v[]) {
    double x = o[0] + p[0] * u[0] + p[1] * v[0];
    double y = o[1] + p[0] * u[1] + p[1] * v[1];
    double z = o[2] + p[0] * u[2] + p[1] * v[2];
    p[0] = x;
    p[1] = y;
    p[2] = z;
  }

  // q = o + p[0] u + p[1] v
   static void map(
      double q[], double p[], double o[], double u[], double v[]) {
    double x = o[0] + p[0] * u[0] + p[1] * v[0];
    double y = o[1] + p[0] * u[1] + p[1] * v[1];
    double z = o[2] + p[0] * u[2] + p[1] * v[2];
    q[0] = x;
    q[1] = y;
    q[2] = z;
  }

  // q = o + x u + y v
   static void map(
      double q[], double o[], double u[], double v[], double x, double y) {
    double i = o[0] + x * u[0] + y * v[0];
    double j = o[1] + x * u[1] + y * v[1];
    double k = o[2] + x * u[2] + y * v[2];
    q[0] = i;
    q[1] = j;
    q[2] = k;
  }

  // v = ( head - tail ) / | head - tail |
   static void constructUnitVector(
      double v[], const double head[], const double tail[]) {
    for(int i = 0; i < 3; i++) {
      v[i] = head[i] - tail[i];
    }
    double s = 1.0 / sqrt(v[0] * v[0] + v[1] * v[1] + v[2] * v[2]);
    for(int i = 0; i < 3; i++) {
      v[i] = v[i] * s;
    }
  }

  // head = ( head - tail ) / | head - tail |
   static void constructUnitVector(
      double head[], double tail[]) {
    for(int i = 0; i < 3; i++) {
      head[i] = head[i] - tail[i];
    }
    double s = 1.0 / sqrt(
        head[0] * head[0] + head[1] * head[1] + head[2] * head[2]);
    for(int i = 0; i < 3; i++) {
      head[i] = head[i] * s;
    }
  }

  // a == b
   static bool equals(double a[], double b[]) {
    for(int i = 0; i < 3; i++) {
      if (abs(a[i] - b[i]) > TINY) {
        return false;
      }
    }
    return true;
  }

  // v == (x, y, z)
   static bool equals(double v[], double x, double y, double z) {
    return abs(v[0] - x) <= TINY
        && abs(v[1] - y) <= TINY
        && abs(v[2] - z) <= TINY;
  }

  // w -> u, v
   static void onb(double u[], double v[], double w[]) {
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
};

#endif