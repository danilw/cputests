#include <GL/gl.h>
#include <GL/glu.h>
#include <GL/glut.h>
#include <unistd.h>

#include <cstdlib>
#include <cmath>
#include <iostream>
#include <chrono>
#include <ctime>


#include <vector>

GLfloat a_light[] = {0.2, 0.2, 0.2, 1.0};
GLfloat s_light[] = {0.9, 0.8, 0.8, 1.0};
GLfloat l_pos[] = {-0.005, 0.0005, 0.0, 0.0};


const int WIDTH = 1920;
const int HEIGHT = 1080;
int dotsscale = 1000; // dots array scale, 100^(x), example 100 1000 10000 1000000 etc
int dots = M_PI*dotsscale; // Pi*1000=3142
float rotateradius = 1;
int fps = 0;
double frameRateSmoothing = 1.0;
int numFrames = 0;
static std::chrono::high_resolution_clock::time_point lastFpsTime;
double persp = 45.0f;
bool stateof[3] = {true, true, true};
bool stateofdir[3] = {true, true, true};
bool mainrot[2] = {false, false};

void drawfunction();
double scale = 0.5;

struct imgdata {
    int dotsscale = 100;
    int dots = M_PI*dotsscale;

    std::vector<double> datavert1x;
    std::vector<double> datavert1y;
    std::vector<double> datavert2x;
    std::vector<double> datavert2y;
    std::vector<double> datavert3x;
    std::vector<double> datavert3y;
    std::vector<double> datavert4x;
    std::vector<double> datavert4y;
    std::vector<double> datavert5x;
    std::vector<double> datavert5y;

    std::vector<double> datahotizont1x;
    std::vector<double> datahotizont1y;
    std::vector<double> datahotizont2x;
    std::vector<double> datahotizont2y;
    std::vector<double> datahotizont3x;
    std::vector<double> datahotizont3y;
    std::vector<double> datahotizont4x;
    std::vector<double> datahotizont4y;
    std::vector<double> datahotizont5x;
    std::vector<double> datahotizont5y;

    imgdata() {
        datavert1x.resize(dots);
        datavert1y.resize(dots);
        datavert2x.resize(dots);
        datavert2y.resize(dots);
        datavert3x.resize(dots);
        datavert3y.resize(dots);
        datavert4x.resize(dots);
        datavert4y.resize(dots);
        datavert5x.resize(dots);
        datavert5y.resize(dots);

        datahotizont1x.resize(dots);
        datahotizont1y.resize(dots);
        datahotizont2x.resize(dots);
        datahotizont2y.resize(dots);
        datahotizont3x.resize(dots);
        datahotizont3y.resize(dots);
        datahotizont4x.resize(dots);
        datahotizont4y.resize(dots);
        datahotizont5x.resize(dots);
        datahotizont5y.resize(dots);
    }

    void FunctionList();
    double gettm(int, double);


} p_and_d;

void imgdata::FunctionList() {
    for (double n = 0; n < dots; n++) {
        double t = gettm(1, n);
        datavert1x [n] = -3 + (t * 0.98) / 3;
        datavert1y [n] = t * 0.98;
        datavert2x [n] = -2 - 2 / 3.0 + (t / M_PI) / 3;
        datavert2y [n] = (t / M_PI) - 2;
        datavert3x [n] = -1 - 2.0 / 3 + (t / M_PI) / 3;
        datavert3y [n] = (t / M_PI) + 1;
        datavert4x [n] = -2.0 / 3 + (t / M_PI) / 3;
        datavert4y [n] = 1 + (t / M_PI);
        datavert5x [n] = 1.0 / 3 + ((t / M_PI)*2) / 3;
        datavert5y [n] = 1 + (t / M_PI)*2;


        datahotizont1x [n] = -3.5 + t / 7;
        datahotizont1y [n] = -3;
        datahotizont2x [n] = -1 - 1.0 / 3 + (t / M_PI);
        datahotizont2y [n] = -1;
        datahotizont3x [n] = -1.5 + (t / M_PI) / 2;
        datahotizont3y [n] = 0;
        datahotizont4x [n] = -0.8 + (t / M_PI) / 2;
        datahotizont4y [n] = 2;
        datahotizont5x [n] = -1.0 / 2 + (t / M_PI)*(2 - 1.0 / 2);
        datahotizont5y [n] = 3;

    }
}


//t=[-pi*xpi, pi*xpi]

double imgdata::gettm(int xpi, double n) {
    return xpi * (-1 * M_PI) + xpi * 2 * (n / dotsscale);
}

struct FunctionData {
    int funcid;
    int lastfuncid;
    std::vector<double> datax;
    std::vector<double> datay;


    double rotatex;
    double rotatey;
    double rotatez;

    FunctionData() {

        funcid = 0;
        rotatex = 0;
        rotatey = 0;
        rotatez = 0;

        datax.resize(dots);
        datay.resize(dots);
        calculate();
        findaxis();

    }

    void calculate();
    void findaxis();
    void FunctionList();
    double gett(int, double);
    double gettm(int, double);
} function;


//t=[0, pi*xpi]

double FunctionData::gett(int xpi, double n) {
    return xpi * (n / dotsscale);
}

//t=[-pi*xpi, pi*xpi]

double FunctionData::gettm(int xpi, double n) {
    return xpi * (-1 * M_PI) + xpi * 2 * (n / dotsscale);
}

void FunctionData::FunctionList() {
    switch (funcid) {
        case 0:for (double n = 0; n < dots; n++) {
                double t = gettm(1, n);
                datax [n] = t;
                datay [n] = tan(t);
            }
            return;
        case 1:for (double n = 0; n < dots; n++) {
                double t = gettm(1, n);
                datax [n] = t;
                datay [n] = t * t*t;
            }
            return;
        case 2:
            for (double n = 0; n < dots; n++) {
                double t = gettm(2, n);
                datax [n] = t;
                datay [n] = (6 * sin(t)) / 2;

            }
            return;
        case 3:
            for (double n = 0; n < dots; n++) {
                double t = gettm(1, n);
                datax [n] = t;
                datay [n] = 1 / tan(t);
            }
            return;
        case 4:
            for (double n = 0; n < dots; n++) {
                double t = gettm(2, n);
                datax [n] = t;
                datay [n] = std::abs(t) * sin(t);

            }
            return;
        case 5:
            for (double n = 0; n < dots; n++) {
                double t = gettm(2, n);
                datax [n] = t;
                datay [n] = t / (t * t);
            }
            return;
        case 6:for (double n = 0; n < dots; n++) {
                double t = gettm(2, n);
                datax [n] = t;
                datay [n] = t * sin(t);
            }
            return;
        case 7:for (double n = 0; n < dots; n++) {
                double t = gett(2, n);
                datax [n] = 2 * cos(t) + cos(2 * t);
                datay [n] = 2 * sin(t) - sin(2 * t);
            }
            return;
        case 8:for (double n = 0; n < dots; n++) {
                double t = gett(2, n);
                datax [n] = 4 * (cos(t) + cos(5 * t) / 5);

                datay [n] = 4 * (sin(t) - sin(5 * t) / 5);

            }
            return;
        case 9:for (double n = 0; n < dots; n++) {
                double t = gett(20, n);
                datax [n] = 2.8 * (cos(t) + cos(1.1 * t) / 1.1);

                datay [n] = 2.8 * (sin(t) - sin(1.1 * t) / 1.1);
            }
            return;
        case 10:for (double n = 0; n < dots; n++) {
                double t = gett(2, n);
                datax [n] = 3 * (1 + cos(t)) * cos(t);

                datay [n] = 3 * (1 + cos(t)) * sin(t);

            }
            return;
        case 11:for (double n = 0; n < dots; n++) {
                double t = gett(2, n);
                datax [n] = 3 * sin(t + M_PI / 2);

                datay [n] = 3 * sin(2 * t);
            }
            return;
            //Butterfly
        case 12:for (double n = 0; n < dots; n++) {
                double t = gett(12, n);
                datax [n] = sin(t)*(exp(cos(t)) - 2 * cos(4 * t) + pow(sin(t / 12), 5));

                datay [n] = cos(t)*(exp(cos(t)) - 2 * cos(4 * t) + pow(sin(t / 12), 5));

            }
            return;
            //heart <3
        case 13:for (double n = 0; n < dots; n++) {
                double t = gett(2, n);
                datax [n] = (16 * pow(sin(t), 3)) / 4;
                datay [n] = (13 * cos(t) - 5 * cos(2 * t) - 2 * cos(3 * t) - cos(4 * t)) / 4;

            }
            return;
        case 14:for (double n = 0; n < dots; n++) {
                double t = gettm(1, n);
                datax [n] = 5 * sin(t);
                datay [n] = 5 * cos(t);
            }
            return;
        case 15:for (double n = 0; n < dots; n++) {
                double t = gettm(1, n);
                datax [n] = (cos(t) + pow(cos(80 * t), 3))*3;
                datay [n] = (sin(80 * t) + pow(sin(t), 4))*2.5;
            }
            return;
        case 16:for (double n = 0; n < dots; n++) {
                double t = gettm(1, n);
                datax [n] = cos(t) * sqrt((2 * 2 * pow(sin(t), 2) - 5 * 5 * pow(cos(t), 2)) / (pow(sin(t), 2) - pow(cos(t), 2)));
                datay [n] = sin(t) * sqrt((2 * 2 * pow(sin(t), 2) - 5 * 5 * pow(cos(t), 2)) / (pow(sin(t), 2) - pow(cos(t), 2)));
            }
            return;
        case 17:for (double n = 0; n < dots; n++) {
                double t = gettm(1, n);
                datax [n] = 3 * cos(t)*(1 - 2 * pow(sin(t), 2));
                datay [n] = 3 * sin(t)*(1 - 2 * pow(cos(t), 2));
            }
            return;
            //18 p and d cahrs
        default:funcid = 18;
            persp = 50;
            p_and_d.FunctionList();

            return;
            return;
    }


}

void FunctionData::calculate() {
    FunctionList();


}

void FunctionData::findaxis() {

    if (!mainrot[0]) {
        if (stateof[0] && stateof[1] && stateof[2]) {

            if (stateofdir[0]) {
                function.rotatey += 0.05;
                stateofdir[0] = function.rotatey < 7;
            } else {
                stateof[0] = stateofdir[0];
            }
        } else if (stateof[1]&&(!stateof[0]) && stateof[2]) {
            if (function.rotatey > 0)function.rotatey -= 0.05;
            if (stateofdir[1]) {
                function.rotatex += 0.05;
                stateofdir[1] = function.rotatex < 7;
            } else {
                stateof[1] = stateofdir[1];
            }
        }
        if ((!stateof[1])&&(!stateof[0]) && stateof[2]) {
            if (function.rotatex > 0)function.rotatex -= 0.05;
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
                    stateofdir[2] = function.rotatez <-7;
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
                        stateofdir[2] = function.rotatez <-7;
                    }
                } else {
                    function.rotatex -= 0.05;
                    stateofdir[1] = function.rotatex <-7;
                    if (stateofdir[2]) {
                        function.rotatez += 0.05;
                        stateofdir[2] = function.rotatez < 7;
                        if (funcid != 18)mainrot[1] = !stateofdir[2]; //end this and turn next
                    } else {
                        function.rotatez -= 0.05;
                        stateofdir[2] = function.rotatez <-7;
                    }
                }
                function.rotatey -= 0.05;
                stateofdir[0] = function.rotatey <-7;
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

void display(void) {
    glClear(GL_COLOR_BUFFER_BIT);
    glPushMatrix();
    for (double r = 0; r < 360; r += rotateradius) {
        glColor3f(((function.rotatex > 0 ? function.rotatex : -1 * function.rotatex) / 14.0),
                ((function.rotatey > 0 ? function.rotatey : -1 * function.rotatey) / 14.0),
                ((function.rotatez > 0 ? function.rotatez : -1 * function.rotatez) / 14.0));
        /*glColor3f(function.xaxis * .225 + (1 / (rand() % 100 + 1)),
                function.yaxis * .225,
                function.zaxis * .225 + (1 / (rand() % 100 + 1)));*/

        glRotated(r / (100 / rotateradius), function.rotatex, function.rotatey, function.rotatez);

        drawfunction();

    }
    glFlush();
    glPopMatrix();
}

void drawfunction() {
    glBegin(GL_POINTS);
    for (double n = 0; n < dots; n++) {
        if (function.funcid == 18) {
            if (n >= p_and_d.dots)break;
            glVertex3f(p_and_d.datahotizont1x[n] * scale, p_and_d.datahotizont1y[n] * scale, 0);
            glVertex3f(p_and_d.datahotizont2x[n] * scale, p_and_d.datahotizont2y[n] * scale, 0);
            glVertex3f(p_and_d.datahotizont3x[n] * scale, p_and_d.datahotizont3y[n] * scale, 0);
            glVertex3f(p_and_d.datahotizont4x[n] * scale, p_and_d.datahotizont4y[n] * scale, 0);
            glVertex3f(p_and_d.datahotizont5x[n] * scale, p_and_d.datahotizont5y[n] * scale, 0);

            glVertex3f(p_and_d.datavert1x[n] * scale, p_and_d.datavert1y[n] * scale, 0);
            glVertex3f(p_and_d.datavert2x[n] * scale, p_and_d.datavert2y[n] * scale, 0);
            glVertex3f(p_and_d.datavert3x[n] * scale, p_and_d.datavert3y[n] * scale, 0);
            glVertex3f(p_and_d.datavert4x[n] * scale, p_and_d.datavert4y[n] * scale, 0);
            glVertex3f(p_and_d.datavert5x[n] * scale, p_and_d.datavert5y[n] * scale, 0);

            glVertex3f(p_and_d.datahotizont1x[n] * scale + 4.35 + 1.0 / 3, p_and_d.datahotizont1y[n] * scale + 3.8, 0);
            glVertex3f(p_and_d.datahotizont2x[n] * scale + 2.18 + 1.0 / 3, p_and_d.datahotizont2y[n] * scale + 1.8, 0);
            glVertex3f(p_and_d.datahotizont3x[n] * scale + 2.34 + 1.0 / 3, p_and_d.datahotizont3y[n] * scale + 0.8, 0);
            glVertex3f(p_and_d.datahotizont4x[n] * scale + 1.65 + 1.0 / 3, p_and_d.datahotizont4y[n] * scale - 1.2, 0);
            glVertex3f(p_and_d.datahotizont5x[n] * scale + 1.35 + 1.0 / 3, p_and_d.datahotizont5y[n] * scale - 2.2, 0);

            glVertex3f(p_and_d.datavert1x[n] * scale + 4.005 + 1.0 / 6, p_and_d.datavert1y[n] * scale + 0.8, 0);
            glVertex3f(p_and_d.datavert2x[n] * scale + 4.05 - 1.0 / 6, p_and_d.datavert2y[n] * scale + 2.8, 0);
            glVertex3f(p_and_d.datavert3x[n] * scale + 3 - 1.0 / 6, p_and_d.datavert3y[n] * scale - 0.2, 0);
            glVertex3f(p_and_d.datavert4x[n] * scale + 2 - 1.0 / 6, p_and_d.datavert4y[n] * scale - 0.2, 0);
            glVertex3f(p_and_d.datavert5x[n] * scale + 1. - 1.0 / 6, p_and_d.datavert5y[n] * scale - 0.2, 0);
        } else glVertex3f(function.datax[n] * scale, function.datay[n] * scale, 0);
    }
    glEnd();
}

void idle_func(void) {

    function.calculate();
    function.findaxis();
    glutPostRedisplay();
}

int window;

void InitGL(int Width, int Height) {

    glEnable(GL_LIGHTING);
    glLightModelfv(GL_LIGHT_MODEL_AMBIENT, a_light);
    glLightfv(GL_LIGHT0, GL_DIFFUSE, s_light);
    glLightfv(GL_LIGHT0, GL_POSITION, l_pos);
    glEnable(GL_LIGHT0);

    glEnable(GL_COLOR_MATERIAL);
    glColorMaterial(GL_FRONT, GL_AMBIENT_AND_DIFFUSE);


    glEnable(GL_BLEND);
    glEnable(GL_CULL_FACE);

    glBlendFunc(GL_ONE, GL_ONE);


}

void ReSizeGLScene(int Width, int Height) {
    if (Height == 0)
        Height = 1;

    glViewport(0, 0, Width, Height);

    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();

    gluPerspective(persp, (GLfloat) Width / (GLfloat) Height, 0.1f, 100.0f);
    glMatrixMode(GL_MODELVIEW);
}

void DrawGLScene() {
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glLoadIdentity();

    glTranslatef(0.0f, 0.0f, -7.0f);
    display();
    glutSwapBuffers();
    std::cout << "fps: " << fps << "\n";
    numFrames++;
    std::chrono::duration<double> delta = std::chrono::duration_cast<std::chrono::duration<double>> (std::chrono::high_resolution_clock::now() - lastFpsTime);
    if (delta.count() > frameRateSmoothing) {
        fps = (int) (numFrames / delta.count());
        numFrames = 0;
        lastFpsTime = std::chrono::high_resolution_clock::now();
    }

}

int main(int argc, char **argv) {
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_RGBA | GLUT_DOUBLE | GLUT_ALPHA | GLUT_DEPTH);
    glutInitWindowSize(WIDTH, HEIGHT);
    glutInitWindowPosition(0, 0);
    window = glutCreateWindow("opengl basic");
    glutDisplayFunc(&DrawGLScene);
    glutIdleFunc(idle_func);
    glutReshapeFunc(&ReSizeGLScene);
    InitGL(WIDTH, HEIGHT);
    std::chrono::high_resolution_clock::time_point lastFpsTime = std::chrono::high_resolution_clock::now();
    glutMainLoop();

    return 0;
}
