#ifndef Ground_c
#define Ground_c

#include <math.h>
#include "c_main_svals.h"
#include "Vec.cpp"
#include "IObject.cpp"
#include "Material.cpp"
#include "Intersection.cpp"

class Ground : public IObject {
public:
    double squareSize;
    double inverseSquareSize;
    Material material1;
    Material material2;

    Ground(double squareSide, const Material material1, const Material material2) {
        this->squareSize = squareSide;
        this->material1 = material1;
        this->material2 = material2;
        inverseSquareSize = 1.0 / squareSize;
    }

    virtual bool intersect(double o[], double d[], bool primaryRay,
            double maxTime, double (*temps)[3],
            Intersection *intersection) {

        if (d[1] == 0) {
            return false;
        }

        intersection->time = -o[1] / d[1];

        if (intersection->time >= c_main_EPSILON && intersection->time <= maxTime) {

            if (!primaryRay) {
                return true;
            }

            Vec::assign(intersection->hit, o[0] + d[0] * intersection->time, 0,
                    o[2] + d[2] * intersection->time);
            Vec::assign(intersection->normal, 0, 1, 0);

            long a = ((long) floor(intersection->hit[0] * inverseSquareSize)) & 1;
            long b = ((long) floor(intersection->hit[2] * inverseSquareSize)) & 1;
            intersection->material = (((a + b) & 1) == 0) ? material1 : material2;

            return true;
        }

        return false;
    }
};

#endif