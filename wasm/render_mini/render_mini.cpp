

//calc
#include <cstdlib>
#include <cmath>
#include <algorithm> 
#include <time.h>
#include <vector>
#include <iostream>
#include <array>
#include <time.h>
#include <limits>
#include <cstddef>
#include <chrono>
#include <ctime>
#include <ratio>
#include <emscripten.h>


//draw
#include <SDL.h>
#include <thread>

using namespace std;

const int viewWidth = 300;
const int viewHeight = 200;
const int viewScaleX = 3;
const int viewScaleY = 3;
int scene = 1;
SDL_Surface *screen = NULL;

bool keyDown[65536] = {};

int oncept = 0;
static void sdl_draw();

void putpixel(SDL_Surface *surface, int x, int y, Uint32 pixel) {
    int bpp = surface->format->BytesPerPixel;
    /* Here p is the address to the pixel we want to set */
    Uint8 *p = (Uint8 *) surface->pixels + y * surface->pitch + x * bpp;

    switch (bpp) {
        case 1:
            *p = pixel;
            break;

        case 2:
            *(Uint16 *) p = pixel;
            break;

        case 3:
            if (SDL_BYTEORDER == SDL_BIG_ENDIAN) {
                p[0] = (pixel >> 16) & 0xff;
                p[1] = (pixel >> 8) & 0xff;
                p[2] = pixel & 0xff;
            } else {
                p[0] = pixel & 0xff;
                p[1] = (pixel >> 8) & 0xff;
                p[2] = (pixel >> 16) & 0xff;
            }
            break;

        case 4:
            *(Uint32 *) p = pixel;
            break;
    }
}

class Gg2 {
public:

    static bool disable_ani;
    static double speed;
    static double leftm;
    static double rightm;
    static double zz;
    static double *wlight;
    static bool *wlightstate;
    static bool *wlightprgrs;
    static double maxinverval;
    static double inverval;
    static double *invervalt;
    static bool invert;

    static bool *currcolor;

    static double lastatime;

    static int mat_blue;
    static int mat_yellow;


    static double frameRateSmoothing;


    static double maxViewDist;
    static double primaryRayStepThreshold;
    static double noIntersection;

    class Vec {
    public:

        double x;
        double y;
        double z;

        Vec(double x, double y, double z) {
            this->x = x;
            this->y = y;
            this->z = z;
        }

        double length() {
            return std::sqrt(x * x + y * y + z * z);
        }

        double dotProduct(Vec v) {
            return x * v.x + y * v.y + z * v.z;
        }

        Vec add(Vec v) {
            return Vec(x + v.x, y + v.y, z + v.z);
        }

        Vec subtract(Vec v) {
            return Vec(x - v.x, y - v.y, z - v.z);
        }

        Vec multiply(double a) {
            return Vec(x * a, y * a, z * a);
        }

        Vec normalise() {
            return this->multiply(1.0 / length());
        }

        Vec crossProduct(Vec v) {
            return Vec(y * v.z - z * v.y, z * v.x - x * v.z, x * v.y - y * v.x);
        }
    };

    static void processKeyEvent() {
        SDL_Event event;

        while (SDL_PollEvent(&event)) {

            switch (event.type) {
                case SDL_KEYDOWN:
                case SDL_KEYUP:
                    keyDown[event.key.keysym.sym] = true;
                    break;

                default:
                    break;
            }

        }
    }

    static double getDistToSphere(Vec pt, double radius) {
        return pt.length() - radius;
    }

    static double getDistToBox(Vec pt, Vec halfSize) {
        Vec tmp = Vec(std::max((double) 0, std::abs(pt.x) - halfSize.x),
                std::max((double) 0, std::abs(pt.y) - halfSize.y),
                std::max((double) 0, std::abs(pt.z) - halfSize.z));
        return tmp.length();
    }

    static Vec tilePrimitive(Vec pt, double tileSize) {

        double halfTileSize = tileSize / 2.0;
        return Vec(fmod(pt.x, tileSize) - halfTileSize,
                fmod(pt.y, tileSize) - halfTileSize,
                fmod(pt.z, tileSize) - halfTileSize);
    }

    static Vec getSphereNormal(Vec pt) {
        return pt.normalise();
    }

    static double worldGetDist(Vec pt) {

        double tileSize = 3.0;
        pt = tilePrimitive(pt, tileSize);

        switch (scene) {
            case 1:
                return getDistToSphere(pt, 1);
            case 2:
                return getDistToBox(pt, Vec(0.5, 0.5, 0.5));
            default:
                return getDistToSphere(pt, 1);
        }
    }

    static Vec worldGetNormal(Vec pt) {

        double tileSize = 3.0;
        pt = tilePrimitive(pt, tileSize);
        return getSphereNormal(pt);
    }

    static double worldIntersect(Vec rayStart, Vec rayDir, double maxDist, double rayStepThreshold) {

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

    static void putpixel(int x, int y, int color) {
        if (x < 0 || x >= viewWidth || y < 0 || y >= viewHeight) {
            return;
        }

        pixels[y * viewWidth + x] = color;
    }

    //public:

    static int *pixels;
    static long frame_timetocalc;
    static int fps;
    static long min_timetocalc;
    static long max_timetocalc;
    static int numFrames;
    static std::chrono::high_resolution_clock::time_point lastFpsTime;

    static void run() {
        
        while (true) {
            clock_t begin = clock();
            processKeyEvent();

            if (keyDown[SDLK_1]) {
                keyDown[SDLK_1] = false;
                scene = 1;
            }

            if (keyDown[SDLK_2]) {
                keyDown[SDLK_2] = false;
                scene = 2;
            }

            if (keyDown[SDLK_w]) {
                keyDown[SDLK_w] = false;
                speed = (speed < 0.3) ? speed + 0.05 : 0.35;

            }

            if (keyDown[SDLK_s]) {
                keyDown[SDLK_s] = false;
                speed = (speed > 0.06) ? speed - 0.05 : 0;

            }
            lastatime += speed;

            if (keyDown[SDLK_a]) {
                keyDown[SDLK_a] = false;
                if (rightm == 0) {
                    leftm = (leftm < 0.9) ? leftm + 0.08 : 0.91;
                } else {
                    rightm = ((rightm - 0.08) > 0) ? rightm - 0.08 : 0;
                }
            }

            if (keyDown[SDLK_d]) {
                keyDown[SDLK_d] = false;
                if (leftm == 0) {
                    rightm = (rightm < 0.9) ? rightm + 0.08 : 0.91;
                } else {
                    leftm = ((leftm - 0.08) > 0) ? leftm - 0.08 : 0;
                }
            }

            if (keyDown[SDLK_q]) {
                keyDown[SDLK_q] = false;
                zz = (zz < 0.0055) ? zz + 0.0005 : 0.006;
            }

            if (keyDown[SDLK_e]) {
                keyDown[SDLK_e] = false;
                zz = ((zz - 0.0005) > -0.0055) ? zz -= 0.0005 : -0.006;
            }

            Vec moveDir(1.5, zz, 0.8);
            Vec cameraPos = moveDir.multiply(lastatime);
            Vec cameraLookAt = cameraPos.add(moveDir).add(Vec(0 + rightm, 0.8 - zz * 500, 0.5 + leftm));
            Vec cameraUp(0 + rightm / 3, 1.0, 0 + leftm / 3);

            Vec cameraForward = cameraLookAt.subtract(cameraPos).normalise();
            Vec cameraRight = cameraForward.crossProduct(cameraUp);
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
                }
            } else inverval = invervalt[0] = invervalt[1] = invervalt[2] = 1;

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

                        Vec tmp(-1 - wlight[1] * 2, 0.5 - wlight[1] * 2, -0.7 - wlight[2] * 2);
                        Vec dirToLight = tmp.normalise();
                        double shadowFactor = noIntersection;

                        Vec pt = rayStart.add(rayDir.multiply(depth));
                        Vec normal = worldGetNormal(pt);

                        if (shadowFactor == noIntersection) {
                            shadowFactor = 1.0;
                        } else {
                            shadowFactor = 1.0 - shadowFactor;
                        }

                        double normalisedIntensity = std::min(std::max(0.0, normal.dotProduct(dirToLight)) * shadowFactor, 1.0);
                        int intensity = (int) (normalisedIntensity * 255.0);

                        int intensityr = (int) (intensity * invervalt[0]);
                        int intensityg = (int) (intensity * invervalt[1]);
                        int intensityb = (int) (intensity * invervalt[2]);
                        if (scene == 2) {
                            unsigned char depthByte = 0;
                            double invMaxViewDist = 1.0 / maxViewDist;
                            if (depth != noIntersection) {
                                depthByte = (unsigned char) ((1.0 - depth * invMaxViewDist) * 255.0);
                                putpixel(col, row, ((int) (depthByte - intensity * 0.5) << 16) + ((int) (depthByte - intensity * 0.5) << 8) + (int) (depthByte));
                            }
                        } else {
                            putpixel(col, row, ((intensityr) << 16) + ((intensityg) << 8) + intensityb);

                        }
                    }
                }
            }

            clock_t end = clock();
            frame_timetocalc = ((double) (end - begin) / CLOCKS_PER_SEC)*1000;
            if (max_timetocalc < frame_timetocalc) {
                max_timetocalc = frame_timetocalc;
            }
            if (min_timetocalc > frame_timetocalc) {
                min_timetocalc = frame_timetocalc;
            }

            sdl_draw();
            oncept++;
            if (oncept > 5) {
                oncept = 0;
                cout << "fps: " << fps << " , timetocalc:" << frame_timetocalc << " , max:" << Gg2::max_timetocalc << " , min:" << Gg2::min_timetocalc << std::endl;
            }
            numFrames++;
            std::chrono::duration<double> delta = std::chrono::duration_cast<std::chrono::duration<double>> (std::chrono::high_resolution_clock::now() - lastFpsTime);
            if (delta.count() > frameRateSmoothing) {
                fps = (int) (numFrames / delta.count());
                numFrames = 0;
                lastFpsTime = std::chrono::high_resolution_clock::now();
            }
            return;

        }
    }

    static void start() {
        SDL_Init(SDL_INIT_EVERYTHING);
        SDL_SetVideoMode(viewWidth*viewScaleX, viewHeight*viewScaleY, 32, SDL_SWSURFACE);
        screen = SDL_GetVideoSurface();
        SDL_WM_SetCaption("wasm_mini_render", NULL);
        emscripten_set_main_loop(run, 0, 0);
        atexit(SDL_Quit);
    }

};

static void sdl_draw() {
    SDL_LockSurface(screen);
    for (int i = 0; i < viewWidth; i++) {
        for (int j = 0; j < viewHeight; j++) {
            for (int o_y = 0; o_y < viewScaleY; ++o_y)
                for (int o_x = 0; o_x < viewScaleX; ++o_x)
                    putpixel(screen, viewScaleX * i + o_x, viewScaleY * j + o_y, SDL_MapRGB(screen->format, (Gg2::pixels[j * viewWidth + i] >> 16), ((Gg2::pixels[j * viewWidth + i] >> 8)-((Gg2::pixels[j * viewWidth + i] >> 16) << 8)), ((Gg2::pixels[j * viewWidth + i])-((Gg2::pixels[j * viewWidth + i] >> 8) << 8))));
        }
    }
    SDL_UnlockSurface(screen);
    SDL_Flip(screen);
}



int *Gg2::pixels = new int[viewWidth * viewHeight] {
};
bool Gg2::disable_ani = false; //set true to disable animation
double Gg2::leftm = 0;
double Gg2::rightm = 0;
double Gg2::zz = 0;
double *Gg2::wlight = new double[3] {
    0, 0, 0
};
bool *Gg2::wlightstate = new bool[3] {
    false, false, false
};
bool *Gg2::wlightprgrs = new bool[3] {
    false, false, false
};
double Gg2::maxinverval = 3.5;
double Gg2::inverval = Gg2::maxinverval;
double *Gg2::invervalt = new double[3] {
    Gg2::maxinverval, Gg2::maxinverval, 1
};
bool Gg2::invert = false;

bool *Gg2::currcolor = new bool[3] {
    true, true, false
};

double Gg2::lastatime = 1000;

int Gg2::mat_blue = 0x0000ff;
int Gg2::mat_yellow = 0xffff00;


double Gg2::frameRateSmoothing = 1.0;


double Gg2::maxViewDist = 100;
double Gg2::primaryRayStepThreshold = 0.01;
double Gg2::noIntersection = -1.0;

double Gg2::speed = 0.12;
long Gg2::min_timetocalc = 100000000;
long Gg2::max_timetocalc = 0;
long Gg2::frame_timetocalc = 0;
int Gg2::fps = 0;
int Gg2::numFrames = 0;
std::chrono::high_resolution_clock::time_point Gg2::lastFpsTime = std::chrono::high_resolution_clock::now();

int main(int argc, char** argv) {
    Gg2::start();
};
