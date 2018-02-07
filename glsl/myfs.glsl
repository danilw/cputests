// License Creative Commons Attribution-NonCommercial-ShareAlike

// opensource
// please dont use it for sell on google/apple store thanks

//#version 130 //texture


#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform vec3 iResolution;

float iTime = time;


const int maxbullets = 50; //50
const int maxen = 50; //50

uniform float tax;
uniform float angle; //ship rotation angle
uniform float radius; //ship radius
uniform vec2 shippos; //ship coordinates
uniform bool shua; //shield hit
uniform float animlamp; //sin parameter for laser anim
uniform float animlcounter;
uniform float lpower; //laser power 20 low to 1 max
uniform float zoom; //zoom of game board
uniform float bulletposx[maxbullets]; //bullets
uniform float bulletposy[maxbullets]; //bullets
uniform float bullettimer[maxbullets]; //bullets
uniform bool bulletexpl[maxbullets]; //bullets
uniform float bulletexplctrl[maxbullets]; //bullets
uniform int bulletcounter; //bullets
uniform float bulletanimtimer; //0 to 1.4, 0.7 mid
uniform bool paused; //animation
uniform bool wwh;
uniform bool en3hit;


uniform float en1posx[maxen]; //enemy pos
uniform float en1posy[maxen]; //enemy pos
uniform float en2posx[maxen]; //enemy pos
uniform float en2posy[maxen]; //enemy pos
uniform float en1timer[maxen];
uniform float en2timer[maxen];
uniform float en2extimer[maxen];
uniform int en1counter;
uniform int en2counter;


uniform float en1lval[maxen];
uniform float en1exval[maxen];
uniform bool en1llisex[maxen];
uniform bool en2llishit[maxen];

uniform vec2 planetpos1; //planets
uniform vec2 planetpos2; //planets
uniform vec2 planetpos3; //planets
uniform vec2 planetpos4; //planets
uniform vec2 planetpos5; //planets
uniform vec2 planetpos6; //planets
uniform vec2 nebulapos; //nebula
uniform vec2 en3pos; //enemy
uniform vec2 lhitpos; //laser

uniform vec2 starpos1; //planets
uniform vec2 starpos2; //planets

uniform bool best;
uniform bool fast; //texture/non

uniform sampler2D iChannel0; // only noise texture


#define SS(x, y, z) smoothstep(x, y, z)
#define S(v)       SS(0., 4./R.y, v)
#define C(U,P,r)   S ( r - length(U-(P)) )
#define M(t, d) mat2(cos(t * d), sin(t * d), -sin(t * d), cos(t * d))
#define MD(a) mat2(cos(a), -sin(a), sin(a), cos(a))
#define PI (4.0 * atan(1.0))
#define TAU (2.*PI)
#define e exp(1.)
#define sigmoid(x) 0.1/(1. + exp2(-x/4.)) + .9
#define sqr(a) a*a
//#define box2(p, b) length(max(abs(p)-b,0.0))
#define box2(p, b) length(max((-p)-b,length(p*.5)))
#define box(p, b) step(.001,length(max(abs(p)-b,0.0)))
#define hash2(p) fract(sin(vec2(dot(p, vec2(127.1, 311.7)), dot(p, vec2(269.5, 183.3))))*43758.5453)

float hash(float n) {
    return fract(sin(n)*758.5453);
}

float hash(vec2 x) {
    return fract(cos(dot(x.xy, vec2(2.31, 53.21))*124.123)*412.0);
}

vec3 voronoi(in vec2 x) {
    vec2 n = floor(x);
    vec2 f = fract(x);

    //----------------------------------
    // first pass: regular voronoi
    //----------------------------------
    vec2 mg, mr;

    float md = 8.0;
    for (int j = -1; j <= 1; j++)
        for (int i = -1; i <= 1; i++) {
            vec2 g = vec2(float(i), float(j));
            vec2 o = hash2(n + g);
            o = 0.5 + 0.5 * sin(iTime + 6.2831 * o);
            vec2 r = g + o - f;
            float d = dot(r, r);

            if (d < md) {
                md = d;
                mr = r;
                mg = g;
            }
        }

    //----------------------------------
    // second pass: distance to borders
    //----------------------------------

    md = 8.0;
    for (int j = -2; j <= 2; j++)
        for (int i = -2; i <= 2; i++) {
            vec2 g = mg + vec2(float(i), float(j));
            vec2 o = hash2(n + g);
            o = 0.5 + 0.5 * sin(iTime + 6.2831 * o);
            vec2 r = g + o - f;

            if (dot(mr - r, mr - r) > 0.00001)
                md = min(md, dot(0.5 * (mr + r), normalize(r - mr)));
        }


    return vec3(md, mr / 20.);
}

float random(vec2 ab) {
    float f = (cos(dot(ab, vec2(21.9898, 78.233))) * 43758.5453);
    return fract(f);
}


//texture

/*
float noisetxt(in vec2 xy) {
return texture(iChannel0,xy/(64.*15.)).x;//64*15px size
}
 */

float noise(in vec2 xy) {
    //if(fast)return noisetxt(xy); //texture save about 5% of GPU time
    vec2 ij = floor(xy);
    vec2 uv = xy - ij;
    uv = uv * uv * (3.0 - 2.0 * uv);


    float a = random(vec2(ij.x, ij.y));
    float b = random(vec2(ij.x + 1., ij.y));
    float c = random(vec2(ij.x, ij.y + 1.));
    float d = random(vec2(ij.x + 1., ij.y + 1.));
    float k0 = a;
    float k1 = b - a;
    float k2 = c - a;
    float k3 = a - b - c + d;
    return (k0 + k1 * uv.x + k2 * uv.y + k3 * uv.x * uv.y);
}

float configurablenoise(vec3 x, float c1, float c2) {
    vec3 p = floor(x);
    vec3 f = fract(x);
    f = f * f * (3.0 - 2.0 * f);

    float h2 = c1;
    float h1 = c2;
#define h3 (h2 + h1)

    float n = p.x + p.y * h1 + h2 * p.z;
    return mix(mix(mix(hash(n + 0.0), hash(n + 1.0), f.x),
            mix(hash(n + h1), hash(n + h1 + 1.0), f.x), f.y),
            mix(mix(hash(n + h2), hash(n + h2 + 1.0), f.x),
            mix(hash(n + h3), hash(n + h3 + 1.0), f.x), f.y), f.z);

}

float supernoise3dX(vec3 p) {

    float a = configurablenoise(p, 883.0, 971.0);
    float b = configurablenoise(p + 0.5, 113.0, 157.0);
    return (a * b);
}

float snoise(vec3 uv, float res) {
    const vec3 s = vec3(1e0, 1e2, 1e3);
    uv *= res;
    vec3 uv0 = floor(mod(uv, res)) * s;
    vec3 uv1 = floor(mod(uv + 1., res)) * s;
    vec3 f = fract(uv);
    f = f * f * (3.0 - 2.0 * f);
    vec4 v = vec4(uv0.x + uv0.y + uv0.z, uv1.x + uv0.y + uv0.z,
            uv0.x + uv1.y + uv0.z, uv1.x + uv1.y + uv0.z);
    vec4 r = fract(sin(v * 1e-1)*1e3);
    float r0 = mix(mix(r.x, r.y, f.x), mix(r.z, r.w, f.x), f.y);
    r = fract(sin((v + uv1.z - uv0.z)*1e-1)*1e3);
    float r1 = mix(mix(r.x, r.y, f.x), mix(r.z, r.w, f.x), f.y);
    return mix(r0, r1, f.z)*2. - 1.;
}

float fbm(vec2 p, vec3 a) {
    float v = 0.0;
    v += noise(p * a.x)*.5;
    if (best) {//best
        v += noise(p * a.y)*.25;
        v += noise(p * a.z)*.125;
    }
    return v;
}

float fbmHI2d(vec2 p, float dx, float tshift) {
    p *= 1.2;
    float a = 0.0;
    float w = 1.0;
    float wc = 0.0;
    int bval = 3; //best 5
    if (best)bval = 5;
    for (int i = 0; i < bval; i++) {
        a += clamp(2.0 * abs(0.5 - (supernoise3dX(vec3(p, 1.0)))) * w, 0.0, 1.0);
        wc += w * (1. - (sin(min(iTime, PI * 0.99) / 1.4))) + 0.00271;
        w *= 0.5;
        p = p * dx / (sin(min(tshift, PI * 0.99)));
    }
    return a / wc;
}

float fbm(vec2 p) {
    mat2 m = mat2(0.6, 0.6, -0.6, 0.8);
    float f = 0.0;
    if (!best)p *= m * 1.502; //not best
    f += 0.5000 * noise(p);
    p *= m * 2.02;
    f += 0.2500 * noise(p);
    p *= m * 2.03;
    if (best) {//best
        f += 0.1250 * noise(p);
        p *= m * 2.01;
        f += 0.0625 * noise(p);
        p *= m * 2.04;
    }
    f /= 0.79375;
    return f;
}

float fcircle(vec2 p) {
    return 1. - dot(p -= .5, p);
}

vec2 dist(vec2 uv) {

    vec2 d = vec2(.0);
    d += .2 * dot(uv, uv) - .5;

    return d;
}

float noise(float _st) {
    return fract(abs(sin(_st)));
}

float flare(float alpha, vec2 main, float seed, float dir) {
    float SPEED = 0.4;
    float amnt = 0.6 + sin(seed)*8.0;
    float ang = atan(main.y, main.x);
    float t = (iTime) * SPEED * dir;
    float n = noise(vec2((seed + ang * amnt + t * 0.1) + cos(alpha * 13.8 + noise(t + ang + seed)*3.0)*0.2 + seed / 20.0, seed + t + ang));


    n *= pow(noise(vec2(seed * 194.0 + ang * amnt + t + cos(alpha * 2.0 * n + t * 1.1 + ang)*2.8, seed + t + ang) + alpha), 2.0);
    n *= pow(noise(vec2(seed * 134.0 + ang * amnt + t + cos(alpha * 2.2 * n + t * 1.1 + ang)*1.1, seed + t + ang) + alpha), 3.0);
    n *= pow(noise(vec2(seed * 123.0 + ang * amnt + t + cos(alpha * 2.3 * n + t * 1.1 + ang)*0.8, seed + t + ang) + alpha), 4.0);
    n *= pow(alpha, 2.96);
    n *= (((ang + PI) / 3.0) * (TAU - ang - PI));


    n += sqrt(alpha * alpha) * 0.26;
    return pow(n * 2.1, 2.0);
}

vec3 st(vec2 uv, float tshift) {
    float intensityred = (1.0 / (1.0 + 30.0 * abs(uv.y))) * fbmHI2d(uv * 30.0, 3.0, tshift) * (1.0 - abs(uv.x));
    float intensitywhite = (1.0 / (1.0 + 20.0 * abs(uv.y))) * fbmHI2d(uv * 30.0 + 120.0, 3.0, tshift) * (1.0 - abs(uv.x));
    float intensityblue = (1.0 / (1.0 + 20.0 * abs(uv.y))) * fbmHI2d(uv * 30.0 + 220.0, 3.0, tshift) * (1.0 - abs(uv.x));
    float galaxydust = SS(0.1, 0.5, (1.0 / (1.0 + 20.0 * abs(uv.y))) * fbmHI2d(uv * 20.0 + 220.0, 3.0, tshift) * (1.0 - abs(uv.x)));
    float galaxydust2 = SS(0.1, 0.5, (1.0 / (1.0 + 20.0 * abs(uv.y))) * fbmHI2d(uv * 50.0 + 220.0, 3.0, tshift) * (1.0 - abs(uv.x)));
    intensityred = 1.0 - pow(1.0 - intensityred, 3.0) * 0.73;
    intensitywhite = 1.0 - pow(1.0 - intensitywhite, 3.0) * 0.73;
    intensityblue = 1.0 - pow(1.0 - intensityblue, 3.0) * 0.73;
    vec3 dustinner = vec3(0.9 + 1.5 * random(vec2(iTime, -tshift)), 0.8, 0.8 + 2. * random(vec2(-iTime, tshift)));
    vec3 dustouter = vec3(0.32, 0.21, 0.0)*-1.;
    vec3 allmix = mix(dustouter, vec3(0.), (1.0 - galaxydust2));
    vec3 bloom = 1.6 * dustinner * (1.0 / (1.0 + 30.0 * abs(uv.y))) * fbmHI2d(uv * 3.0, 3.0, tshift) * (1.0 - abs(uv.x));
    return allmix * abs(sin(tshift / 2.)) + bloom;
}

float fractalNoise(vec2 v) {
    float value = 0.0;
    float amplitude = 0.5;
    int bval = 2; //best 4
    if (best)bval = 4;
    for (int i = 0; i < bval; i++) {
        value += amplitude * noise(v);
        v *= 2.0;
        amplitude *= 0.5;
        value += amplitude * noise(v * 2.)*0.5;
        amplitude *= 0.5;

    }
    return value;
}

vec3 burn(vec2 p, float size) {
    float color1 = size * 4. - 3. * length(2.5 * p);
    vec3 coord = vec3(atan(p.x, p.y) / 6.2832 + .5, length(p)*.4, .5);

    float power = exp2(float(1.));
    color1 += 0.2 * (1.5 / power) * snoise(coord + vec3(0., -time * .05, -time * .01), power * 16.);
    if (best) {
        power = exp2(float(2.));
        color1 += 0.1 * (1.5 / power) * snoise(coord + vec3(0., -time * .05, -time * .01), power * 16.);
        power = exp2(float(3.));
        color1 += 0.1 * (1.5 / power) * snoise(coord + vec3(0., -time * .05, -time * .01), power * 16.);
    }
    color1 *= 0.6;
    return vec3(color1);
}

vec4 texturepl1(vec2 fragCoord) {
    vec2 uv = fragCoord * 7. - 0.5;
    float hypot = sqrt(uv.x * uv.x + uv.y * uv.y);
    float uvang = atan(uv.y, uv.x);
    float newang = uvang + iTime / 100.;
    uv = vec2(hypot * cos(newang), hypot * sin(newang));

    float xPeriod = 2. + .2 * (cos(iTime / 10.));
    float yPeriod = 2. - .2 * (sin(iTime / 10.));


    float r = sin(uv.x * xPeriod * 6.283 + uv.y * yPeriod * 6.283
            + 15.0 * fractalNoise(10.0 * uv));
    r = r + 1.0;

    vec4 gray = vec4(r, r, r, 1.0);
    vec4 lightGreen = vec4(0.75, 1.0, 0.75, 1.0);
    vec4 darkGreen = vec4(0.0, 0.25, 0.0, 1.0);
    vec4 fragColor = gray * lightGreen + (1.0 - gray) * darkGreen;
    return fragColor;
}

vec4 texturepl11(in vec2 fragCoord) {
    float r = (zoom * 5000.) / 2.12510;
    float out_outer = 0.574;
    float out_inner = 0.12;
    vec2 pos = (fragCoord - planetpos1 * zoom - shippos);
    pos = vec2(pos.xy - (zoom * 5000.) / 2.);
    float z_out = sqrt(-r * r + pos.x * pos.x + pos.y * pos.y);
    float z_out_atm = (r * out_inner) / z_out - out_outer;
    z_out_atm = max(0., z_out_atm + 0.3);
    vec3 l = normalize(vec3(0., 0., 1.));
    vec3 norm_out = normalize(vec3(pos.x, pos.y, z_out));
    float diffuse_out = max(0.0, dot(norm_out, l));
    return vec4(1. * z_out_atm * diffuse_out, 1. * z_out_atm * diffuse_out, 10. * z_out_atm * diffuse_out, 1.);
}

vec4 texturepl21(vec2 p) {
    p.y = p.y - 0.8505124;
    p.x = p.x - 2.0050624;

    float boundA = PI / 3.;
    float boundB = TAU / 3.;
    float smoothBound = .2;

    float t = atan(p.y, p.x);
    float c = SS(boundA - smoothBound, boundA, t) - SS(boundB, boundB + smoothBound, t);
    float r = (t - boundA) / (boundB - boundA);
    r = sin(PI * r) * .2;

    r += abs(sin(r * 10. + iTime * .1)) * .2;

    r += .1;
    r *= SS(.4, .6, length(p)) - SS(.8, abs(sin(r * 10. + iTime)) * .2 + 2., length(p));
    r *= abs(noise(p + iTime * .5));
    r *= 15.;
    return vec4(vec3(-1.29, -.5, -.1) * r * c, 1.);

}

vec4 texturepl22(vec2 fragCoord) {
    vec2 uv = fragCoord;
    float r = 1.00;
    vec2 center = vec2(0.5, 0.5);
    float dis = distance(fragCoord.xy, center);
    float t = clamp(r - dis, 0.0, 1.0);


    float c = (fragCoord.x) * 80.0;

    c = cos(c - iTime / 2.) * 0.5 + 0.5;

    vec4 background = vec4(-.2500, .00, .00, 1.0);
    vec4 color = vec4(c, c, c, min(t, c));

    return mix(background, color, color.a);
}


#define F length(fract(m[3]*=m*=.4-k.w++)-.5)

vec4 texturepl2(vec2 p) {
    vec2 ttx = vec2(iTime, iTime) + 10000.; //bug with float<5200
    mat4 m = mat4(-1, 2, -2, 0,
            -2, 1, 3, 0,
            3, 2, 1, 0,
            800.2 * p, ttx);

    vec2 im = vec2(0.5, 0.9);
    float r = im.x / im.y,
            s = r - 1. / r;

    m *= mat4(1, 0, 0, 0,
            0, 1, 0, 0,
            s, 0, r, 0,
            0, 0, 0, 1);


    vec4 k = vec4(0.);
    k = min(min(F, F), F) / m[2];
    return k + texturepl21(p) + texturepl22(p);
}

vec4 texturepl31(vec2 p) {
    const vec4 col1 = vec4(.462, .44, .81, 1.0);
    const vec4 col2 = vec4(.208, .108, .0, 1.0);
    const mat3 _m = mat3(-2.0, -1.0, 2.0, 3.0, -2.0, 1.0, 1.0, 2.0, 2.0);
    vec2 uv = p.xy * .525 + 2.9;

    vec4 d = vec4(iTime * .081);


    d.xy = uv;
    d.y *= 0.015;
    d.x *= 0.725;

    d.xyw *= _m * .5;
    float v1 = length(.5 - fract(d.xyw));
    d.xyw *= _m * .4;
    float v2 = length(.5 - fract(d.xyw));
    d.xyw *= _m * .3;
    float v3 = length(.5 - fract(d.xyw));


    float v = pow(min(min(v1, v2), v3), 4.)*13.37 + uv.y * 1.55;
    return mix(col2, col1, v);

}

vec4 texturepl3(vec2 fragCoord) {

    vec3 PLANET_BAND_1 = vec3(1.50, 1.294, 1.908235);
    vec3 PLANET_BAND_2 = vec3(1.0, .0504019, -0.806);
    vec3 PLANET_BAND_3 = vec3(1., 1., .5);
    vec2 uv = fragCoord.xy * .51;
    vec2 PLANET_LOC = vec2(.5 - (0.015 * sin(iTime / 3.)), .5);
    vec3 color;
    vec2 auv = vec2(uv.x, uv.y);
    vec2 aPLANET_LOC = vec2(PLANET_LOC.x, PLANET_LOC.y);
    mat2 rotMat = mat2(.8660, .5, -.5, .8660);
    vec2 puv = rotMat * (auv - aPLANET_LOC);

    vec3 bgcolor = color;
    color = mix(PLANET_BAND_1, PLANET_BAND_2, 0.5 * (1.0 + sin(60.0 * puv.y)));
    color = mix(color, PLANET_BAND_3, 0.5 * (1.0 + sin(80.0 * puv.y * puv.y)));
    color = mix(color, bgcolor, pow(length(auv - aPLANET_LOC), 80.0));


    return vec4(color, 1.) * texturepl31(fragCoord);

}

vec4 tyxt1(vec2 U) {
    U = U * 200.;
    vec4 O = vec4(1.);

    O += .1 / fract(sin(1e5 * length(ceil(U /= 8.))) < 0. ? U.x : U.y) - O;
    return O;
}

vec4 tyxt(vec2 g) {
    vec4 f = vec4(1.);
    vec4 ff = tyxt1(g);

    g = (g) * 8.;
    g.x *= 5.25;

    g.x = atan(g.x, g.y) * 1.7 * floor(g.y = length(g));

    f += step(.1 / fract(cos(6e4 * length(floor(g))) < -.8 ? g.x : g.y), .6) - f;

    return f * max(0., 0.6 - ff.r);
}

float geom(vec2 p) {
    float q = 0.0;
    for (float i = 0.0; i < 5.0; i += 1.0) {
        q += 0.028 + i * 0.01;

        vec2 op = p;

        p.x += p.y * sin(iTime * 0.021)*0.1 + sin(iTime * 0.05)*1.2;
        p.y -= p.x * cos(iTime * 0.031)*0.1 + cos(iTime * 0.05)*1.2;

        vec2 w = mod(p, 4.0);
        if (tyxt(w * 0.25).x < 0.3 - cos(1. * 0.61)*0.2) {
            break;
        }

        p *= 1.2;
    }
    return q;
}

vec4 texturepl4(vec2 fragCoord) {
    vec2 uv = fragCoord.xy * 01.851 - 4.5;

    float q = 0.0;
    vec2 p = uv;


    float b = 1.0 + length(p);
    b += tyxt(uv * 1.4).x * 0.1;
    b += sin(iTime)*0.01;
    p *= (b);

    p.x += sin(iTime * 0.2)*2.0;
    p.y += cos(iTime * 0.2)*2.0;


    q = geom(p * 0.1 + uv * 1.0);

    float gg = 0.0;
    float tbest = 4.;
    if (best)tbest = 6.; //best
    for (float g = 0.0; g < tbest; g += 1.0) {
        float xg = g / 20.0;
        xg = pow(xg, 0.5);
        float lg = (g - 1.0) / 20.0;
        lg = pow(lg, 0.5);
        gg += geom(p * 0.1 + uv * (xg + hash(uv + p)*(xg - lg)));
    }

    q = mix(gg * .125, q, 0.25);

    vec4 col = vec4(q * 4.0, q * 3.0, q, 1.0);

    col /= (b - 0.61);
    float h = hash(uv + col.xy);
    col -= vec4(h, h, h, 0.0)*0.025;

    float w = col.x + col.y + col.z;
    vec4 fragColor = mix(col, vec4(w, w, w, 1.0)*0.85, w);

    return fragColor;
}

vec3 magmaFunc(vec3 color, vec2 uv, float detail, float power,
        float colorMul, float glowRate, bool animate, float noiseAmount) {
    vec3 rockColor = vec3(0.09 + abs(sin(iTime * .75)) * .03, 0.02, .02);
    float minDistance = 1.;
    uv *= detail;

    vec2 cell = floor(uv);
    vec2 frac = fract(uv);

    for (int i = -1; i <= 1; i++) {
        for (int j = -1; j <= 1; j++) {
            vec2 cellDir = vec2(float(i), float(j));
            vec2 randPoint = hash2(cell + cellDir);
            randPoint += noise(uv) / 5. * noiseAmount;
            randPoint = animate ? 0.5 + 0.5 * sin(iTime * .35 + 6.2831 * randPoint) : randPoint;
            minDistance = min(minDistance, length(cellDir + randPoint - frac));
        }
    }

    float powAdd = sin(uv.x * 2. + iTime * glowRate) + sin(uv.y * 2. + iTime * glowRate);
    vec3 outColor = vec3(color * pow(minDistance, power + powAdd * .95) * colorMul);
    outColor.rgb = mix(rockColor, outColor.rgb, minDistance);
    return outColor;
}

vec4 texturepl5(vec2 cc) {
    vec2 uv = cc * 3.;
    uv.x += iTime * .11;
    vec4 fcx;
    fcx.rgb += magmaFunc(vec3(1.5, .45, 0.), uv, 3., 2.5, 1.15, 1.5, false, 1.5);
    fcx.rgb += magmaFunc(vec3(1.5, 0., 0.), uv, 6., 3., .4, 1., false, 0.);
    fcx.rgb += magmaFunc(vec3(1.2, .4, 0.), uv, 8., 4., .2, 1.9, true, 0.5);
    return fcx;
}

vec2 uv2tri(vec2 uv) {
    float sx = uv.x - uv.y / 2.;
    float offs = step(fract(1. - uv.y), fract(sx));
    return vec2(floor(sx) * 2. + offs, floor(uv.y));
}

vec2 CxFactorial(vec2 z, float tshift) {
    float x = z.x;
    float y = z.y;
    float r = length(z);
    float t = atan(z.x, z.y);
    float A = sqrt(5. * PI) * exp((log(r) / log(e))*(x + 0.5) - y * t - x);
    float B = y * ((log(r) / log(e)) - 1.) + t * (x * 0.15 + 01.5)+-tshift;
    return A * vec2(sin(B), cos(B));
}

vec4 sh2(vec2 uv, float an, bool naa, float b) {
    vec2 pos = uv;
    an += -PI / 4.;
    float R = 250.;
    vec2 p = vec2(R * zoom);
    uv = (pos - p / 2.) / p.y;
    uv *= MD(an);
    uv *= 3.;
    vec2 msf = uv / 1.75 + 0.9975;
    vec2 offset = vec2(msf.x, msf.y);
    ;
    float speed = 2.;
    float itt = iTime;
    float t = mod(itt * TAU / speed, TAU);
    vec2 offseta = vec2(0., 0.);

    t = mod(itt * TAU / (speed / 0.3), TAU);
    vec2 offset2 = vec2(msf.x + 0.1 - (0.1 * msf.x * (cos(t))), msf.y + 0.1 - (0.1 * msf.y * (cos(t))));
    vec2 offset3 = vec2(msf.x - 0.1 + abs(0.1 * msf.x * (cos(t))), msf.y - 0.1 + abs(0.1 * msf.y * (cos(t))));

    vec3 light_color = vec3(0.49 + 2. * (naa ? 1. : 0.), 0.365, 0.25);
    float light = 0.0;

    light = 0.015 / distance(normalize(uv), uv);

    if (length(uv) < 1.) {
        light += (naa ? 1. : 0.)*0.51 / distance(normalize(uv - offset3), uv - offset3);
        light += (naa ? 1. : 0.)*0.51 / distance(normalize(uv - offset2), uv - offset2);
        light *= 0.0511 / distance(normalize(uv - offset), uv - offset);
        light *= 0.18521 / distance(normalize(uv - offseta), uv - offseta);
    }


    return vec4((light * light_color) * SS(1.5, 0.0, length(uv)), 1.) * b;
}

float linify(float value, float thickness) {
    return abs(thickness / value);
}

float circlify(vec2 pos, vec2 center, float radius) {
    float R = 250. * zoom;
    float x = pos.x - center.x;
    float y = pos.y - center.y;
    float time = iTime;
    float circleEquation = x * x + y * y - 0.7 * radius * radius * abs(sin(x * y * 50.0 + time + R * x + R * y));
    return linify(circleEquation, 0.5 * radius);
}

vec4 en1tx1(vec2 pos) {

    float R = 250. * zoom;
    vec2 p = (pos.xy / R)*2. - 1.;
    p.x -= 0.051;

    vec3 finalColor = vec3(0.);

    vec3 color = vec3(0.1, 0.1, 0.2);
    vec3 color1 = vec3(0.2, 0.1, 0.1);
    vec3 color2 = vec3(0.1, 0.2, 0.1);


    finalColor += color * circlify(p, vec2(0., 0.), 0.64152); //r

    return vec4(finalColor, 1.0);

}

vec4 en1tx2(vec2 pos, float power, float tshift) {
    float R = 250. * zoom;
    vec2 center = vec2(R / 2.);

    float intensity = pow((power)*(R / 2.) / length(center - pos.xy), 4.);

    intensity += pow(32. * (pow(exp(-abs(pos.x - center.x) * (0.02 / (R / 500.))), 2.)) / abs(R / 2. - pos.y), .5);
    intensity += pow(intensity, 2.0);
    return min(vec4(1.), vec4(vec3(.91 + 0.05 * sin(-tshift * 50.) * step(0.5, power), .25, .97) * intensity * 0.8, 1.)) * power;
}

vec4 en11(vec2 uv, float power, float tshift) {
    uv.x -= 0.05;
    uv *= 0.08; //z


    vec2 branch = vec2(0);
    vec2 relative;
    float dir;

    relative = uv - branch;
    relative *= relative*relative;
    dir = atan(relative.y, relative.x);
    dir *= 3.0;
    dir -= tshift * 1.5;
    relative = vec2(cos(dir), sin(dir)) / 3. - .783191859;
    branch += relative / (100.0) / distance(uv, branch);
    float dist = distance(uv, branch);
    float ttx = 02. + .5 * sin(tshift) + 10. * power;
    vec4 tmpc = vec4(abs(sin(ttx) - 1. - (1. - sin(tshift)) * SS(0.1, .0, length(uv)*2.)),
            abs(0.5 + sin(ttx)-(0.5 - sin(tshift)) * SS(0.1, .0, length(uv)*2.)),
            abs((0.5 - sin(ttx))-(0.5 - sin(tshift)) * SS(0.1, .00, length(uv)*2.)), 1.);
    vec4 col = (min(vec4(1.), tmpc * (dist / 1. / (1. * power)))) - SS(0.1, 0.9, length(uv) / 2.);


    return (col);
}

vec3 ring(vec2 pos, float radius, float width) {
    float h_width = width * 0.5;
    float d = length(pos);
    return vec3((SS(radius - h_width - 0.01, radius - h_width, d) -
            SS(radius + h_width, radius + h_width + 0.01, d)), 1. - SS(radius + h_width, radius + h_width + 0.01, d), SS(radius - h_width - 0.01, radius - h_width, d));
}









//enemy 3
//--------

vec3 WeirdCircle(vec2 uv, float radius, float thickness, float intensity, vec3 fbmOffset, float t2, vec3 color) {
    float _Frequency = 30.0;
    float dist = box2(uv / 1.6, vec2(0.502 + 0.07, 0.0915));

    float aTan = atan(uv.y / uv.x);
    float t1 = intensity * sin(aTan * _Frequency + iTime * t2) * 0.5 + 0.5 + fbm(uv, fbmOffset) * 0.15;
    float warp = mix(0.0, 0.5, t1);

    float effector = thickness * abs(0.003 / ((dist) - (radius + warp)));

    return color * effector;

}

vec2 ifs(vec2 _p, vec2 _shift) {
    vec2 pos = _p;

    vec2 shift = _shift;

    int tb = 5;
    if (best)tb = 6;
    for (int i = 0; i < tb; i++) {
        float intensity = pow(2.0, -float( i));
        pos = abs(pos) - shift * intensity;
        if (pos.x < pos.y) {
            pos.xy = pos.yx;
        }
    }

    return pos;
}

float lxx(vec2 p) {
    float R = 900. * zoom;
    vec2 fc = p.xy;
    bool iss = (abs(fc.x - (sin(fc.y / (-0.22) + iTime)*222.0 + R / 2.0)) < 15.0 / zoom);
    float tmxs = (1. - SS(0.19, 0.39, tax))+(1. - SS(0.65, 0.39, tax));
    return float(iss)*(1. - 0.9 * tmxs);
}

float angle2d(float cx, float cy, float ex, float ey) {
    float dy = ey - cy;
    float dx = ex - cx;
    float theta = atan(dy, dx);
    return theta;
}

vec2 cux(vec2 pxx) {
    vec2 SIZE = vec2(0.683, 0.83);
    float tmxs = (1. - SS(0.00, 0.29, tax))+(1. - SS(0.7, 0.29, tax));
    float R = 900. * zoom;
    vec2 pos = (pxx / R - 0.5) * 50.0;
    vec2 px = (pxx / R - 0.5);
    pos = ifs(pos, vec2(9.0, (tmxs) * 2.0 + 7.)).xy;

    vec2 color = vec2(0.0);
    color = abs(pos.x) < SIZE.x && abs(pos.y) < SIZE.y ? vec2(1., SS(0.1, 3., length(pos))) : vec2(0., SS(1.5, 0., length(pos)));
    return color;
}

vec4 en3sh(vec2 pos) {

    float _Radius = 0.206;
    float _Radius2 = 0.2;
    float rcm = en3hit ? 2. * SS(20., 0., lpower) : 0.;
    float _Intensity = 0.015 + rcm / 50. * cos(sin(iTime));
    float R = 900. * zoom;

    vec2 uv = (pos / R) * 2.0 - 1.0;

    vec3 finalColor = vec3(0.0);

    finalColor += WeirdCircle(uv, _Radius, 1.0, _Intensity, vec3(200, 100, 50), -10.0, vec3(0.3 + rcm, 0.5, 2.5 - abs(rcm * cos(sin(iTime)))));
    finalColor += WeirdCircle(uv, _Radius2, 1.0, _Intensity, vec3(30, 6, 5), 5.0, vec3(1.3 + rcm, 0.5 + abs(rcm * sin(cos(iTime))), .5));
    if (best) {//best
        //finalColor += WeirdCircle(uv, _Radius, 1.0, _Intensity, vec3( 90, 15, 1),1.0,vec3( 0.8,0.5, 0.0 ));
        //finalColor += WeirdCircle(uv, _Radius2-0.04, 1.0, _Intensity * 2.0, vec3(100,100,100),4.0,vec3( 0.12, 0.15, 2.1 +rcm*cos(sin(iTime))));
        finalColor += WeirdCircle(uv, _Radius2 - 0.014, 0.51, _Intensity, vec3(20., 30, 70.), 4.0, vec3(0.1 + rcm, 0.951 + abs(rcm * sin(cos(iTime))), 0.652));
    }
    return vec4(finalColor, 1.);


}

vec4 en3sa(vec2 pos, bool rev) {

    vec3 color = vec3(0.);

    if (rev)pos.y = pos.y - pos.x / 4.;
    else pos.y = pos.y + pos.x / 4.;
    vec3 SUN_1 = vec3(00., .40, 1.0);
    float R = 900. * zoom;
    vec3 SUN_3 = vec3(02., .3525, 1.80);
    float ssamount = 1.;
    if (best)ssamount = 2.;
    float mblur = 1.;
    if (best)mblur = 2.;
    for (float blur = 0.; blur < mblur; blur += 1.) {
        float timed = blur / mblur / 4. + float(rev ? iTime : -iTime)*6.;
        for (float x = 0.; x < ssamount; x += 1.)
            for (float y = 0.; y < ssamount; y += 1.) {
                vec2 position = pos.xy + vec2(x / ssamount, y / ssamount);
                position /= R;
                position *= 2.;
                position -= 1.25;

                if (rev)
                    position.x += 1. - 0.13674635540;
                else {
                    position.x += -0.3674635540;
                    position.y += -0.5;
                }
                position.x *= 8.5 + 1.75 * sin(0.);
                position.y *= 1.4;
                position.y += .4;
                if (rev) {
                    position.x = -position.x;
                    position.y = -position.y;
                }
                float angle = atan(position.y, position.x);
                float d = length(position);

                color += 0.1 / length(vec2(.04, 2. * position.y * sqr(position.x) - pow(sin(pow(position.x, 3.)*2.5 - timed), .5))) * SUN_1;
                color += 0.1 / length(vec2(.04, 2. * position.y * sqr(position.x) + pow(sin(pow(position.x, 3.)*2.5 - timed), .5))) * SUN_1;

                color += 0.1 / length(vec2(.01, 3. * position.y * sqr(position.x) + sin(pow(position.x, 3.)*8. + sqr(position.x)*32. + timed) * sin(position.y * sqr(position.x)*16. + sin(timed / 8.)))) * SUN_3;
                color *= step(0.0, position.x - 0.9);
            }
    }
    return vec4(color / sqr(ssamount) / mblur, 1.0);


}

vec4 en3ls(vec2 pos) {
    float R = 900. * zoom;
    vec2 st = pos.xy / R;
    st.x -= -0.0;
    st.y += 0.40;

    st -= vec2(0.5);
    float tmxs = (1. - SS(0.19, 0.39, tax))+(1. - SS(0.65, 0.39, tax));
    float sint = 0.8 * (1. - tmxs);

    float y = pow(abs(st.y), (0.5 - sint * 0.4)*5.);
    vec3 grad = vec3(y);

    vec3 basecolor = vec3(0.080, 0.003, 0.020);
    vec3 color = grad * vec3(0.849, 0.08369, 0.080);
    vec3 final = basecolor + color;


    float w = 0.75 + sint * 0.2 - pow(abs(st.x), 0.324);
    vec3 grad2 = vec3(w);

    final = final +grad2;

    float b1a0 = 0.5 + sint * 0.5;
    vec2 pos1 = st;

    float r = length(pos1)*2.0;
    float a = atan(pos1.y, pos1.x);
    float f = abs(cos(a * 1.))*0.01;

    color = vec3(1. - SS(f, f + 0.02 + b1a0 * 0.10, r));
    color = color * vec3(0.860, 0.759, 0.410);
    final = final +color;
    float tmxsx = (1. - SS(0.19, 0.65, tax));
    return (vec4(final, 1) * SS(0.05 + 0.05 * st.y, .04, abs(st.x)) * step(0.0, st.y)*(1. - tmxs))*SS(02.5 + 3. * (1. - tmxsx), 00.0, length(st));


}

vec4 en3cl(vec4 col, vec2 pos) {
    float R = 900. * zoom;
    if ((pos.x > 0. - 300. * zoom)&&(pos.x < R + 300. * zoom)&&(pos.y > 0. - 300. * zoom)&&(pos.y < R + 300. * zoom)) {
        vec2 uv = pos.xy / R;
        vec2 tuv = -uv + 0.5;
        tuv.y += -0.;
        float time = iTime;

        float pulse = 0.9 + cos(time + length(tuv)*10.);

        vec3 baseColor = vec3(0.0);


        vec3 color = vec3(0.);

        float tmxs = (1. - SS(0.00, 0.29, tax))+(1. - SS(0.7, 0.29, tax));
        vec2 size = vec2(0.08, 0.3 - 0.07 * tmxs);
        vec2 pos1 = vec2(0.5, 0.5);
        vec2 b = cux(pos);
        float boxx = 1. - box(uv - pos1, size);
        float lx = lxx(pos);
        boxx *= lx;
        pos1 = vec2(0.5, 0.5);

        float dust = .85 * SS(0.05, 0.0, b.y);
        float block = 0.1 * SS(0.001, 0.0, b.y);
        float shine = 1.0 * pulse * SS(-0.002, b.y, 0.037);
        vec3 light = vec3(00.0, 0.4 + 0.9 * (1. - tmxs), 01.)*(b.x);
        color += dust * (b.x) + block * (b.x) + shine * light;
        return vec4(color, 1.0) + boxx * (1. - b.y * 2. - b.x) + en3sh(pos) * SS(1.3, .9, uv.y) * SS(0.0, .1, uv.y) * SS(1. - 01.3, 1. - 0.9, uv.x) * SS(01.3, 0.9, uv.x) +
                max(vec4(0.), en3sa(pos, true)) * SS(0.8, .7, uv.y - 0.05 * sin(time)*2.) * SS(0.2, .3, uv.y + 0.05 * sin(time)*2.)*(1. - b.x) * SS(1. - 01.3, 1. - 0.9, uv.x) +
                max(vec4(0.), en3sa(pos, false)) * SS(0.8, .7, uv.y - 0.05 * sin(time)*2.) * SS(0.2, .3, uv.y + 0.05 * sin(time)*2.)*(1. - b.x) * SS(01.3, 0.9, uv.x) + en3ls(pos) + col * (1. - b.x);
    }
    return col + en3ls(pos);
}

vec4 en3(vec4 col, vec2 pos) {
    pos = (pos - en3pos * zoom - shippos);
    pos *= MD(tax + PI / 2. + PI / 4.3);
    return en3cl(col, pos); //laser power 0.2 to 0.8 max power
}

//--------

float laspawn(vec2 pos, float timex, bool lekill) {

    float rl = 250. * zoom;

    vec2 uv = pos.xy / rl * 2. - 1.;
    if (lekill) {
        timex += 1.; //k
    } else {
        timex += 5.7; //s
    }


    float power = (sin(timex * 2.) + 1.) * 5.;
    float level = sin(timex * 3.) / 2. + .5;
    float shadow = (sin(timex * 5.) / 2. + 1.) * 40.;

    float r = 250.;
    float a = sqrt(pow(abs(uv.x), power) + pow(abs(uv.y), power));
    float b = ((level - a) * r + shadow) / shadow;
    float mul = clamp((level - a) * r, 0., 1.);
    return max(0., 1. * mul + 1. * (1. - mul) * (1. + b));
}







//enemy 1

vec4 en1(vec2 poxu, float tshift, vec4 col, vec4 colx, vec2 pos, float cpower, float chpower, vec4 colz, out vec4 tcc, bool xxex) {
    float an = -angle2d(0., 0., poxu.x * zoom - 125. * zoom, poxu.y * zoom - 125. * zoom);
    //float an=angle;
    pos = (pos - poxu * zoom - shippos);
    float R = 250.;
    if ((1. - step((R + 50. + 500. * cpower) / 2. * zoom, length(pos - (R) / 2. * zoom)) > 0.)) {
        R = R*zoom;
        vec2 uv = (pos.xy) / R;
        uv = (uv - 0.5) * 2.0;
        uv *= MD(an);

        float theta = atan(uv.y, uv.x);

        float amp = -(1. - chpower) * max(0., exp(-(-cos(theta) * 0.5 + 0.5) * 14.) - 0.05); //amp
        float width = -cos(theta) * 0.5 + 0.5;

        vec3 tr = ring(uv, 0.6 + amp * (0.5 + 0.5 * sin((theta - tshift) * 15. + 0. * (TAU / 3.))) / 10., 0.2 * width);
        float r = tr.x;
        float it = tshift;
        float b = 0.;
        if (it < 1.2) {
            b = laspawn(pos, it, false);
            ;
        } else b = 1.;
        vec4 tr2 = en11(uv, chpower, tshift);
        tr2 = tr2 * b + 5. * tr2 * (1. - b) * b;
        vec4 fragColor = -en1tx1(pos) * b;
        vec4 txex = en1tx2(pos, cpower, tshift) * b;
        uv.x += 0.1;
        if (xxex || cpower > 0.) {
            tcc = txex * SS(0.7 + 2. * cpower, 0.5, length(uv));
            return tcc;
        }
        tcc = max(vec4(0.), (vec4((-vec3(-r, r, r)), 1.) * tr2 * tr.y * 0.57 + 1. * tr2 * tr.y + fragColor * (tr.y) + tr2 * (1. - tr.y) * SS(0.7, 0.5, length(uv)))) + txex * SS(0.7 + 2. * cpower, 0.5, length(uv)) + colz * (1. - tr.x);
        return max(vec4(0.), (vec4((-vec3(-r, r, r)), 1.) * tr2 * tr.y * 0.57 + 1. * tr2 * tr.y + fragColor * (tr.y) + tr2 * (1. - tr.y) * SS(0.7, 0.5, length(uv)))) + txex * SS(0.7 + 2. * cpower, 0.5, length(uv)) + colx * (1. - tr.y * b) + colz * (1. - tr.z * b);



    }
    if (xxex || cpower > 0.) {
        tcc = vec4(0);
        return vec4(0);
    }
    tcc = colz;
    return colx;


}



//enemy 2

vec4 en2(vec4 col, vec4 colxx, vec2 pos, vec2 pux, float tshift, out vec4 lux, bool naa, float botmr) {

    vec2 pox = (pux * zoom - 125. * zoom);
    pos = (pos - pux * zoom - shippos);
    bool laser = (step(length(pox), 500. * 3. * zoom) > 0.)&&(botmr < 0.001);
    float an = -angle2d(0., 0., pux.x * zoom - 125. * zoom, pux.y * zoom - 125. * zoom) - PI / 2.;
    float R = 250.;
    if ((1. - step((R + 50.) / 2. * zoom, length(pos - (R) / 2. * zoom)) > 0.) || (laser)) {
        vec2 rx = vec2(R * zoom);
        vec2 uv = (pos - rx / 2.) / rx.y * 8.;
        uv = abs(uv);
        uv *= MD(an);

        vec3 p = vec3(dot(uv, vec2(1.5, 0.5)), dot(uv, vec2(-1, 0.5)), uv.y);
        vec3 p1 = fract(+p);
        vec3 p2 = fract(-p);

        float d1 = .2 + min(min(p1.x, p1.y), p1.z);
        float d2 = min(min(p2.x, p2.y), p2.z);
        float d = min(d1, d2);

        vec2 tri = uv2tri(uv);
        float r = random(tri) * 2. + tri.x / 16. + -tshift * 2.;
        float c = step(0.12 + sin(r) * 0.2, d);



        uv = (pos.xy / rx) - 0.5;
        uv *= MD(an);

        vec2 sp = uv;
        sp.y += -0.291;
        vec2 z = vec2(0.);

        z += pow(vec2(float(0.), float(0.)), abs(sp));
        z += pow(vec2(float(0.), float(1.)), abs(sp));
        z += pow(vec2(float(1.), float(0.)), abs(sp));

        z += CxFactorial(pow(abs(sp)*1e6, vec2(0.1)), tshift);

        vec4 cl1 = vec4(sin(z.x), cos(z.x) + cos(z.y), sin(z.y), 1.0);
        if (laser)cl1 = vec4(cl1.r * cl1.g * cl1.b) + cl1 * 0.21;
        else cl1 = vec4(cl1.r * cl1.g * cl1.b);



        float tuv = SS(0.3, 0.29, length(uv))*2.;
        float tuvz = SS(0.3, 0.29, length(uv));
        vec2 tuvv = uv;
        float it = tshift;
        float b = 0.;
        if (it < 1.2) {
            b = laspawn(pos, it, false);
        } else if (botmr > 0.) {
            it = botmr;
            b = laspawn(pos, it, true);
        } else b = 1.;
        col = colxx * (1. - c * b) * tuvz + colxx * (1. - tuvz);
        vec4 tret = c * cl1*tuv;




        tret = tret * b + 3. * cl1 * (1. - b) * b * SS(.3, 0.2, length(uv));


        tuv = (2. - tuv);

        uv = (pos.yx / rx) - .5;
        uv *= MD(-an);

        vec4 lc = vec4(0.);
        ;
        if (laser) {
            float dy = (1. / (25. * length(uv - vec2(uv.x, 0)))) * SS(0.1, 0.05, length(uv - vec2(uv.x, 0))) * tuv;
            dy *= step(0.1, length(max(vec2(0.), tuvv - vec2(tuvv.x, 0))));
            lc = vec4((uv.x + cl1.x) * dy, cl1.y * dy, cl1.z*dy, 1.);
        }
        lux = lc * (step(length(pos - 125. * zoom), length(pox)));
        return tret + col + sh2(pos, an, naa, b);
    }
    lux = vec4(0.);
    ;
    return colxx;


}

vec4 xxxf(in vec2 fragCoord) {
    float Rx = 8500. * zoom;
    vec3 color = vec3(01., 0.508, 0.520);
    float size = 1.0;

    vec2 R = vec2(Rx * 1.3);
    vec2 p = (fragCoord.xy - .5 * R) / R.y;
    p *= MD(tax * 3.);

    vec3 color2 = burn(p, size);
    return vec4(color2 * color * 0.7, 1.0);
}

vec4 pl1lsht(vec2 pos) {

    float tmxs = (1. - SS(0.19, 0.65, tax));

    float R = 7000. * zoom;
    pos += -R / 2. + R * 0.145;
    pos = R * 0.5 - pos * MD(tax + PI / 3.2 + PI / 2. * (1. - tmxs));
    vec2 uv = pos / R;

    vec2 p = uv - vec2(0.5, 0.5);
    vec3 col = vec3(0.0, 0.0, 0.0);


    float sqR = dot(p, p) * 8.0;

    float scale = (1.0 - sqrt(abs(1.0 - sqR))) / (sqR);
    vec3 Color = xxxf(pos).xyz * 1.4;
    col = Color * scale;


    return vec4(col, scale);

}


#define X1 c += texturepl1(p*bval); p *= .4; c *= .6;
//planet1

vec4 planet1(vec4 col, vec2 w) {
    vec2 pos = (w - planetpos1 * zoom - shippos);
    float R = 5000.;
    if (1. - step((R + 1000.) / 2. * zoom, length(pos - (R) / 2. * zoom)) > 0.) {
        vec2 p = vec2(R * zoom);
        float d = length(p = (pos * 2. - p) / p.y);

        vec4 b = vec4(.63, .62, .86, 1) + p.y, c = b;
        p = p * asin(d) / d - 5.;
        p = p * p.y;
        float bval = .021;
        if (best) {
            bval = .1;
            X1 X1
        } //best
        X1 X1 X1
                float tmxs = (1. - SS(0.23, 0.39, tax))+(1. - SS(0.65, 0.39, tax));
        vec4 cxu;
        if (1. - tmxs > 0.)
            cxu = pl1lsht(pos);
        else cxu = vec4(0.);
        vec4 cxx = vec4(1.)*(1. - (1. - tmxs)) + cxu * (1. - tmxs);
        return max(vec4(0.), (c.g + (b - c.g) * c.r) * clamp(9. - d * d * 9., 0., 1.)) * cxx + (texturepl11(w))*(1. - (clamp(9. - d * d * 9., 0., 1.))) + col * (1. - (clamp(9. - d * d * 9., 0., 1.))) + cxu * SS(01.2, 01.0, d)*(1. - tmxs);

    }
    return col;
}


#define X2 c += texturepl2(p*bval); p *= .4; c *= .6;
//planet2

vec4 planet2(vec4 col, vec2 w) {
    vec2 pos = (w - planetpos2 * zoom - shippos);
    float R = 15000.;
    if (1. - step((R) / 2. * zoom, length(pos - (R) / 2. * zoom)) > 0.) {
        vec2 p = vec2(R * zoom);
        float d = length(p = (pos * 2. - p) / p.y);
        vec4 b = vec4(.53, .952, 1.8, 1) + p.y, c = b;
        p = p * asin(d) / d - 5.;
        p = p * p.y;
        float bval = .01951;
        if (best) {
            bval = .1;
            X2 X2 X2
        }
        X2 X2
        vec4 tmpc = max(vec4(0.), (c.g + (b - c.g) * c.r) * clamp(9. - d * d * 9., 0., 1.) + col * (1. - (clamp(9. - d * d * 9., 0., 1.))));
        tmpc.r *= .55;
        tmpc.g *= .725;
        return tmpc;
    }
    return col;
}

#define X3 c += texturepl3(p*.0390151); p *= .4; c *= .3856;
//planet3

vec4 planet3(vec4 col, vec2 w) {
    vec2 pos = (w - planetpos3 * zoom - shippos);
    float R = 20000.;
    if (1. - step((R) / 2. * zoom, length(pos - (R) / 2. * zoom)) > 0.) {

        vec2 p = vec2(R * zoom);
        float d = length(p = (pos * 2. - p) / p.y);
        vec4 b = vec4(.43, .442, .4, 1) + p.y, c = b;
        p = p * asin(d) / d - 5.;
        p = p * p.y;
        if (best) {
            X3
        }
        X3
        vec4 tmpc = max(vec4(0.), (c) * clamp(9. - d * d * 9., 0., 1.) + col * (1. - (clamp(9. - d * d * 9., 0., 1.))));
        tmpc *= .755;
        return tmpc;
    }
    return col;
}

#define X4 c += texturepl4(p*.1); p *= .4; c *= .76;
//planet4

vec4 planet4(vec4 col, vec2 w) {
    vec2 pos = (w - planetpos4 * zoom - shippos);
    float R = 25000.;
    if (1. - step((R) / 2. * zoom, length(pos - (R) / 2. * zoom)) > 0.) {

        vec2 p = vec2(R * zoom);
        float d = length(p = (pos * 2. - p) / p.y);
        vec4 b = vec4(.43, .42, .678, 1)-(min(.590, abs(p.y))), c = b;
        p = p * asin(d) / d - 5.;
        p = p * p.y;
        X4
        vec4 tmpc = max(vec4(0.), (c) * clamp(9. - d * d * 9., 0., 1.) + col * (1. - (clamp(9. - d * d * 9., 0., 1.))));
        tmpc.b *= 0.51;
        return tmpc;

    }
    return col;
}

#define X5 c += texturepl5(p*.15); p *= .4; c *= .6;
//planet5

vec4 planet5(vec4 col, vec2 w) {
    vec2 pos = (w - planetpos5 * zoom - shippos);
    float R = 8000.;
    if (1. - step((R) / 2. * zoom, length(pos - (R) / 2. * zoom)) > 0.) {

        vec2 p = vec2(R * zoom);
        float d = length(p = (pos * 2. - p) / p.y);
        vec4 b = vec4(.4643, .22, .28, 1) + p.y / 1.5, c = b;
        p = p * asin(d) / d - 5.;
        p = p * p.y;
        if (best) {
            X5
        }//best
        X5
        vec4 tmpc = max(vec4(0.), (c) * clamp(9. - d * d * 9., 0., 1.) + col * (1. - (clamp(9. - d * d * 9., 0., 1.))));
        tmpc.b *= -2.51;
        return tmpc;
    }
    return col;
}

float xffxgfx(in vec2 fragCoord) {
    float FEATURE_SIZE = 25.;

    float SPHERE_RADIUS = 0.5;

    float GREEN_COS_MULTIPLIER = 9.;

    vec2 rezzz = vec2(10500.) * zoom;
    fragCoord = ((fragCoord - vec2(rezzz.x / 2., rezzz.y / 2.)) / rezzz.y);

    float outerCircle = 0.1 + SPHERE_RADIUS * fcircle((fragCoord + vec2(0.25, 0.25)) * 2.);
    float tilePattern = 3.0 * fcircle(fract(fragCoord * 1. / outerCircle * FEATURE_SIZE + (iTime / 2.)));
    float z = (tilePattern * outerCircle / 6.) * tilePattern * outerCircle;
    float gr = abs(pow(z * 9.9, 7.6) * cos(z * GREEN_COS_MULTIPLIER));
    return (((gr + (sin(z * 10.5)))));
}



//planet6

vec4 planet6(vec4 col, vec2 w) {
    vec2 pos = (w - planetpos6 * zoom - shippos);
    vec2 rezzz = vec2(10500.);
    if (1. - step((rezzz.x) / 2. * zoom, length(pos - (rezzz.x) / 2. * zoom)) > 0.) {
        rezzz *= zoom;
        vec4 SURFACE = vec4(0.0, 0.75, 0.0, 1.0);
        SURFACE = vec4(xffxgfx(pos));

        float RADIUS = 0.4;
        float AA = 5.0;


        vec4 SPACE = vec4(0.0, 0.0, 0.0, 0.0);
        vec4 ATMOSPHERE = vec4(10.0, 2.45, 1.40, 0.5);

        float DARK = 0.75;

        float TERM = .05;

        float HAZE = .015;

        float tscale = 5.0;
        float tmxs = (1. - SS(0.19, 0.49, tax))+(1. - SS(0.7, 0.49, tax));
        float ct = 1.;
        float st = -tmxs;
        vec3 LIGHT = normalize(vec3(ct, st / 5.0, st));

        float rez = min(rezzz.x, rezzz.y);
        vec2 center = rezzz.xy / 2.0;
        vec2 v = (pos.xy - center) / rez;
        v *= MD(tax + PI / 4.3 - (PI / 12.)*(tmxs));
        float l = length(v);
        float diff = l - RADIUS;

        float pixels = AA / rez;
        float aa = 1.0 - SS(-pixels, 0.0, diff);

        vec3 n = vec3(v / RADIUS, 0.0);
        vec4 s;
        if (length(n) < 1.0) {
            n = vec3(n.xy, sqrt(1.0 - n.x * n.x - n.y * n.y));

            float lambert = dot(n, LIGHT)*(1. - tmxs);
            float minnaert = pow(lambert, DARK);
            float toon = SS(-TERM, TERM, minnaert - 0.5);

            s = aa * mix(0.10 * SURFACE, SURFACE, toon);
        } else {
            s = SPACE;
        }

        vec3 p = vec3(v / RADIUS, 0.0);
        vec4 a;
        if (length(p) < 1.0)
            p = vec3(p.xy, sqrt(1.0 - p.x * p.x - p.y * p.y));
        else
            p = normalize(p);

        p = p - vec3(0.0, 0.0, RADIUS + HAZE * RADIUS);

        float haze = SS(0.0, HAZE*RADIUS, diff);
        float backlight = dot(p, LIGHT)*(1. - tmxs);

        a = clamp(backlight, 0.0, 1.0) * mix(ATMOSPHERE.w*ATMOSPHERE, SPACE, haze);

        return (s + a)+col * step((10500. - 2110.) / 2. * zoom, length(pos - (10500.) / 2. * zoom));
    }
    return col;
}




//star1

vec4 st1(vec2 fragCoord) {
    float size = 200.0;
    float I_R = 100.0;
    float F_R = 250.0;
    float R = 250000.;
    vec2 pos = (fragCoord - starpos1 * zoom - shippos);
    if (1. - step((R + I_R + F_R) / 2. * zoom, length(pos - (R) / 2. * zoom)) > 0.) {
        vec2 p = vec2(R * zoom);
        vec2 uv = (pos * size - p * size * 0.5) / (p.y);
        vec2 uv1 = pos / p - 0.5;
        vec4 trr = min(vec4(1.), vec4(vec3(0.2463, 0.254, 0.9729) / dot(uv1, uv1) / 3.59, 1.0));
        float c = 0.0;
        float len = length(uv);
        float alpha = pow(clamp(F_R - len + I_R - 40.0, 0.0, F_R) / F_R, 6.0);
        c += flare(alpha, uv, 1.2637, 1.0)*3.5;
        c = clamp(c, 0.0, 1.0);
        return min(1., max(0., c)) * trr * SS(.5, 0.34, length(uv1));
    }
    return vec4(0.);
}


//star2

vec4 st2(vec2 fragCoord) {
    vec2 pos = (fragCoord - starpos2 * zoom - shippos);
    float R = 100000.;
    if (1. - step((R * 2.) / 2. * zoom, length(pos - (R) / 2. * zoom)) > 0.) {
        float time = iTime;
        vec2 p = vec2(R * zoom);
        vec2 uv1 = pos / p - 0.5;
        p = pos / p.y - 0.35;

        float a = atan(p.y, p.x);
        float r = length(p / 2.) + 0.0001;

        float b = 1.9 * sin(8.0 * r - time - 2.0 * a);
        b = 0.3125 / r + cos(7.0 * a + b * b) / (100.0 * r);
        b *= SS(0.0, 0.4, b);

        vec4 fragColor = vec4(b * .3, .3 * b + 0.2 * sin(a + time), b * 0.5, 1.0);


        p = vec2(R * zoom);
        p = pos / p.y - .628;
        a = atan(p.y, p.x);
        r = length(p / 2.) + 0.0001;

        b = 1.9 * (sin(8.0 * r + time - 2.0 * a));
        b = 0.3125 / r + cos(7.0 * a + b * b) / (100.0 * r);
        b *= SS(0.0, 0.4, b);
        fragColor *= vec4(b * .3, .3 * b + 0.2 * sin(a + time), b * 0.5, 1.0);
        fragColor *= SS(.8, 0.5, length(uv1));
        return fragColor;
    }
    return vec4(0.);
}



//nebula

vec4 nebula(vec2 fragCoord) {
    vec2 pos = (fragCoord - nebulapos * zoom - shippos);
    float R = 50000.;
    if (1. - step((R * 4.) / 2. * zoom, length(pos - (R) / 2. * zoom)) > 0.) {
        vec2 p = vec2(R * zoom);
        vec2 uv = pos / p - 0.15;



        vec2 st = uv * 1.35;


        st += dist(st);
        float t = iTime * .01;

        uv -= vec2(.8, .5);
        st += sign(dot(uv, uv));
        uv += sign(dot(uv, uv));


        float mw = SS(-.5, 1.5, length(uv));




        uv -= sign(dot(uv, uv));

        vec2 n1 = vec2(.2 * t, .2 * t);
        vec2 n2 = vec2(.3 * t, .3 * t);
        vec2 n3 = vec2(.4 * t, .4 * t);

        float r = .23 * fbm(M(t, 2.5) * (1.5 * st + n1));
        float g = .24 * fbm(M(t, 2.0) * (2. * st + n2));
        float b = .26 * fbm(M(t, 1.5) * (1. * st + n3));

        vec4 cl = pow(vec4(r, g, b, 1.), vec4(1.3));
        cl = cl + cl;

        vec4 s = vec4(0.);
        cl = pow(cl + cl, vec4(1.5));
        cl = pow(cl + cl + cl, vec4(1.5))*.7;


        cl = mix(cl + cl, cl * s, .85);

        cl += cl * 2.;
        cl.xyz += .5 * pow(1. - length(uv / 2.), 2.5);

        cl = .9 * clamp(cl, vec4(.0), vec4(1.));

        cl += SS(.0, 1., SS(.7, 1., s));
        float cl1 = fbm((fbm(st * .4) - vec2(t, t)) * 15.) * dist(uv).x;


        cl = mix(cl, cl + cl1 + cl1 + cl1, .6);
        cl += .2 * fbm(vec2(-iTime * .3, iTime * .3) + (uv * 20.));
        cl -= min(cl, vec4(-.3, .0, -.5, 1.));
        cl -= .8 * dot(uv, uv);

        return max(vec4(0.), cl);



    }
    return vec4(0.);
}
//bgd

vec4 background(in vec2 pos) {

    float time = iTime;
    vec2 position = (pos.xy + -0.5 * iResolution.xy) / iResolution.yy;

    float color = pow(noise(pos.xy), 40.0) * 20.0;

    float r1 = noise(pos.xy * noise(vec2(sin(time * 0.01))));
    float r2 = noise(pos.xy * noise(vec2(cos(time * 0.01), sin(time * 0.01))));
    float r3 = noise(pos.xy * noise(vec2(sin(time * 0.05), cos(time * 0.05))));

    vec4 tc = vec4(0.);

    return vec4(vec3(color*r1, color*r2, color * r3), 1.0);

}

vec3 animltmp(in vec3 c) {
    vec3 r = clamp(abs(mod(c.x * 6.0 + vec3(0.0, 0.0, 2.0), 6.0) - 2.0) - 1.0, 0.0, 0.5);
    return c.z * mix(vec3(1.0), r, c.y);
}


//bullet hit effect

vec4 explef(in vec2 fragCoord, vec2 center, float tshift) {
    float R = 125.;
    vec2 pos = (fragCoord - center * zoom - shippos);
    vec2 uv = pos / (R * zoom);
    uv = uv * 2.0 - 0.3;
    uv *= 0.5;
    if (!(step(1., length(uv)) - 1. > -1.)) {
        pos = MD(iTime - tshift) * uv;
        vec2 uxx = pos;
        uxx.y *= 2.;
        uxx.x *= 1.5;
        vec4 ret = vec4(min(vec3(1.), st(pos, tshift) * abs(sin(min(tshift, PI * 0.99)))) * SS(1.6, 0.65, length(uxx)), 1.0);
        ret.y *= 1. * SS(PI * 1.04, PI * 0.9, tshift);
        ret.x *= 1. * SS(PI * 1.0, PI * 0.9, tshift);
        ret.z *= 3. * SS(PI * 1.06, PI * 0.9, tshift);
        return ret;
    }
    return vec4(0.0);

}


//bulets

vec4 player_bullet(vec2 pos, vec2 center, float tshift, float period) {
    vec3 bg1 = vec3(0.);
    vec3 bg = vec3(0.);
    float R = 35.;
    pos = pos - center * zoom - shippos;
    if ((pos.x > 0.)&&(pos.x < R * zoom)&&(pos.y > 0.)&&(pos.y < R * zoom)) {
        vec2 uv = (pos) / (R / 2.);

        uv /= zoom;

        float rotation = tshift * 3.5;
        float rotation1 = rotation + 2.8;
        float tt = 4.6 + tshift / 0.5;

        vec3 fg1 = vec3(4. - 4. * SS(10., 38., period), 1., 1. + 4. * SS(10., 38., period));
        vec3 fg2 = vec3(1., 1., 4.);

        vec2 shift = uv - 1.;
        float shiftLen = length(shift)*1.;
        float shiftAtan = atan(shift.x + cos(tt), shift.y + sin(tt));

        float pct1 = SS(0.5 + 0.4 * (cos(tt)), 1.0, shiftLen);
        float pct2 = SS(0.5 + 0.4 * (sin(tt)), 1.0, shiftLen);

        vec3 fade1 = mix(fg1, bg1, pct1);
        vec3 fade2 = mix(fg2, bg1, pct2);

        float offset = rotation + shiftLen / 1.0;
        float x = sin(offset + shiftAtan * period);
        float val = x;

        vec3 color = mix(bg1, fade1, val) / length(uv);

        offset = rotation1 + shiftLen / 1.0;
        x = sin(offset + shiftAtan * period);
        val = x;
        uv = -1. * zoom + pos / ((R) / 2.);
        uv /= zoom - zoom * SS(36.9, 37.5, period);
        float ccx = abs(step(1., length(uv)) - 1.);

        color = mix(color, fade2, val) / length(uv);
        return vec4(max(vec3(0.0), color) * ccx, 1.0) * SS(38., 36., period);
    }
    return vec4(bg, 1.0);

}

//background+

vec4 movef(vec2 pos) {

    if (paused) return vec4(0., 0., 0., 1.);

    vec2 zz = (shippos + radius / 2.) / (iResolution.xy) - 0.5;
    vec2 p = (pos - (-shippos + iResolution.xy) + radius / 2. + (radius * 3.) * zz) / (iResolution.xy);
    float b = ceil(atan(p.x, p.y) * 6e2), h = cos(b), z = h / dot(p, p);
    return vec4(max(0., min(1., (exp(fract(z + h * b + time) * -1e2) / z)) * abs(length(zz * zoom))));
}

vec4 player(vec4 txeb, vec4 precol, vec4 col, vec4 exbff, vec2 poss) {
    poss = poss - shippos;
    vec2 R = vec2(radius, radius);
    vec2 pos = poss;
    if ((poss.x > 0.)&&(poss.x < R.x)&&(poss.y > 0.)&&(poss.y < R.x)) {



        //ship
        //------------
        pos = (pos * 2. - R) / R.y;
        pos *= MD(angle);
        pos.x = abs(pos.x);

        pos *= MD(1.15);


        vec2 P = vec2(.0, -.8);
        float n = S(.5 - length(vec2(.7 * pos.x, pos.y - .5)))
                - C(pos, P, 1.9)
                + C(pos, P, 1.28)
                - C(pos, P, 1.18)
                + C(pos, P, 1.18 - .04)
                - S(-pos.x * 1.2 + pos.y - .2) * SS((pos.y - .2) - 0.01, (pos.y - .2) + .01, .15);

        n = max(n, 0.) + S(-pos.x + (pos.y + .970) / 4.5) * SS(.0, 0.01, .2 - pos.y);
        n = min(n, 1.);
        n = normalize(n);

        //---------------------

        //shield
        //------------
        vec2 tpos = (poss * 2. - R) / R.y;
        tpos *= MD(angle);
        vec3 c = voronoi(10.0 * tpos);

        float t = iTime / 1.0;
        float scale1 = 0.1;
        float scale2 = 0.1;
        float val = n;
        float len = (length(vec2(.67 * pos.x, pos.y - .05))*1.9);

        val += 2.0 * c.x * (0.5 + 0.5 * sin(64.0 * c.x));


        float glow = 0.020 / (0.015 + distance(len, 1.0));

        vec4 col2 = vec4(0.3 + 2. * (shua ? 1. : 0.) + 03.35 * exbff.r, 0.7 - 0.5 * exbff.g - .3 * (shua ? 1. : 0.), 1. - 0.8 * (shua ? 1. : 0.) - 0.9 * exbff.b, 1.0) - 0.8 * txeb * (1. - min(1., step(len, 1.0)) * val)*(1. - min(1., SS(1., 0.85, len))) + vec4(0., 0., 0.8 * txeb.r * (1. - min(1., step(len, 1.0)) * val)*(1. - min(1., SS(1., 0.85, len))), 1.);
        vec4 col2g = vec4(0.3 - 0.535 * exbff.r + .5 * (shua ? 1. : 0.), 0.7 - 01.875 * exbff.g - .3 * (shua ? 1. : 0.), 1. - 2.25 * exbff.b - 0.8 * (shua ? 1. : 0.), 1.0) + txeb * (1. - min(1., step(len, 1.0)) * val)*(1. - min(1., SS(1.1, 1., len)));



        float i = iTime;
        vec2 uv = poss.xy / (R.x / 2.) - 1.0;
        uv *= MD(angle);
        uv.x = abs(uv.x);
        vec4 cc = vec4(1.);
        float d = length(uv);

        d -= i;
        cc.r = abs(mod(uv.y - uv.x * 2. * d, uv.x * 1.1)) / 2.5;
        cc.g = abs(mod(uv.y - uv.x * 2. * d, uv.x * 1.1)) / 2.5;
        cc.b = abs(mod(uv.y - uv.x * 2. * d, uv.x * 1.1))*2.;


        vec4 tmpc = cc;



        //-------------
        //sphere
        //-----------

        uv = poss.xy / (R.x / 2.) - 1.;
        uv *= MD(angle) * MD(-PI / 2.);

        vec2 p = 15.0 * uv;

        t = iTime * 10.;
        vec3 color = vec3(0.0);
        float lp = length(p);



        vec2 zp = p * 10.;
        vec2 zp2 = 0.2 * zp;
        float ofs = 1.0 / cos(p.y);
        color.b = clamp(1.0, 0.0, (5.0 * sin(zp.x * ofs + t)) - 2.0);
        color.b += clamp(1.0, 0.0, (3.0 * sin(0.9 * zp.x * ofs + t * 0.6)) - 2.5);

        float stencil = ceil(1.0 - clamp(1.0, 0.0, lp));
        float boxstencil = stencil * length(p * sin(zp2.x) * sin(0.4 * t - zp2.y));
        boxstencil = clamp(1.0, 0.0, boxstencil);
        boxstencil += -1.4 + sin(p.y + t * 0.2)*2.0;
        color *= (0.6 * boxstencil * 10.0 * (1.0 - lp));



        color = vec3(color.b * .6, color.b * 0.7, color.b * 3.0);

        color *= 1. - clamp(1.0, 0.0, length(p));
        color = (color + length(p))*(color.r);
        color = clamp(vec3(1.0), vec3(0.0), color);
        tmpc = tmpc + vec4(color, 1.0);

        //------------------




        //laseranim
        //----------------------
        vec2 position = poss.xy / (R.x / 2.) - 1.;

        position *= MD(angle);
        position.y -= 0.55;
        position -= position * 0.5;
        float b = 0.;

        float shotval = animlamp;
        vec3 animlasercolor = vec3(1. * ((shotval - 1.5) / 4.5), 0.05, 0.05 + 0.35 * (1. - (shotval - 1.5) / 4.5));



        float px = pow(4., 1.);
        b += cos(px * (shotval) * PI * (position.x)- (shotval / 2.) * animlcounter) / (px * 2.);
        px = pow(4., 2.);
        b += cos(px * (shotval) * PI * (position.x)- (shotval / 2.) * animlcounter) / (px * 2.);

        b = (0.15 + 0.2 * b) * (0.1 / abs(position.y - 0.045 * b));
        vec3 result = b *animlasercolor;
        result = max(result, 0.4) - 0.4;
        //-----



        //laser
        //-----
        vec4 cl = vec4(0., 0., 0., 1.);
        vec2 ttpos = vec2(0., 0.);
        if (lpower < 20.) {
            vec2 q = (vec2(poss.x - R.x / 2., (poss.y - R.y / 2.)) / (50. * (R.x / 500.)));
            ttpos = vec2(poss.x - R.x / 2., (poss.y - R.y / 2.));
            vec2 uv = (poss - 250. * zoom) / R.y;
            vec2 uv2 = ((lhitpos) * zoom) / R.y;
            ttpos.y -= 20. * (R.x / 500. / zoom);
            ttpos *= MD(angle)*2.;
            q *= MD(angle);
            q.y -= 2.75;
            q.y /= (R.x / 500. / zoom);
            q.x = abs(q.x);
            p = 15. * q;
            float v = 8. * p.x * length(q) + cos(-iTime * 15. + p.y);
            vec3 colx = vec3(0.1 * max(0.0, p.y), step(0.0, (ttpos.y))*0.05 * max(0.0, p.x), step(0.0, (ttpos.y))*0.5 * max(0.0, p.x)) / abs(v * 1. * length(q * (q.x * 15.1)));
            cl = vec4(colx, 1.0)*(1. - color.x) * SS(length(uv2) + 0.05 + 0.20 * (wwh ? 0. : 1.), length(uv2) + 0.15 * (wwh ? 0. : 1.) - 2.55 * SS(0., 5., (length(uv2)))*(wwh ? 0. : 1.), length(uv));
        }
        //----


        //bullet anim
        //----
        vec4 ancl = vec4(0.0);
        if (bulletanimtimer > 0.) {
            uv = (poss.xy) / (R.x / 2.) - 1.;

            uv *= MD(angle);
            uv -= vec2(0., 0.55);
            uv -= uv * 0.5;
            uv.y *= 20.5;
            uv.x *= 5.5;
            uv += sin(uv.x * 10. * (uv.y * 1.11) + iTime * 2.) * 0.15;
            float m = clamp((.7 - abs(uv.y)) * 3., 0., 1.);
            vec3 V;
            V.z = animltmp(vec3((uv.x * 0.1) + bulletanimtimer * 0.725, 1., 2.)).z; //0-1.4
            V *= m;
            V *= 1. - (sin(uv.y * uv.y * 30.) * .26);
            ancl = vec4(V, 1.0);
        }
        //----


        float len1 = (length(vec2(.67 * pos.x, pos.y + .05))*1.9);
        vec4 col1 = mix(vec4(0.), tmpc + vec4(result, 1.0)*0.3, n);
        vec4 ret1 = min(1., step(len, 1.0) * val) * col2 + vec4(result, 1.0) * step(len1, 1.0) + ancl * step(len1, 1.0);
        return mix(ret1, col1, val) + glow * col2g + (cl * ttpos.y / lpower)*(20. - lpower) / lpower + (1. - min(1., step(len, 1.0)) * val)*(min(1., step(len, 1.0))) * precol + (1. - min(1., step(len, 1.0))) * col + 0.3 * txeb * (1. - min(1., step(len, 1.0)) * val)*(1. - min(1., SS(1.4, 1.1, len)));

    } else {

        pos = (pos * 2. - R) / R.y;
        pos *= MD(angle);
        pos.x = abs(pos.x);
        pos *= MD(1.15);
        float len = (length(vec2(.67 * pos.x, pos.y - .05))*1.9);
        float glow = 0.020 / (0.015 + distance(len, 1.0));
        float tmss = max(exbff.z, max(exbff.x, exbff.y));
        //vec4 col2g = vec4(0.3-0.535*exbff.r,0.7-01.875*exbff.g,1.-2.25*exbff.b, 1.0)+txeb;
        vec4 col2g = vec4(0.3 - 0.535 * exbff.r + .5 * (shua ? 1. : 0.), 0.7 - 01.875 * exbff.g - .3 * (shua ? 1. : 0.), 1. - 2.25 * exbff.b - 0.8 * (shua ? 1. : 0.), 1.0) + txeb;


        //laser
        //-----

        if (lpower < 20.) {
            vec2 q = (vec2(poss.x - R.x / 2., (poss.y - R.y / 2.)) / (50. * (R.x / (500.))));
            vec2 ttpos = vec2(poss.x - R.x / 2., (poss.y - R.y / 2.));
            vec2 uv = (poss - 250. * zoom) / R.y;
            vec2 uv2 = ((lhitpos) * zoom) / R.y;

            ttpos.y -= 20. * (R.x / 500. / zoom);
            ttpos *= MD(angle)*2.;
            q *= MD(angle);
            q.y -= 2.75;
            q.y /= (R.x / 500. / zoom);
            q.x = abs(q.x);
            vec2 p = 15. * q;
            float v = 8. * p.x * length(q) + cos(-iTime * 15. + p.y);
            vec3 colx = vec3(0.1 * max(0.0, p.y), step(0.0, (ttpos.y))*0.05 * max(0.0, p.x), step(0.0, (ttpos.y))*0.5 * max(0.0, p.x)) / abs(v * 1. * length(q * (q.x * 15.1)));
            vec4 cl = vec4(colx, 1.0) * SS(length(uv2) + 0.05 + 0.20 * (wwh ? 0. : 1.), length(uv2) + 0.15 * (wwh ? 0. : 1.) - 2.55 * SS(0., 5., (length(uv2)))*(wwh ? 0. : 1.), length(uv));
            //----

            return glow * col2g + col + (cl * ttpos.y / lpower)*(20. - lpower) / lpower + 0.3 * txeb;
        } else {
            return glow * col2g + col + 0.3 * txeb;
        }

    }
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {


    vec4 buff;
    buff = background(fragCoord);
    buff += nebula(fragCoord);

    buff = planet1(buff, fragCoord);
    buff = planet2(buff, fragCoord);
    buff = planet3(buff, fragCoord);
    buff = planet4(buff, fragCoord);
    buff = planet5(buff, fragCoord);
    buff = planet6(buff, fragCoord);


    buff += movef(fragCoord);
    vec4 mcol = buff;
    buff = en3(buff, fragCoord);


    vec4 tccy = vec4(0);
    vec4 tb = mcol;
    vec4 exbff = vec4(0);
    for (int i = 0; i < en1counter; i++) {

        vec4 tvv = en1(vec2(en1posx[i], en1posy[i]), en1timer[i], mcol, buff, fragCoord, en1exval[i], en1lval[i], tb, tccy, en1llisex[i]);
        if (en1llisex[i] || en1exval[i] > 0.) {
            exbff += min(vec4(1.), tvv);
        } else {
            buff = tvv;
            tb = tccy;
        }
    }

    mcol = buff;
    vec4 lux;
    vec4 txeb = vec4(0.);

    for (int i = 0; i < en2counter; i++) {
        buff = en2(mcol, buff, fragCoord, vec2(en2posx[i], en2posy[i]), en2timer[i], lux, en2llishit[i], en2extimer[i]);
        txeb += lux;
    }
    mcol = buff;
    buff += exbff;
    buff += st1(fragCoord);
    buff += st2(fragCoord);
    buff = max(vec4(0.0), buff);
    buff = min(vec4(1.0), buff);
    buff = player(txeb, mcol, buff, exbff, fragCoord);

    for (int i = 0; i < bulletcounter; i++) {
        if (bulletexpl[i]) {
            buff += player_bullet(fragCoord, vec2(bulletposx[i], bulletposy[i]), bullettimer[i], bulletexplctrl[i])*(1. - step(bullettimer[i], TAU));
            buff += explef(fragCoord, vec2(bulletposx[i], bulletposy[i]), bullettimer[i])*(step(bullettimer[i], TAU));
        } else
            buff += player_bullet(fragCoord, vec2(bulletposx[i], bulletposy[i]), bullettimer[i], 1.);

    }

    fragColor = buff;

}

void main(void) {
    vec4 color = vec4(0.0, 0.0, 0.0, 1.0);
    mainImage(color, gl_FragCoord.xy);
    color.w = 1.0;
    gl_FragColor = color;
}
