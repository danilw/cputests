#include <math.h>

#include <deque>
#include <cmath>

#include <string.h>
#include <getopt.h>


#include <sys/types.h>

//#include <GLES2/gl2.h>
#include <GL/glew.h>
#include <GL/glut.h>
//#include <GL/freeglut_ext.h> //non wasm
#include <GL/freeglut_std.h> //wasm


//#include <gdk-pixbuf/gdk-pixbuf.h> //load texture non wasm

#include <stdio.h>
#include <stdlib.h>
//#include <pthread.h> 
#include <time.h> //wasm

//gl_es wasm
const char* vertex_source =
    "attribute vec4 position;   \n"
    "attribute vec2 texCoord;   \n"
    "varying vec2 v_texCoord;     \n"
    "void main()                  \n"
    "{                            \n"
    "   gl_Position = position; \n"
    "   v_texCoord = texCoord;  \n"
    "}                            \n";



char const *fspath= "./fs/binfs.glsl";
//#define ntxt "noise.png"

const int maxbullets = 25; //50 best 25 non
const int maxen = 25; //25 non best 50 best

float angle; //ship rotation angle
float radius; //ship radius
float shippos[2] = {0}; //ship coordinates
float animlamp; //sin parameter for laser anim
float zoom; //zoom of game board
float speedx, speedy; //max speed of ship in pizel per sec
float lpower; //laser power 20 low to 1 max
float bulletposx[maxbullets] = {0}; //bullets pos
float bulletposy[maxbullets] = {0}; //bullets pos
float bullethdx[maxbullets] = {0}; //bullets speed
float bullethdy[maxbullets] = {0}; //bullets speed
float bullettimer[maxbullets] = {0}; //bullets
bool bulletexpl[maxbullets] = {0}; //bullets
int bulletcounter; //bullets
float enradius;
float bulletanimtimer; //0 to 1.4, 0.7 mid
bool fast; //graphic
bool best; //graphic
static GLenum iChannel; //texture
GLint positionLoc;
GLint texCoordLoc;

float planetpos1[2] = {0}; //planets
float planetpos2[2] = {0}; //planets
float planetpos3[2] = {0}; //planets
float planetpos4[2] = {0}; //planets
float planetpos5[2] = {0}; //planets
float planetpos6[2] = {0}; //planets
float starpos1[2] = {0}; //stars
float starpos2[2] = {0}; //stars
float nebulapos[2] = {0}; //nebula
float en3pos[2] = {0}; //enemy
float lhitpos[2] = {0}; //laser
bool wwh; //laser
bool en3hit;

int en1counter;
int en2counter;
float en1posx[maxen] = {0}; //enemy pos
float en1posy[maxen] = {0}; //enemy pos
float en2posx[maxen] = {0}; //enemy pos
float en2posy[maxen] = {0}; //enemy pos
float en1thdx[maxen] = {0};
float en1thdy[maxen] = {0};
float en2thdx[maxen] = {0};
float en2thdy[maxen] = {0};
float en1timer[maxen] = {0};
float en2timer[maxen] = {0};
float en2extimer[maxen] = {0};

float en1lval[maxen] = {0}; //1 min .1 max
float en1exval[maxen] = {0}; //0 min 1 max
bool en1llisex[maxen] = {0};

bool en1llisexb[maxen] = {0};
bool en1llishit[maxen] = {0};
int en2llishit[maxen] = {0};
bool shua;

int tmpen1llisex[maxen] = {0};
float tmpen1lval[maxen] = {0};
float tmpen1exval[maxen] = {0};
int tmpen2llishit[maxen] = {0};

//needed vars
float zoomtrig;
float animlcounter;
bool animlampbtn;
bool animbulletbtn;
int uniformids[100] = {0};
bool paused;
long shifttime = 0;
float shiftpos[2] = {0};
float shspeedx, shspeedy;
float slowmpos[2] = {0};
float camerapos[2] = {0};
float scrcenter[2] = {0};
bool bulletalive[maxbullets] = {0};
bool en1alive[maxen] = {0};
bool en2alive[maxen] = {0};
float bulletexplctrl[maxbullets] = {0};
float tmpbulletexplctrl[maxbullets] = {0};
float playzoom;
float playzoomtrig;
float tmpbulletposx[maxbullets] = {0};
float tmpbulletposy[maxbullets] = {0};
bool en2dd[maxen] = {0};
bool isnew[maxbullets] = {0};
float tmpen1posx[maxen] = {0};
float tmpen1posy[maxen] = {0};
float tmpen2posx[maxen] = {0};
float tmpen2posy[maxen] = {0};
float tmpen1timer[maxen] = {0};
float tmpen2timer[maxen] = {0};
float tmpen2extimer[maxen] = {0};
int tmpbulletexpl[maxbullets] = {0};
float tmpbullettimer[maxbullets] = {0};
float exltimer[maxbullets] = {0};
float ta, ta2, ta3;
float shipthwgr[2] = {0};
float shipthwgrt[2] = {0};
bool fullscreen;

//speed/mov control
float shipth[2] = {0};
const float maxth = 20;
const float slowfact = 1.1;
const float movcontrolxy = 0.2;




/*
int
load_texture(char *filename,
        GLenum type,
        GLenum *tex_id,
        char nearest,
        char repeat);
 */
void my_setup();
bool interceptOnCircle(float *p1, float *p2, float *c, float r, float *ret1, float *ret2);
float angle2d(float cx, float cy, float ex, float ey);
void rotate2d(float *origin, float *point, float radian, float *retval);

void startposxx() {




    //most of it UNUSED I keep it only for game map understanding

    planetpos2[0] = -65000.; //r 15k
    planetpos2[1] = -10000.;
    planetpos1[0] = planetpos2[0] + 8000 + 7500 - 2500; //r 5k
    planetpos1[1] = planetpos2[1] + 8000 + 7500 - 2500;

    planetpos3[0] = -40000.; //r 20k
    planetpos3[1] = 10000.;
    planetpos5[0] = planetpos3[0] + 12000 + 10000 - 4000; //r 8k
    planetpos5[1] = planetpos3[1] + 12000 + 10000 - 4000;

    planetpos4[0] = -85000; //r 25k
    planetpos4[1] = 10000;
    planetpos6[0] = planetpos4[0] + 12000 + 12500 - 5250; //r 10500
    planetpos6[1] = planetpos4[1] + 12000 + 12500 - 5250;
    en3pos[0] = planetpos6[0] + 5250. - 450.; //r 900
    en3pos[1] = planetpos6[1] + 10500 - 1090.;




    shippos[0] = planetpos1[0];
    shippos[1] = planetpos1[1];


    starpos1[0] = -65000.; //r 250k
    starpos1[1] = -45000.;


    starpos2[0] = -180000; //r 200k
    starpos2[1] = 8000;
    nebulapos[0] = -200000; //r 200k
    nebulapos[1] = 45000.;
}

void initglslvals() {
    fast = false;
    best = false;
    fullscreen = false;
    en3hit = false;
    wwh = false;
    shua = false;
    ta = ta2 = ta3 = 0;
    angle = 0;
    radius = 500;
    enradius = 250;
    animlamp = 1.5;
    animlampbtn = animbulletbtn = false;
    animlcounter = 0;
    zoom = 1.;
    zoomtrig = 0;
    speedx = speedy = 0;
    paused = false;
    shifttime = 0;
    lpower = 20;
    bulletanimtimer = 0;
    bulletcounter = en1counter = en2counter = 0;
    playzoom = 1.;
    playzoomtrig = 0;
    /*struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC_RAW, &ts);
    shifttime = (ts.tv_sec * 1000 + ts.tv_nsec / 1000000);*/
    clock_t begin = clock();
    shifttime =((double) (begin) / CLOCKS_PER_SEC)*1000;
    startposxx();
    my_setup();


}


#define localmin(a, b) ((a) < (b) ? a:b)

#define PI 3.14159265358979323

bool keystates[256] = {0};



/*
int
load_texture(char *filename,
        GLenum type,
        GLenum *tex_id,
        char nearest,
        char repeat) {
    GdkPixbuf *pixbuf;
    int width, height;
    uint8_t *data;
    GLfloat *tex_data;
    int rowstride;
    int cpp, bps;
    int x, y, c;

    pixbuf = gdk_pixbuf_new_from_file(filename, NULL);

    width = gdk_pixbuf_get_width(pixbuf);
    height = gdk_pixbuf_get_height(pixbuf);

    data = gdk_pixbuf_get_pixels(pixbuf);
    rowstride = gdk_pixbuf_get_rowstride(pixbuf);
    bps = gdk_pixbuf_get_bits_per_sample(pixbuf);
    cpp = gdk_pixbuf_get_n_channels(pixbuf);

    if (bps != 8 && bps != 16) {
        fprintf(stderr, "unexpected bits per sample: %d\n", bps);
        return 0;
    }

    if (cpp != 3 && cpp != 4) {
        fprintf(stderr, "unexpected n_channels: %d\n", cpp);
        return 0;
    }

    tex_data = static_cast<char*>(malloc(width * height * cpp * sizeof (GLfloat)));
    for (y = 0; y < height; y++) {
        uint8_t *cur_row8 = (uint8_t *) (data + y * rowstride);
        uint16_t *cur_row16 = (uint16_t *) (data + y * rowstride);

        for (x = 0; x < width; x++) {
            for (c = 0; c < cpp; c++) {
                if (bps == 8)
                    tex_data[(y * width + x) * cpp + c] = ((GLfloat) cur_row8[x * cpp + c]) / 255.0;
                else
                    tex_data[(y * width + x) * cpp + c] = ((GLfloat) cur_row16[x * cpp + c]) / 65535.0;
            }
        }
    }

    glGenTextures(1, tex_id);
    glBindTexture(type, *tex_id);
    glTexImage2D(type, 0, GL_RGBA,
            width, height,
            0, cpp == 3 ? GL_RGB : GL_RGBA,
            GL_FLOAT,
            tex_data);
    if (nearest) {
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    } else {
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR);
        glGenerateMipmap(GL_TEXTURE_2D);
    }

    if (repeat) {
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
    } else {
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
    }

    free(tex_data);
    g_object_unref(pixbuf);

    fprintf(stderr, "texture: %s, %dx%d, %d (%d) --> id %d\n",
            filename, width, height, cpp, bps, *tex_id);

    return 1;
}
 */
















//-------------
//logic

class Point {
public:
    float x;
    float y;

    Point(float x, float y);

    float distance(Point &p);

};

Point::Point(float x, float y) : x(x), y(y) {
}

float Point::distance(Point &p) {
    float x1 = x;
    float x2 = p.x;
    float y1 = y;
    float y2 = p.y;

    return sqrt(pow((x2 - x1), 2) + pow((y2 - y1), 2));
}

class vec2 {
public:
    float x;
    float y;

    vec2(float x, float y);


};

vec2::vec2(float x, float y) : x(x), y(y) {
}

class body {
public:
    int mass;
    int radiusin;
    float maxll;
    bool islon = false;
    bool miilive = false;
    int iterator; //element id, 0 player, 1-2 stars, 3-9 planets, 10-maxbulets+10 bullet,  maxbulets+10-maxenemy+.. enemy1,  maxenemy+..-maxenemy+.. enemy2 
    Point origin; //position
    vec2 heading; //velocity 
    float llhitpos[2] = {0};
    int llhitid = 0; //bind to deque ID
    bool llhit = false;
    double maxvel = 0; //max speed
    float orbitpos = 0; //+% orbit radius
    bool isstatic = false; //object dont need to be moved
    bool hit = false; //hit with other object
    int hitid = 0; //bind to deque ID
    //int orbitslowdown=0; //% slowdown on orbit 0-100%
    //int velslowdown=0; //% slowdown on movement 0-100% (if maxheading>0)


    body(int mass, int radius, Point position, vec2 heading);
    bool collides(body &p);
    void velocityCheck();
    void onOrbit(body &p);

    void distance(body &p, float &horizontalDistance, float &verticalDistance);

    float calculateGravity(body &p);

    vec2 findVector(body &p);

    void sumVector(std::deque<body> dq);



};

body::body(int mass, int radius, Point origin, vec2 heading)
: mass(mass), radiusin(radius), origin(origin), heading(heading) {
}


// Calculates the gravitational 

float body::calculateGravity(body &p) {
    int mass1 = mass;
    int mass2 = p.mass;
    float distanceBetween = origin.distance(p.origin);

    return ((mass1 * mass2) / pow(distanceBetween, 2));
}

// Calculates the horizontal and vertical distance

void body::distance(body &p, float &horizontalDistance, float &verticalDistance) {
    horizontalDistance = p.origin.x - origin.x;
    verticalDistance = p.origin.y - origin.y;

}

// calculates a gravitational vector

vec2 body::findVector(body &p) {
    float forceBetween = calculateGravity(p);

    float horizontalDistance = 0;
    float verticalDistance = 0;
    distance(p, horizontalDistance, verticalDistance);


    float totalDistance = abs(horizontalDistance) + abs(verticalDistance);

    float xComponent = (forceBetween / totalDistance) * horizontalDistance;
    float yComponent = (forceBetween / totalDistance) * verticalDistance;


    vec2 toReturn(xComponent, yComponent);

    return toReturn;
}

//orbit movement

void body::onOrbit(body &p) {


    float deltaX = (origin.x + heading.x) - p.origin.x;
    float deltaY = (origin.y + heading.y) - p.origin.y;
    float rad = atan2(deltaY, deltaX);
    float posx = p.radiusin * (1 + orbitpos / 100) * cos(rad);
    float posy = p.radiusin * (1 + orbitpos / 100) * sin(rad);

    float deltaX1 = (origin.x) - p.origin.x;
    float deltaY1 = (origin.y) - p.origin.y;
    float rad1 = atan2(deltaY1, deltaX1);
    float posx1 = p.radiusin * (1 + orbitpos / 100) * cos(rad1);
    float posy1 = p.radiusin * (1 + orbitpos / 100) * sin(rad1);

    heading.x = posx - posx1;
    heading.y = posy - posy1;
    origin.x = (posx + p.origin.x);
    origin.y = (posy + p.origin.y);

}

//max speed limit

void body::velocityCheck() {
    if (maxvel > 0) {
        if (std::abs(heading.x) + std::abs(heading.y) > maxvel) {
            float pers = ((std::abs(heading.x) + std::abs(heading.y)) - maxvel) / maxvel;

            heading.x = (heading.x) / (1 + pers);
            heading.y = (heading.y) / (1 + pers);
        }
    }
}

bool body::collides(body &p) {
    if ((iterator < 10) || ((iterator >= 10)&&(p.iterator != 0)&&((iterator < maxbullets + 10) || (p.iterator < maxbullets + 10)))) {

        Point temp(origin.x + heading.x, origin.y + heading.y);
        float distance = temp.distance(p.origin);
        if (distance < radiusin + p.radiusin * (1 + orbitpos / 100)) {
            return true;
        } else {
            return false;
        }
    } else {
        return false;
    }
}


// sums a final heading vector which will be its path

void body::sumVector(std::deque<body> dq) {

    if (!miilive)return;
    int wasx=0;
    wasx=dq.size();
    float tmplhitx[wasx];
    memset( tmplhitx, 0, wasx*sizeof(float) );//wasm can not in {0}
    float tmplhity[wasx];
    memset( tmplhity, 0, wasx*sizeof(float) );
    bool tmpishit[wasx];
    memset( tmpishit, 0, wasx*sizeof(bool) );
    int tmphitid[wasx];
    memset( tmphitid, 0, wasx*sizeof(int) );
    llhit = false;
    if (this->islon) {
        for (unsigned int i = 0; i < dq.size(); i++) {
            if (origin.x != dq.at(i).origin.x && origin.y != dq.at(i).origin.y && dq.at(i).miilive) {
                if (!((dq.at(i).iterator >= 10)&&(dq.at(i).iterator < maxbullets + 10))) {

                    float ret[2] = {0};
                    float tm[2] = {0};
                    float tm2[2] = {0};
                    float an = angle;
                    tm[0] = -maxll;
                    rotate2d(tm2, tm, an, ret);
                    float p1[] = {shippos[0], shippos[1]};
                    float p2[] = {shippos[0] + ret[0], shippos[1] + ret[1]};
                    float c[] = {dq.at(i).origin.x, dq.at(i).origin.y};
                    float r = dq.at(i).radiusin;
                    float ret1[2] = {0};
                    float ret2[2] = {0};
                    bool rr = interceptOnCircle(p1, p2, c, r, ret1, ret2);

                    if (rr) {
                        if (abs(an) > PI / 2) {
                            tmplhitx[i] = ret1[0] - shippos[0];
                            tmplhity[i] = ret1[1] - shippos[1];
                        } else {
                            tmplhitx[i] = ret2[0] - shippos[0];
                            tmplhity[i] = ret2[1] - shippos[1];
                        }
                    } else {
                        tmplhitx[i] = 0;
                        tmplhity[i] = maxll;
                    }
                    float yyy, zzz, fff;

                    //after fix
                    if (rr) {
                        yyy = angle2d(dq.at(i).origin.x, dq.at(i).origin.y, shippos[0], shippos[1]);


                        bool cx = false;
                        if ((yyy>-PI / 2)&&(yyy < PI / 2)) {
                            zzz = an - yyy;
                            if ((zzz > PI / 2)) {
                                cx = true;
                            } else
                                if ((zzz<-PI / 2)) {
                                cx = true;
                            }
                        } else {
                            zzz = an + PI - yyy;
                            if (yyy < 0)zzz = -PI - yyy + an;
                            if ((zzz > 0)&&(zzz < PI / 2)) {
                                cx = true;
                            } else
                                if ((zzz < 0)&&(zzz>-PI / 2)) {
                                cx = true;
                            }
                        }
                        if (!cx) {
                            tmplhitx[i] = 0;
                            tmplhity[i] = maxll;

                        } else {
                            if (sqrt(std::abs(tmplhitx[i]) * std::abs(tmplhitx[i]) + std::abs(tmplhity[i]) * std::abs(tmplhity[i])) > maxll) {
                                tmplhitx[i] = 0;
                                tmplhity[i] = maxll;
                            } else {
                                tmpishit[i] = true;
                                tmphitid[i] = i;
                            }
                        }


                    }

                }
            }
        }
        float lmax = maxll;
        for (unsigned int i = 0; i < dq.size(); i++) {
            if (tmpishit[i]) {
                float tlm = sqrt(std::abs(tmplhitx[i]) * std::abs(tmplhitx[i]) + std::abs(tmplhity[i]) * std::abs(tmplhity[i]));
                if (tlm < lmax) {
                    lmax = tlm;
                    llhit = true;
                    llhitid = tmphitid[i];
                    llhitpos[0] = tmplhitx[i];
                    llhitpos[1] = tmplhity[i];
                }
            }
        }

    }
    if (this->isstatic)return;
    vec2 final(heading.x, heading.y);

    vec2 temp(0, 0);

    if (hit) {

        if (dq.at(hitid).miilive) {
            velocityCheck();
            onOrbit(dq.at(hitid));
            return;
        }
        hit = false;
    }



    for (unsigned int i = 0; i < dq.size(); i++) {
        if (origin.x != dq.at(i).origin.x && origin.y != dq.at(i).origin.y) {
            //collides hit check
            if (!((dq.at(i).iterator >= 10)&&(dq.at(i).iterator < maxbullets + 10))) {
                if ((iterator == 0)&&(dq.at(i).iterator > 10))continue;
                if ((iterator >= maxbullets + 10)&&(dq.at(i).iterator >= maxbullets + 10))continue;
                if (((iterator < 10) || (iterator >= maxbullets + 10))&&(dq.at(i).iterator == -1))continue;
                if (dq.at(i).miilive){
                if (collides(dq.at(i))) {

                    velocityCheck();
                    onOrbit(dq.at(i));
                    hitid = i;
                    hit = true;
                    final.x = 0;
                    final.y = 0;
                    break;
                }
                temp = findVector(dq.at(i));
                final.x = final.x + temp.x;
                final.y = final.y + temp.y;}
            }
        }
    }

    if (hit)return;
    heading = final;


    velocityCheck();


    origin.x += heading.x;
    origin.y += heading.y;
    return;
}



bool shouldRotate;
std::deque<body> bds;
std::deque<body> bds2;
std::deque<body> bds3;

void my_setup(void) {
    //some of it unused
    shouldRotate = false;
    int mass = 150;
    int mass11 = 0;
    int radiusx = 1;
    Point origin(shippos[0], shippos[1]);
    vec2 heading(0, 0);
    double maxheading = 40;

    body player(mass, radiusx, origin, heading);
    body player1(mass11, radiusx, origin, heading);
    player1.isstatic = true;
    player1.iterator = 0;
    player1.maxll = radius * 15;
    player1.miilive = true;
    player.maxvel = maxheading;
    player.orbitpos = 0.5;
    player.iterator = 0;
    player.maxll = radius * 15;
    player.miilive = true;


    int mass1 = 5000000;
    int radius1 = 75000;
    Point origin1(starpos1[0] + 125000 - 250, starpos1[1] + 125000 - 250);
    Point origin11(starpos1[0] + 125000 - 17, starpos1[1] + 125000 - 17);
    vec2 heading1(0, 0);

    body sun1(mass1, radius1, origin1, heading1);
    sun1.isstatic = true;
    sun1.iterator = 1;
    sun1.miilive = true;
    body sun11(mass1, radius1, origin11, heading1);
    sun11.isstatic = true;
    sun11.miilive = true;
    sun11.iterator = 1;


    int mass2 = 1000000;
    int radius2 = 25000;
    Point origin2(starpos2[0] + 50000 - 250, starpos2[1] + 50000 - 250);
    Point origin22(starpos2[0] + 50000 - 17, starpos2[1] + 50000 - 17);
    vec2 heading2(0, 0);

    body sun2(mass2, radius2, origin2, heading2);
    sun2.isstatic = true;
    sun2.iterator = 2;
    sun2.miilive = true;
    body sun22(mass2, radius2, origin22, heading2);
    sun22.isstatic = true;
    sun22.iterator = 2;
    sun22.miilive = true;




    int mass4 = 10000;
    int radius4 = 2500;
    Point origin4(planetpos1[0] + 2500 - 250, planetpos1[1] + 2500 - 250);
    vec2 heading4(0, 0);

    body planet1(mass4, radius4, origin4, heading4);
    planet1.isstatic = true;
    planet1.iterator = 3;
    planet1.miilive = true;

    int mass5 = 60000;
    int radius5 = 7500;
    Point origin5(planetpos2[0] + 7500 - 250, planetpos2[1] + 7500 - 250);
    vec2 heading5(0, 0);

    body planet2(mass5, radius5, origin5, heading5);
    planet2.isstatic = true;
    planet2.iterator = 4;
    planet2.miilive = true;

    int mass6 = 70000;
    int radius6 = 10000;
    Point origin6(planetpos3[0] + 10000 - 250, planetpos3[1] + 10000 - 250);
    vec2 heading6(0, 0);

    body planet3(mass6, radius6, origin6, heading6);
    planet3.isstatic = true;
    planet3.iterator = 5;
    planet3.miilive = true;

    int mass7 = 80000;
    int radius7 = 12500;
    Point origin7(planetpos4[0] + 12500 - 250, planetpos4[1] + 12500 - 250);
    vec2 heading7(0, 0);

    body planet4(mass7, radius7, origin7, heading7);
    planet4.isstatic = true;
    planet4.iterator = 6;
    planet4.miilive = true;

    int mass8 = 15000;
    int radius8 = 4000;
    Point origin8(planetpos5[0] + 4000 - 250, planetpos5[1] + 4000 - 250);
    vec2 heading8(0, 0);

    body planet5(mass8, radius8, origin8, heading8);
    planet5.isstatic = true;
    planet5.iterator = 7;
    planet5.miilive = true;

    int mass9 = 15000;
    int radius9 = 4250;
    Point origin9(planetpos6[0] + 5250 - 250, planetpos6[1] + 5250 - 250);
    vec2 heading9(0, 0);

    body planet6(mass9, radius9, origin9, heading9);
    planet6.isstatic = true;
    planet6.iterator = 8;
    planet6.miilive = true;

    int mass111 = 1;
    int radius11 = 500;
    Point origin111(en3pos[0] - 250, en3pos[1] - 250);
    vec2 heading11(0, 0);

    body en3x(mass111, radius11, origin111, heading11);
    en3x.isstatic = true;
    en3x.iterator = -1;
    en3x.miilive = true;








    bds.push_front(sun1);
    bds.push_front(sun2);
    bds.push_front(player);
    bds.push_front(en3x);
    bds.push_front(planet1);
    bds.push_front(planet2);
    bds.push_front(planet3);
    bds.push_front(planet4);
    bds.push_front(planet5);
    bds.push_front(planet6);

    bds2.push_front(sun11);
    bds2.push_front(sun22);
    bds2.push_front(player1);
    bds2.push_front(en3x);

    bds2.push_front(planet1);
    bds2.push_front(planet2);
    bds2.push_front(planet3);
    bds2.push_front(planet4);
    bds2.push_front(planet5);
    bds2.push_front(planet6);

    bds3.push_front(sun11);
    bds3.push_front(sun22);
    bds3.push_front(en3x);
    bds3.push_front(planet1);
    bds3.push_front(planet2);
    bds3.push_front(planet3);
    bds3.push_front(planet4);
    bds3.push_front(planet5);
    bds3.push_front(planet6);


    for (int i = 0; i < maxbullets; i++) {
        int mass10 = 100;
        int radius10 = 1;
        Point origin10(0, 0);
        vec2 heading10(0, 0);

        body bulletx(mass10, radius10, origin10, heading10);
        bulletx.iterator = i + 10;
        bulletx.isstatic = true;
        bulletx.miilive = false;

        bds2.push_front(bulletx);
    }


    for (int i = 0; i < maxen; i++) {
        int mass10 = 50;
        int radius10 = 105;
        int radius101 = 1;
        Point origin10(0, 0);
        vec2 heading10(0, 0);

        body enx(mass10, radius10, origin10, heading10);
        body enxx(mass10, radius101, origin10, heading10);
        enx.iterator = i + 10 + maxbullets;
        enx.isstatic = true;
        enx.miilive = false;
        enxx.iterator = i + 10 + maxbullets;
        enxx.isstatic = true;
        enxx.miilive = false;

        bds2.push_front(enx);
        bds.push_front(enx);
        bds3.push_front(enxx);

        int mass12 = 100;
        int radius12 = 95;
        int radius121 = 1;
        Point origin12(0, 0);
        vec2 heading12(0, 0);

        body en2x(mass12, radius12, origin12, heading12);
        body en2xx(mass12, radius121, origin12, heading12);
        en2x.iterator = i + 10 + maxbullets + maxen;
        en2x.isstatic = true;
        en2x.miilive = false;
        en2xx.iterator = i + 10 + maxbullets + maxen;
        en2xx.isstatic = true;
        en2xx.miilive = false;

        bds2.push_front(en2x);
        bds.push_front(en2x);
        bds3.push_front(en2xx);




    }
}


//----------

void rotate2d(float *origin, float *point, float radian, float *retval) {

    float s = std::sin(radian);
    float c = std::cos(radian);
    point[0] -= origin[0];
    point[1] -= origin[1];
    float xnew = point[0] * c - point[1] * s;
    float ynew = point[0] * s + point[1] * c;
    retval[0] = xnew + origin[0];
    retval[1] = ynew + origin[1];

}

float angle2d(float cx, float cy, float ex, float ey) {
    float dy = ey - cy;
    float dx = ex - cx;
    float theta = std::atan2(dy, dx);
    return theta;
}

bool interceptOnCircle(float *p1, float *p2, float *c, float r, float *ret1, float *ret2) {

    float p3[] = {p1[0] - c[0], p1[1] - c[1]};
    float p4[] = {p2[0] - c[0], p2[1] - c[1]};
    float m = (p4[0] - p3[0]) == 0 ? 1000000 : (p4[1] - p3[1]) / (p4[0] - p3[0]);
    //float m = (p4[1] - p3[1]) / (p4[0] - p3[0]);
    float b = p3[1] - m * p3[0];

    float underRadical = pow(r, 2) * pow(m, 2) + pow(r, 2) - pow(b, 2);

    if (underRadical < 0) {
        return false;
    } else {
        float t1 = (-m * b + sqrt(underRadical)) / (pow(m, 2) + 1);
        float t2 = (-m * b - sqrt(underRadical)) / (pow(m, 2) + 1);
        float i1[] = {t1 + c[0], m * t1 + b + c[1]};
        float i2[] = {t2 + c[0], m * t2 + b + c[1]};
        ret1[0] = i1[0];
        ret1[1] = i1[1];
        ret2[0] = i2[0];
        ret2[1] = i2[1];
        return true;
    }
}




//---------
//draw







/* x, y, x_press, y_press  (in target coords) */
static double mouse[4] = {0,};

static GLint prog = 0;

void
mouse_press_handler(int button, int state, int x, int y) {

    int x0, y0, height;
    // Wheel reports as button 3(scroll up) and button 4(scroll down)

    if ((button == 3) || (button == 4)) { // It's a wheel event
        if (paused) {
            // Each wheel event reports like a button click, GLUT_DOWN then GLUT_UP
            if (state == GLUT_UP) return; // Disregard redundant GLUT_UP events
            zoomtrig = (button == 3) ? 0.01 * zoom + zoom / 200 : -(0.01 * zoom + zoom / 200);
        } else {
            // Each wheel event reports like a button click, GLUT_DOWN then GLUT_UP
            if (state == GLUT_UP) return; // Disregard redundant GLUT_UP events
            playzoomtrig = (button == 3) ? 0.01 * playzoom + playzoom / 200 : -(0.01 * playzoom + playzoom / 200);

        }

    }

    if (button == GLUT_LEFT_BUTTON) {
        if (state == GLUT_DOWN) {
            animbulletbtn = true;
            animlampbtn = false;
        } else {
            animbulletbtn = false;
        }
    } else {
        if (button == GLUT_RIGHT_BUTTON) {
            if (state == GLUT_DOWN) {
                animlampbtn = true;
                animbulletbtn = false;
            } else {
                animlampbtn = false;
            }
        }
    }
}

void
mouse_move_handler(int x, int y) {

    int x0, y0, height;

    x0 = glutGet(GLUT_WINDOW_X);
    y0 = glutGet(GLUT_WINDOW_Y);
    height = glutGet(GLUT_WINDOW_HEIGHT);

    mouse[0] = slowmpos[0] = x;
    mouse[1] = slowmpos[1] = height - y;

}

void
mouse_press_move_handler(int x, int y) {

    int x0, y0, height;

    x0 = glutGet(GLUT_WINDOW_X);
    y0 = glutGet(GLUT_WINDOW_Y);
    height = glutGet(GLUT_WINDOW_HEIGHT);

    if (animlampbtn) {

        mouse[0] = slowmpos[0] = x;
        mouse[1] = slowmpos[1] = height - y;
    } else {
        mouse[0] = slowmpos[0] = x;
        mouse[1] = slowmpos[1] = height - y;
    }

}

void close() {
    exit(0);
}

void
keyboard_up_handler(unsigned char key, int x, int y) {

    keystates[key] = true;
    switch (key) {
        case 'a':
        case 'A':
            if (keystates['d'] || keystates['d'])keystates['d'] = keystates['D'] = false;
            break;
        case 'd':
        case 'D':
            if (keystates['a'] || keystates['A'])keystates['a'] = keystates['D'] = false;
            break;
        case 'w':
        case 'W':
            if (keystates['s'] || keystates['S'])keystates['s'] = keystates['S'] = false;
            break;
        case 's':
        case 'S':
            if (keystates['w'] || keystates['W'])keystates['w'] = keystates['W'] = false;
            break;
        case 'r':
        case 'R':
            playzoom = zoom = 1;
            shiftpos[0] = shiftpos[1] = 0;
            shspeedx = 0;
            shspeedx = 0;
            zoomtrig = 0;
            playzoomtrig = 0;
            break;
        case '\x1b': /* Escape */
            //glutLeaveMainLoop(); //non wasm
            close();
            break;

        case 'f': /* fullscreen */
        case 'F':
            //glutFullScreenToggle(); //non wasm
            fullscreen = !fullscreen;
            if (fullscreen) {
                glutFullScreen();
            } else {
                glutReshapeWindow(1280, 720);
                glutPositionWindow(0, 0);
            }
            break;

        default:
            break;
    }
}

void cameraposs(int width, int height) {
    if (!paused) {
        if (shipth[0] <= 0) {
            camerapos[0] = -scrcenter[0]*((float) shipth[0] / maxth);
        }
        if (shipth[0] > 0) {
            camerapos[0] = -scrcenter[0]*((float) shipth[0] / maxth);
        }
        if (shipth[1] <= 0) {
            camerapos[1] = -scrcenter[1]*((float) shipth[1] / maxth);
        }
        if (shipth[1] > 0) {
            camerapos[1] = -scrcenter[1]*((float) shipth[1] / maxth);
        }
        camerapos[0] -= shippos[0];
        camerapos[1] -= shippos[1];
    } else {
        camerapos[0] = -shippos[0];
        camerapos[1] = -shippos[1];
    }

    /*if(!paused){
        if(mouse[0]<width/2){camerapos[0]=scrcenter[0]-scrcenter[0]*((float)mouse[0]/(width/2));}
        if(mouse[0]>width/2){camerapos[0]=-scrcenter[0]*((float)(mouse[0]-width/2)/(width/2));}
        if(mouse[1]<height/2){camerapos[1]=scrcenter[1]-scrcenter[1]*((float)mouse[1]/(height/2));}
        if(mouse[1]>height/2){camerapos[1]=-scrcenter[1]*((float)(mouse[1]-height/2)/(height/2));}
        camerapos[0]-=shippos[0];
        camerapos[1]-=shippos[1];
    }*/
}

void spawnenemy(float pass) {
    static bool cd;
    static float lasttime;
    static bool laspam;
    static bool lewfe1[maxen];
    static bool lewfe2[maxen];
    static float lewtimen1[maxen];
    static float lewtimen2[maxen];


    if (!paused) {
        //if ((ta < PI / 3.)&&(ta > 0.10))
        {
            lasttime += pass;
            if (lasttime > pass * 120)cd = false;
            for (int ii = 0; ii < maxen; ii++) {
                if (cd)break;
                if (laspam) {


                    if (!en2alive[ii]) {

                        float tm[2] = {0};
                        float tm2[2] = {0};
                        tm[0] = planetpos4[0] + 12000 + 12500;
                        tm[1] = planetpos4[1] + 12000 + 12500;
                        tm2[0] = planetpos4[0] + 12500;
                        tm2[1] = planetpos4[1] + 12500;
                        float ret[2] = {0};
                        rotate2d(tm2, tm, ta - PI / 2.5, ret);
                        en2posx[ii] = ret[0];
                        en2posy[ii] = ret[1];
                        if ((std::sqrt(pow(abs(en2posx[ii] - shippos[0]) + abs(en2posy[ii] - shippos[1]), 2)) > 35000)) {
                            cd = true;
                            break;
                        }

                        en2thdx[ii] = 0;
                        en2thdy[ii] = 0;
                        en2alive[ii] = true;
                        en2timer[ii] = 0;
                        lewtimen2[ii] = 0;
                        lewfe2[ii] = false;
                        en2dd[ii] = false;
                        en2extimer[ii] = 0;
                        cd = true;
                        lasttime = 0;
                        en2llishit[ii] = false;

                        laspam = !laspam;
                    }
                } else
                    if (!en1alive[ii]) {
                    float tm[2] = {0};
                    float tm2[2] = {0};
                    tm[0] = planetpos4[0] + 12000 + 12500;
                    tm[1] = planetpos4[1] + 12000 + 12500;
                    tm2[0] = planetpos4[0] + 12500;
                    tm2[1] = planetpos4[1] + 12500;
                    float ret[2] = {0};
                    rotate2d(tm2, tm, ta - PI / 2.5, ret);
                    en1posx[ii] = ret[0];
                    en1posy[ii] = ret[1];
                    if ((std::sqrt(pow(abs(en1posx[ii] - shippos[0]) + abs(en1posy[ii] - shippos[1]), 2)) > 35000)) {
                        cd = true;
                        break;
                    }

                    en1thdx[ii] = 0;
                    en1thdy[ii] = 0;
                    en1alive[ii] = true;
                    en1timer[ii] = 0;
                    cd = true;
                    lasttime = 0;
                    en1lval[ii] = 1;
                    en1exval[ii] = 0;
                    en1llishit[ii] = false;
                    lewtimen1[ii] = 0;
                    en1llisex[ii] = false;
                    en1llisexb[ii] = false;
                    lewfe1[ii] = false;
                    laspam = !laspam;

                }
                if (ii == maxen - 1) {
                    laspam = !laspam;
                    cd = true;
                }
            }
        }
    }



    if (!paused) {
        en1counter = 0;
        en2counter = 0;
        for (int ii = 0; ii < maxen; ii++) {
            if (en2alive[ii]) {
                en2timer[ii] += pass;
                tmpen2timer[en2counter] = en2timer[ii];
                float ret[2] = {0};
                float tm[2] = {0};
                float tm2[2] = {0};
                float an = angle2d(shippos[0], shippos[1], en2posx[ii] - 125, en2posy[ii] - 125);

                float tf = std::sqrt(pow(abs(en2posx[ii] - shippos[0] - 125) + abs(en2posy[ii] - shippos[1] - 125), 2));
                tm[0] = -25;
                if (tf < 800) {
                    lewfe2[ii] = true;
                }
                if (!lewfe2[ii]) {
                    rotate2d(tm2, tm, an, ret);
                    en2thdx[ii] += ret[0] / 250;
                    en2thdy[ii] += ret[1] / 250;
                } else {
                    en2thdx[ii] = en2thdx[ii] / 1.01;
                    en2thdy[ii] = en2thdy[ii] / 1.01;
                    lewtimen2[ii] += pass;
                    if (lewtimen2[ii] > pass * 10) {
                        lewtimen2[ii] = 0;
                        lewfe2[ii] = tf < 100;

                    }
                }
                if (en2dd[ii]) {
                    en2thdx[ii] = 0;
                    en2thdy[ii] = 0;
                }
                tmpen2posx[en2counter] = en2posx[ii] = en2posx[ii] + en2thdx[ii];
                tmpen2posy[en2counter] = en2posy[ii] = en2posy[ii] + en2thdy[ii];
                tmpen2posx[en2counter] += -shippos[0];
                tmpen2posy[en2counter] += -shippos[1];
                tmpen2llishit[en2counter] = en2llishit[ii];
                tmpen2extimer[en2counter] = en2extimer[ii];
                if (en2dd[ii]) {
                    en2extimer[ii] += 0.016;
                    if (en2extimer[ii] > 1.25) {
                        en2alive[ii] = false;
                        //fprintf(stderr, "mii dead\n");
                    }

                }
                if (en2llishit[ii] || (tf < 1500)) {

                    if (en2llishit[ii]) {
                        en2thdx[ii] = en2thdx[ii] / 1.1;
                        en2thdy[ii] = en2thdy[ii] / 1.1;
                    } else {
                        en2thdx[ii] = en2thdx[ii] / 1.01;
                        en2thdy[ii] = en2thdy[ii] / 1.01;
                    }

                }
                if ((tf > 35000)) {
                    en2dd[ii] = true;
                }
                en2llishit[ii] = false;

                en2counter++;
            }

            if (en1alive[ii]) {
                en1timer[ii] += pass;
                tmpen1timer[en1counter] = en1timer[ii];
                float ret[2] = {0};
                float tm[2] = {0};
                float tm2[2] = {0};
                float an = angle2d(shippos[0], shippos[1], en1posx[ii] - 125, en1posy[ii] - 125);

                float tf = std::sqrt(pow(abs(en1posx[ii] - shippos[0] - 125) + abs(en1posy[ii] - shippos[1] - 125), 2));
                tm[0] = -25;
                if (tf < 800) {
                    lewfe1[ii] = true;
                }
                if (!lewfe1[ii]) {
                    rotate2d(tm2, tm, an, ret);
                    en1thdx[ii] += ret[0] / 150;
                    en1thdy[ii] += ret[1] / 150;
                } else {
                    lewtimen1[ii] += pass;
                    if (lewtimen1[ii] > pass * 10) {
                        lewtimen1[ii] = 0;
                        lewfe1[ii] = tf < 800;

                    }
                }
                if (en1llisex[ii]) {
                    en1thdx[ii] = 0;
                    en1thdy[ii] = 0;

                }
                tmpen1posx[en1counter] = en1posx[ii] = en1posx[ii] + en1thdx[ii];
                tmpen1posy[en1counter] = en1posy[ii] = en1posy[ii] + en1thdy[ii];
                tmpen1posx[en1counter] += -shippos[0];
                tmpen1posy[en1counter] += -shippos[1];
                if (en1llishit[ii] || (tf > 35000) || (tf < 1500)) {
                    if (en1llishit[ii]) {
                        en1thdx[ii] = en1thdx[ii] / 1.1;
                        en1thdy[ii] = en1thdy[ii] / 1.1;
                    } else {
                        en1thdx[ii] = en1thdx[ii] / 1.01;
                        en1thdy[ii] = en1thdy[ii] / 1.01;
                    }

                    if (!en1llisex[ii]) {
                        if (en1lval[ii] > 0.1) {
                            en1lval[ii] -= 0.006;
                        } else {
                            en1llisex[ii] = true;

                        }
                    }

                }
                if (en1llisex[ii]) {
                    if (!en1llisexb[ii]) {
                        en1exval[ii] += 0.1;
                        if (en1exval[ii] > 8) {
                            en1llisexb[ii] = true;
                        }
                    } else {
                        en1exval[ii] -= 0.15 - 0.145 * (en1exval[ii] / 8);
                        if (en1exval[ii] < 0.05) {
                            en1alive[ii] = false;
                        }
                    }
                }
                tmpen1lval[en1counter] = en1lval[ii];
                tmpen1exval[en1counter] = en1exval[ii];
                tmpen1llisex[en1counter] = en1llisexb[ii];
                en1llishit[ii] = false;

                en1counter++;
            }
        }
    }

}

void staticplanetsmov() {
    if (!paused) {
        float ret[2] = {0};
        float tm[2] = {0};
        float tm2[2] = {0};
        tm[0] = planetpos2[0] + 8000 + 7500;
        tm[1] = planetpos2[1] + 8000 + 7500;
        tm2[0] = planetpos2[0] + 7500;
        tm2[1] = planetpos2[1] + 7500;

        ta += ta > 2 * PI ? -2 * PI + PI / 8000 : PI / 8000;
        rotate2d(tm2, tm, ta, ret);
        planetpos1[0] = ret[0] - 2500;
        planetpos1[1] = ret[1] - 2500;

        tm[0] = planetpos3[0] + 12000 + 10000;
        tm[1] = planetpos3[1] + 12000 + 10000;
        tm2[0] = planetpos3[0] + 10000;
        tm2[1] = planetpos3[1] + 10000;
        ta2 += ta2 > 2 * PI ? -2 * PI + PI / 10000 : PI / 10000;
        rotate2d(tm2, tm, -ta2, ret);
        planetpos5[0] = ret[0] - 4000;
        planetpos5[1] = ret[1] - 4000;


        tm[0] = planetpos4[0] + 12000 + 12500;
        tm[1] = planetpos4[1] + 12000 + 12500;
        tm2[0] = planetpos4[0] + 12500;
        tm2[1] = planetpos4[1] + 12500;
        rotate2d(tm2, tm, ta - PI / 2, ret);
        planetpos6[0] = ret[0] - 5250;
        planetpos6[1] = ret[1] - 5250;




        tm[0] = planetpos6[0] + 5250 + 2625 + 450 - 150.;
        tm[1] = planetpos6[1] + 5250 + 2625 + 450 - 150.;
        tm2[0] = planetpos6[0] + 5250;
        tm2[1] = planetpos6[1] + 5250;

        rotate2d(tm2, tm, -ta - PI / 2.25, ret);
        en3pos[0] = ret[0];
        en3pos[1] = ret[1];

        tm[0] = planetpos6[0] + 5250 + 2625 + 450 - 150. + 300;
        tm[1] = planetpos6[1] + 5250 + 2625 + 450 - 150. + 300;
        tm2[0] = planetpos6[0] + 5250;
        tm2[1] = planetpos6[1] + 5250;

        rotate2d(tm2, tm, -ta - PI / 2.25 - 0.11, ret);

        float txxx[2] = {0};
        txxx[0] = ret[0];
        txxx[1] = ret[1];


        for (unsigned int i = 0; i < bds.size(); i++) {
            if (bds.at(i).iterator == -1) {
                bds.at(i).origin.x = txxx[0] - 250;
                bds.at(i).origin.y = txxx[1] - 250;
            };
            if (bds.at(i).iterator == 3) {
                bds.at(i).origin.x = planetpos1[0] + 2500 - 250;
                bds.at(i).origin.y = planetpos1[1] + 2500 - 250;
            };
            if (bds.at(i).iterator == 4) {
                bds.at(i).origin.x = planetpos2[0] + 7500 - 250;
                bds.at(i).origin.y = planetpos2[1] + 7500 - 250;
            };
            if (bds.at(i).iterator == 5) {
                bds.at(i).origin.x = planetpos3[0] + 10000 - 250;
                bds.at(i).origin.y = planetpos3[1] + 10000 - 250;
            };
            if (bds.at(i).iterator == 6) {
                bds.at(i).origin.x = planetpos4[0] + 12500 - 250;
                bds.at(i).origin.y = planetpos4[1] + 12500 - 250;
            };
            if (bds.at(i).iterator == 7) {
                bds.at(i).origin.x = planetpos5[0] + 4000 - 250;
                bds.at(i).origin.y = planetpos5[1] + 4000 - 250;
            };
            if (bds.at(i).iterator == 8) {
                bds.at(i).origin.x = planetpos6[0] + 5250 - 250;
                bds.at(i).origin.y = planetpos6[1] + 5250 - 250;
            };
        }

        for (unsigned int i = 0; i < bds2.size(); i++) {
            if (bds2.at(i).iterator == 0) {
                bds2.at(i).origin.x = shippos[0];
                bds2.at(i).origin.y = shippos[1];
            };
            if (bds2.at(i).iterator == 3) {
                bds2.at(i).origin.x = planetpos1[0] + 2500 - 17;
                bds2.at(i).origin.y = planetpos1[1] + 2500 - 17;
            };
            if (bds2.at(i).iterator == 4) {
                bds2.at(i).origin.x = planetpos2[0] + 7500 - 17;
                bds2.at(i).origin.y = planetpos2[1] + 7500 - 17;
            };
            if (bds2.at(i).iterator == 5) {
                bds2.at(i).origin.x = planetpos3[0] + 10000 - 17;
                bds2.at(i).origin.y = planetpos3[1] + 10000 - 17;
            };
            if (bds2.at(i).iterator == 6) {
                bds2.at(i).origin.x = planetpos4[0] + 12500 - 17;
                bds2.at(i).origin.y = planetpos4[1] + 12500 - 17;
            };
            if (bds2.at(i).iterator == 7) {
                bds2.at(i).origin.x = planetpos5[0] + 4000 - 17;
                bds2.at(i).origin.y = planetpos5[1] + 4000 - 17;
            };
            if (bds2.at(i).iterator == 8) {
                bds2.at(i).origin.x = planetpos6[0] + 5250 - 17;
                bds2.at(i).origin.y = planetpos6[1] + 5250 - 17;
            };
            if (bds2.at(i).iterator == -1) {
                bds2.at(i).origin.x = txxx[0] - 17;
                bds2.at(i).origin.y = txxx[1] - 17;
            };
        }

        for (unsigned int i = 0; i < bds3.size(); i++) {

            if (bds3.at(i).iterator == 3) {
                bds3.at(i).origin.x = planetpos1[0] + 2500 - 125;
                bds3.at(i).origin.y = planetpos1[1] + 2500 - 125;
            };
            if (bds3.at(i).iterator == 4) {
                bds3.at(i).origin.x = planetpos2[0] + 7500 - 125;
                bds3.at(i).origin.y = planetpos2[1] + 7500 - 125;
            };
            if (bds3.at(i).iterator == 5) {
                bds3.at(i).origin.x = planetpos3[0] + 10000 - 125;
                bds3.at(i).origin.y = planetpos3[1] + 10000 - 125;
            };
            if (bds3.at(i).iterator == 6) {
                bds3.at(i).origin.x = planetpos4[0] + 12500 - 125;
                bds3.at(i).origin.y = planetpos4[1] + 12500 - 125;
            };
            if (bds3.at(i).iterator == 7) {
                bds3.at(i).origin.x = planetpos5[0] + 4000 - 125;
                bds3.at(i).origin.y = planetpos5[1] + 4000 - 125;
            };
            if (bds3.at(i).iterator == 8) {
                bds3.at(i).origin.x = planetpos6[0] + 5250 - 125;
                bds3.at(i).origin.y = planetpos6[1] + 5250 - 125;
            };
            if (bds3.at(i).iterator == -1) {
                bds3.at(i).origin.x = txxx[0] - 17;
                bds3.at(i).origin.y = txxx[1] - 17;
            };
        }



    }
}

void allkeys_movement() {
    float x = 0;
    float y = 0;
    int maxx = 10;




    if (keystates['1']) {
        if (paused)zoomtrig += 0.0005 * zoom + zoom / 200;
        else playzoomtrig += 0.0005 * zoom + playzoom / 200;
    }
    if (keystates['2']) {
        if (paused)zoomtrig -= 0.0005 * zoom + 0.1 * zoom / 200;
        else playzoomtrig -= 0.0005 * zoom + 0.1 * playzoom / 200;
    }
    if (keystates['d'] || keystates['D'])x += movcontrolxy;
    if (keystates['a'] || keystates['A'])x -= movcontrolxy;
    if (!((keystates['d'] || keystates['D']) || (keystates['a'] || keystates['A']))) {
        speedx /= slowfact;
        shspeedx /= 1.1;
    };
    if (keystates['w'] || keystates['W'])y += movcontrolxy;
    if (keystates['s'] || keystates['S'])y -= movcontrolxy;
    if (!((keystates['w'] || keystates['W']) || (keystates['s'] || keystates['S']))) {
        speedy /= slowfact;
        shspeedy /= 1.1;
    };
    if (!paused) {
        zoomtrig = 0;
        playzoomtrig /= 1.1;
        playzoom += ((playzoom + playzoomtrig > 0.02)&&(playzoom + playzoomtrig < 2)) ? playzoomtrig : playzoomtrig = 0;
        zoom = playzoom;
        shiftpos[0] = shiftpos[1] = 0;
        shspeedx = 0;
        shspeedx = 0;
        if (abs(speedx + x) < maxx)speedx += x / 10;
        if (abs(speedy + y) < maxx)speedy += y / 10;
        shipth[0] += speedx;
        shipth[1] += speedy;
        animlamp += (animlampbtn) ? ((animlamp < 5.5) ? 0.2 : 0 * (animlcounter += 0.2)) : (animlamp > 1.5) ? -0.2 : 0 * (animlcounter += 0.2);
        animlcounter = (animlcounter > (0.87901 * PI) * PI) ? 0 : animlcounter;
        lpower = (animlampbtn) ? ((lpower > 5) ? lpower - 1 : 5) : ((lpower < 19) ? lpower + 1.5 : 20);

    } else {
        playzoomtrig = 0;
        playzoom = ((zoom > 0.02)&&(zoom < 2)) ? zoom : (zoom >= 1 ? 2 : 0.02);
        float tvalx = 1;
        if (zoom > 1)tvalx = 4 / zoom;
        else tvalx = 300 / zoom;

        if (abs(shspeedx + x * (zoom) * tvalx) < maxx * (zoom) + zoom * tvalx)shspeedx += x * (zoom) * tvalx;
        if (abs(shspeedy + y * (zoom) * tvalx) < maxx * (zoom) + zoom * tvalx)shspeedy += y * (zoom) * tvalx;
        shiftpos[0] += shspeedx;
        shiftpos[1] += shspeedy;
        zoomtrig /= 1.1;
        zoom += ((zoom + zoomtrig > 0.005)&&(zoom + zoomtrig < 20)) ? zoomtrig : zoomtrig = 0;

    }



}

void shipmovwithgrav() {
    if (!paused) {
        if (std::abs(shipth[0]) > maxth)shipth[0] = maxth * (shipth[0] > 0 ? 1 : -1);
        if (std::abs(shipth[1]) > maxth)shipth[1] = maxth * (shipth[1] > 0 ? 1 : -1);


        for (unsigned int i = 0; i < bds3.size(); i++) {
            if ((bds3.at(i).iterator >= maxbullets + 10)&&(bds3.at(i).iterator < maxbullets + 10 + maxen)) {
                if (en1alive[bds3.at(i).iterator - 10 - maxbullets]) {

                    bds3.at(i).origin.x = en1posx[bds3.at(i).iterator - 10 - maxbullets] + 125 - 125;
                    bds3.at(i).origin.y = en1posy[bds3.at(i).iterator - 10 - maxbullets] + 125 - 125;
                    bds3.at(i).heading.x = en1thdx[bds3.at(i).iterator - 10 - maxbullets];
                    bds3.at(i).heading.y = en1thdy[bds3.at(i).iterator - 10 - maxbullets];
                    bds3.at(i).isstatic = en1llisex[bds3.at(i).iterator - 10 - maxbullets];
                    bds3.at(i).miilive = true;

                } else {
                    bds3.at(i).isstatic = true;
                    bds3.at(i).miilive = false;
                }

            }
            if ((bds3.at(i).iterator >= maxbullets + 10 + maxen)) {
                if (en2alive[bds3.at(i).iterator - 10 - maxbullets - maxen]) {

                    bds3.at(i).origin.x = en2posx[bds3.at(i).iterator - 10 - maxbullets - maxen] + 125 - 125;
                    bds3.at(i).origin.y = en2posy[bds3.at(i).iterator - 10 - maxbullets - maxen] + 125 - 125;
                    bds3.at(i).heading.x = en2thdx[bds3.at(i).iterator - 10 - maxbullets - maxen];
                    bds3.at(i).heading.y = en2thdy[bds3.at(i).iterator - 10 - maxbullets - maxen];
                    bds3.at(i).isstatic = false;
                    bds3.at(i).miilive = true;

                } else {
                    bds3.at(i).isstatic = true;
                    bds3.at(i).miilive = false;
                }

            }
            bds3.at(i).sumVector(bds3);
        }
        shua = false;
        for (unsigned int i = 0; i < bds3.size(); i++) {
            if ((bds3.at(i).iterator >= maxbullets + 10)&&(bds3.at(i).iterator < maxbullets + 10 + maxen)) {
                if (en1alive[bds3.at(i).iterator - 10 - maxbullets]) {

                    if ((bds3.at(i).hit)) {
                        bds3.at(i).hit = false;
                        float ret[2] = {0};
                        float tm[2] = {0};
                        float tm2[2] = {0};
                        float an = angle2d(bds3.at(i).origin.x, bds3.at(i).origin.y, bds3.at(bds3.at(i).hitid).origin.x, bds3.at(bds3.at(i).hitid).origin.y);
                        tm[0] = -5;
                        rotate2d(tm2, tm, an, ret);
                        bds3.at(i).heading.x += ret[0];
                        bds3.at(i).heading.y += ret[1];
                    }


                    en1posx[bds3.at(i).iterator - 10 - maxbullets] = bds3.at(i).origin.x - 125 + 125;
                    en1posy[bds3.at(i).iterator - 10 - maxbullets] = bds3.at(i).origin.y - 125 + 125;
                    en1thdx[bds3.at(i).iterator - 10 - maxbullets] = bds3.at(i).heading.x;
                    en1thdy[bds3.at(i).iterator - 10 - maxbullets] = bds3.at(i).heading.y;

                }
            }

            if ((bds3.at(i).iterator >= maxbullets + 10 + maxen)) {
                if (en2alive[bds3.at(i).iterator - 10 - maxbullets - maxen]) {

                    if ((bds3.at(i).hit)) {
                        bds3.at(i).hit = false;
                        float ret[2] = {0};
                        float tm[2] = {0};
                        float tm2[2] = {0};
                        float an = angle2d(bds3.at(i).origin.x, bds3.at(i).origin.y, bds3.at(bds3.at(i).hitid).origin.x, bds3.at(bds3.at(i).hitid).origin.y);
                        tm[0] = -5;
                        rotate2d(tm2, tm, an, ret);
                        bds3.at(i).heading.x += ret[0];
                        bds3.at(i).heading.y += ret[1];
                    }


                    en2posx[bds3.at(i).iterator - 10 - maxbullets - maxen] = bds3.at(i).origin.x - 125 + 125;
                    en2posy[bds3.at(i).iterator - 10 - maxbullets - maxen] = bds3.at(i).origin.y - 125 + 125;
                    en2thdx[bds3.at(i).iterator - 10 - maxbullets - maxen] = bds3.at(i).heading.x;
                    en2thdy[bds3.at(i).iterator - 10 - maxbullets - maxen] = bds3.at(i).heading.y;
                    if (!shua) {
                        shua = (sqrt(abs(pow(en2posx[bds3.at(i).iterator - 10 - maxbullets - maxen] - shippos[0] - 125, 2)) + abs(pow(en2posy[bds3.at(i).iterator - 10 - maxbullets - maxen] - shippos[1] - 125, 2)))) < 1500;
                    }

                }
            }


        }



        for (unsigned int i = 0; i < bds2.size(); i++) {
            /*if (bds2.at(i).iterator == 0) {
                bds2.at(i).islon = (lpower < 20);
            }*/

            if ((bds2.at(i).iterator >= 10)&&(bds2.at(i).iterator < maxbullets + 10)) {
                if (bulletalive[bds2.at(i).iterator - 10]) {
                    if (isnew[bds2.at(i).iterator - 10])isnew[bds2.at(i).iterator - 10] = bds2.at(i).hit = false;
                    bds2.at(i).origin.x = bulletposx[bds2.at(i).iterator - 10];
                    bds2.at(i).origin.y = bulletposy[bds2.at(i).iterator - 10];
                    bds2.at(i).heading.x = bullethdx[bds2.at(i).iterator - 10];
                    bds2.at(i).heading.y = bullethdy[bds2.at(i).iterator - 10];
                    bds2.at(i).isstatic = (bulletexpl[bds2.at(i).iterator - 10]&&(exltimer[bds2.at(i).iterator - 10] > 4 * PI));
                    bds2.at(i).miilive = true;
                } else {
                    bds2.at(i).isstatic = true;
                    bds2.at(i).miilive = false;
                }

            }

            if ((bds2.at(i).iterator >= maxbullets + 10)&&(bds2.at(i).iterator < maxbullets + 10 + maxen)) {
                if (en1alive[bds2.at(i).iterator - 10 - maxbullets]) {
                    bds2.at(i).origin.x = en1posx[bds2.at(i).iterator - 10 - maxbullets] + 125 - 17;
                    bds2.at(i).origin.y = en1posy[bds2.at(i).iterator - 10 - maxbullets] + 125 - 17;
                    bds2.at(i).heading.x = en1thdx[bds2.at(i).iterator - 10 - maxbullets];
                    bds2.at(i).heading.y = en1thdy[bds2.at(i).iterator - 10 - maxbullets];
                    bds2.at(i).miilive = true;
                } else {
                    bds2.at(i).miilive = false;
                }

            }
            if ((bds2.at(i).iterator >= maxbullets + 10 + maxen)) {
                if (en2alive[bds2.at(i).iterator - 10 - maxbullets - maxen]) {
                    bds2.at(i).origin.x = en2posx[bds2.at(i).iterator - 10 - maxbullets - maxen] + 125 - 17;
                    bds2.at(i).origin.y = en2posy[bds2.at(i).iterator - 10 - maxbullets - maxen] + 125 - 17;
                    bds2.at(i).heading.x = en2thdx[bds2.at(i).iterator - 10 - maxbullets - maxen];
                    bds2.at(i).heading.y = en2thdy[bds2.at(i).iterator - 10 - maxbullets - maxen];
                    bds2.at(i).miilive = true;
                } else {
                    bds2.at(i).miilive = false;
                }
            }


            bds2.at(i).sumVector(bds2);
        }


        for (unsigned int i = 0; i < bds2.size(); i++) {
            if ((bds2.at(i).iterator >= 10)&&(bds2.at(i).iterator < maxbullets + 10)) {
                if (bulletalive[bds2.at(i).iterator - 10]) {
                    bulletposx[bds2.at(i).iterator - 10] = bds2.at(i).origin.x;
                    bulletposy[bds2.at(i).iterator - 10] = bds2.at(i).origin.y;
                    if ((bds2.at(i).hit)&&(bds2.at(bds2.at(i).hitid).iterator == -1)) {
                        bds2.at(i).hit = false;
                        float ret[2] = {0};
                        float tm[2] = {0};
                        float tm2[2] = {0};
                        float an = angle2d(bds2.at(i).origin.x, bds2.at(i).origin.y, bds2.at(bds2.at(i).hitid).origin.x, bds2.at(bds2.at(i).hitid).origin.y);
                        tm[0] = -10;
                        rotate2d(tm2, tm, an, ret);
                        bds2.at(i).heading.x += ret[0];
                        bds2.at(i).heading.y += ret[1];
                    }
                    if ((bds2.at(i).hit)&&(bds2.at(bds2.at(i).hitid).iterator >= maxbullets + 10)&&(bds2.at(bds2.at(i).hitid).iterator < maxen + maxbullets + 10)) {
                        bds2.at(i).hit = false;
                    }

                    if ((bds2.at(i).hit)&&(bds2.at(bds2.at(i).hitid).iterator >= maxbullets + 10 + maxen)&&(!bulletexpl[bds2.at(i).iterator - 10])) {
                        bulletexpl[bds2.at(i).iterator - 10] = true;
                        bulletexplctrl[bds2.at(i).iterator - 10] = 0.;
                        exltimer[bds2.at(i).iterator - 10] = 0;
                        bullettimer[bds2.at(i).iterator - 10] = 4 * PI + bullettimer[bds2.at(i).iterator - 10]-((int) ((bullettimer[bds2.at(i).iterator - 10]) / (4 * PI)))*4 * PI;
                    }
                    if ((bulletexpl[bds2.at(i).iterator - 10]&&(exltimer[bds2.at(i).iterator - 10] > 4 * PI))) {
                        if ((bds2.at(i).hit)&&(bds2.at(bds2.at(i).hitid).iterator >= maxbullets + 10 + maxen)) {
                            en2dd[bds2.at(bds2.at(i).hitid).iterator - maxbullets - 10 - maxen] = true;
                        }
                    }
                    bullethdx[bds2.at(i).iterator - 10] = (bulletexpl[bds2.at(i).iterator - 10]&&(exltimer[bds2.at(i).iterator - 10] > 4 * PI)) ? 0 : ((bds2.at(i).hit)&&(bds2.at(bds2.at(i).hitid).iterator >= maxbullets + 10)) ? bds2.at(i).heading.x + 0.5 * bds2.at(bds2.at(i).hitid).heading.x : bds2.at(i).heading.x;
                    bullethdy[bds2.at(i).iterator - 10] = (bulletexpl[bds2.at(i).iterator - 10]&&(exltimer[bds2.at(i).iterator - 10] > 4 * PI)) ? 0 : ((bds2.at(i).hit)&&(bds2.at(bds2.at(i).hitid).iterator >= maxbullets + 10)) ? bds2.at(i).heading.y + 0.5 * bds2.at(bds2.at(i).hitid).heading.y : bds2.at(i).heading.y;
                    //bullethdx[bds2.at(i).iterator - 10] = bds2.at(i).heading.x;
                    //bullethdy[bds2.at(i).iterator - 10] = bds2.at(i).heading.y;

                }
            }




            /*if (bds2.at(i).iterator == 0) {
                if (bds2.at(i).llhit) {
                    lhitpos[0] = bds2.at(i).llhitpos[0];
                    lhitpos[1] = bds2.at(i).llhitpos[1];
                } else {
                    lhitpos[0] = 0;
                    lhitpos[1] = bds2.at(i).maxll;
                }
            }*/
        }

        for (unsigned int i = 0; i < bds.size(); i++) {
            if ((bds.at(i).iterator >= maxbullets + 10)&&(bds.at(i).iterator < maxbullets + 10 + maxen)) {
                if (en1alive[bds.at(i).iterator - 10 - maxbullets]) {
                    bds.at(i).origin.x = en1posx[bds.at(i).iterator - 10 - maxbullets] + 125 - 250;
                    bds.at(i).origin.y = en1posy[bds.at(i).iterator - 10 - maxbullets] + 125 - 250;
                    bds.at(i).heading.x = en1thdx[bds.at(i).iterator - 10 - maxbullets];
                    bds.at(i).heading.y = en1thdy[bds.at(i).iterator - 10 - maxbullets];
                    bds.at(i).miilive = true;
                } else {
                    bds.at(i).miilive = false;
                }

            }

            if ((bds.at(i).iterator >= maxbullets + 10 + maxen)) {
                if (en2alive[bds.at(i).iterator - 10 - maxbullets - maxen]) {
                    bds.at(i).origin.x = en2posx[bds.at(i).iterator - 10 - maxbullets - maxen] + 125 - 250;
                    bds.at(i).origin.y = en2posy[bds.at(i).iterator - 10 - maxbullets - maxen] + 125 - 250;
                    bds.at(i).heading.x = en2thdx[bds.at(i).iterator - 10 - maxbullets - maxen];
                    bds.at(i).heading.y = en2thdy[bds.at(i).iterator - 10 - maxbullets - maxen];
                    bds.at(i).miilive = true;
                } else {
                    bds.at(i).miilive = false;
                }
            }

            if (bds.at(i).iterator == 0) {
                bds.at(i).islon = (lpower < 20);
            }
            bds.at(i).sumVector(bds);

        }
        wwh = false;
        en3hit = false;
        for (unsigned int i = 0; i < bds.size(); i++) {
            if (bds.at(i).iterator == 0) {


                if ((keystates['d'] || keystates['D']) || (keystates['a'] || keystates['A']))
                    bds.at(i).heading.x += shipth[0] - shipthwgr[0];
                if ((keystates['w'] || keystates['W']) || (keystates['s'] || keystates['S']))
                    bds.at(i).heading.y += shipth[1] - shipthwgr[1];
                shippos[0] = bds.at(i).origin.x;
                shippos[1] = bds.at(i).origin.y;
                shipthwgr[0] = abs(shipth[0]) > 19.9 ? (shipth[0] > 0 ? shipth[0] - 0.25 : shipth[0] + 0.25) : shipth[0];
                shipthwgr[1] = abs(shipth[1]) > 19.9 ? (shipth[1] > 0 ? shipth[1] - 0.25 : shipth[1] + 0.25) : shipth[1];
                shipthwgrt[0] = bds.at(i).heading.x;
                shipthwgrt[1] = bds.at(i).heading.y;
                /*if ((keystates['k'] || keystates['K'])) {
                    bds.at(i).heading.x = 0;
                    bds.at(i).heading.y = 0;
                }*/

                if (keystates[' ']) {
                    if (bds.at(i).hit) {
                        bds.at(i).hit = false;
                        float ret[2] = {0};
                        float tm[2] = {0};
                        float tm2[2] = {0};
                        float an = angle2d(shippos[0], shippos[1], bds.at(bds.at(i).hitid).origin.x, bds.at(bds.at(i).hitid).origin.y);
                        tm[0] = -40;
                        rotate2d(tm2, tm, an, ret);
                        bds.at(i).heading.x += ret[0];
                        bds.at(i).heading.y += ret[1];
                    }
                }

                if (bds.at(i).llhit) {

                    if ((bds.at(bds.at(i).llhitid).iterator >= maxbullets + 10)&&(bds.at(bds.at(i).llhitid).iterator < maxbullets + 10 + maxen)) {
                        en1llishit[bds.at(bds.at(i).llhitid).iterator - maxbullets - 10] = true;
                    }
                    if ((bds.at(bds.at(i).llhitid).iterator >= maxbullets + 10 + maxen)) {
                        en2llishit[bds.at(bds.at(i).llhitid).iterator - maxbullets - 10 - maxen] = true;
                    }
                    lhitpos[0] = bds.at(i).llhitpos[0];
                    lhitpos[1] = bds.at(i).llhitpos[1];
                    en3hit = (bds.at(bds.at(i).llhitid).iterator == -1);
                    wwh = (bds.at(bds.at(i).llhitid).iterator >= maxbullets + 10) || en3hit;

                } else {
                    lhitpos[0] = 0;
                    lhitpos[1] = bds.at(i).maxll;
                }
                break;
            };
        }
        shipth[0] /= slowfact;
        shipth[1] /= slowfact;

    }
}

void inituniforms() {
    GLint uindex;

    //glUseProgram(prog);
    uindex = glGetUniformLocation(prog, "time");
    uniformids[0] = uindex;
    uindex = glGetUniformLocation(prog, "iResolution");
    uniformids[1] = uindex;
    uindex = glGetUniformLocation(prog, "iMouse");
    uniformids[2] = uindex;
    uindex = glGetUniformLocation(prog, "resolution");
    uniformids[3] = uindex;
    uindex = glGetUniformLocation(prog, "angle");
    uniformids[4] = uindex;
    uindex = glGetUniformLocation(prog, "radius");
    uniformids[5] = uindex;
    uindex = glGetUniformLocation(prog, "shippos");
    uniformids[6] = uindex;
    uindex = glGetUniformLocation(prog, "shua");
    uniformids[7] = uindex;
    uindex = glGetUniformLocation(prog, "animlamp");
    uniformids[8] = uindex;
    uindex = glGetUniformLocation(prog, "animlcounter");
    uniformids[9] = uindex;
    uindex = glGetUniformLocation(prog, "lpower");
    uniformids[10] = uindex;
    uindex = glGetUniformLocation(prog, "zoom");
    uniformids[11] = uindex;
    uindex = glGetUniformLocation(prog, "bulletanimtimer");
    uniformids[12] = uindex;

    uindex = glGetUniformLocation(prog, "bulletposx");
    uniformids[13] = uindex;
    uindex = glGetUniformLocation(prog, "bulletposy");
    uniformids[14] = uindex;
    uindex = glGetUniformLocation(prog, "bullettimer");
    uniformids[15] = uindex;
    uindex = glGetUniformLocation(prog, "bulletcounter");
    uniformids[16] = uindex;
    uindex = glGetUniformLocation(prog, "paused");
    uniformids[17] = uindex;
    uindex = glGetUniformLocation(prog, "fast");
    uniformids[18] = uindex;
    uindex = glGetUniformLocation(prog, "bulletexpl");
    uniformids[19] = uindex;
    uindex = glGetUniformLocation(prog, "bulletexplctrl");
    uniformids[20] = uindex;
    uindex = glGetUniformLocation(prog, "planetpos1");
    uniformids[21] = uindex;
    uindex = glGetUniformLocation(prog, "planetpos2");
    uniformids[22] = uindex;
    uindex = glGetUniformLocation(prog, "planetpos3");
    uniformids[23] = uindex;
    uindex = glGetUniformLocation(prog, "planetpos4");
    uniformids[24] = uindex;
    uindex = glGetUniformLocation(prog, "planetpos5");
    uniformids[25] = uindex;
    uindex = glGetUniformLocation(prog, "planetpos6");
    uniformids[26] = uindex;
    uindex = glGetUniformLocation(prog, "best");
    uniformids[27] = uindex;

    //texture
    if (fast) {
        uindex = glGetUniformLocation(prog, "iChannel0");
        uniformids[28] = uindex;
        /*        if (!load_texture(ntxt, GL_TEXTURE_2D, &iChannel, 0, 1)) {
                    fprintf(stderr, "Failed to load texture. Aborting.\n");
                    exit(1);
                }*/
    } else uniformids[28] = -1;

    uindex = glGetUniformLocation(prog, "starpos1");
    uniformids[29] = uindex;
    uindex = glGetUniformLocation(prog, "starpos2");
    uniformids[30] = uindex;
    uindex = glGetUniformLocation(prog, "nebulapos");
    uniformids[31] = uindex;
    uindex = glGetUniformLocation(prog, "en3pos");
    uniformids[32] = uindex;
    uindex = glGetUniformLocation(prog, "tax");
    uniformids[33] = uindex;


    uindex = glGetUniformLocation(prog, "en1timer");
    uniformids[34] = uindex;
    uindex = glGetUniformLocation(prog, "en1posx");
    uniformids[35] = uindex;
    uindex = glGetUniformLocation(prog, "en1posy");
    uniformids[36] = uindex;
    uindex = glGetUniformLocation(prog, "en1counter");
    uniformids[37] = uindex;
    uindex = glGetUniformLocation(prog, "en2timer");
    uniformids[38] = uindex;
    uindex = glGetUniformLocation(prog, "en2posx");
    uniformids[39] = uindex;
    uindex = glGetUniformLocation(prog, "en2posy");
    uniformids[40] = uindex;
    uindex = glGetUniformLocation(prog, "en2counter");
    uniformids[41] = uindex;
    uindex = glGetUniformLocation(prog, "lhitpos");
    uniformids[42] = uindex;
    uindex = glGetUniformLocation(prog, "wwh");
    uniformids[43] = uindex;
    uindex = glGetUniformLocation(prog, "en3hit");
    uniformids[44] = uindex;
    uindex = glGetUniformLocation(prog, "en1lval");
    uniformids[45] = uindex;
    uindex = glGetUniformLocation(prog, "en1exval");
    uniformids[46] = uindex;
    uindex = glGetUniformLocation(prog, "en1llisex");
    uniformids[47] = uindex;
    uindex = glGetUniformLocation(prog, "en2llishit");
    uniformids[48] = uindex;
    uindex = glGetUniformLocation(prog, "en2extimer");
    uniformids[49] = uindex;
    
    positionLoc = glGetAttribLocation(prog, "position");
    texCoordLoc = glGetAttribLocation(prog, "texCoord");

}

void
keyboard_down_handler(unsigned char key, int x, int y) {
    keystates[key] = false;
    switch (key) {
        case 'p':
        case 'P':paused = !paused;/*
            struct timespec ts;
            clock_gettime(CLOCK_MONOTONIC_RAW, &ts);
            if (paused) {
                shifttime = (ts.tv_sec * 1000 + ts.tv_nsec / 1000000) - shifttime;
            } else {
                shifttime = (ts.tv_sec * 1000 + ts.tv_nsec / 1000000) - shifttime;
            };*/
                clock_t begin = clock();
    if (paused) {
                shifttime = ((double) (begin) / CLOCKS_PER_SEC)*1000 - shifttime;
            } else {
                shifttime = ((double) (begin) / CLOCKS_PER_SEC)*1000 - shifttime;
            };
    
            break;
            
    }
}

void
redisplay(int value) {
    glutPostRedisplay();
    glutTimerFunc(value, redisplay, value);
}

void
display(void) {
    static long frames, last_time;
    static float pass, fps;
    static bool cd;
    long x0, y0, width, height, ticks;
    GLint uindex;
    //struct timespec ts;

    glUseProgram(prog);

    x0 = glutGet(GLUT_WINDOW_X);
    y0 = glutGet(GLUT_WINDOW_Y);
    width = glutGet(GLUT_WINDOW_WIDTH);
    height = glutGet(GLUT_WINDOW_HEIGHT);
    //clock_gettime(CLOCK_MONOTONIC_RAW, &ts);
    clock_t begin = clock();




    //ticks = ts.tv_sec * 1000 + ts.tv_nsec / 1000000;
    ticks =((double) (begin) / CLOCKS_PER_SEC)*1000;

    if (frames == 0) {
        last_time = ticks;
    }


    frames++;
    //need pass first sec of time
    if (ticks - last_time >= 1000) {
        fps = 1000.0 * frames / (ticks - last_time);
        fprintf(stderr, "FPS: %.2f\n", fps);
        pass = (ticks - last_time) / (1000. * frames);
        frames = 0;
    }
    scrcenter[0] = width / 2 - (radius * zoom) / 2;
    scrcenter[1] = height / 2 - (radius * zoom) / 2;
    allkeys_movement();
    shipmovwithgrav();
    cameraposs(width, height);
    staticplanetsmov();
    spawnenemy(pass);
    if (uniformids[0] >= 0) {
        if (paused)glUniform1f(uniformids[0], (float) (shifttime / 1000.0));
        else glUniform1f(uniformids[0], (float) ((ticks - shifttime) / 1000.0));
    }

    if (uniformids[1] >= 0) {
        glUniform3f(uniformids[1], width, height, 1.0);
    }

    if (uniformids[2] >= 0)
        glUniform4f(uniformids[2], mouse[0], mouse[1], mouse[2], mouse[3]);

    if (uniformids[3] >= 0) {
        glUniform2f(uniformids[3], width, height);
    }


    if (uniformids[4] >= 0) {
        if (!paused) {
            if (animlampbtn) {
                float lastangle = angle;
                float nang = 0.02;
                angle = std::atan2((mouse[1]-(shippos[1] + scrcenter[1] + camerapos[1]+((radius * zoom) / 2))) / (radius), (mouse[0]-(shippos[0] + scrcenter[0] + camerapos[0]+((radius * zoom) / 2))) / (radius));
                angle = lastangle + ((std::abs(angle - lastangle) > nang) ? (((angle - lastangle) > 0) ? (((angle > (PI / 2))&&(lastangle < (-PI / 2))) ? -nang : ((angle < (-PI / 2))&&(lastangle > (PI / 2))) ? -nang : nang) : (((angle > (PI / 2))&&(lastangle < (-PI / 2))) ? nang : ((angle < (-PI / 2))&&(lastangle > (PI / 2))) ? nang : -nang)) : ((angle > (PI / 2))&&(lastangle < (-PI / 2))) ? angle - lastangle : ((angle < (-PI / 2))&&(lastangle > (PI / 2))) ? angle - lastangle : angle - lastangle);
                angle = (angle > PI) ? angle - 2 * PI : (angle<-PI) ? 2 * PI + angle : angle;

            } else {
                float lastangle = angle;
                float nang = 0.06;
                if (lpower < 20)nang = 0.02;
                angle = std::atan2((mouse[1]-(shippos[1] + scrcenter[1] + camerapos[1]+((radius * zoom) / 2))) / (radius), (mouse[0]-(shippos[0] + scrcenter[0] + camerapos[0]+((radius * zoom) / 2))) / (radius));
                angle = lastangle + ((std::abs(angle - lastangle) > nang) ? (((angle - lastangle) > 0) ? (((angle > (PI / 2))&&(lastangle < (-PI / 2))) ? -nang : ((angle < (-PI / 2))&&(lastangle > (PI / 2))) ? -nang : nang) : (((angle > (PI / 2))&&(lastangle < (-PI / 2))) ? nang : ((angle < (-PI / 2))&&(lastangle > (PI / 2))) ? nang : -nang)) : ((angle > (PI / 2))&&(lastangle < (-PI / 2))) ? angle - lastangle : ((angle < (-PI / 2))&&(lastangle > (PI / 2))) ? angle - lastangle : angle - lastangle);
                angle = (angle > PI) ? angle - 2 * PI : (angle<-PI) ? 2 * PI + angle : angle;
            }
        }
        glUniform1f(uniformids[4], PI / 2 - angle);
    }

    if (uniformids[5] >= 0) {
        glUniform1f(uniformids[5], radius * zoom);
    }

    if (uniformids[6] >= 0) {
        glUniform2f(uniformids[6], (shippos[0] + shiftpos[0] * zoom + camerapos[0] + scrcenter[0]), (shippos[1] + shiftpos[1] * zoom + camerapos[1] + scrcenter[1]));
    }

    if (uniformids[7] >= 0) {
        glUniform1i(uniformids[7], shua);
    }

    if (uniformids[8] >= 0) {
        glUniform1f(uniformids[8], animlamp);
    }

    if (uniformids[9] >= 0) {
        glUniform1f(uniformids[9], animlcounter);
    }
    if (uniformids[10] >= 0) {
        glUniform1f(uniformids[10], lpower);
    }
    if (uniformids[11] >= 0) {
        glUniform1f(uniformids[11], zoom);
    }
    if (uniformids[12] >= 0) {
        if (!paused) {
            if (animbulletbtn) {
                bulletanimtimer += pass;
                if (bulletanimtimer > 1) {
                    for (int ii = 0; ii < maxbullets; ii++) {
                        if (cd)break;
                        if (!bulletalive[ii]) {
                            //wdrt u wasm {..gg..}
                            float tm[2];
                            tm[0] = 137.5 + shippos[0] - shipthwgrt[0];
                            tm[1] = 137.5 + shippos[1] - shipthwgrt[1];
                            float tm2[2];
                            tm2[0] = 238.5 + shippos[0] - shipthwgrt[0];
                            tm2[1] = 238.5 + shippos[1] - shipthwgrt[1];
                            float ret[2];
                            ret[0]=0;
                            ret[1]=0;
                            rotate2d(tm2, tm, angle + PI / 1.3335, ret);
                            bulletposx[ii] = 12.5 + -35 / 2. + ret[0];
                            bulletposy[ii] = 12.5 + -35 / 2. + ret[1];
                            bulletalive[ii] = isnew[ii] = true;

                            bullettimer[ii] = 0;
                            float rOffputX = std::sin(angle);
                            float rOffputY = std::cos(angle);
                            bullethdx[ii] = rOffputY * 2. + shipthwgrt[0];
                            bullethdy[ii] = rOffputX * 2. + shipthwgrt[1];
                            bulletexpl[ii] = false;
                            cd = true;
                        }

                    }
                }
            } else {
                bulletcounter = 0;
                if (bulletanimtimer > 0.7)bulletanimtimer += pass;
                else bulletanimtimer -= pass;
                if (bulletanimtimer < 0)bulletanimtimer = 0;
            }
            if (bulletanimtimer > 1.4) {
                bulletanimtimer = 0;
                cd = false;
            };
        }
        glUniform1f(uniformids[12], bulletanimtimer);
    }
    bulletcounter = 0;
    for (int ii = 0; ii < maxbullets; ii++)if (bulletalive[ii]) {
            if ((!paused)&&(!bulletexpl[ii])) {
                tmpbulletexpl[bulletcounter] = false;
                if ((bullettimer[ii] > maxbullets - 15)) {
                    bulletexpl[ii] = true;
                    bulletexplctrl[ii] = 0.;
                    exltimer[ii] = 0;
                    bullettimer[ii] = 4 * PI + bullettimer[ii]-((int) ((bullettimer[ii]) / (4 * PI)))*4 * PI; //glsl


                    bullettimer[ii] += -pass;
                }


                bullettimer[ii] += pass;
                tmpbullettimer[bulletcounter] = bullettimer[ii];
                tmpbulletposx[bulletcounter] = bulletposx[ii] = bulletposx[ii];
                tmpbulletposy[bulletcounter] = bulletposy[ii] = bulletposy[ii];
                tmpbulletposx[bulletcounter] += -shippos[0];
                tmpbulletposy[bulletcounter] += -shippos[1];
            } else {
                tmpbulletposx[bulletcounter] = bulletposx[ii] - shippos[0];
                tmpbulletposy[bulletcounter] = bulletposy[ii] - shippos[1];
            }
            if (!paused) {
                if (bulletexpl[ii]) {
                    tmpbulletposx[bulletcounter] = bulletposx[ii] = bulletposx[ii];
                    tmpbulletposy[bulletcounter] = bulletposy[ii] = bulletposy[ii];
                    tmpbulletposx[bulletcounter] += -shippos[0];
                    tmpbulletposy[bulletcounter] += -shippos[1];
                    if (exltimer[ii] < 4 * PI) {//glsl


                        bullettimer[ii] += pass + 2 * (pass * ((exltimer[ii]) / (4 * PI)));
                        exltimer[ii] += pass / 1.5;
                        bulletexplctrl[ii] = tmpbulletexplctrl[bulletcounter] = bulletexplctrl[ii] + pass + 2 * (pass * ((exltimer[ii]) / (4 * PI)));
                        if (exltimer[ii] >= 4 * PI - pass) {
                            exltimer[ii] = 100;
                            bullettimer[ii] = 0;

                        }
                        tmpbulletexpl[bulletcounter] = bulletexpl[ii];
                        tmpbullettimer[bulletcounter] = bullettimer[ii];

                    } else {

                        if (bullettimer[ii] > PI * 1.24) //glsl
                        {
                            bulletalive[ii] = false;
                            tmpbulletexpl[bulletcounter] = false;
                            bulletexpl[ii] = false;
                            continue;
                        }

                        tmpbulletexpl[bulletcounter] = bulletexpl[ii];
                        bullettimer[ii] += pass;
                        tmpbullettimer[bulletcounter] = bullettimer[ii];
                        tmpbulletexpl[bulletcounter] = bulletexpl[ii];
                        tmpbullettimer[bulletcounter] = bullettimer[ii];


                    }

                }
            }




            bulletcounter++;
        }
    if (uniformids[13] >= 0) {
        glUniform1fv(uniformids[13], maxbullets, tmpbulletposx);
    }

    if (uniformids[14] >= 0) {
        glUniform1fv(uniformids[14], maxbullets, tmpbulletposy);
    }

    if (uniformids[15] >= 0) {
        glUniform1fv(uniformids[15], maxbullets, tmpbullettimer);
    }

    if (uniformids[16] >= 0) {
        glUniform1i(uniformids[16], bulletcounter);
    }
    if (uniformids[17] >= 0) {
        glUniform1i(uniformids[17], paused);
    }
    if (uniformids[18] >= 0) {
        glUniform1i(uniformids[18], fast);
    }
    if (uniformids[19] >= 0) {
        glUniform1iv(uniformids[19], maxbullets, tmpbulletexpl);
    }
    if (uniformids[20] >= 0) {
        glUniform1fv(uniformids[20], maxbullets, tmpbulletexplctrl);
    }
    if (uniformids[21] >= 0) {
        glUniform2f(uniformids[21], planetpos1[0] - shippos[0], planetpos1[1] - shippos[1]);
    }
    if (uniformids[22] >= 0) {
        glUniform2f(uniformids[22], planetpos2[0] - shippos[0], planetpos2[1] - shippos[1]);
    }
    if (uniformids[23] >= 0) {
        glUniform2f(uniformids[23], planetpos3[0] - shippos[0], planetpos3[1] - shippos[1]);
    }
    if (uniformids[24] >= 0) {
        glUniform2f(uniformids[24], planetpos4[0] - shippos[0], planetpos4[1] - shippos[1]);
    }
    if (uniformids[25] >= 0) {
        glUniform2f(uniformids[25], planetpos5[0] - shippos[0], planetpos5[1] - shippos[1]);
    }
    if (uniformids[26] >= 0) {
        glUniform2f(uniformids[26], planetpos6[0] - shippos[0], planetpos6[1] - shippos[1]);
    }
    if (uniformids[27] >= 0) {
        glUniform1i(uniformids[27], best);
    }
    if (uniformids[28] >= 0) {
        glActiveTexture(GL_TEXTURE0 + 0);
        glBindTexture(GL_TEXTURE_2D, iChannel);
        glUniform1i(uniformids[28], 0);
    }
    if (uniformids[29] >= 0) {
        glUniform2f(uniformids[29], starpos1[0] - shippos[0], starpos1[1] - shippos[1]);
    }
    if (uniformids[30] >= 0) {
        glUniform2f(uniformids[30], starpos2[0] - shippos[0], starpos2[1] - shippos[1]);
    }
    if (uniformids[31] >= 0) {
        glUniform2f(uniformids[31], nebulapos[0] - shippos[0], nebulapos[1] - shippos[1]);
    }
    if (uniformids[32] >= 0) {
        glUniform2f(uniformids[32], en3pos[0] - shippos[0], en3pos[1] - shippos[1]);
    }
    if (uniformids[33] >= 0) {
        glUniform1f(uniformids[33], ta);
    }
    if (uniformids[34] >= 0) {
        glUniform1fv(uniformids[34], maxen, tmpen1timer);
    }
    if (uniformids[35] >= 0) {
        glUniform1fv(uniformids[35], maxen, tmpen1posx);
    }

    if (uniformids[36] >= 0) {
        glUniform1fv(uniformids[36], maxen, tmpen1posy);
    }
    if (uniformids[37] >= 0) {
        glUniform1i(uniformids[37], en1counter);
    }
    if (uniformids[38] >= 0) {
        glUniform1fv(uniformids[38], maxen, tmpen2timer);
    }
    if (uniformids[39] >= 0) {
        glUniform1fv(uniformids[39], maxen, tmpen2posx);
    }

    if (uniformids[40] >= 0) {
        glUniform1fv(uniformids[40], maxen, tmpen2posy);
    }
    if (uniformids[41] >= 0) {
        glUniform1i(uniformids[41], en2counter);
    }

    if (uniformids[42] >= 0) {
        glUniform2f(uniformids[42], lhitpos[0], lhitpos[1]);
    }
    if (uniformids[43] >= 0) {
        glUniform1i(uniformids[43], wwh);
    }
    if (uniformids[44] >= 0) {
        glUniform1i(uniformids[44], en3hit);
    }
    if (uniformids[45] >= 0) {
        glUniform1fv(uniformids[45], maxen, tmpen1lval);
    }
    if (uniformids[46] >= 0) {
        glUniform1fv(uniformids[46], maxen, tmpen1exval);
    }
    if (uniformids[47] >= 0) {
        glUniform1iv(uniformids[47], maxen, tmpen1llisex);
    }
    if (uniformids[48] >= 0) {
        glUniform1iv(uniformids[48], maxen, tmpen2llishit);
    }
    if (uniformids[49] >= 0) {
        glUniform1fv(uniformids[49], maxen, tmpen2extimer);
    }

    GLuint vertexObject;
    GLuint indexObject;
GLfloat vVertices[] = { -1.0,  1.0, 0.0, 0.0, 0.0, -1.0, -1.0, 0.0, 0.0, 1.0,
                             1.0, -1.0, 0.0, 1.0,  1.0, 1.0, 1.0, 0.0, 1.0,  0.0};
    GLushort indices[] = { 0, 1,2, 0, 2, 3 };

    glGenBuffers(1, &vertexObject);
    glBindBuffer(GL_ARRAY_BUFFER, vertexObject);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vVertices), vVertices, GL_STATIC_DRAW);

    glGenBuffers(1, &indexObject);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, indexObject);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices), indices, GL_STATIC_DRAW);

    // Set the viewport
    glViewport(0, 0, width, height);



    glClear(GL_COLOR_BUFFER_BIT);
    //glRectf(-1.0, -1.0, 1.0, 1.0);
    glVertexAttribPointer(positionLoc, 3, GL_FLOAT, GL_FALSE, 5 * sizeof(GLfloat), 0);
    glVertexAttribPointer(texCoordLoc, 2, GL_FLOAT, GL_FALSE, 5 * sizeof(GLfloat), (GLvoid*) (3 * sizeof(GLfloat)));

    glEnableVertexAttribArray(positionLoc);
    glEnableVertexAttribArray(texCoordLoc);

    glutSwapBuffers();
    glDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_SHORT, 0);
}

GLint
compile_shader(const GLenum shader_type,
        const GLchar * shader_source) {
    GLuint shader = glCreateShader(shader_type);
    GLint status = GL_FALSE;
    GLint loglen;
    GLchar *error_message;

    glShaderSource(shader, 1, &shader_source, NULL);
    glCompileShader(shader);

    glGetShaderiv(shader, GL_COMPILE_STATUS, &status);
    if (status == GL_TRUE)
        return shader;

    glGetShaderiv(shader, GL_INFO_LOG_LENGTH, &loglen);
    error_message = static_cast<char*> (calloc(loglen, sizeof (GLchar)));
    glGetShaderInfoLog(shader, loglen, NULL, error_message);
    fprintf(stderr, "shader failed to compile:\n   %s\n", error_message);
    free(error_message);

    return -1;
}

GLint
link_program(const GLchar * shader_source) {
    GLint frag,vert, program;
    GLint status = GL_FALSE;
    GLint loglen, n_uniforms;
    GLchar *error_message;
    GLint i;

    GLchar name[80];
    GLsizei namelen;

    frag = compile_shader(GL_FRAGMENT_SHADER, shader_source);
    if (frag < 0)
        return -1;
        
    vert = compile_shader(GL_VERTEX_SHADER, vertex_source);
    if (vert < 0)
        return -1;

    program = glCreateProgram();
    
    glAttachShader(program, vert);
    glAttachShader(program, frag);
    
    glBindAttribLocation(program, 0, "position");

    glLinkProgram(program);
    glValidateProgram(program);
    // glDeleteShader (frag);

    glGetProgramiv(program, GL_LINK_STATUS, &status);
    if (status != GL_TRUE) {
        glGetProgramiv(program, GL_INFO_LOG_LENGTH, &loglen);
        error_message = static_cast<char*> (calloc(loglen, sizeof (GLchar)));
        glGetProgramInfoLog(program, loglen, NULL, error_message);
        fprintf(stderr, "program failed to link:\n   %s\n", error_message);
        free(error_message);
        return -1;
    }

    /* diagnostics */
    glGetProgramiv(program, GL_ACTIVE_UNIFORMS, &n_uniforms);
    fprintf(stderr, "%d uniforms:\n", n_uniforms);

    for (i = 0; i < n_uniforms; i++) {
        GLint size;
        GLenum type;

        glGetActiveUniform(program, i, 79, &namelen, &size, &type, name);
        name[namelen] = '\0';
        fprintf(stderr, "  %2d: %-20s (type: 0x%04x, size: %d)\n", i, name, type, size);
    }

    return program;
}

void
init_glew(void) {
    GLenum status;

    status = glewInit();

    if (status != GLEW_OK) {
        fprintf(stderr, "glewInit error: %s\n", glewGetErrorString(status));
        exit(-1);
    }

    fprintf(stderr,
            "GL_VERSION   : %s\nGL_VENDOR    : %s\nGL_RENDERER  : %s\n"
            "GLEW_VERSION : %s\nGLSL VERSION : %s\n\n",
            glGetString(GL_VERSION), glGetString(GL_VENDOR),
            glGetString(GL_RENDERER), glewGetString(GLEW_VERSION),
            glGetString(GL_SHADING_LANGUAGE_VERSION));

    if (!GLEW_VERSION_2_1) {
        fprintf(stderr, "OpenGL 2.1 or better required for GLSL support.");
        exit(-1);
    }
}

char *
load_file(char const *filename) {
    FILE *f;
    int size;
    char *data;

    f = fopen(filename, "rb");
    if (f == NULL) {
        perror("error opening file");
        return NULL;
    }

    fseek(f, 0, SEEK_END);
    size = ftell(f);
    fseek(f, 0, SEEK_SET);

    data = static_cast<char*> (malloc(size + 1));
    if (fread(data, size, 1, f) < 1) {
        fprintf(stderr, "problem reading file %s\n", filename);
        free(data);
        return NULL;
    }
    fclose(f);

    data[size] = '\0';

    return data;
}

int
main(int argc,
        char *argv[]) {
	fprintf(stdout,"control: W A S D - move, mouse scroll or 1/2 - zoom in/out, SPACE to jump from planets, R reset zoom, P pause, Left/Right mouse shoot\n");
    char *frag_code = NULL;
    glutInit(&argc, argv);
    initglslvals();

    glutInitWindowSize(1280, 720);
    glutInitDisplayMode(GLUT_RGBA | GLUT_DOUBLE);
    glutCreateWindow("glslgm");


    init_glew();

    frag_code = load_file(fspath);
    if (!frag_code) {
        fprintf(stderr, "Failed to load Shaderfile. Aborting.\n");
        exit(-1);
    }

    prog = link_program(frag_code);
    if (prog < 0) {
        fprintf(stderr, "Failed to link shader program. Aborting\n");
        exit(-1);
    }

    glutDisplayFunc(display);
    glutMouseFunc(mouse_press_handler);
    glutMotionFunc(mouse_press_move_handler);
    glutPassiveMotionFunc(mouse_move_handler);
    //glutIgnoreKeyRepeat(1);
    glutKeyboardFunc(keyboard_up_handler);
    glutKeyboardUpFunc(keyboard_down_handler);
    redisplay(1000 / 60);
    inituniforms();
    glutMainLoop();

    return 0;
}
