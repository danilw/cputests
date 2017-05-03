wasm(*todo*)/js/java/C CPU tests
-


**results** (*latter*)

build options
-

gcc -lm -O2 **basic.c**

g++ -pthread -I/usr/include/gtk-2.0 -I/usr/lib64/gtk-2.0/include -I/usr/include/pango-1.0 -I/usr/include/atk-1.0 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libdrm -I/usr/include/libpng16 -lgtk-x11-2.0 -lgdk-x11-2.0 -lpangocairo-1.0 -latk-1.0 -lgdk_pixbuf-2.0 -lgio-2.0 -lpangoft2-1.0 -lfontconfig -lfreetype -lpango-1.0 -lgobject-2.0 -lglib-2.0 -lcairo -std=c++11 -O2 **terrain.cpp**

**javascript** disable firefox optimization
js45 --no-cgc --no-ggc --ion-offthread-compile=off --ion-osr=off --ion-inlining=off --ion-range-analysis=off
