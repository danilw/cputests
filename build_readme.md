html/web
--------------------

open *.html file in webbrowser(or upload to you webserver) it will work, no extra actions needed

native gcc compiler
--------------------

**basic**
```
gcc -lm -O2 basic.c -o basic
```
**terrain**
```
g++ -pthread -I/usr/include/gtk-2.0 -I/usr/lib64/gtk-2.0/include -I/usr/include/pango-1.0 -I/usr/include/atk-1.0 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libdrm -I/usr/include/libpng16 -lgtk-x11-2.0 -lgdk-x11-2.0 -lpangocairo-1.0 -latk-1.0 -lgdk_pixbuf-2.0 -lgio-2.0 -lpangoft2-1.0 -lfontconfig -lfreetype -lpango-1.0 -lgobject-2.0 -lglib-2.0 -lcairo -std=c++11 -O2 terrain.cpp -o terrain
```
**render**
```
g++ Ground.cpp Intersection.cpp IObject.cpp main.cpp Main_c.cpp Material.cpp Materials.cpp RandomDoubles.cpp RandomRays.cpp Sphere.cpp Vec.cpp -pthread -I/usr/include/gtk-2.0 -I/usr/lib64/gtk-2.0/include -I/usr/include/pango-1.0 -I/usr/include/atk-1.0 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libdrm -I/usr/include/libpng16 -lgtk-x11-2.0 -lgdk-x11-2.0 -lpangocairo-1.0 -latk-1.0 -lgdk_pixbuf-2.0 -lgio-2.0 -lpangoft2-1.0 -lpango-1.0 -lgobject-2.0 -lfontconfig -lfreetype -lgthread-2.0 -pthread -lglib-2.0 -lcairo -std=c++11 -O3 -o render
```
**render_mini**
```
g++ -pthread -I/usr/include/X11 -I/usr/include/gtk-2.0 -I/usr/lib64/gtk-2.0/include -I/usr/include/pango-1.0 -I/usr/include/atk-1.0 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libdrm -I/usr/include/libpng16 -lgtk-x11-2.0 -lgdk-x11-2.0 -lpangocairo-1.0 -latk-1.0 -lgdk_pixbuf-2.0 -lgio-2.0 -lpangoft2-1.0 -lfontconfig -lfreetype -lpango-1.0 -lgobject-2.0 -lglib-2.0 -lcairo -lX11 -std=c++11 -O3 render_mini.cpp -o render_mini
```

**opengl_basic**
```
g++ -lGL -lGLU -lglut -std=c++11 opengl_basic.cpp -O3 -o opengl_basic
```

**sgame**

original GLSL code are GLSL/myfs.glsl file 
```
g++ -O3 -lglut -lGLEW -lGL -lm -lGLU -Wall -Wextra -pthread main.cpp
```

GLSL code can use "prerender" noise texture, uncomment all "loading" texture functions in main.cpp file and texture code in myfs.glsl file and use glsl/noise.png file (when I test, texture give me +5% better performance)

WebAssembly Emscripten compiler
--------------------

use source files from **wasm/*** folder

**basic**
```
emcc -lm -O2 basic.c -s WASM=1 -o basic.html
```
**terrain**
```
em++ -std=c++11 -O2 terrain.cpp -s WASM=1 -o terrain.html
```
**render**

copy two files **wasm/render/main.cpp** and **wasm/render/Main_c.cpp** to **C/render/**

move to **C/render/** and build
```
em++ Ground.cpp Intersection.cpp IObject.cpp main.cpp Main_c.cpp Material.cpp Materials.cpp RandomDoubles.cpp RandomRays.cpp Sphere.cpp Vec.cpp -std=c++11 -O3 -s WASM=1 -o render.html
```

**render_mini**
```
em++ -std=c++11 -O3 render_mini.cpp -s WASM=1 -o render_mini.html
```

**opengl_basic**
```
em++ opengl_basic.cpp -std=c++11 -O3 -s LEGACY_GL_EMULATION=1 -s WASM=1 -o opengl_basic.html
```

**sgame**
```
em++ -std=c++11 -O3 main_wasm.cpp -s USE_WEBGL2=1 -s FULL_ES3=1 -s WASM=1 -o sgame.html --preload-file ./fs
```

js45 
--------------------

**basic**

uncomment line 18 in *basic.js*

js45 basic.js

**terrain**

uncomment line 86 in  *terrain.js*

js45 terrain.js


**render**

edit **render/Main.js** file, comment(/* */) line from 268 to 271 (full "rowCompleted" function logic)

create "render_no_draw.js"

write:
```
load("Ground.js")
load("Intersection.js")
load("js_base.js")
load("Material.js")
load("Materials.js")
load("RandomDoubles.js")
load("RandomRays.js")
load("Sphere.js")
load("Vec.js")
load("Main.js")

js_main= new Main();
var timetocalc = new Date().getTime();
js_main.launch();
timetocalc = new Date().getTime() - timetocalc;
console.log("timetocalc(msec): " + timetocalc);
```
save "render_no_draw.js" and launch

js45 render_no_draw.js


**render_mini**

uncomment line 170 and 343 in *render_mini.js* 

js45 render_mini.js

