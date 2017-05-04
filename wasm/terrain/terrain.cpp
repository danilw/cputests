//calc
#include <cstdlib>
#include <cmath>
#include <algorithm> 
#include <time.h>
#include <vector>
#include<iostream>
#include <array>

#include <SDL.h>

/*
 * 
 */
using namespace std;


double timetocalc;
double timetodraw;
int width, height;

class terrain {
private:
    void set(int, int, float);
    std::vector<float> *map;

    class generate;
public:
    float get(int, int);
    int size;
    int max;
    terrain(float);
    void f_generate(float, terrain);
    void draw(int, int);
};

class terrain::generate {
private:
    float roughness;
    void divide(int, terrain);
    float average(std::vector<float>);
    void square(int, int, int, int, terrain);
    void diamond(int, int, int, int, terrain);
public:
    generate(float, terrain);
};

terrain *c_terrain;

terrain::generate::generate(float roughness, terrain self) {
    this->roughness = roughness;
    c_terrain->set(0, 0, self.max);
    c_terrain->set(c_terrain->max, 0, self.max / 2);
    c_terrain->set(c_terrain->max, c_terrain->max, 0);
    c_terrain->set(0, c_terrain->max, self.max / 2);

    divide(c_terrain->max, self);
}

terrain::terrain(float detail) {
    size = (int) pow(2, detail) + 1;
    max = size - 1;
    map = new std::vector<float>(size * size);
}

float terrain::get(int x, int y) {
    if (x < 0 || x > max || y < 0 || y > max) {
        return -1;
    }
    return map->at(x + size * y);
}

void terrain::set(int x, int y, float val) {
    map->at(x + size * y) = val;
}

void terrain::f_generate(float roughness, terrain self) {
    new generate(roughness, self);
}

void terrain::generate::divide(int size, terrain self) {
    int x, y, half = size / 2;
    float scale = roughness * size;
    if (half < 1) {
        return;
    }

    for (y = half; y < self.max; y += size) {
        for (x = half; x < self.max; x += size) {
            square(x, y, half, (int) (((float) rand() / RAND_MAX) * scale * 2 - scale), self);
        }
    }
    for (y = 0; y <= self.max; y += half) {
        for (x = (y + half) % size; x <= self.max; x += size) {
            diamond(x, y, half, (int) (((float) rand() / RAND_MAX) * scale * 2 - scale), self);
        }
    }
    divide(size / 2, self);
}

float terrain::generate::average(std::vector<float> values) {

    values.erase(std::remove_if(values.begin(), values.end(), [](int n) {
        return n == -1; }), values.end());
    float total = 0;
    std::for_each(values.rbegin(), values.rend(), [&](int n) {
        total += n; });

    return total / values.size();
}

void terrain::generate::square(int x, int y, int size, int offset, terrain self) {
    float ave = average(std::vector<float>{
        self.get(x - size, y - size),
        self.get(x + size, y - size),
        self.get(x + size, y + size),
        self.get(x - size, y + size)
    });
    self.set(x, y, ave + offset);
}

void terrain::generate::diamond(int x, int y, int size, int offset, terrain self) {
    float ave = average(std::vector<float>{
        self.get(x, y - size),
        self.get(x + size, y),
        self.get(x, y + size),
        self.get(x - size, y)
    });
    self.set(x, y, ave + offset);
}

class sdldraw {
private:

    static std::array<float, 2>project(int flatX, int flatY, float flatZ) {
        std::array<float, 2> point = iso(flatX, flatY);
        float x0 = (float) (width * 0.5);
        float y0 = (float) (height * 0.2);
        float z = (float) (c_terrain->size * 0.5 - flatZ + point[1] * 0.75);
        float x = (float) ((point[0] - c_terrain->size * 0.5) * 6);
        float y = (float) ((c_terrain->size - point[1]) * 0.005 + 1);

        return{
            x0 + x / y,
            y0 + z / y};
    }

    static std::array<float, 2> iso(int x, int y) {
        return {
            (float) (0.5 * (c_terrain->size + x - y)),
            (float) (0.5 * (x + y))};

    }

    static std::array<float, 4> brightness(int x, int y, float slope) {

        if (y == c_terrain->max || x == c_terrain->max) {
            return {0, 0, 0, 0.5};
        }
        int b = ~ ~((int) (slope * 50)) + 128;
        b = b > 255 ? 255 : b;
        b = b < 0 ? 0 : b;
        return {(float) b / 255, (float) b / 255, (float) b / 255, (float) 255 / 255};

    }

    void rect(std::array<float, 2> a, std::array<float, 2> b, std::array<float, 4> style) {
        if (b.at(1) < a.at(1)) {
            return;
        }
        SDL_Rect offset;
        offset.x = (int) a.at(0);
        offset.y = (int) a.at(1);
        offset.w = (int) b.at(0) - (int) a.at(0);
        offset.h = (int) b.at(1) - (int) a.at(1);
        SDL_FillRect(screen, &offset, SDL_MapRGBA(screen->format, style.at(0)*255, style.at(1)*255, style.at(2)*255, style.at(3)*255));

    }

    SDL_Surface *screen = NULL;
public:

    sdldraw(int w, int h) {
        width = w;
        height = h;

        SDL_Init(SDL_INIT_EVERYTHING);
        screen = SDL_SetVideoMode(width, height, 32, SDL_SWSURFACE);
        SDL_WM_SetCaption("terrain", NULL);

        draw_sdl();

    }

    void draw_sdl() {

        clock_t begin = clock();

        float waterVal = (float) (c_terrain->size * 0.3);
        for (int y = 0; y < c_terrain->size; y++) {
            for (int x = 0; x < c_terrain->size; x++) {
                float val = c_terrain->get(x, y);
                std::array<float, 2> top = project(x, y, val);
                std::array<float, 2> bottom = project(x + 1, y, 0);
                std::array<float, 2> water = project(x, y, waterVal);
                std::array<float, 4> style = brightness(x, y, c_terrain->get(x + 1, y) - val);
                rect(top, bottom, style);
                std::array<float, 4> tmp = {(float) 50 / 255, (float) 150 / 255, (float) 200 / 255, (float) 15 / 255};
                rect(water, bottom, tmp);
            }
        }

        clock_t end = clock();
        timetodraw = ((double) (end - begin) / CLOCKS_PER_SEC)*1000;
        cout << "timetodraw(msec): " << timetodraw << "\n";

        //SDL_Delay( 2000 );
        SDL_Quit();

    }

};

void terrain::draw(int width, int height) {

    sdldraw tmp(width, height);
}

int main(int argc, char** argv) {
    srand(time(NULL));
    width = 1900;
    height = 1000;
    clock_t begin = clock();
    terrain tmp(9);
    c_terrain = &tmp;
    c_terrain->f_generate((float) 0.7, tmp);
    clock_t end = clock();
    timetocalc = ((double) (end - begin) / CLOCKS_PER_SEC)*1000;
    cout << "timetocalc(msec): " << timetocalc << "\n";
    c_terrain->draw(width, height);


    return 0;
}

