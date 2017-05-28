
import java.awt.Frame;
import java.awt.AWTEvent;
import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.awt.event.KeyEvent;
import java.awt.event.*;

class Gg2 extends Frame implements Runnable {

    private double speed = 0.12;
    private double leftm = 0;
    private double rightm = 0;
    private double zz = 0;
    private double wlight[] = {0, 0, 0};
    private boolean wlightstate[] = {false, false, false};
    private boolean wlightprgrs[] = {false, false, false};
    private double maxinverval = 3.5;
    private boolean disable_ani=false; //set true to disable animation
    private double inverval = maxinverval;
    private double invervalt[] = {maxinverval, maxinverval, 1};
    private boolean invert = false;

    private boolean currcolor[] = {true, true, false};

    private double lastatime = 1000;
    private final int viewWidth = 300;
    private final int viewHeight = 200;
    private final int viewScaleX = 3;
    private final int viewScaleY = 3;

    final private int mat_blue = 0x0000ff;
    final private int mat_yellow = 0xffff00;

    private final int[] pixels = new int[viewWidth * viewHeight];

    private final double frameRateSmoothing = 1.0;
    private final long nanosPerSecond = 1000000000;


    private final double maxViewDist = 100;
    private final double primaryRayStepThreshold = 0.01;
    private final double noIntersection = -1.0;

    private int scene = 1;

    private static final boolean keyDown[] = new boolean[65536];

    public long frame_timetocalc = 0;
    public long min_timetocalc = 1000000000;
    public long max_timetocalc = 0;


    private class Vec {

        double x;
        double y;
        double z;

        Vec(double x, double y, double z) {
            this.x = x;
            this.y = y;
            this.z = z;
        }

        double length() {
            return Math.sqrt(x * x + y * y + z * z);
        }

        double dotProduct(Vec v) {
            return x * v.x + y * v.y + z * v.z;
        }

        Vec add(Vec v) {
            return new Vec(x + v.x, y + v.y, z + v.z);
        }

        Vec subtract(Vec v) {
            return new Vec(x - v.x, y - v.y, z - v.z);
        }

        Vec multiply(double a) {
            return new Vec(x * a, y * a, z * a);
        }

        Vec normalise() {
            return this.multiply(1.0 / length());
        }

        Vec crossProduct(Vec v) {
            return new Vec(y * v.z - z * v.y, z * v.x - x * v.z, x * v.y - y * v.x);
        }
    };

    private double getDistToSphere(Vec pt, double radius) {
        return pt.length() - radius;
    }

    private double getDistToBox(Vec pt, Vec halfSize) {
        return new Vec(Math.max(0, Math.abs(pt.x) - halfSize.x),
                Math.max(0, Math.abs(pt.y) - halfSize.y),
                Math.max(0, Math.abs(pt.z) - halfSize.z)).length();
    }

    private Vec tilePrimitive(Vec pt, double tileSize) {

        final double halfTileSize = tileSize / 2.0;
        return new Vec(pt.x % tileSize - halfTileSize,
                pt.y % tileSize - halfTileSize,
                pt.z % tileSize - halfTileSize);
    }

    private Vec getSphereNormal(Vec pt) {
        return pt.normalise();
    }

    private double worldGetDist(Vec pt) {

        final double tileSize = 3.0;
        pt = tilePrimitive(pt, tileSize);

        switch (scene) {
            case 1:
                return getDistToSphere(pt, 1);
            case 2:
                return getDistToBox(pt, new Vec(0.5, 0.5, 0.5));
            default:
                return getDistToSphere(pt, 1);
        }
    }

    private Vec worldGetNormal(Vec pt) {

        final double tileSize = 3.0;
        pt = tilePrimitive(pt, tileSize);
        return getSphereNormal(pt);
    }

    private double worldIntersect(Vec rayStart, Vec rayDir, double maxDist, double rayStepThreshold) {

        Vec pt = rayStart;
        double rayLen = 0.0;

        double dist;

        while ((dist = worldGetDist(pt)) > rayStepThreshold) {
            rayLen += dist;
            if (rayLen > maxDist) {
                rayLen = noIntersection;
                break;
            }

            pt = pt.add(rayDir.multiply(dist));
        }

        return rayLen;
    }

    private void putpixel(int x, int y, int color) {
        if (x < 0 || x >= viewWidth || y < 0 || y >= viewHeight) {
            return;
        }

        pixels[y * viewWidth + x] = color;
    }

    private Thread thread;

    public void start() {
        enableEvents(AWTEvent.KEY_EVENT_MASK);
        thread = new Thread(this);
        thread.start();
    }

    public void stop() {
        thread.stop();
    }

    @Override
    public void run() {

        int numFrames = 0;
        int fps = 0;
        long lastFpsTime = 0;
        setSize(100 + viewWidth * viewScaleX, 100 + viewHeight * viewScaleY);
        BufferedImage image = new BufferedImage(viewWidth, viewHeight, BufferedImage.TYPE_INT_RGB);
        Graphics gfx = image.getGraphics();
        Graphics iimage = getGraphics();
        while (true) {
            frame_timetocalc = System.currentTimeMillis();
            if (keyDown[KeyEvent.VK_W]) {
                keyDown[KeyEvent.VK_W] = false;
                speed = (speed < 0.3) ? speed + 0.05 : 0.35;

            }

            if (keyDown[KeyEvent.VK_S]) {
                keyDown[KeyEvent.VK_S] = false;
                speed = (speed > 0.06) ? speed - 0.05 : 0;

            }
            lastatime += speed;

            if (keyDown[KeyEvent.VK_A]) {
                keyDown[KeyEvent.VK_A] = false;
                if (rightm == 0) {
                    leftm = (leftm < 0.9) ? leftm + 0.08 : 0.91;
                } else {
                    rightm = ((rightm - 0.08) > 0) ? rightm - 0.08 : 0;
                }
            }

            if (keyDown[KeyEvent.VK_D]) {
                keyDown[KeyEvent.VK_D] = false;
                if (leftm == 0) {
                    rightm = (rightm < 0.9) ? rightm + 0.08 : 0.91;
                } else {
                    leftm = ((leftm - 0.08) > 0) ? leftm - 0.08 : 0;
                }
            }

            if (keyDown[KeyEvent.VK_Q]) {
                keyDown[KeyEvent.VK_Q] = false;
                zz = (zz < 0.0055) ? zz + 0.0005 : 0.006;
            }

            if (keyDown[KeyEvent.VK_E]) {
                keyDown[KeyEvent.VK_E] = false;
                zz = ((zz - 0.0005) > -0.0055) ? zz -= 0.0005 : -0.006;
            }

            Vec moveDir = new Vec(1.5, zz, 0.8);
            Vec cameraPos = moveDir.multiply(lastatime);
            final Vec cameraLookAt = cameraPos.add(moveDir).add(new Vec(0 + rightm, 0.8 - zz * 500, 0.5 + leftm));
            Vec cameraUp = new Vec(0 + rightm / 3, 1.0, 0 + leftm / 3);

            final Vec cameraForward = cameraLookAt.subtract(cameraPos).normalise();
            final Vec cameraRight = cameraForward.crossProduct(cameraUp);
            cameraUp = cameraRight.crossProduct(cameraForward);

            if (!(wlightprgrs[0] || wlightprgrs[1] || wlightprgrs[2])) {
                wlightprgrs[0] = true;
            }
            for (int ij = 0; ij < 3; ij++) {
                if (wlightprgrs[ij]) {
                    if (wlightstate[ij]) {
                        wlight[ij] -= 0.05;
                        if (wlight[ij] < 0.1) {
                            wlight[ij] = 0.05;
                            wlightstate[ij] = false;
                            wlightprgrs[ij] = false;
                            if (ij != 2) {
                                wlightprgrs[ij + 1] = true;
                            }
                        }
                    } else {
                        wlight[ij] += 0.05;
                        if (wlight[ij] > 1) {
                            wlight[ij] = 1;
                            wlightstate[ij] = true;
                            wlightprgrs[ij] = false;
                            if (ij != 2) {
                                wlightprgrs[ij + 1] = true;
                            }
                        }
                    }
                    break;
                }
            }
            if (!disable_ani) {
            if (inverval + 0.05 > maxinverval) {
                inverval = maxinverval;
                invert = true;
            }
            if (invert) {
                inverval -= 0.05;
                if (currcolor[0] && currcolor[1]) {
                    invervalt[0] -= 0.05;
                    invervalt[2] += 0.05;
                } else if (currcolor[1] && currcolor[2]) {
                    invervalt[1] -= 0.05;
                    invervalt[0] += 0.05;
                } else if (currcolor[2] && currcolor[0]) {
                    invervalt[2] -= 0.05;
                    invervalt[1] += 0.05;
                }
            } else {
                inverval += 0.05;
                if (currcolor[0] && currcolor[1]) {
                    invervalt[0] += 0.05;
                    invervalt[1] -= 0.05;
                } else if (currcolor[1] && currcolor[2]) {
                    invervalt[1] += 0.05;
                    invervalt[2] -= 0.05;
                } else if (currcolor[2] && currcolor[0]) {
                    invervalt[2] += 0.05;
                    invervalt[0] -= 0.05;
                }
            }
            if (inverval - 0.04 > 1) {

            } else {
                invert = false;
                inverval = 1;

                if (currcolor[0] && currcolor[1]) {
                    inverval = maxinverval;
                    currcolor[0] = false;
                    currcolor[2] = true;
                } else if (currcolor[1] && currcolor[2]) {
                    inverval = maxinverval;
                    currcolor[1] = false;
                    currcolor[0] = true;
                } else if (currcolor[2] && currcolor[0]) {
                    inverval = maxinverval;
                    currcolor[2] = false;
                    currcolor[1] = true;
                }
            }}else inverval=invervalt[0]=invervalt[1]=invervalt[2]=1;

            for (int row = 0; row < viewHeight; row++) {
                for (int col = 0; col < viewWidth; col++) {

                    double xFrac = (double) (col - viewWidth * 0.5) / viewWidth;
                    double yFrac = (double) (row - viewHeight * 0.5) / viewWidth;
                    double zFrac = 0.5;

                    Vec rayStart = cameraPos;
                    Vec rayDir = cameraRight.multiply(xFrac).add(cameraUp.multiply(yFrac)).add(cameraForward.multiply(zFrac));
                    rayDir = rayDir.normalise();
                    double depth = worldIntersect(rayStart, rayDir, maxViewDist, primaryRayStepThreshold);

                    if (depth == noIntersection) {
                        if (scene == 2) {
                            putpixel(col, row, mat_yellow);
                        } else {
                            putpixel(col, row, mat_blue);
                        }
                    } else {

                        final Vec dirToLight = new Vec(-1 - wlight[1] * 2, 0.5 - wlight[1] * 2, -0.7 - wlight[2] * 2).normalise();
                        double shadowFactor = noIntersection;

                        Vec pt = rayStart.add(rayDir.multiply(depth));
                        Vec normal = worldGetNormal(pt);

                        if (shadowFactor == noIntersection) {
                            shadowFactor = 1.0;
                        } else {
                            shadowFactor = 1.0 - shadowFactor;
                        }

                        double normalisedIntensity = Math.min(Math.max(0.0, normal.dotProduct(dirToLight)) * shadowFactor, 1.0);
                        int intensity = (int) (normalisedIntensity * 255.0);

                        int intensityr = (int) (intensity * invervalt[0]);
                        int intensityg = (int) (intensity * invervalt[1]);
                        int intensityb = (int) (intensity * invervalt[2]);
                        if (scene == 2) {
                            byte depthByte = 0;
                            final double invMaxViewDist = 1.0 / maxViewDist;
                            if (depth != noIntersection) {
                                depthByte = (byte) ((1.0 - depth * invMaxViewDist) * 255.0);
                                putpixel(col, row, ((int) (depthByte - intensity * 0.5) << 16) + ((int) (depthByte - intensity * 0.5) << 8) + (int) (depthByte));
                            }
                        } else {
                            putpixel(col, row, ((intensityr) << 16) + ( (intensityg) << 8) + intensityb);

                        }
                    }
                }
            }

            image.setRGB(0, 0, viewWidth, viewHeight, pixels, 0, viewWidth);

            frame_timetocalc = System.currentTimeMillis() - frame_timetocalc;
            if (max_timetocalc < frame_timetocalc) {
                max_timetocalc = frame_timetocalc;
            }
            if (min_timetocalc > frame_timetocalc) {
                min_timetocalc = frame_timetocalc;
            }
            gfx.setColor(Color.RED);
            gfx.drawString(
                    "fps:" + String.valueOf(fps)
                    + " , timetocalc:" + frame_timetocalc
                    + " ,  max:" + max_timetocalc
                    + " , min:" + min_timetocalc,
                    0, viewHeight);
            iimage.drawImage(image,
                    50, 50, viewWidth * viewScaleX + 50, viewHeight * viewScaleY + 50,
                    0, 0, viewWidth, viewHeight, null);

            numFrames++;
            double delta = (double) (System.nanoTime() - lastFpsTime) / nanosPerSecond;
            if (delta > frameRateSmoothing) {
                fps = (int) (numFrames / delta);
                numFrames = 0;
                lastFpsTime = System.nanoTime();
            }

        }
    }

    @Override
    public void processKeyEvent(KeyEvent e) {
        keyDown[e.getKeyCode()] = (e.getID() == KeyEvent.KEY_PRESSED);

        int numericKey = e.getKeyCode() - KeyEvent.VK_1 + 1;
        if (numericKey >= 1 && numericKey <= 7) {
            max_timetocalc = 0;
            min_timetocalc = 10000000;
            scene = numericKey;
        }

    }

}

public class render_mini {

    public static void main(String[] args) {

        Gg2 f = new Gg2();
        f.setLayout(null);
        f.setVisible(true);
        f.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent we) {
                System.out.println("max:" + f.max_timetocalc
                        + " , min:" + f.min_timetocalc);
                System.exit(0);
            }
        });
        f.start();

    }

}
