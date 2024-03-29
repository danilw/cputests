wasm/js/java/C++ CPU tests
-

**what is it**- *Comparison of calculation speed and drawing speed*

# This is just some random code I made to see how it works(in 2018) while was learning WASM and WebGL/OpenGL, this has no real use and display nothing. 

### Check my new projects on [https://github.com/danilw](https://github.com/danilw)

*todo* - this is done, new projects next

### Live test

name     | wasm | javascript
-------- | ----------- | ---
basic |   [wasm_basic](https://danilw.github.io/cputests/wasm/basic/basic.html)      | [js_basic](https://danilw.github.io/cputests/js/basic.html)
terrain   | [wasm_terrain](https://danilw.github.io/cputests/wasm/terrain/terrain.html)        | [js_terrain](https://danilw.github.io/cputests/js/terrain.html)
render     | [wasm_render](https://danilw.github.io/cputests/wasm/render/html/render.html)      |  [js_render](https://danilw.github.io/cputests/js/render/render.html)    
 render_mini  |     [wasm_render_mini](https://danilw.github.io/cputests/wasm/render_mini/render_mini.html)      |  [js_render_mini](https://danilw.github.io/cputests/js/render_mini.html)
  opengl_basic  |     [wasm_opengl_basic](https://danilw.github.io/cputests/wasm/opengl_basic/opengl_basic.html)      |  [js_opengl_basic](https://danilw.github.io/cputests/js/opengl_basic.html), [vertex shader port](https://www.vertexshaderart.com/art/8AQFD78CWiZsN4phd)
sgame(normal) |  [wasm_sgame n](https://danilw.github.io/cputests/wasm/sgame/normal/sgame.html)   | [js_sgame n](https://danilw.github.io/cputests/js/sgame/normal/sgame.html)
sgame(best) |  [wasm_sgame b](https://danilw.github.io/cputests/wasm/sgame/best/sgame.html)  | [js_sgame b_wfix](https://danilw.github.io/cputests/js/sgame/best_wfix/sgame.html), [same but without twgl library](https://danilw.github.io/GLSL-howto/sgame_ntwgl/sgame.html)

### Result

**sgame(GPU+CPU)** - very simple game using GLSL without textures, control: **F** fullscreen, **W A S D** - move, mouse scroll or **1/2** - zoom in/out, **SPACE** to jump from planets, **R** reset zoom, **P** pause, **Left/Right mouse** shoot.  Normal version has max 3 noise loops, Best 5 noise loops (also in best max enemy 50 with max bullets 50, normal valus is 25).

*Work very well in wasm, native C++ program has better "image quality"(because GL_ES in browsers).*

*sgame(best) has **bug in Windows**(noise bugged somehow), try this fixed [wasm_sgame win fix](https://danilw.github.io/cputests/wasm/sgame/best_wfix/sgame.html)*

tester     | result
-------- | ----------- 
firefox |  the slowest
chrome     |   the slowest
 java    |    2x slower then wasm
 C++    |    the fastest
wasm  chrome    |   fast, but GL_ES (with bug on windows)
wasm  firefox    |   fast, but GL_ES (with bug on windows)

*Note 1* original glsl file are here glsl/myfs.glsl

*Note 2* I think my "array logic" in *sgame* project bugged, becuase java and javascript "deque" lists shift all "object coordinates" by half of their radius(look in js or java code variable *fixx*(also added few more +/- half of radius in code)) :)

**opengl_basic(GPU+CPU)** - animated OpenGL scene (1.3kk points change position each frame(final scene (P and D chars) use 2.4kk points), without GLSL. **note** windows(OS) webbrowsers with wasm do not have OpenGL support, wasm was tested only on linux(it work)

tester     | fps (final scene fps first)
-------- | ----------- 
firefox |  4-15
chrome     |   10-30
 java    |    25-50
 C++    |    35-80   
wasm  chrome    |   10-18 
wasm  firefox    |   10-14


**render_mini(CPU)** - animated(live move camera) 3d scene render (software(CPU) render without GPU))

Camera control (in all versions same):1 or 2 change scene, Q or E rotate camera, W or S scroll speed, A or D tilt camera

Edit (source code) *viewWidth* and *viewHeight* to change render resolution (current for test 300x200) also *viewScaleX/Y* to set image Scale, *disable_ani* to True will disable animations.

tester     | timetocalc(msec) 
-------- | ----------- 
firefox |  120-150 (fps 6)
js45   |  100-120 
chrome     |  100-135 (fps 10)
 java    |    90-210 (fps 8)
 C++    |    80-120 (fps 8)
wasm  chrome    |   120-150 (fps 6)
wasm  firefox    |   150-200 (fps 4)


**render(CPU)** - 3d scene render with shadows and reflection (software(CPU) render without GPU))

tester     | timetocalc(sec) 
-------- | ----------- 
firefox |  367 (6.1 min)
js45   |   387 (6.5 min)
chrome     |   410 (6.8 min)
 java    |    28
 C++    |    21   
wasm  chrome    |   41 
wasm  firefox    |   34


**terrain(CPU)** - recursion with lambda expressions in logic, and draw 2d map

tester     | timetocalc(msec) | timetodraw(msec)
-------- | ----------- | ---
firefox |   30-60      | 1000
js45   | 17-35         | --
chrome     |   200-250       | 800-900
 java  Graphics2D  |    170-220      | 2200-3000 
 C++  cairo  |    10-50      | 250-350 
wasm  chrome  sdl  |   50-60       | 1200-1500 
wasm  firefox  sdl  |  30-35       | 800-1000 


**basic(CPU)**- simple memory copy, string concat, number to string

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


### Building
**read**  [build_readme.md](build_readme.md)

### Graphic
[![sgame](sgame.png)](https://youtu.be/lVCIEaFEMO4)
[![opengl_basic](testoglyt.png)](http://www.youtube.com/watch?v=405yudjksDA)
![testmini](testmini.jpg)
![test](test.png)
