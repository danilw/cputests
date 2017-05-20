#ifndef Main_c
#define Main_c

#include <math.h>
#include <iostream>


#include "Vec.cpp"
#include "IObject.cpp"

#include "Intersection.cpp"
#include "Material.cpp"
#include "Materials.cpp"
#include "RandomDoubles.cpp"
#include "RandomRays.cpp"
#include "Sphere.cpp"
#include "Ground.cpp"


#include <gtk/gtk.h>
#include <cairo.h>
#include <cairo-pdf.h>
#include <cairo-ps.h>
#include <cairo-svg.h>
#include <gdk/gdkkeysyms.h>

#include <chrono>
#include <thread>

using namespace std;

/*
 * 
 */



class Main {
public:

    const int SQRT_SAMPLES = 16;

    const int IMAGE_SCALE = 3;
    const int WIDTH = 1920 / IMAGE_SCALE;
    const int HEIGHT = 1080 / IMAGE_SCALE;
    const double VIRTUAL_SCREEN_WIDTH = 100;

    double EYE[3] = {0, 40, 250};
    const double LOOK[3] = {0, 40, 0};
    const double LIGHT[3] = {500, 500, 500};
    const double LIGHT_COLOR[3] = {1, 1, 1};
    const double LIGHT_RADIUS = 50.0;
    const double AMBIENT_COLOR[3] = {1, 1, 1};
    const double DISTANCE_TO_VIRTUAL_SCREEN = VIRTUAL_SCREEN_WIDTH;

    const bool RENDER_IN_WINDOW = true;

    const double GAMMA = 2.2;

    const int SAMPLES = SQRT_SAMPLES * SQRT_SAMPLES;
    const double INVERSE_SQRT_SAMPLES = 1.0 / SQRT_SAMPLES;
    const double INVERSE_SAMPLES = 1.0 / SAMPLES;
    const double INVERSE_GAMMA = 1.0 / GAMMA;
    const double HALF_WIDTH = WIDTH / 2.0;
    const double HALF_HEIGHT = HEIGHT / 2.0;
    const double VIRTUAL_SCREEN_RATIO
            = VIRTUAL_SCREEN_WIDTH / WIDTH;

    const bool AMBIENT_OCCLUSION = true;
    const double MAX_OCCLUSION_DISTANCE = 100.0;
    const double RADIANCE_SCALE = 1.0;
    const double EPSILON = 1E-6;
    const int MAX_DEPTH = 10;
    const double MIN_COLOR_INTENSITY = 1.0 / 256.0;

    const long SECOND_MILLIS = 1000L;
    const long MINUTE_MILLIS = 60 * SECOND_MILLIS;
    const long HOUR_MILLIS = 60 * MINUTE_MILLIS;

    int rowIndex = 0;


    static const int scene_l = 5;
    IObject *scene[scene_l] = {
        new Ground(25, Materials::YELLOW_MATTE, Materials::GREEN_MATTE),
        new Sphere(0, 0, 0, 1E6, Materials::BLUE_MATTE),
        new Sphere(0, 40, 0, 40, Materials::MIRROR),
        new Sphere(-80, 40, 0, 40, Materials::RED_METAL),
        new Sphere(80, 40, 0, 40, Materials::YELLOW_METAL),
    };


    cairo_t *image;

    Main() {
    }

    void render() {

        clock_t begin = clock();
        double u[3];
        double v[3];
        double w[3];
        double c[3];
        double p[3];
        double d[3];
        double l[3];
        double l2[3];
        double light[3];
        double r[3];
        double ar[3];
        double f[3];
        double o[3];
        double temps[16][3];
        Intersection intersection;
        Intersection bestIntersection;

        Vec::constructUnitVector(w, EYE, LOOK);
        Vec::ray(c, EYE, w, -DISTANCE_TO_VIRTUAL_SCREEN);
        Vec::onb(u, v, w);

        RandomRays randomRays;
        RandomDoubles randomDoubles;
        int pixels[WIDTH];
        double pixel[3];

        while (true) {

            int y = getNextRowIndex();
            if (y >= HEIGHT) {
                clock_t end = clock();
                double timetocalc = ((double) (end - begin) / CLOCKS_PER_SEC)*1000;
                cout << "timetocalc(msec): " << timetocalc << "\n";
                return;

            }
            for (int x = 0; x < WIDTH; x++) {


                Vec::assign(pixel, 0, 0, 0);


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

                        Vec::map(p, c, u, v, a, b);
                        Vec::constructUnitVector(d, p, EYE);




                        Vec::assign(o, EYE);
                        Vec::assign(f, RADIANCE_SCALE, RADIANCE_SCALE, RADIANCE_SCALE);

                        bool reflectionLoop = true;


                        for (int m = 0; (m < MAX_DEPTH)&&(reflectionLoop); m++) {


                            bool hit = false;
                            bestIntersection.time = std::numeric_limits<double>::infinity();
                            for (int k = scene_l - 1; k >= 0; k--) {
                                IObject *object = scene[k];
                                if (object->intersect(o, d, true, std::numeric_limits<double>::infinity(),
                                        temps, &intersection)) {
                                    if (intersection.time < bestIntersection.time) {
                                        hit = true;

                                        bestIntersection.time = intersection.time;
                                        Vec::assign(bestIntersection.normal, intersection.normal);
                                        Vec::assign(bestIntersection.hit, intersection.hit);
                                        bestIntersection.material = intersection.material;
                                    }
                                }
                            }

                            if (hit) {

                                if (Vec::dot(bestIntersection.normal, d) >= 0) {
                                    Vec::negate(bestIntersection.normal);
                                }

                                if (bestIntersection.material.ambientWeight > 0) {
                                    double ambientPercent = 1.0;

                                    if (AMBIENT_OCCLUSION
                                            && bestIntersection.material.ambientOcclusionPercent > 0) {

                                        randomRays.randomRay(ar);
                                        if (Vec::dot(ar, bestIntersection.normal) < 0) {
                                            Vec::negate(ar);
                                        }

                                        for (int k = scene_l - 1; k >= 0; k--) {
                                            IObject *object = scene[k];
                                            if (object->intersect(bestIntersection.hit, ar, false,
                                                    MAX_OCCLUSION_DISTANCE, temps, &intersection)) {
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

                                Vec::assign(light, LIGHT);

                                if (LIGHT_RADIUS > 0) {
                                    Vec::subtract(l2, bestIntersection.hit, light);

                                    randomRays.randomRay(l);
                                    if (Vec::dot(l, l2) < 0) {
                                        Vec::negate(l);
                                    }
                                    Vec::ray(light, LIGHT, l, LIGHT_RADIUS);
                                }

                                Vec::constructUnitVector(l, light, bestIntersection.hit);

                                double nDotl = Vec::dot(l, bestIntersection.normal);
                                if (nDotl > 0) {

                                    double maxTime = Vec::distance(bestIntersection.hit, light);

                                    bool illuminated = true;
                                    for (int k = scene_l - 1; k >= 0; k--) {
                                        IObject *object = scene[k];
                                        if (object->intersect(bestIntersection.hit, l, false,
                                                maxTime, temps, &intersection)) {
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

                                            Vec::scale(r, bestIntersection.normal, 2.0 * nDotl);
                                            Vec::subtract(r, l);
                                            double rDotMd = Vec::dotNegative(r, d);
                                            if (rDotMd > 0) {
                                                for (int k = 0; k < 3; k++) {
                                                    pixel[k] += bestIntersection.material.specularWeight
                                                            * pow(rDotMd,
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
                                    bool aboveMinColorIntensity = false;
                                    for (int k = 0; k < 3; k++) {



                                        f[k] *= bestIntersection.material.reflectionWeight
                                                * bestIntersection.material.reflectionColor[k];
                                        if (f[k] >= MIN_COLOR_INTENSITY) {
                                            aboveMinColorIntensity = true;
                                        }
                                    }
                                    if (!aboveMinColorIntensity) {
                                        reflectionLoop = false;
                                        break;
                                    }

                                    Vec::ray(d, bestIntersection.normal,
                                            -2 * Vec::dot(bestIntersection.normal, d));
                                    Vec::assign(o, bestIntersection.hit);
                                } else {
                                    reflectionLoop = false;
                                    break;
                                }

                            } else {
                                reflectionLoop = false;
                                break;
                            }
                        }
                    }
                }

                int value = 0;
                for (int i = 0; i < 3; i++) {
                    int intensity = (int) round(255 * pow(pixel[i] * INVERSE_SAMPLES, INVERSE_GAMMA));

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

    int getNextRowIndex() {
        return rowIndex++;
    }

    void rowCompleted(int rowIndex, int pixels[]) {

        cairo_move_to(image, 0, rowIndex);
        for (int i = 0; i < WIDTH; i++) {
            cairo_move_to(image, i, rowIndex);

            cairo_set_source_rgb(image, (pixels[i] >> 16) / (float) 255, ((pixels[i] >> 8)-((pixels[i] >> 16) << 8)) / (float) 255, ((pixels[i])-((pixels[i] >> 8) << 8)) / (float) 255);

            cairo_line_to(image, i + 1, rowIndex);
            cairo_close_path(image);
            cairo_stroke(image);
        }
    }
};

#endif