#ifndef Material_c
#define Material_c


#include <iostream>

using namespace std;

class Material {
public:
    double ambientWeight;
    double ambientOcclusionPercent;
    double diffuseWeight;
    double specularWeight;
    double reflectionWeight;
    double shininess;
    double diffuseColor[3];
    double highlightColor[3];
    double reflectionColor[3];

    Material(
            double ambientWeight,
            double ambientOcclusionPercent,
            double diffuseWeight,
            double specularWeight,
            double reflectionWeight,
            double shininess,
            double diffuseColor[3],
            double highlightColor[3],
            double reflectionColor[3]) {
        this->ambientWeight = ambientWeight;
        this->ambientOcclusionPercent = ambientOcclusionPercent;
        this->diffuseWeight = diffuseWeight;
        this->specularWeight = specularWeight;
        this->reflectionWeight = reflectionWeight;
        this->shininess = shininess;
        std::copy(diffuseColor,diffuseColor +3, this->diffuseColor);
        std::copy(highlightColor,highlightColor +3, this->highlightColor);
        std::copy(reflectionColor, reflectionColor+3, this->reflectionColor);
    }
    
    Material(){
        
    }
};
#endif