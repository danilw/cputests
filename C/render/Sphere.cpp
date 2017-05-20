#ifndef Sphere_c
#define Sphere_c



#include <math.h>
#include "c_main_svals.h"
#include "Material.cpp"
#include "Vec.cpp"
#include "IObject.cpp"

class Sphere : public IObject {
public:
    double center[3];
    double radius = 1;
    Material material;

    Sphere(double x, double y, double z, double radius, Material material) {
        Vec::assign(center, x, y, z);
        this->radius = radius;
        this->material = material;
    }

    virtual bool intersect(
            double o[], double d[], bool primaryRay, double maxTime,
            double (*temps)[3],
            Intersection *intersection) {

        Vec::subtract(temps[0], o, center);
        double B = 2.0 * Vec::dot(d, temps[0]);
        
        double C = Vec::magnitude2(temps[0]) - radius * radius;
        
        double square = B * B - 4 * C;
        if (square >= 0) {
            double sqrt_c = sqrt(square);
            
            double t1 = 0.5 * (-B - sqrt_c);
            double t2 = 0.5 * (-B + sqrt_c);
            bool intersected = false;
            double ep = c_main_EPSILON;
            if (t1 >= ep && t1 <= maxTime) {
                intersected = true;
                intersection->time = t1;
            } else if (t2 >= c_main_EPSILON && t2 <= maxTime) {
                intersected = true;
                intersection->time = t2;
            }
            if (primaryRay && intersected) {
                Vec::ray(intersection->hit, o, d, intersection->time);
                Vec::constructUnitVector(intersection->normal, intersection->hit, center);
                intersection->material = material;
            }
            if (intersected) {
                return true;
            }
        }

        return false;
    }
};

#endif