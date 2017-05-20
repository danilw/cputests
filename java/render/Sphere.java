public class Sphere implements IObject {

  public double[] center = new double[3];
  public double radius = 1;
  public Material material;

  public Sphere(
      double x, double y, double z, double radius, Material material) {
    Vec.assign(center, x, y, z);
    this.radius = radius;
    this.material = material;
  }

  public boolean intersect(
      double[] o, double[] d, boolean primaryRay, double maxTime,
      double[][] temps,
      Intersection intersection) {

    Vec.subtract(temps[0], o, center);
    double B = 2.0 * Vec.dot(d, temps[0]);
    
    double C = Vec.magnitude2(temps[0]) - radius * radius;
    
    double square = B * B - 4 * C;
    if (square >= 0) {
      double sqrt = Math.sqrt(square);
      double t1 = 0.5 * (-B - sqrt);
      double t2 = 0.5 * (-B + sqrt);
      boolean intersected = false;
      if (t1 >= Main.EPSILON && t1 <= maxTime) {
        intersected = true;
        intersection.time = t1;
      } else if (t2 >= Main.EPSILON && t2 <= maxTime) {
        intersected = true;
        intersection.time = t2;
      }
      if (primaryRay && intersected) {
        Vec.ray(intersection.hit, o, d, intersection.time);
        Vec.constructUnitVector(intersection.normal, intersection.hit, center);
        intersection.material = material;
      }
      if (intersected) {
        return true;
      }
    }

    return false;
  }
}
