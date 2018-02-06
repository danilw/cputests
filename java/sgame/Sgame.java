package sgame;

import org.lwjgl.LWJGLException;
import org.lwjgl.input.Keyboard;
import org.lwjgl.input.Mouse;
import org.lwjgl.opengl.Display;
import org.lwjgl.opengl.DisplayMode;
import static org.lwjgl.opengl.GL11.*;

public class Sgame {

    static c_sgame cg = new c_sgame();
    static Program program;

    static void c_init() {
        cg.initglslvals();
        cg.inituniforms(program);

    }

    static void c_worker() {

        cg.mouse_press_handler();
        cg.mouse_move_handler();
        cg.keyboard_up_handler();
        cg.display(program);
    }
    static String frag = "myfs.glsl"; //add this file to java package, its resource

    public static void main(String[] args) {
        try {     
            DisplayMode mode = Display.getDesktopDisplayMode();

            Display.setDisplayMode(mode);       
            Display.setFullscreen(false);
                    
            Display.create();         
            Keyboard.create();
            Mouse.create();


            glMatrixMode(GL_PROJECTION);
            glLoadIdentity();
            glOrtho(-1.0f, 1.0f, -1.0f, 1.0f, 11.0f, 60.0f);

            glMatrixMode(GL_MODELVIEW);

            // createa a fragment shader
            program = new Program();
            program.addShader(frag, true);
            program.linkProgram();

            program.bind();
            c_init();

            glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
            while (!Display.isCloseRequested()) {
                Thread.sleep(1000/60);
                glClearColor(0.0f, 0.0f, 0.0f, 1.0f);

                glViewport(0, 0, Display.getWidth(), Display.getHeight());
                glClear(GL_COLOR_BUFFER_BIT );

                glLoadIdentity();

                glTranslatef(0.0f, 0.f, -20f);

                if (Keyboard.isKeyDown(Keyboard.KEY_ESCAPE)) {
                    break;
                }
                c_worker();
                glRectf(-1.0f, -1.0f, 2.0f, 2.0f);
                Display.update();
            }

            program.delete();

            Display.destroy();

        } catch (Exception ex) {

        }
    }
}
