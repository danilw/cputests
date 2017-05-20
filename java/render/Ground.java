
import java.util.Locale;

public class Ground implements IObject {

  public double squareSize;
  public double inverseSquareSize;
  public Material material1;
  public Material material2;

  public Ground(double squareSide, Material material1, Material material2) {
    this.squareSize = squareSide;
    this.material1 = material1;
    this.material2 = material2;

    inverseSquareSize = 1.0 / squareSize;
  }

  public boolean intersect(double[] o, double[] d, boolean primaryRay,
      double maxTime, double[][] temps, Intersection intersection) {

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

      long a = ((long)Math.floor(intersection.hit[0] * inverseSquareSize)) & 1;
      long b = ((long)Math.floor(intersection.hit[2] * inverseSquareSize)) & 1;
      intersection.material = (((a + b) & 1) == 0) ? material1 : material2;

      return true;
    }

    return false;
  }
}
