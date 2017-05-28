

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


//draw
#include <gtk/gtk.h>
#include <cairo.h>
#include <cairo-pdf.h>
#include <cairo-ps.h>
#include <cairo-svg.h>
#include <gdk/gdkkeysyms.h>
#include <X11/Xlib.h>
#include <thread>
#include <gdk/gdkkeysyms.h>

using namespace std;

const int viewWidth = 300;
const int viewHeight = 200;
const int viewScaleX = 3;
const int viewScaleY = 3;
bool active = true;
int scene = 1;

GtkWidget *canvas = NULL;
std::thread *draw_thread = NULL;


static void draw_gtk(GtkWidget *, GdkEventExpose *, gpointer);
bool keyDown[65536]={};
class Gg2 {
private:

    bool disable_ani = false; //set true to disable animation
    double speed = 0.12;
    double leftm = 0;
    double rightm = 0;
    double zz = 0;
    double wlight[3] = {0, 0, 0};
    bool wlightstate[3] = {false, false, false};
    bool wlightprgrs[3] = {false, false, false};
    double maxinverval = 3.5;
    double inverval = maxinverval;
    double invervalt[3] = {maxinverval, maxinverval, 1};
    bool invert = false;

    bool currcolor[3] = {true, true, false};

    double lastatime = 1000;

    int mat_blue = 0x0000ff;
    int mat_yellow = 0xffff00;


    double frameRateSmoothing = 1.0;


    double maxViewDist = 100;
    double primaryRayStepThreshold = 0.01;
    double noIntersection = -1.0;


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

    static void closethis() {
        active = false;
        std::this_thread::sleep_for(std::chrono::seconds(1));
        gtk_main_quit();

    }

    static gboolean processKeyEvent(GtkWidget *widget, GdkEventKey *event, gpointer user_data) {

        switch (event->keyval) {
            case GDK_1:scene=1;keyDown[GDK_1] = true;
                break;
            case GDK_2:scene=2;keyDown[GDK_2] = true;
                break;
            case GDK_s:keyDown[GDK_s] = true;
                break;
            case GDK_w:keyDown[GDK_w] = true;
                break;
            case GDK_a:keyDown[GDK_a] = true;
                break;
            case GDK_d:keyDown[GDK_d] = true;
                break;
            case GDK_q:keyDown[GDK_q] = true;
                break;
            case GDK_e:keyDown[GDK_e] = true;
                break;
            default:
                return FALSE;
        }
        return FALSE;
    }

    static void gtk_draw() {
        XInitThreads();
        gtk_init(NULL, NULL);
        GtkWidget *mainwin = NULL;

        mainwin = gtk_window_new(GTK_WINDOW_TOPLEVEL);
        canvas = gtk_drawing_area_new();
        gtk_widget_set_size_request(canvas, viewWidth*viewScaleX, viewHeight * viewScaleY);

        gtk_container_add(GTK_CONTAINER(mainwin), canvas);

        g_signal_connect(mainwin, "destroy", G_CALLBACK(closethis), NULL);

        g_signal_new("paint-this",
                G_TYPE_OBJECT, G_SIGNAL_RUN_FIRST,
                0, NULL, NULL,
                g_cclosure_marshal_VOID__POINTER,
                G_TYPE_NONE, 1, G_TYPE_POINTER);

        g_signal_connect(G_OBJECT(canvas), "paint-this", G_CALLBACK(draw_gtk), NULL);
        g_signal_connect(G_OBJECT(mainwin), "key_press_event", G_CALLBACK(processKeyEvent), NULL);

        gtk_widget_show_all(mainwin);
        gtk_main();
    }

    double getDistToSphere(Vec pt, double radius) {
        return pt.length() - radius;
    }

    double getDistToBox(Vec pt, Vec halfSize) {
        Vec tmp = Vec(std::max((double) 0, std::abs(pt.x) - halfSize.x),
                std::max((double) 0, std::abs(pt.y) - halfSize.y),
                std::max((double) 0, std::abs(pt.z) - halfSize.z));
        return tmp.length();
    }

    Vec tilePrimitive(Vec pt, double tileSize) {

        double halfTileSize = tileSize / 2.0;
        return Vec(fmod(pt.x, tileSize) - halfTileSize,
                fmod(pt.y, tileSize) - halfTileSize,
                fmod(pt.z, tileSize) - halfTileSize);
    }

    Vec getSphereNormal(Vec pt) {
        return pt.normalise();
    }

    double worldGetDist(Vec pt) {

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

    Vec worldGetNormal(Vec pt) {

        double tileSize = 3.0;
        pt = tilePrimitive(pt, tileSize);
        return getSphereNormal(pt);
    }

    double worldIntersect(Vec rayStart, Vec rayDir, double maxDist, double rayStepThreshold) {

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

    void putpixel(int x, int y, int color) {
        if (x < 0 || x >= viewWidth || y < 0 || y >= viewHeight) {
            return;
        }

        pixels[y * viewWidth + x] = color;
    }

public:
    
    int pixels [viewWidth * viewHeight];
    long frame_timetocalc = 0;
    long min_timetocalc = 1000000000;
    long max_timetocalc = 0;
    int fps = 0;

    void run() {

        int numFrames = 0;
        fps = 0;
        std::chrono::high_resolution_clock::time_point lastFpsTime;
        while (active) {
            clock_t begin = clock();
            if (keyDown[GDK_w]) {
                keyDown[GDK_w] = false;
                speed = (speed < 0.3) ? speed + 0.05 : 0.35;

            }

            if (keyDown[GDK_s]) {
                keyDown[GDK_s] = false;
                speed = (speed > 0.06) ? speed - 0.05 : 0;

            }
            lastatime += speed;

            if (keyDown[GDK_a]) {
                keyDown[GDK_a] = false;
                if (rightm == 0) {
                    leftm = (leftm < 0.9) ? leftm + 0.08 : 0.91;
                } else {
                    rightm = ((rightm - 0.08) > 0) ? rightm - 0.08 : 0;
                }
            }

            if (keyDown[GDK_d]) {
                keyDown[GDK_d] = false;
                if (leftm == 0) {
                    rightm = (rightm < 0.9) ? rightm + 0.08 : 0.91;
                } else {
                    leftm = ((leftm - 0.08) > 0) ? leftm - 0.08 : 0;
                }
            }

            if (keyDown[GDK_q]) {
                keyDown[GDK_q] = false;
                zz = (zz < 0.0055) ? zz + 0.0005 : 0.006;
            }

            if (keyDown[GDK_e]) {
                keyDown[GDK_e] = false;
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

            if (active)
                g_signal_emit_by_name(canvas, "paint-this");
            numFrames++;
            std::chrono::duration<double> delta = std::chrono::duration_cast<std::chrono::duration<double>> (std::chrono::high_resolution_clock::now() - lastFpsTime);
            if (delta.count() > frameRateSmoothing) {
                fps = (int) (numFrames / delta.count());
                numFrames = 0;
                lastFpsTime = std::chrono::high_resolution_clock::now();
            }

        }
    }

    void start() {
        draw_thread = new std::thread(gtk_draw);
        run();
        draw_thread->join();

    }

};

Gg2 *newgg;

static void draw_gtk(GtkWidget *widget, GdkEventExpose *eev, gpointer data) {
    cairo_t *image;
    image = gdk_cairo_create(widget->window);
    cairo_scale(image, viewScaleX, viewScaleY);
    cairo_move_to(image, 0, 0);
    for (int i = 0; i < viewWidth; i++) {
        for (int j = 0; j < viewHeight; j++) {
            cairo_move_to(image, i, j);
            cairo_set_source_rgb(image, (newgg->pixels[j * viewWidth + i] >> 16) / (float) 255, ((newgg->pixels[j * viewWidth + i] >> 8)-((newgg->pixels[j * viewWidth + i] >> 16) << 8)) / (float) 255, ((newgg->pixels[j * viewWidth + i])-((newgg->pixels[j * viewWidth + i] >> 8) << 8)) / (float) 255);
            cairo_line_to(image, i, j + 1);
            cairo_close_path(image);
            cairo_stroke(image);

        }
    }

    cairo_select_font_face(image, "Sans", CAIRO_FONT_SLANT_NORMAL,
            CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_font_size(image, 12.0);
    cairo_move_to(image, 0, viewHeight);
    cairo_text_path(image, (string("fps:") + string(std::to_string(newgg->fps)) + string(" , timetocalc:") + string(std::to_string(newgg->frame_timetocalc)) + string(" ,  max:") + string(std::to_string(newgg->max_timetocalc)) + string(" , min:") + string(std::to_string(newgg->min_timetocalc))).c_str());
    cairo_set_source_rgb(image, 1, 0, 0);
    cairo_fill_preserve(image);

    cairo_destroy(image);



}

int main(int argc, char** argv) {
    newgg = new Gg2;
    newgg->start();
    cout << "max:" << newgg->max_timetocalc << " , min:" << newgg->min_timetocalc << std::endl;

};
