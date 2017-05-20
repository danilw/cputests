#ifndef Materials_c
#define Materials_c

#include "Material.cpp"

class Materials {
public:
    static const Material RED_PLASTIC;
    static const Material YELLOW_PLASTIC;

    static const Material BLUE_MATTE;
    static const Material GREEN_MATTE;
    static const Material YELLOW_MATTE;
    static const Material WHITE_MATTE;

    static const Material YELLOW_METAL;
    static const Material PURPLE_METAL;
    static const Material BLUE_METAL;
    static const Material CYAN_METAL;
    static const Material RED_METAL;

    static const Material MIRROR;

    static Material createMetal(double *color) {
        return Material(
                0.1,
                1.0,
                0.7,
                1.0,
                1.0,
                20.0,
                color,
                color,
                color
                );
    }

    static Material createPolishedMetal(double *color) {
        return Material(
                0.0,
                0.0,
                0.0,
                1.0,
                1.0,
                20.0,
                color,
                color,
                color
                );
    }

    static Material createPlastic(double *color) {
        return Material(
                0.1,
                1.0,
                1.0,
                1.0,
                0.0,
                10.0,
                color,
                new double[3] {
                    1, 1, 1 },
        new double[3] {
            0, 0, 0 }
        );
    }

    static Material createMatte(double *color) {
        return Material(
                0.1,
                1.0,
                1.0,
                0.0,
                0.0,
                0.0,
                color,
                new double[3] {
                    0, 0, 0 },
        new double[3] {
            0, 0, 0 }
        );
    }

    Materials() {
    }
};







#endif