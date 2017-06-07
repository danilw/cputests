package java_opengl_basic;

import java.util.ArrayList;
import static org.lwjgl.opengl.GL11.*;
import static org.lwjgl.util.glu.GLU.*;

import org.lwjgl.LWJGLException;
import org.lwjgl.input.Keyboard;
import org.lwjgl.input.Mouse;
import org.lwjgl.opengl.Display;
import org.lwjgl.opengl.DisplayMode;
import java.nio.FloatBuffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;


public class opengl_basic {

    public static FloatBuffer makeFloatBuffer(float[] arr) {
        ByteBuffer bb = ByteBuffer.allocateDirect(arr.length * 4);
        bb.order(ByteOrder.nativeOrder());
        FloatBuffer fb = bb.asFloatBuffer();
        fb.put(arr);
        fb.position(0);
        return fb;
    }

    static FloatBuffer a_light = makeFloatBuffer(new float[]{0.2f, 0.2f, 0.2f, 1.0f});
    static FloatBuffer s_light = makeFloatBuffer(new float[]{0.9f, 0.8f, 0.8f, 1.0f});
    static FloatBuffer l_pos = makeFloatBuffer(new float[]{-0.005f, 0.0005f, 0.0f, 0.0f});

    static final double M_PI = Math.PI;
    static final int WIDTH = 1920;
    static final int HEIGHT = 1080;
    static int oncept = 0;
    static final long nanosPerSecond = 1000000000;
    static int dotsscale = 1000; // dots array scale, 100^(x), example 100 1000 10000 1000000 etc
    static int dots = (int) (M_PI * dotsscale); // Pi*1000=3142
    static float rotateradius = 1;
    static int fps = 0;
    static double frameRateSmoothing = 1.0;
    static int numFrames = 0;
    static long lastFpsTime = 0;

    static float persp = 45.0f;
    static boolean stateof[] = {true, true, true};
    static boolean stateofdir[] = {true, true, true};
    static boolean mainrot[] = {false, false};

    static float scale = 0.5f;

    static class p_and_d {

        static int dotsscale = 100;
        static int dots = (int) (M_PI * dotsscale);

        static ArrayList<Double> datavert1x = new ArrayList<Double>();
        static ArrayList<Double> datavert1y = new ArrayList<Double>();
        static ArrayList<Double> datavert2x = new ArrayList<Double>();
        static ArrayList<Double> datavert2y = new ArrayList<Double>();
        static ArrayList<Double> datavert3x = new ArrayList<Double>();
        static ArrayList<Double> datavert3y = new ArrayList<Double>();
        static ArrayList<Double> datavert4x = new ArrayList<Double>();
        static ArrayList<Double> datavert4y = new ArrayList<Double>();
        static ArrayList<Double> datavert5x = new ArrayList<Double>();
        static ArrayList<Double> datavert5y = new ArrayList<Double>();

        static ArrayList<Double> datahotizont1x = new ArrayList<Double>();
        static ArrayList<Double> datahotizont1y = new ArrayList<Double>();
        static ArrayList<Double> datahotizont2x = new ArrayList<Double>();
        static ArrayList<Double> datahotizont2y = new ArrayList<Double>();
        static ArrayList<Double> datahotizont3x = new ArrayList<Double>();
        static ArrayList<Double> datahotizont3y = new ArrayList<Double>();
        static ArrayList<Double> datahotizont4x = new ArrayList<Double>();
        static ArrayList<Double> datahotizont4y = new ArrayList<Double>();
        static ArrayList<Double> datahotizont5x = new ArrayList<Double>();
        static ArrayList<Double> datahotizont5y = new ArrayList<Double>();

        public static void init() {

            for (int i = 0; i < dots; i++) {
                datavert1x.add(null);
                datavert1y.add(null);
                datavert2x.add(null);
                datavert2y.add(null);
                datavert3x.add(null);
                datavert3y.add(null);
                datavert4x.add(null);
                datavert4y.add(null);
                datavert5x.add(null);
                datavert5y.add(null);

                datahotizont1x.add(null);
                datahotizont1y.add(null);
                datahotizont2x.add(null);
                datahotizont2y.add(null);
                datahotizont3x.add(null);
                datahotizont3y.add(null);
                datahotizont4x.add(null);
                datahotizont4y.add(null);
                datahotizont5x.add(null);
                datahotizont5y.add(null);
            }
        }

        static public void FunctionList() {
            for (double n = 0; n < dots; n++) {
                double t = gettm(1, n);
                datavert1x.set((int) n, -3 + (t * 0.98) / 3);
                datavert1y.set((int) n, t * 0.98);
                datavert2x.set((int) n, -2 - 2 / 3.0 + (t / M_PI) / 3);
                datavert2y.set((int) n, (t / M_PI) - 2);
                datavert3x.set((int) n, -1 - 2.0 / 3 + (t / M_PI) / 3);
                datavert3y.set((int) n, (t / M_PI) + 1);
                datavert4x.set((int) n, -2.0 / 3 + (t / M_PI) / 3);
                datavert4y.set((int) n, 1 + (t / M_PI));
                datavert5x.set((int) n, 1.0 / 3 + ((t / M_PI) * 2) / 3);
                datavert5y.set((int) n, 1 + (t / M_PI) * 2);

                datahotizont1x.set((int) n, -3.5 + t / 7);
                datahotizont1y.set((int) n, -3.0);
                datahotizont2x.set((int) n, -1 - 1.0 / 3 + (t / M_PI));
                datahotizont2y.set((int) n, -1.0);
                datahotizont3x.set((int) n, -1.5 + (t / M_PI) / 2);
                datahotizont3y.set((int) n, 0.0);
                datahotizont4x.set((int) n, -0.8 + (t / M_PI) / 2);
                datahotizont4y.set((int) n, 2.0);
                datahotizont5x.set((int) n, -1.0 / 2 + (t / M_PI) * (2 - 1.0 / 2));
                datahotizont5y.set((int) n, 3.0);

            }
        }

//t=[-pi*xpi, pi*xpi]
        static public double gettm(int xpi, double n) {
            return xpi * (-1 * M_PI) + xpi * 2 * (n / dotsscale);
        }

    };

    static class function {

        static int funcid;
        static int lastfuncid;
        static ArrayList<Double> datax = new ArrayList<Double>();
        ;
    static ArrayList<Double> datay = new ArrayList<Double>();
        ;


    static double rotatex;
        static double rotatey;
        static double rotatez;

        public static void init() {

            funcid = 0;
            rotatex = 0;
            rotatey = 0;
            rotatez = 0;
            for (int i = 0; i < dots; i++) {
                datax.add(null);
                datay.add(null);
            }
            calculate();
            findaxis();

        }
        //t=[0, pi*xpi]

        static double gett(int xpi, double n) {
            return xpi * (n / dotsscale);
        }
        //t=[-pi*xpi, pi*xpi]

        static double gettm(int xpi, double n) {
            return xpi * (-1 * M_PI) + xpi * 2 * (n / dotsscale);
        }

        static void FunctionList() {
            
            switch (funcid) {
                case 0:
                    for (double n = 0; n < dots; n++) {
                        double t = gettm(1, n);
                        datax.set((int) n, t);
                        datay.set((int) n, Math.tan(t));
                    }
                    return;
                case 1:
                    for (double n = 0; n < dots; n++) {
                        double t = gettm(1, n);
                        datax.set((int) n, t);
                        datay.set((int) n, t * t * t);
                    }
                    return;
                case 2:
                    for (double n = 0; n < dots; n++) {
                        double t = gettm(2, n);
                        datax.set((int) n, t);
                        datay.set((int) n, (6 * Math.sin(t)) / 2);

                    }
                    return;
                case 3:
                    for (double n = 0; n < dots; n++) {
                        double t = gettm(1, n);
                        datax.set((int) n, t);
                        datay.set((int) n, 1 / Math.tan(t));
                    }
                    return;
                case 4:
                    for (double n = 0; n < dots; n++) {
                        double t = gettm(2, n);
                        datax.set((int) n, t);
                        datay.set((int) n, Math.abs(t) * Math.sin(t));

                    }
                    return;
                case 5:
                    for (double n = 0; n < dots; n++) {
                        double t = gettm(2, n);
                        datax.set((int) n, t);
                        datay.set((int) n, t / (t * t));
                    }
                    return;
                case 6:
                    for (double n = 0; n < dots; n++) {
                        double t = gettm(2, n);
                        datax.set((int) n, t);
                        datay.set((int) n, t * Math.sin(t));
                    }
                    return;
                case 7:
                    for (double n = 0; n < dots; n++) {
                        double t = gett(2, n);
                        datax.set((int) n, 2 * Math.cos(t) + Math.cos(2 * t));
                        datay.set((int) n, 2 * Math.sin(t) - Math.sin(2 * t));
                    }
                    return;
                case 8:
                    for (double n = 0; n < dots; n++) {
                        double t = gett(2, n);
                        datax.set((int) n, 4 * (Math.cos(t) + Math.cos(5 * t) / 5));

                        datay.set((int) n, 4 * (Math.sin(t) - Math.sin(5 * t) / 5));

                    }
                    return;
                case 9:
                    for (double n = 0; n < dots; n++) {
                        double t = gett(20, n);
                        datax.set((int) n, 2.8 * (Math.cos(t) + Math.cos(1.1 * t) / 1.1));

                        datay.set((int) n, 2.8 * (Math.sin(t) - Math.sin(1.1 * t) / 1.1));
                    }
                    return;
                case 10:
                    for (double n = 0; n < dots; n++) {
                        double t = gett(2, n);
                        datax.set((int) n, 3 * (1 + Math.cos(t)) * Math.cos(t));

                        datay.set((int) n, 3 * (1 + Math.cos(t)) * Math.sin(t));

                    }
                    return;
                case 11:
                    for (double n = 0; n < dots; n++) {
                        double t = gett(2, n);
                        datax.set((int) n, 3 * Math.sin(t + M_PI / 2));

                        datay.set((int) n, 3 * Math.sin(2 * t));
                    }
                    return;
                //Butterfly
                case 12:
                    for (double n = 0; n < dots; n++) {
                        double t = gett(12, n);
                        datax.set((int) n, Math.sin(t) * (Math.exp(Math.cos(t)) - 2 * Math.cos(4 * t) + Math.pow(Math.sin(t / 12), 5)));

                        datay.set((int) n, Math.cos(t) * (Math.exp(Math.cos(t)) - 2 * Math.cos(4 * t) + Math.pow(Math.sin(t / 12), 5)));

                    }
                    return;
                //heart <3
                case 13:
                    for (double n = 0; n < dots; n++) {
                        double t = gett(2, n);
                        datax.set((int) n, (16 * Math.pow(Math.sin(t), 3)) / 4);
                        datay.set((int) n, (13 * Math.cos(t) - 5 * Math.cos(2 * t) - 2 * Math.cos(3 * t) - Math.cos(4 * t)) / 4);

                    }
                    return;
                case 14:
                    for (double n = 0; n < dots; n++) {
                        double t = gettm(1, n);
                        datax.set((int) n, 5 * Math.sin(t));
                        datay.set((int) n, 5 * Math.cos(t));
                    }
                    return;
                case 15:
                    for (double n = 0; n < dots; n++) {
                        double t = gettm(1, n);
                        datax.set((int) n, (Math.cos(t) + Math.pow(Math.cos(80 * t), 3)) * 3);
                        datay.set((int) n, (Math.sin(80 * t) + Math.pow(Math.sin(t), 4)) * 2.5);
                    }
                    return;
                case 16:
                    for (double n = 0; n < dots; n++) {
                        double t = gettm(1, n);
                        datax.set((int) n, Math.cos(t) * Math.sqrt((2 * 2 * Math.pow(Math.sin(t), 2) - 5 * 5 * Math.pow(Math.cos(t), 2)) / (Math.pow(Math.sin(t), 2) - Math.pow(Math.cos(t), 2))));
                        datay.set((int) n, Math.sin(t) * Math.sqrt((2 * 2 * Math.pow(Math.sin(t), 2) - 5 * 5 * Math.pow(Math.cos(t), 2)) / (Math.pow(Math.sin(t), 2) - Math.pow(Math.cos(t), 2))));
                    }
                    return;
                case 17:
                    for (double n = 0; n < dots; n++) {
                        double t = gettm(1, n);
                        datax.set((int) n, 3 * Math.cos(t) * (1 - 2 * Math.pow(Math.sin(t), 2)));
                        datay.set((int) n, 3 * Math.sin(t) * (1 - 2 * Math.pow(Math.cos(t), 2)));
                    }
                    return;
                //18 p and d cahrs
                default:
                    funcid = 18;
                    persp = 50;
                    p_and_d.FunctionList();

                    return;
            }

        }

        static void calculate() {
            FunctionList();

        }

        static void findaxis() {

            if (!mainrot[0]) {
                if (stateof[0] && stateof[1] && stateof[2]) {

                    if (stateofdir[0]) {
                        function.rotatey += 0.05;
                        stateofdir[0] = function.rotatey < 7;
                    } else {
                        stateof[0] = stateofdir[0];
                    }
                } else if (stateof[1] && (!stateof[0]) && stateof[2]) {
                    if (function.rotatey > 0) {
                        function.rotatey -= 0.05;
                    }
                    if (stateofdir[1]) {
                        function.rotatex += 0.05;
                        stateofdir[1] = function.rotatex < 7;
                    } else {
                        stateof[1] = stateofdir[1];
                    }
                }
                if ((!stateof[1]) && (!stateof[0]) && stateof[2]) {
                    if (function.rotatex > 0) {
                        function.rotatex -= 0.05;
                    }
                    if (stateofdir[2]) {
                        function.rotatez += 0.05;
                        stateofdir[2] = function.rotatez < 7;
                    } else {
                        stateof[2] = stateofdir[2];
                        mainrot[0] = !stateofdir[2];
                    }
                }
            } else {
                if (!mainrot[1]) {
                    if (stateofdir[0]) {
                        function.rotatey += 0.05;
                        stateofdir[0] = function.rotatey < 7;

                        if (stateofdir[2]) {
                            function.rotatez += 0.05;
                            stateofdir[2] = function.rotatez < 7;
                        } else {
                            function.rotatez -= 0.05;
                            stateofdir[2] = function.rotatez < -7;
                        }
                    } else {
                        if (stateofdir[1]) {
                            function.rotatex += 0.05;
                            stateofdir[1] = function.rotatex < 7;
                            if (stateofdir[2]) {
                                function.rotatez += 0.05;
                                stateofdir[2] = function.rotatez < 7;
                            } else {
                                function.rotatez -= 0.05;
                                stateofdir[2] = function.rotatez < -7;
                            }
                        } else {
                            function.rotatex -= 0.05;
                            stateofdir[1] = function.rotatex < -7;
                            if (stateofdir[2]) {
                                function.rotatez += 0.05;
                                stateofdir[2] = function.rotatez < 7;
                                if (funcid != 18) {
                                    mainrot[1] = !stateofdir[2]; //end this and turn next
                                }
                            } else {
                                function.rotatez -= 0.05;
                                stateofdir[2] = function.rotatez < -7;
                            }
                        }
                        function.rotatey -= 0.05;
                        stateofdir[0] = function.rotatey < -7;
                    }
                }
            }
            if (mainrot[0] && mainrot[1]) {
                if (function.rotatez > 0) {
                    function.rotatez -= 0.1;
                } else {
                    function.rotatez = 0;
                    function.rotatex = 0;
                    function.rotatey = 0;
                    stateof[0] = stateof[1] = stateof[2] = true;
                    stateofdir[0] = stateofdir[1] = stateofdir[2] = true;
                    mainrot[0] = mainrot[1] = false;
                    function.funcid += 1;
                }
            }

        }
    };

    static void display() {
        glClear(GL_COLOR_BUFFER_BIT);
        glPushMatrix();
        for (double r = 0; r < 360; r += rotateradius) {
            glColor3f((float) ((function.rotatex > 0 ? function.rotatex : -1 * function.rotatex) / 14.0),
                    (float) ((function.rotatey > 0 ? function.rotatey : -1 * function.rotatey) / 14.0),
                    (float) ((function.rotatez > 0 ? function.rotatez : -1 * function.rotatez) / 14.0));

            glRotated(r / (100 / rotateradius), function.rotatex / 7, function.rotatey / 7, function.rotatez / 7);

            drawfunction();

        }
        glFlush();
        glPopMatrix();
    }

    static void drawfunction() {
        glBegin(GL_POINTS);
        for (double n = 0; n < dots; n++) {

            if (function.funcid == 18) {
                if ((n >= p_and_d.dots)||(p_and_d.datavert1x.get((int) n)==null)) {
                    break;
                }
                glVertex3f((float) (p_and_d.datahotizont1x.get((int) n) * scale), (float) (p_and_d.datahotizont1y.get((int) n) * scale), 0);
                glVertex3f((float) (p_and_d.datahotizont2x.get((int) n) * scale), (float) (p_and_d.datahotizont2y.get((int) n) * scale), 0);
                glVertex3f((float) (p_and_d.datahotizont3x.get((int) n) * scale), (float) (p_and_d.datahotizont3y.get((int) n) * scale), 0);
                glVertex3f((float) (p_and_d.datahotizont4x.get((int) n) * scale), (float) (p_and_d.datahotizont4y.get((int) n) * scale), 0);
                glVertex3f((float) (p_and_d.datahotizont5x.get((int) n) * scale), (float) (p_and_d.datahotizont5y.get((int) n) * scale), 0);

                glVertex3f((float) (p_and_d.datavert1x.get((int) n) * scale), (float) (p_and_d.datavert1y.get((int) n) * scale), 0);
                glVertex3f((float) (p_and_d.datavert2x.get((int) n) * scale), (float) (p_and_d.datavert2y.get((int) n) * scale), 0);
                glVertex3f((float) (p_and_d.datavert3x.get((int) n) * scale), (float) (p_and_d.datavert3y.get((int) n) * scale), 0);
                glVertex3f((float) (p_and_d.datavert4x.get((int) n) * scale), (float) (p_and_d.datavert4y.get((int) n) * scale), 0);
                glVertex3f((float) (p_and_d.datavert5x.get((int) n) * scale), (float) (p_and_d.datavert5y.get((int) n) * scale), 0);

                glVertex3f((float) (p_and_d.datahotizont1x.get((int) n) * scale + 4.35 + 1.0 / 3), (float) (p_and_d.datahotizont1y.get((int) n) * scale + 3.8), 0);
                glVertex3f((float) (p_and_d.datahotizont2x.get((int) n) * scale + 2.18 + 1.0 / 3), (float) (p_and_d.datahotizont2y.get((int) n) * scale + 1.8), 0);
                glVertex3f((float) (p_and_d.datahotizont3x.get((int) n) * scale + 2.34 + 1.0 / 3), (float) (p_and_d.datahotizont3y.get((int) n) * scale + 0.8), 0);
                glVertex3f((float) (p_and_d.datahotizont4x.get((int) n) * scale + 1.65 + 1.0 / 3), (float) (p_and_d.datahotizont4y.get((int) n) * scale - 1.2), 0);
                glVertex3f((float) (p_and_d.datahotizont5x.get((int) n) * scale + 1.35 + 1.0 / 3), (float) (p_and_d.datahotizont5y.get((int) n) * scale - 2.2), 0);

                glVertex3f((float) (p_and_d.datavert1x.get((int) n) * scale + 4.005 + 1.0 / 6), (float) (p_and_d.datavert1y.get((int) n) * scale + 0.8), 0);
                glVertex3f((float) (p_and_d.datavert2x.get((int) n) * scale + 4.05 - 1.0 / 6), (float) (p_and_d.datavert2y.get((int) n) * scale + 2.8), 0);
                glVertex3f((float) (p_and_d.datavert3x.get((int) n) * scale + 3 - 1.0 / 6), (float) (p_and_d.datavert3y.get((int) n) * scale - 0.2), 0);
                glVertex3f((float) (p_and_d.datavert4x.get((int) n) * scale + 2 - 1.0 / 6), (float) (p_and_d.datavert4y.get((int) n) * scale - 0.2), 0);
                glVertex3f((float) (p_and_d.datavert5x.get((int) n) * scale + 1. - 1.0 / 6), (float) (p_and_d.datavert5y.get((int) n) * scale - 0.2), 0);
            } else {
                glVertex3f((float) (function.datax.get((int) n) * scale), (float) (function.datay.get((int) n) * scale), 0);

            }
        }
        glEnd();
        glPopMatrix();

    }

    static void idle_func() {
        function.calculate();
        function.findaxis();
        //glutPostRedisplay();
    }

    static void InitGL(int Width, int Height) throws LWJGLException {

        glEnable(GL_LIGHTING);

        glLightModel(GL_LIGHT_MODEL_AMBIENT, a_light);
        glLight(GL_LIGHT0, GL_DIFFUSE, s_light);
        glLight(GL_LIGHT0, GL_POSITION, l_pos);
        glEnable(GL_LIGHT0);

        glEnable(GL_COLOR_MATERIAL);
        glColorMaterial(GL_FRONT, GL_AMBIENT_AND_DIFFUSE);

        glEnable(GL_BLEND);
        glEnable(GL_CULL_FACE);
        glEnable(GL_NORMALIZE);

        glBlendFunc(GL_ONE, GL_ONE);

    }

    static void ReSizeGLScene(int Width, int Height) {
        if (Height == 0) {
            Height = 1;
        }

        glViewport(0, 0, Width, Height);

        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        gluPerspective(persp, (Width + 250) / Height, 0.1f, 100.0f);
        glMatrixMode(GL_MODELVIEW);
    }

    static void DrawGLScene() throws LWJGLException {
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
        glLoadIdentity();

        glTranslatef(0.0f, 0.0f, -7.0f);
        display();
        Display.swapBuffers();
        oncept++;
        if (oncept > 5) {
            oncept = 0;
            System.out.println("fps: " + fps);
        }
        numFrames++;
        double delta = (double) (System.nanoTime() - lastFpsTime) / nanosPerSecond;
        if (delta > frameRateSmoothing) {
            fps = (int) (numFrames / delta);
            numFrames = 0;
            lastFpsTime = System.nanoTime();
        }

    }

    static void destroy() {
        //Methods already check if created before destroying.
        Mouse.destroy();
        Keyboard.destroy();
        Display.destroy();
    }

    public void run() {
        while (!Display.isCloseRequested()) {
            if (Display.isVisible()) {
                
                try {{
                idle_func();
                    DrawGLScene();}
                } catch (Exception ex) {
                    System.out.println(ex.toString());
                    return;
                }
                
                // update();
                // render();
            } else {
                if (Display.isDirty()) {
                    idle_func();
                }
            }
            Display.update();
        }
    }

    public static void main(String[] args) {

        opengl_basic main = null;
        p_and_d.init();
        function.init();
        try {

            main = new opengl_basic();
            Display.setDisplayMode(new DisplayMode(WIDTH, HEIGHT));
            Display.setFullscreen(false);
            Display.setTitle("opengl basic");
            Display.create();

            InitGL(WIDTH, HEIGHT);
            ReSizeGLScene(WIDTH, HEIGHT);
            main.run();

        } catch (Exception ex) {
            System.out.println(ex.toString());
            return;
        } finally {
            if (main != null) {
                main.destroy();
            }
        }
    }
}
