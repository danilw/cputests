

#ifndef RandomDoubles_c
#define RandomDoubles_c

#include <cstdlib>


class RandomDoubles {
public:

    
    
    
    RandomDoubles() {
        if (this->values == NULL) {
            
            values = new double[lgth];
            for (int i = lgth - 1; i >= 0; i--) {
                values[i] = ((float) rand() / RAND_MAX);
            }
        }
        index = (int) (((float) rand() / RAND_MAX) * lgth);
    }

    double random() {
        
        if (index >= lgth) {
            index = 0;
        }
        return values[index++];
    }


private:
    double *values=NULL;
    int lgth=70001;

    int index;
};


#endif