wasm/js/java/C++ CPU tests
-

**what is it**- *typical game-engine logic, speed tests*

*todo* - 2d dynamic animation

### Result

**render** - 3d scene render with shadows and reflection (software(CPU) render without GPU)

tester     | timetocalc(sec) 
-------- | ----------- 
firefox |  367 (6.1 min)
js45   |   387 (6.5 min)
chrome     |   410 (6.8 min)
 java    |    28
 C++    |    21   
wasm  chrome    |   41 
wasm  firefox    |   34


**terrain** - recursion with lambda expressions in logic, and draw 2d map

tester     | timetocalc(msec) | timetodraw(msec)
-------- | ----------- | ---
firefox |   30-60      | 1000
js45   | 17-35         | --
chrome     |   200-250       | 800-900
 java  Graphics2D  |    170-220      | 2200-3000 
 C++  cairo  |    10-50      | 250-350 
wasm  chrome  sdl  |   50-60       | 1200-1500 
wasm  firefox  sdl  |  30-35       | 800-1000 


**basic**- simple memory copy, string concat, number to string

tester     | timetocalc(sec) 
-------- | ----------- 
firefox |  15
js45   | 15  
chrome     |   22
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


###Building
**read**  [build_readme.md](build_readme.md)

###Graphic
![test](test.png)
