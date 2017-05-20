

#include "Main_c.cpp"

const Material Materials::RED_PLASTIC = createPlastic(new double[3] {
    1, 0, 0
});
const Material Materials::YELLOW_PLASTIC = createPlastic(new double[3] {
    1, 1, 0
});

const Material Materials::BLUE_MATTE = createMatte(new double[3] {
    0, 0, 1
});
const Material Materials::GREEN_MATTE = createMatte(new double[3] {
    0, 1, 0
});
const Material Materials::YELLOW_MATTE = createMatte(new double[3] {
    1, 1, 0
});
const Material Materials::WHITE_MATTE = createMatte(new double[3] {
    1, 1, 1
});

const Material Materials::YELLOW_METAL = createMetal(new double[3] {
    1, 1, 0
});
const Material Materials::PURPLE_METAL = createMetal(new double[3] {
    1, 0, 1
});
const Material Materials::BLUE_METAL = createMetal(new double[3] {
    0, 0, 1
});
const Material Materials::CYAN_METAL = createMetal(new double[3] {
    0, 1, 1
});
const Material Materials::RED_METAL = createMetal(new double[3] {
    1, 0, 0
});

const Material Materials::MIRROR = createPolishedMetal(new double[3] {
    1, 1, 1
});

const double Vec::TINY = 1e-9;

bool painted = false;
static Main *c_main;

void launch() {

    SDL_Init(SDL_INIT_EVERYTHING);
        c_main->screen = SDL_SetVideoMode(c_main->WIDTH, c_main->HEIGHT, 32, SDL_SWSURFACE);
        SDL_WM_SetCaption("wasm_render", NULL);
        c_main->render();
        SDL_Quit();
}

int main(int argc, char** argv) {

    srand(time(NULL));
    c_main = new Main();
    launch();
    return 0;
}
