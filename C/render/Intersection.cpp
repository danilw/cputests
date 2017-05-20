#ifndef Intersection_c
#define Intersection_c

#include "Material.cpp"

class Intersection {
public: double time;
   double hit[3];
   double normal[3];
   Material material;
   Intersection(){};
};
#endif