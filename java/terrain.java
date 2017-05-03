import java.util.Arrays;
import java.util.stream.*;

import java.awt.Graphics;
import java.awt.Color;

import javax.swing.JComponent;
import javax.swing.JFrame;
import java.awt.Rectangle;
import java.awt.Graphics2D;

public class terrain {

    static long timetocalc;
    static long timetodraw;

    static terrain terrain;

    int size;
    int max;
    float[] map;

    public terrain(float detail) {
        this.size = (int) Math.pow(2, detail) + 1;
        this.max = this.size - 1;
        this.map = new float[this.size * this.size];
    }

    float get(int x, int y) {
        if (x < 0 || x > this.max || y < 0 || y > this.max) {
            return -1;
        }
        return this.map[x + this.size * y];
    }

    void set(int x, int y, float val) {
        this.map[x + this.size * y] = val;
    }

    public void generate(float roughness) {
        new generate(roughness);
    }

    class generate {

        float roughness;
        terrain self = terrain;

        public generate(float roughness) {
            this.roughness = roughness;
            terrain.set(0, 0, self.max);
            terrain.set(terrain.max, 0, self.max / 2);
            terrain.set(terrain.max, terrain.max, 0);
            terrain.set(0, terrain.max, self.max / 2);

            divide(terrain.max);
        }

        void divide(int size) {
            int x, y, half = size / 2;
            float scale = roughness * size;
            if (half < 1) {
                return;
            }

            for (y = half; y < self.max; y += size) {
                for (x = half; x < self.max; x += size) {
                    square(x, y, half, (int) (Math.random() * scale * 2 - scale));
                }
            }
            for (y = 0; y <= self.max; y += half) {
                for (x = (y + half) % size; x <= self.max; x += size) {
                    diamond(x, y, half, (int) (Math.random() * scale * 2 - scale));
                }
            }
            divide(size / 2);
        }

        float average(float[] values) {
            DoubleStream ds = IntStream.range(0, values.length).mapToDouble(i -> values[i]);
            double[] valid = ds.filter(x -> x != -1).toArray();
            float total = (float) Arrays.stream(valid).reduce(0, (x, y) -> x + y);
            return total / valid.length;
        }

        void square(int x, int y, int size, int offset) {
            float ave = average(new float[]{self.get(x - size, y - size),
                self.get(x + size, y - size),
                self.get(x + size, y + size),
                self.get(x - size, y + size)
            });
            self.set(x, y, ave + offset);
        }

        void diamond(int x, int y, int size, int offset) {
            float ave = average(new float[]{
                self.get(x, y - size),
                self.get(x + size, y),
                self.get(x, y + size),
                self.get(x - size, y)
            });
            self.set(x, y, ave + offset);
        }
    }

    void draw(int width, int height) {

        JFrame window = new JFrame();
        window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        window.setBounds(0, 0, width, height);
        window.getContentPane().add(new draw(width, height));
        window.setVisible(true);

    }

    class draw extends JComponent {

        int width, height;
        boolean painted = false;

        public void paint(Graphics g) {
            if (!painted) {
                painted = true;
                Graphics2D g2d = (Graphics2D) g;
                g2d.setColor(new Color(0, 0, 0));
                g2d.fill(new Rectangle(0, 0, width, height));
                float waterVal = (float) (terrain.size * 0.3);
                for (int y = 0; y < terrain.size; y++) {
                    for (int x = 0; x < terrain.size; x++) {
                        float val = terrain.get(x, y);
                        float[] top = project(x, y, val);
                        float[] bottom = project(x + 1, y, 0);
                        float[] water = project(x, y, waterVal);
                        Color style = brightness(x, y, terrain.get(x + 1, y) - val);
                        rect(top, bottom, style, g2d);
                        rect(water, bottom, new Color(50, 150, 200, 15), g2d);
                    }
                }
                g2d.setColor(Color.WHITE);
                timetodraw = System.currentTimeMillis() - timetodraw;
                g2d.drawString("timetocalc(msec): " + timetocalc + " timetodraw(msec): " + timetodraw, 50, 50);
                System.out.println("timetocalc(msec): " + timetocalc + " timetodraw(msec): " + timetodraw);
            }
        }

        public draw(int width, int height) {
            this.width = width;
            this.height = height;
        }

        void rect(float[] a, float[] b, Color style, Graphics2D g2d) {
            if (b[1] < a[1]) {
                return;
            }
            g2d.setColor(style);
            g2d.fill(new Rectangle((int) a[0], (int) a[1], (int) b[0] - (int) a[0], (int) b[1] - (int) a[1]));
        }

        Color brightness(int x, int y, float slope) {
            if (y == terrain.max || x == terrain.max) {
                return new Color(0, 0, 0);
            }
            int b = ~ ~((int) (slope * 50)) + 128;
            b = b > 255 ? 255 : b;
            b = b < 0 ? 0 : b;
            return new Color(b, b, b, 255);
        }

        float[] iso(int x, int y) {
            return new float[]{
                (float) (0.5 * (terrain.size + x - y)),
                (float) (0.5 * (x + y))
            };
        }

        float[] project(int flatX, int flatY, float flatZ) {
            float[] point = iso(flatX, flatY);
            float x0 = (float) (width * 0.5);
            float y0 = (float) (height * 0.2);
            float z = (float) (terrain.size * 0.5 - flatZ + point[1] * 0.75);
            float x = (float) ((point[0] - terrain.size * 0.5) * 6);
            float y = (float) ((terrain.size - point[1]) * 0.005 + 1);

            return new float[]{
                x0 + x / y,
                y0 + z / y
            };
        }

    }

    public static void main(String[] args) {
        int width = 1900;
        int height = 1000;
        timetocalc = System.currentTimeMillis();
        terrain = new terrain(9);
        terrain.generate((float) 0.7);
        timetocalc = System.currentTimeMillis() - timetocalc;
        timetodraw = System.currentTimeMillis();
        terrain.draw(width, height);

    }

}
