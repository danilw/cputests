public interface IObject {
  public boolean intersect(
      double[] o, double[] d, boolean primaryRay, double maxTime,
      double[][] temps,
      Intersection intersection);
}
