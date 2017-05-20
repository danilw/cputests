public final class Materials {

  private Materials() {
  }

  public static final Material RED_PLASTIC = createPlastic(1, 0, 0);
  public static final Material YELLOW_PLASTIC = createPlastic(1, 1, 0);

  public static final Material BLUE_MATTE = createMatte(0, 0, 1);
  public static final Material GREEN_MATTE = createMatte(0, 1, 0);
  public static final Material YELLOW_MATTE = createMatte(1, 1, 0);
  public static final Material WHITE_MATTE = createMatte(1, 1, 1);
  
  public static final Material YELLOW_METAL = createMetal(1, 1, 0);
  public static final Material PURPLE_METAL = createMetal(1, 0, 1);
  public static final Material BLUE_METAL = createMetal(0, 0, 1);
  public static final Material CYAN_METAL = createMetal(0, 1, 1);
  public static final Material RED_METAL = createMetal(1, 0, 0);

  public static final Material MIRROR = createPolishedMetal(1, 1, 1);

  public static Material createMetal(double... color) {
    return new Material(
      0.1,
      1.0,
      0.7,
      1.0,
      1.0,
      20.0,
      color,
      color,
      color
    );
  }

  public static Material createPolishedMetal(double... color) {
    return new Material(
      0.0,
      0.0,
      0.0,
      1.0,
      1.0,
      20.0,
      color,
      color,
      color
    );
  }

  public static Material createPlastic(double... color) {
    return new Material(
      0.1,
      1.0,
      1.0,
      1.0,
      0.0,
      10.0,
      color,
      new double[] { 1, 1, 1 },
      new double[] { 0, 0, 0 }
    );
  }

  public static Material createMatte(double... color) {
    return new Material(
      0.1,
      1.0,
      1.0,
      0.0,
      0.0,
      0.0,
      color,
      new double[] { 0, 0, 0 },
      new double[] { 0, 0, 0 }
    );
  }
}
