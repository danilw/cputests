public class RandomRays {

  private volatile double[][] rays;

  private int index;

  public RandomRays() {
    synchronized(RandomRays.class) {
      if (rays == null) {
        rays = new double[24001][3];
        for(int i = rays.length - 1; i >= 0; i--) {
          do {
            for(int j = 0; j < 3; j++) {
              rays[i][j] = 2.0 * Math.random() - 1.0;
            }
          } while(Vec.magnitude2(rays[i]) > 1.0);
          Vec.normalize(rays[i]);
        }
      }
      index = (int)(Math.random() * rays.length);
    }
  }

  public void randomRay(double[] ray) {
    if (index >= rays.length) {
      index = 0;
    }
    Vec.assign(ray, rays[index++]);
  }
}
