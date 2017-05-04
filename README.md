wasm/js/java/C CPU tests
-

**what is it**- *typical game-engine logic, speed tests*

### Result

**terrain** - recursion with lambda expressions in logic, and draw 2d map

tester     | timetocalc(msec) | timetodraw(msec)
-------- | ----------- | ---
firefox |   30-60      | 1000
js45   | 17-35         | --
Chrome     |   200-250       | 800-900
 java    |    170-220      | 2200-3000
 C++    |    10-50      | 250-350
wasm  chrome    |   50-60       | 1200-1500
wasm  firefox    |  30-35       | 800-1000


**basic**- simple memory copy, string concat, number to string

tester     | timetocalc(sec) 
-------- | ----------- 
firefox |  15
js45   | 17-35   
Chrome     |   22
 java    |    20
 C    |    11   
wasm  chrome    |   44 
wasm  firefox    |   55

soft version: 
openjdk version "9-internal", 
Chrome 58.0, 
Firefox 52.1, 
gcc-5, 
Emscripten 1.37.9


build options
-

gcc -lm -O2 **basic.c**

g++ -pthread -I/usr/include/gtk-2.0 -I/usr/lib64/gtk-2.0/include -I/usr/include/pango-1.0 -I/usr/include/atk-1.0 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libdrm -I/usr/include/libpng16 -lgtk-x11-2.0 -lgdk-x11-2.0 -lpangocairo-1.0 -latk-1.0 -lgdk_pixbuf-2.0 -lgio-2.0 -lpangoft2-1.0 -lfontconfig -lfreetype -lpango-1.0 -lgobject-2.0 -lglib-2.0 -lcairo -std=c++11 -O2 **terrain.cpp**

**javascript**  to disable firefox optimization and slow js45 to Chrome/v8 speed (10x slow) (then timetocalc will be same like Chrome/v8)

js45 --no-cgc --no-ggc --ion-offthread-compile=off --ion-osr=off --ion-inlining=off --ion-range-analysis=off


**Emscripten** -O1/2/3 they do nothing
