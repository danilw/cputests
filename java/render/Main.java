
import java.awt.image.*;
//import javax.imageio.*;
//import java.io.*;

public class Main {

    public static final int SQRT_SAMPLES = 16;

    public static final int IMAGE_SCALE = 3;
    public static final int WIDTH = 1920 / IMAGE_SCALE;
    public static final int HEIGHT = 1080 / IMAGE_SCALE;
    public static final double VIRTUAL_SCREEN_WIDTH = 100;

    public static final double[] EYE = {0, 40, 250};
    public static final double[] LOOK = {0, 40, 0};
    public static final double[] LIGHT = {500, 500, 500};
    public static final double[] LIGHT_COLOR = {1, 1, 1};
    public static final double LIGHT_RADIUS = 50.0;
    public static final double[] AMBIENT_COLOR = {1, 1, 1};
    public static final double DISTANCE_TO_VIRTUAL_SCREEN = VIRTUAL_SCREEN_WIDTH;

    //public static final String IMAGE_TYPE = "png";
    //public static final String OUTPUT_FILE = "output." + IMAGE_TYPE;
    public static final boolean RENDER_IN_WINDOW = true;

    public static final double GAMMA = 2.2;

    public static final int SAMPLES = SQRT_SAMPLES * SQRT_SAMPLES;
    public static final double INVERSE_SQRT_SAMPLES = 1.0 / SQRT_SAMPLES;
    public static final double INVERSE_SAMPLES = 1.0 / SAMPLES;
    public static final double INVERSE_GAMMA = 1.0 / GAMMA;
    public static final double HALF_WIDTH = WIDTH / 2.0;
    public static final double HALF_HEIGHT = HEIGHT / 2.0;
    public static final double VIRTUAL_SCREEN_RATIO
            = VIRTUAL_SCREEN_WIDTH / WIDTH;

    public static final boolean AMBIENT_OCCLUSION = true;
    public static final double MAX_OCCLUSION_DISTANCE = 100.0;
    public static final double RADIANCE_SCALE = 1.0;
    public static final double EPSILON = 1E-6;
    public static final int MAX_DEPTH = 10;
    public static final double MIN_COLOR_INTENSITY = 1.0 / 256.0;

    public static final long SECOND_MILLIS = 1000L;
    public static final long MINUTE_MILLIS = 60 * SECOND_MILLIS;
    public static final long HOUR_MILLIS = 60 * MINUTE_MILLIS;

    private RenderFrame renderFrame;
    private BufferedImage image;
    //private int runningCount;
    private int rowIndex;

    private volatile IObject[] scene = {
        new Ground(25, Materials.YELLOW_MATTE, Materials.GREEN_MATTE),
        new Sphere(0, 0, 0, 1E6, Materials.BLUE_MATTE),
        new Sphere(0, 40, 0, 40, Materials.MIRROR),
        new Sphere(-80, 40, 0, 40, Materials.RED_METAL),
        new Sphere(80, 40, 0, 40, Materials.YELLOW_METAL),};

    public void launch() throws Throwable {

        image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
        if (RENDER_IN_WINDOW) {
            renderFrame = new RenderFrame(image);
        }

        //int processors = Runtime.getRuntime().availableProcessors();
        //updateRunningCount(processors);
        //for(int i = 0; i < processors; i++) {
        //new Thread(Integer.toString(i)) {
        // @Override
        // public void run() {
        render();
        //   updateRunningCount(-1);
        //  }
        // }.start();
        //  }

        /*synchronized (this) {
            while (runningCount != 0) {
                wait();
            }
        }*/
        //saveImage();
        if (RENDER_IN_WINDOW) {
            renderFrame.setTitle("render [DONE]");
        }
    }

    private void render() {

        double[] u = new double[3];
        double[] v = new double[3];
        double[] w = new double[3];
        double[] c = new double[3];
        double[] p = new double[3];
        double[] d = new double[3];
        double[] l = new double[3];
        double[] l2 = new double[3];
        double[] light = new double[3];
        double[] r = new double[3];
        double[] ar = new double[3];
        double[] f = new double[3];
        double[] o = new double[3];
        double[][] temps = new double[16][3];
        Intersection intersection = new Intersection();
        Intersection bestIntersection = new Intersection();

        Vec.constructUnitVector(w, EYE, LOOK);
        Vec.ray(c, EYE, w, -DISTANCE_TO_VIRTUAL_SCREEN);
        Vec.onb(u, v, w);

        RandomRays randomRays = new RandomRays();
        RandomDoubles randomDoubles = new RandomDoubles();
        int[] pixels = new int[WIDTH];
        double[] pixel = new double[3];

        while (true) {

            int y = getNextRowIndex();
            if (y >= HEIGHT) {
                return;
            }

            for (int x = 0; x < WIDTH; x++) {

                Vec.assign(pixel, 0, 0, 0);

                for (int i = 0; i < SQRT_SAMPLES; i++) {
                    double b = y + INVERSE_SQRT_SAMPLES * i;
                    if (SQRT_SAMPLES == 1) {
                        b += 0.5;
                    } else {
                        b += randomDoubles.random();
                    }

                    b = VIRTUAL_SCREEN_RATIO * (HALF_HEIGHT - b);

                    for (int j = 0; j < SQRT_SAMPLES; j++) {
                        double a = x + INVERSE_SQRT_SAMPLES * j;
                        if (SQRT_SAMPLES == 1) {
                            a += 0.5;
                        } else {
                            a += randomDoubles.random();
                        }

                        a = VIRTUAL_SCREEN_RATIO * (a - HALF_WIDTH);

                        Vec.map(p, c, u, v, a, b);
                        Vec.constructUnitVector(d, p, EYE);

                        Vec.assign(o, EYE);
                        Vec.assign(f, RADIANCE_SCALE, RADIANCE_SCALE, RADIANCE_SCALE);

                        reflectionLoop:
                        for (int m = 0; m < MAX_DEPTH; m++) {

                            boolean hit = false;
                            bestIntersection.time = Double.POSITIVE_INFINITY;
                            for (int k = scene.length - 1; k >= 0; k--) {

                                IObject object = scene[k];
                                if (object.intersect(o, d, true, Double.POSITIVE_INFINITY,
                                        temps, intersection)) {
                                    if (intersection.time < bestIntersection.time) {
                                        hit = true;
                                        bestIntersection.time = intersection.time;
                                        Vec.assign(bestIntersection.normal, intersection.normal);
                                        Vec.assign(bestIntersection.hit, intersection.hit);
                                        bestIntersection.material = intersection.material;
                                    }
                                }
                            }

                            if (hit) {

                                if (Vec.dot(bestIntersection.normal, d) >= 0) {
                                    Vec.negate(bestIntersection.normal);
                                }

                                if (bestIntersection.material.ambientWeight > 0) {
                                    double ambientPercent = 1.0;

                                    if (AMBIENT_OCCLUSION
                                            && bestIntersection.material.ambientOcclusionPercent > 0) {

                                        randomRays.randomRay(ar);
                                        if (Vec.dot(ar, bestIntersection.normal) < 0) {
                                            Vec.negate(ar);
                                        }

                                        for (int k = scene.length - 1; k >= 0; k--) {
                                            IObject object = scene[k];
                                            if (object.intersect(bestIntersection.hit, ar, false,
                                                    MAX_OCCLUSION_DISTANCE, temps, intersection)) {
                                                ambientPercent = 1.0
                                                        - bestIntersection.material.ambientOcclusionPercent;
                                                break;
                                            }
                                        }
                                    }

                                    for (int k = 0; k < 3; k++) {
                                        pixel[k] += bestIntersection.material.ambientWeight
                                                * bestIntersection.material.diffuseColor[k]
                                                * f[k]
                                                * AMBIENT_COLOR[k]
                                                * ambientPercent;

                                    }
                                }

                                Vec.assign(light, LIGHT);
                                if (LIGHT_RADIUS > 0) {
                                    Vec.subtract(l2, bestIntersection.hit, light);
                                    randomRays.randomRay(l);
                                    if (Vec.dot(l, l2) < 0) {
                                        Vec.negate(l);
                                    }
                                    Vec.ray(light, LIGHT, l, LIGHT_RADIUS);
                                }
                                Vec.constructUnitVector(l, light, bestIntersection.hit);

                                double nDotl = Vec.dot(l, bestIntersection.normal);
                                if (nDotl > 0) {

                                    double maxTime = Vec.distance(bestIntersection.hit, light);

                                    boolean illuminated = true;
                                    for (int k = scene.length - 1; k >= 0; k--) {
                                        IObject object = scene[k];
                                        if (object.intersect(bestIntersection.hit, l, false,
                                                maxTime, temps, intersection)) {
                                            illuminated = false;
                                            break;
                                        }
                                    }

                                    if (illuminated) {

                                        if (bestIntersection.material.diffuseWeight > 0) {
                                            for (int k = 0; k < 3; k++) {
                                                pixel[k] += bestIntersection.material.diffuseWeight
                                                        * bestIntersection.material.diffuseColor[k]
                                                        * f[k]
                                                        * LIGHT_COLOR[k]
                                                        * nDotl;
                                            }
                                        }

                                        if (bestIntersection.material.specularWeight > 0) {

                                            Vec.scale(r, bestIntersection.normal, 2.0 * nDotl);
                                            Vec.subtract(r, l);
                                            double rDotMd = Vec.dotNegative(r, d);
                                            if (rDotMd > 0) {
                                                for (int k = 0; k < 3; k++) {
                                                    pixel[k] += bestIntersection.material.specularWeight
                                                            * Math.pow(rDotMd,
                                                                    bestIntersection.material.shininess)
                                                            * f[k]
                                                            * LIGHT_COLOR[k]
                                                            * nDotl
                                                            * bestIntersection.material.highlightColor[k];
                                                }
                                            }
                                        }
                                    }
                                }

                                if (bestIntersection.material.reflectionWeight > 0) {
                                    boolean aboveMinColorIntensity = false;
                                    for (int k = 0; k < 3; k++) {
                                        f[k] *= bestIntersection.material.reflectionWeight
                                                * bestIntersection.material.reflectionColor[k];
                                        if (f[k] >= MIN_COLOR_INTENSITY) {
                                            aboveMinColorIntensity = true;
                                        }
                                    }
                                    if (!aboveMinColorIntensity) {
                                        break reflectionLoop;
                                    }

                                    Vec.ray(d, bestIntersection.normal,
                                            -2 * Vec.dot(bestIntersection.normal, d));
                                    Vec.assign(o, bestIntersection.hit);
                                } else {
                                    break reflectionLoop;
                                }

                            } else {
                                break reflectionLoop;
                            }
                        }
                    }
                }

                int value = 0;
                for (int i = 0; i < 3; i++) {
                    int intensity = (int) Math.round(255
                            * Math.pow(pixel[i] * INVERSE_SAMPLES, INVERSE_GAMMA));
                    if (intensity < 0) {
                        intensity = 0;
                    } else if (intensity > 255) {
                        intensity = 255;
                    }
                    value <<= 8;
                    value |= intensity;

                }

                pixels[x] = value;
            }

            rowCompleted(y, pixels);
        }
    }

    /*  private synchronized void updateRunningCount(int dx) {
    runningCount += dx;
    if (runningCount == 0) {
      notifyAll();
    }
  }*/
    private synchronized int getNextRowIndex() {
        return rowIndex++;
    }

    private synchronized void rowCompleted(int rowIndex, int[] pixels) {
        image.setRGB(0, rowIndex, WIDTH, 1, pixels, 0, WIDTH);
        if (RENDER_IN_WINDOW) {
            renderFrame.imageUpdated();
        }
    }

    /*private void saveImage() throws Throwable {
    ImageIO.write(image, IMAGE_TYPE, new File(OUTPUT_FILE));
  }*/
    public static void main(String... args) throws Throwable {

        long startTime = System.currentTimeMillis();

        Main main = new Main();
        main.launch();

        long timetocalc = System.currentTimeMillis() - startTime;
        System.out.println("timetocalc(msec): " + timetocalc);
    }

}
