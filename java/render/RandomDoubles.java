public class RandomDoubles {

  private volatile double[] values;

  private int index;

  public RandomDoubles() {
    synchronized(RandomDoubles.class) {
      if (values == null) {
        values = new double[70001];
        for(int i = values.length - 1; i >= 0; i--) {
          values[i] = Math.random();
        }
      }
      index = (int)(Math.random() * values.length);
    }
  }

  public double random() {
    if (index >= values.length) {
      index = 0;
    }
    return values[index++];
  }
}
