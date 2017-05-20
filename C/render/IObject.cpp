#ifndef IObject_c
#define IObject_c

#include "Intersection.cpp"

class IObject {
public:
    virtual bool intersect(
            double o[], double d[], bool primaryRay, double maxTime,
            double (*temps)[3],
            Intersection *intersection)=0;
};

#endif