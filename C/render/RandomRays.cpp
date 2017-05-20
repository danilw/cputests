

#ifndef RandomRays_c
#define RandomRays_c

#include <cstdlib>
#include "Vec.cpp"
#include <iostream>

using namespace std;
class RandomRays {
public:

    RandomRays() {
        if (rays == NULL) {
            rays = new double*[lght];
            for (int i = lght - 1; i >= 0; i--) {
                rays[i]= new double[3];
                do {
                    for (int j = 0; j < 3; j++) {
                        rays[i][j] = 2.0 *((float) rand() / RAND_MAX) -1.0;
                    }
                } while (Vec::magnitude2(rays[i]) > 1.0);
                Vec::normalize(rays[i]);
            }
        }
        index = (int) (((float) rand() / RAND_MAX) * lght);
    }

    void randomRay(double *ray) {
        if (index >= lght) {
            index = 0;
        }
        Vec::assign(ray, rays[index++]);
    }


private:
    double **rays=NULL;
    int lght = 24001;

    int index;

};

#endif