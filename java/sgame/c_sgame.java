package sgame;
import java.util.LinkedList;
import org.lwjgl.input.Keyboard;
import org.lwjgl.input.Mouse;
import org.lwjgl.opengl.Display;
import org.lwjgl.LWJGLException;
import java.nio.FloatBuffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.IntBuffer;

public class c_sgame {

    static final int maxbullets = 25; //50 best 25 non
    static final int maxen = 25; //25 non best 50 best

    float angle; //ship rotation angle
    float radius; //ship radius
    float shippos[] = new float[2]; //ship coordinates
    float animlamp; //sin parameter for laser anim
    float zoom; //zoom of game board
    float speedx, speedy; //max speed of ship in pizel per sec
    float lpower; //laser power 20 low to 1 max
    float bulletposx[] = new float[maxbullets]; //bullets pos
    float bulletposy[] = new float[maxbullets]; //bullets pos
    float bullethdx[] = new float[maxbullets]; //bullets speed
    float bullethdy[] = new float[maxbullets]; //bullets speed
    float bullettimer[] = new float[maxbullets]; //bullets
    boolean bulletexpl[] = new boolean[maxbullets]; //bullets
    int bulletcounter; //bullets
    float enradius;
    float bulletanimtimer; //0 to 1.4, 0.7 mid
    boolean fast; //graphic
    boolean best; //graphic
//static GLenum iChannel; //texture

    float planetpos1[] = new float[2]; //planets
    float planetpos2[] = new float[2]; //planets
    float planetpos3[] = new float[2]; //planets
    float planetpos4[] = new float[2]; //planets
    float planetpos5[] = new float[2]; //planets
    float planetpos6[] = new float[2]; //planets
    float starpos1[] = new float[2]; //stars
    float starpos2[] = new float[2]; //stars
    float nebulapos[] = new float[2]; //nebula
    float en3pos[] = new float[2]; //enemy
    float lhitpos[] = new float[2]; //laser
    boolean wwh; //laser
    boolean en3hit;

    int en1counter;
    int en2counter;
    float en1posx[] = new float[maxen]; //enemy pos
    float en1posy[] = new float[maxen]; //enemy pos
    float en2posx[] = new float[maxen]; //enemy pos
    float en2posy[] = new float[maxen]; //enemy pos
    float en1thdx[] = new float[maxen];
    float en1thdy[] = new float[maxen];
    float en2thdx[] = new float[maxen];
    float en2thdy[] = new float[maxen];
    float en1timer[] = new float[maxen];
    float en2timer[] = new float[maxen];
    float en2extimer[] = new float[maxen];

    float en1lval[] = new float[maxen]; //1 min .1 max
    float en1exval[] = new float[maxen]; //0 min 1 max
    boolean en1llisex[] = new boolean[maxen];

    boolean en1llisexb[] = new boolean[maxen];
    boolean en1llishit[] = new boolean[maxen];
    int en2llishit[] = new int[maxen];
    boolean shua;

    int tmpen1llisex[] = new int[maxen];
    float tmpen1lval[] = new float[maxen];
    float tmpen1exval[] = new float[maxen];
    int tmpen2llishit[] = new int[maxen];

//needed vars
    float zoomtrig;
    float animlcounter;
    boolean animlampbtn;
    boolean animbulletbtn;
    boolean paused;
    long shifttime = 0;
    float shiftpos[] = new float[2];
    float shspeedx, shspeedy;
    float slowmpos[] = new float[2];
    float camerapos[] = new float[2];
    float scrcenter[] = new float[2];
    boolean bulletalive[] = new boolean[maxbullets];
    boolean en1alive[] = new boolean[maxen];
    boolean en2alive[] = new boolean[maxen];
    float bulletexplctrl[] = new float[maxbullets];
    float tmpbulletexplctrl[] = new float[maxbullets];
    float playzoom;
    float playzoomtrig;
    float tmpbulletposx[] = new float[maxbullets];
    float tmpbulletposy[] = new float[maxbullets];
    boolean en2dd[] = new boolean[maxen];
    boolean isnew[] = new boolean[maxbullets];
    float tmpen1posx[] = new float[maxen];
    float tmpen1posy[] = new float[maxen];
    float tmpen2posx[] = new float[maxen];
    float tmpen2posy[] = new float[maxen];
    float tmpen1timer[] = new float[maxen];
    float tmpen2timer[] = new float[maxen];
    float tmpen2extimer[] = new float[maxen];
    int tmpbulletexpl[] = new int[maxbullets];
    float tmpbullettimer[] = new float[maxbullets];
    float exltimer[] = new float[maxbullets];
    float ta, ta2, ta3;
    float shipthwgr[] = new float[2];
    float shipthwgrt[] = new float[2];
    boolean fullscreen;

//speed/mov control
    float shipth[] = new float[2];
    final float maxth = 20;
    final float slowfact = 1.1f;
    final float movcontrolxy = 0.2f;

    void startposxx() {

        //most of it UNUSED I keep it only for game map understanding
        planetpos2[0] = -65000.f; //r 15k
        planetpos2[1] = -10000.f;
        planetpos1[0] = planetpos2[0] + 8000 + 7500 - 2500; //r 5k
        planetpos1[1] = planetpos2[1] + 8000 + 7500 - 2500;

        planetpos3[0] = -40000.f; //r 20k
        planetpos3[1] = 10000.f;
        planetpos5[0] = planetpos3[0] + 12000 + 10000 - 4000; //r 8k
        planetpos5[1] = planetpos3[1] + 12000 + 10000 - 4000;

        planetpos4[0] = -85000; //r 25k
        planetpos4[1] = 10000;
        planetpos6[0] = planetpos4[0] + 12000 + 12500 - 5250; //r 10500
        planetpos6[1] = planetpos4[1] + 12000 + 12500 - 5250;
        en3pos[0] = planetpos6[0] + 5250.f - 450.f; //r 900
        en3pos[1] = planetpos6[1] + 10500 - 1090.f;

        shippos[0] = planetpos1[0];
        shippos[1] = planetpos1[1];

        starpos1[0] = -65000.f; //r 250k
        starpos1[1] = -45000.f;

        starpos2[0] = -180000; //r 200k
        starpos2[1] = 8000;
        nebulapos[0] = -200000; //r 200k
        nebulapos[1] = 45000.f;
    }

    void initglslvals() {
        fast = false;
        best = false;
        fullscreen = false;
        en3hit = false;
        wwh = false;
        shua = false;
        ta = ta2 = ta3 = 0;
        angle = 0;
        radius = 500;
        enradius = 250;
        animlamp = 1.5f;
        animlampbtn = animbulletbtn = false;
        animlcounter = 0;
        zoom = 1.f;
        zoomtrig = 0;
        speedx = speedy = 0;
        paused = false;
        shifttime = 0;
        lpower = 20;
        bulletanimtimer = 0;
        bulletcounter = en1counter = en2counter = 0;
        playzoom = 1.f;
        playzoomtrig = 0;

        shifttime = System.currentTimeMillis();
        
        startposxx();
        my_setup();

    }

    final float PI = 3.14159265358979323f;

    boolean keystates[] = new boolean[256];

    public static FloatBuffer makeFloatBuffer(float[] arr) {
        ByteBuffer bb = ByteBuffer.allocateDirect(arr.length * 4);
        bb.order(ByteOrder.nativeOrder());
        FloatBuffer fb = bb.asFloatBuffer();
        fb.put(arr);
        fb.position(0);
        return fb;
    }

    public static IntBuffer makeIntBuffer(int[] arr) {
        ByteBuffer bb = ByteBuffer.allocateDirect(arr.length * 4);
        bb.order(ByteOrder.nativeOrder());
        IntBuffer fb = bb.asIntBuffer();
        fb.put(arr);
        fb.position(0);
        return fb;
    }

//-------------
//logic
    class Point {

        public float x;
        public float y;

        Point(float x, float y) {
            this.x = x;
            this.y = y;
        }

        float distance(Point p) {
            float x1 = x;
            float x2 = p.x;
            float y1 = y;
            float y2 = p.y;

            return (float) Math.sqrt(Math.pow((x2 - x1), 2) + Math.pow((y2 - y1), 2));
        }

    }

    class vec2 {

        public float x;
        public float y;

        vec2(float x, float y) {
            this.x = x;
            this.y = y;
        }
    }

    class body {

        public int mass;
        public int radiusin;
        public float maxll;
        public boolean islon = false;
        public boolean miilive = false;
        public int iterator; //element id, 0 player, 1-2 stars, 3-9 planets, 10-maxbulets+10 bullet,  maxbulets+10-maxenemy+.. enemy1,  maxenemy+..-maxenemy+.. enemy2 
        public Point origin; //position
        public vec2 heading; //velocity 
        public float llhitpos[] = new float[2];
        public int llhitid = 0; //bind to LinkedList ID
        public boolean llhit = false;
        public double maxvel = 0; //max speed
        public float orbitpos = 0; //+% orbit radius
        public boolean isstatic = false; //object dont need to be moved
        public boolean hit = false; //hit with other object
        public int hitid = 0; //bind to LinkedList ID
        //int orbitslowdown=0; //% slowdown on orbit 0-100%
        //int velslowdown=0; //% slowdown on movement 0-100% (if maxheading>0)

        body(int mass, int radius, Point position, vec2 heading) {
            this.mass = mass;
            this.radiusin = radius;
            this.origin = position;
            this.heading = heading;
        }

        boolean collides(body p) {
            if ((iterator < 10) || ((iterator >= 10) && (p.iterator != 0) && ((iterator < maxbullets + 10) || (p.iterator < maxbullets + 10)))) {

                Point temp = new Point(origin.x + heading.x, origin.y + heading.y);
                float distance = temp.distance(p.origin);
                if (distance < radiusin + p.radiusin * (1 + orbitpos / 100)) {
                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        }

        void velocityCheck() {
            if (maxvel > 0) {
                if (Math.abs(heading.x) + Math.abs(heading.y) > maxvel) {
                    float pers = (float) (((Math.abs(heading.x) + Math.abs(heading.y)) - maxvel) / maxvel);

                    heading.x = (heading.x) / (1 + pers);
                    heading.y = (heading.y) / (1 + pers);
                }
            }
        }

        void onOrbit(body p) {

            float deltaX = (origin.x + heading.x) - p.origin.x;
            float deltaY = (origin.y + heading.y) - p.origin.y;
            float rad = (float) Math.atan2(deltaY, deltaX);
            float posx = (float) (p.radiusin * (1 + orbitpos / 100) * Math.cos(rad));
            float posy = (float) (p.radiusin * (1 + orbitpos / 100) * Math.sin(rad));

            float deltaX1 = (origin.x) - p.origin.x;
            float deltaY1 = (origin.y) - p.origin.y;
            float rad1 = (float) Math.atan2(deltaY1, deltaX1);
            float posx1 = (float) (p.radiusin * (1 + orbitpos / 100) * Math.cos(rad1));
            float posy1 = (float) (p.radiusin * (1 + orbitpos / 100) * Math.sin(rad1));

            heading.x = posx - posx1;
            heading.y = posy - posy1;
            origin.x = (posx + p.origin.x);
            origin.y = (posy + p.origin.y);

        }

        float[] distance(body p) {
            float horizontalDistance = p.origin.x - origin.x;
            float verticalDistance = p.origin.y - origin.y;
            float ret[] = {horizontalDistance, verticalDistance};
            return ret;

        }

        float calculateGravity(body p) {
            int mass1 = mass;
            int mass2 = p.mass;
            float distanceBetween = origin.distance(p.origin);

            return (float) ((mass1 * mass2) / Math.pow(distanceBetween, 2));
        }

        vec2 findVector(body p) {
            float forceBetween = calculateGravity(p);

            float[] red = distance(p);
            float horizontalDistance = red[0];
            float verticalDistance = red[1];

            float totalDistance = Math.abs(horizontalDistance) + Math.abs(verticalDistance);

            float xComponent = (forceBetween / totalDistance) * horizontalDistance;
            float yComponent = (forceBetween / totalDistance) * verticalDistance;

            vec2 toReturn = new vec2(xComponent, yComponent);

            return toReturn;
        }

        void sumVector(LinkedList<body> dq) {

            if (!miilive) {
                return;
            }
            float tmplhitx[] = new float[dq.size()];
            float tmplhity[] = new float[dq.size()];
            boolean tmpishit[] = new boolean[dq.size()];
            int tmphitid[] = new int[dq.size()];
            llhit = false;
            if (this.islon) {
                for (int i = 0; i < dq.size(); i++) {
                    if (origin.x != dq.get(i).origin.x && origin.y != dq.get(i).origin.y && dq.get(i).miilive) {
                        if (!((dq.get(i).iterator >= 10) && (dq.get(i).iterator < maxbullets + 10))) {

                            float ret[] = new float[2];
                            float tm[] = new float[2];
                            float tm2[] = new float[2];
                            float an = angle;
                            tm[0] = -maxll;
                            ret = rotate2d(tm2, tm, an);
                            float p1[] = {shippos[0], shippos[1]};
                            float p2[] = {shippos[0] + ret[0], shippos[1] + ret[1]};
                            float c[] = {dq.get(i).origin.x, dq.get(i).origin.y};
                            float r = dq.get(i).radiusin;
                            float ret1[] = new float[2];
                            float ret2[] = new float[2];
                            reta axx = interceptOnCircle(p1, p2, c, r);
                            boolean rr = axx.ret0;
                            ret1 = axx.ret1;
                            ret2 = axx.ret2;

                            if (rr) {
                                if (Math.abs(an) > PI / 2) {
                                    tmplhitx[i] = ret1[0] - shippos[0];
                                    tmplhity[i] = ret1[1] - shippos[1];
                                } else {
                                    tmplhitx[i] = ret2[0] - shippos[0];
                                    tmplhity[i] = ret2[1] - shippos[1];
                                }
                            } else {
                                tmplhitx[i] = 0;
                                tmplhity[i] = maxll;
                            }
                            float yyy, zzz, fff;

                            //after fix
                            if (rr) {
                                yyy = angle2d(dq.get(i).origin.x, dq.get(i).origin.y, shippos[0], shippos[1]);

                                boolean cx = false;
                                if ((yyy > -PI / 2) && (yyy < PI / 2)) {
                                    zzz = an - yyy;
                                    if ((zzz > PI / 2)) {
                                        cx = true;
                                    } else if ((zzz < -PI / 2)) {
                                        cx = true;
                                    }
                                } else {
                                    zzz = an + PI - yyy;
                                    if (yyy < 0) {
                                        zzz = -PI - yyy + an;
                                    }
                                    if ((zzz > 0) && (zzz < PI / 2)) {
                                        cx = true;
                                    } else if ((zzz < 0) && (zzz > -PI / 2)) {
                                        cx = true;
                                    }
                                }
                                if (!cx) {
                                    tmplhitx[i] = 0;
                                    tmplhity[i] = maxll;

                                } else {
                                    if (Math.sqrt(Math.abs(tmplhitx[i]) * Math.abs(tmplhitx[i]) + Math.abs(tmplhity[i]) * Math.abs(tmplhity[i])) > maxll) {
                                        tmplhitx[i] = 0;
                                        tmplhity[i] = maxll;
                                    } else {
                                        tmpishit[i] = true;
                                        tmphitid[i] = i;
                                    }
                                }

                            }

                        }
                    }
                }
                float lmax = maxll;
                for (int i = 0; i < dq.size(); i++) {
                    if (tmpishit[i]) {
                        float tlm = (float) Math.sqrt(Math.abs(tmplhitx[i]) * Math.abs(tmplhitx[i]) + Math.abs(tmplhity[i]) * Math.abs(tmplhity[i]));
                        if (tlm < lmax) {
                            lmax = tlm;
                            llhit = true;
                            llhitid = tmphitid[i];
                            llhitpos[0] = tmplhitx[i];
                            llhitpos[1] = tmplhity[i];
                        }
                    }
                }

            }
            if (this.isstatic) {
                return;
            }
            vec2 finalx = new vec2(heading.x, heading.y);

            vec2 temp = new vec2(0, 0);

            if (hit) {

                if (dq.get(hitid).miilive) {
                    velocityCheck();
                    onOrbit(dq.get(hitid));
                    return;
                }
                hit = false;
            }

            for (int i = 0; i < dq.size(); i++) {
                if (origin.x != dq.get(i).origin.x && origin.y != dq.get(i).origin.y) {
                    //collides hit check
                    if (!((dq.get(i).iterator >= 10) && (dq.get(i).iterator < maxbullets + 10))) {
                        if ((iterator == 0) && (dq.get(i).iterator > 10)) {
                            continue;
                        }
                        if ((iterator >= maxbullets + 10) && (dq.get(i).iterator >= maxbullets + 10)) {
                            continue;
                        }
                        if (((iterator < 10) || (iterator >= maxbullets + 10)) && (dq.get(i).iterator == -1)) {
                            continue;
                        }
                        if (dq.get(i).miilive) {
                            if (collides(dq.get(i))) {

                                velocityCheck();
                                onOrbit(dq.get(i));
                                hitid = i;
                                hit = true;
                                finalx.x = 0;
                                finalx.y = 0;
                                break;
                            }
                            temp = findVector(dq.get(i));
                            finalx.x = finalx.x + temp.x;
                            finalx.y = finalx.y + temp.y;
                        }
                    }
                }
            }

            if (hit) {
                return;
            }
            heading = finalx;

            velocityCheck();

            origin.x += heading.x;
            origin.y += heading.y;
            return;
        }

    };

    boolean shouldRotate;
    LinkedList<body> bds=new LinkedList<body>();
    LinkedList<body> bds2=new LinkedList<body>();
    LinkedList<body> bds3=new LinkedList<body>();

    void my_setup() {
        //some of it unused
        shouldRotate = false;
        int mass = 150;
        int mass11 = 0;
        int radiusx = 1;
        Point origin = new Point(shippos[0], shippos[1]);
        vec2 heading = new vec2(0, 0);
        double maxheading = 40;

        body player = new body(mass, radiusx, origin, heading);
        body player1 = new body(mass11, radiusx, origin, heading);
        player1.isstatic = true;
        player1.iterator = 0;
        player1.maxll = radius * 15;
        player1.miilive = true;
        player.maxvel = maxheading;
        player.orbitpos = 0.5f;
        player.iterator = 0;
        player.maxll = radius * 15;
        player.miilive = true;

        int mass1 = 5000000;
        int radius1 = 75000;
        Point origin1 = new Point(starpos1[0] + 125000 - 250, starpos1[1] + 125000 - 250);
        Point origin11 = new Point(starpos1[0] + 125000 - 17, starpos1[1] + 125000 - 17);
        vec2 heading1 = new vec2(0, 0);

        body sun1 = new body(mass1, radius1, origin1, heading1);
        sun1.isstatic = true;
        sun1.iterator = 1;
        sun1.miilive = true;
        body sun11 = new body(mass1, radius1, origin11, heading1);
        sun11.isstatic = true;
        sun11.miilive = true;
        sun11.iterator = 1;

        int mass2 = 1000000;
        int radius2 = 25000;
        Point origin2 = new Point(starpos2[0] + 50000 - 250, starpos2[1] + 50000 - 250);
        Point origin22 = new Point(starpos2[0] + 50000 - 17, starpos2[1] + 50000 - 17);
        vec2 heading2 = new vec2(0, 0);

        body sun2 = new body(mass2, radius2, origin2, heading2);
        sun2.isstatic = true;
        sun2.iterator = 2;
        sun2.miilive = true;
        body sun22 = new body(mass2, radius2, origin22, heading2);
        sun22.isstatic = true;
        sun22.iterator = 2;
        sun22.miilive = true;

        int mass4 = 10000;
        int radius4 = 2500;
        Point origin4 = new Point(planetpos1[0] + 2500 - 250, planetpos1[1] + 2500 - 250);
        vec2 heading4 = new vec2(0, 0);

        body planet1 = new body(mass4, radius4, origin4, heading4);
        planet1.isstatic = true;
        planet1.iterator = 3;
        planet1.miilive = true;

        int mass5 = 60000;
        int radius5 = 7500;
        Point origin5 = new Point(planetpos2[0] + 7500 - 250, planetpos2[1] + 7500 - 250);
        vec2 heading5 = new vec2(0, 0);

        body planet2 = new body(mass5, radius5, origin5, heading5);
        planet2.isstatic = true;
        planet2.iterator = 4;
        planet2.miilive = true;

        int mass6 = 70000;
        int radius6 = 10000;
        Point origin6 = new Point(planetpos3[0] + 10000 - 250, planetpos3[1] + 10000 - 250);
        vec2 heading6 = new vec2(0, 0);

        body planet3 = new body(mass6, radius6, origin6, heading6);
        planet3.isstatic = true;
        planet3.iterator = 5;
        planet3.miilive = true;

        int mass7 = 80000;
        int radius7 = 12500;
        Point origin7 = new Point(planetpos4[0] + 12500 - 250, planetpos4[1] + 12500 - 250);
        vec2 heading7 = new vec2(0, 0);

        body planet4 = new body(mass7, radius7, origin7, heading7);
        planet4.isstatic = true;
        planet4.iterator = 6;
        planet4.miilive = true;

        int mass8 = 15000;
        int radius8 = 4000;
        Point origin8 = new Point(planetpos5[0] + 4000 - 250, planetpos5[1] + 4000 - 250);
        vec2 heading8 = new vec2(0, 0);

        body planet5 = new body(mass8, radius8, origin8, heading8);
        planet5.isstatic = true;
        planet5.iterator = 7;
        planet5.miilive = true;

        int mass9 = 15000;
        int radius9 = 4250;
        Point origin9 = new Point(planetpos6[0] + 5250 - 250, planetpos6[1] + 5250 - 250);
        vec2 heading9 = new vec2(0, 0);

        body planet6 = new body(mass9, radius9, origin9, heading9);
        planet6.isstatic = true;
        planet6.iterator = 8;
        planet6.miilive = true;

        int mass111 = 1;
        int radius11 = 500;
        Point origin111 = new Point(en3pos[0] - 250, en3pos[1] - 250);
        vec2 heading11 = new vec2(0, 0);

        body en3x = new body(mass111, radius11, origin111, heading11);
        en3x.isstatic = true;
        en3x.iterator = -1;
        en3x.miilive = true;

        bds.push(sun1);
        bds.push(sun2);
        bds.push(player);
        bds.push(en3x);
        bds.push(planet1);
        bds.push(planet2);
        bds.push(planet3);
        bds.push(planet4);
        bds.push(planet5);
        bds.push(planet6);

        bds2.push(sun11);
        bds2.push(sun22);
        bds2.push(player1);
        bds2.push(en3x);

        bds2.push(planet1);
        bds2.push(planet2);
        bds2.push(planet3);
        bds2.push(planet4);
        bds2.push(planet5);
        bds2.push(planet6);

        bds3.push(sun11);
        bds3.push(sun22);
        bds3.push(en3x);
        bds3.push(planet1);
        bds3.push(planet2);
        bds3.push(planet3);
        bds3.push(planet4);
        bds3.push(planet5);
        bds3.push(planet6);

        for (int i = 0; i < maxbullets; i++) {
            int mass10 = 100;
            int radius10 = 1;
            Point origin10 = new Point(0, 0);
            vec2 heading10 = new vec2(0, 0);

            body bulletx = new body(mass10, radius10, origin10, heading10);
            bulletx.iterator = i + 10;
            bulletx.isstatic = true;
            bulletx.miilive = false;

            bds2.push(bulletx);
        }

        for (int i = 0; i < maxen; i++) {
            int mass10 = 50;
            int radius10 = 105;
            int radius101 = 1;
            Point origin10 = new Point(0, 0);
            vec2 heading10 = new vec2(0, 0);

            body enx = new body(mass10, radius10, origin10, heading10);
            body enxx = new body(mass10, radius101, origin10, heading10);
            enx.iterator = i + 10 + maxbullets;
            enx.isstatic = true;
            enx.miilive = false;
            enxx.iterator = i + 10 + maxbullets;
            enxx.isstatic = true;
            enxx.miilive = false;

            bds2.push(enx);
            bds.push(enx);
            bds3.push(enxx);

            int mass12 = 100;
            int radius12 = 95;
            int radius121 = 1;
            Point origin12 = new Point(0, 0);
            vec2 heading12 = new vec2(0, 0);

            body en2x = new body(mass12, radius12, origin12, heading12);
            body en2xx = new body(mass12, radius121, origin12, heading12);
            en2x.iterator = i + 10 + maxbullets + maxen;
            en2x.isstatic = true;
            en2x.miilive = false;
            en2xx.iterator = i + 10 + maxbullets + maxen;
            en2xx.isstatic = true;
            en2xx.miilive = false;

            bds2.push(en2x);
            bds.push(en2x);
            bds3.push(en2xx);

        }
    }

//----------
    float[] rotate2d(float[] origin, float[] point, float radian) {

        float s = (float) Math.sin(radian);
        float c = (float) Math.cos(radian);
        point[0] -= origin[0];
        point[1] -= origin[1];
        float xnew = point[0] * c - point[1] * s;
        float ynew = point[0] * s + point[1] * c;
        float[] retval = new float[2];
        retval[0] = xnew + origin[0];
        retval[1] = ynew + origin[1];
        return retval;

    }

    float angle2d(float cx, float cy, float ex, float ey) {
        float dy = ey - cy;
        float dx = ex - cx;
        float theta = (float) Math.atan2(dy, dx);
        return theta;
    }

    class reta {

        boolean ret0;
        float[] ret1 = new float[2];
        float[] ret2 = new float[2];

    }

    reta interceptOnCircle(float[] p1, float[] p2, float[] c, float r) {

        float p3[] = {p1[0] - c[0], p1[1] - c[1]};
        float p4[] = {p2[0] - c[0], p2[1] - c[1]};
        reta retx = new reta();
        float m = (p4[0] - p3[0]) == 0 ? 1000000 : (p4[1] - p3[1]) / (p4[0] - p3[0]);
        //float m = (p4[1] - p3[1]) / (p4[0] - p3[0]);
        float b = p3[1] - m * p3[0];

        float underRadical = (float) (Math.pow(r, 2) * Math.pow(m, 2) + Math.pow(r, 2) - Math.pow(b, 2));

        if (underRadical < 0) {
            retx.ret0 = false;
            return retx;
        } else {
            float t1 = (float) ((-m * b + Math.sqrt(underRadical)) / (Math.pow(m, 2) + 1));
            float t2 = (float) ((-m * b - Math.sqrt(underRadical)) / (Math.pow(m, 2) + 1));
            float i1[] = {t1 + c[0], m * t1 + b + c[1]};
            float i2[] = {t2 + c[0], m * t2 + b + c[1]};
            retx.ret1[0] = i1[0];
            retx.ret1[1] = i1[1];
            retx.ret2[0] = i2[0];
            retx.ret2[1] = i2[1];
            retx.ret0 = true;
            return retx;
        }
    }

//---------
//draw
    /* x, y, x_press, y_press  (in target coords) */
    static double mouse[] = new double[4];

//static GLint prog = 0;
    void
            mouse_press_handler() {

        int x0, y0, height;
        // Wheel reports as button 3(scroll up) and button 4(scroll down)
        int mwh=Mouse.getDWheel();
            
        if ((mwh > 0) || (mwh < 0)) { // It's a wheel event
            if (paused) {
                zoomtrig = (float) ((mwh > 0) ? 0.01 * zoom + zoom / 200 : -(0.01 * zoom + zoom / 200));
            } else {
                playzoomtrig = (float) ((mwh > 0) ? 0.01 * playzoom + playzoom / 200 : -(0.01 * playzoom + playzoom / 200));

            }

        }
        animbulletbtn = false;
        animlampbtn = false;
        if (Mouse.isButtonDown(0)) {
            animbulletbtn = true;
            animlampbtn = false;

        } else {
            if (Mouse.isButtonDown(1)) {
                animlampbtn = true;
                animbulletbtn = false;

            }
        }
    }

    void
            mouse_move_handler() {

        int height;
        height = Display.getHeight();

        if (animlampbtn) {

            mouse[0] = slowmpos[0] = Mouse.getX();;
            mouse[1] = slowmpos[1] =  Mouse.getY();
        } else {
            mouse[0] = slowmpos[0] = Mouse.getX();;
            mouse[1] = slowmpos[1] =  Mouse.getY();
        }

    }

    void close() {
        System.exit(0);
    }

    void
            keyboard_up_handler() {

        int key = -1;
        key=Keyboard.isKeyDown(Keyboard.KEY_A)?Keyboard.KEY_A:Keyboard.isKeyDown(Keyboard.KEY_W)?Keyboard.KEY_W:Keyboard.isKeyDown(Keyboard.KEY_D)?Keyboard.KEY_D:Keyboard.isKeyDown(Keyboard.KEY_S)?Keyboard.KEY_S:-1;
        key=Keyboard.isKeyDown(Keyboard.KEY_P)?Keyboard.KEY_P:Keyboard.isKeyDown(Keyboard.KEY_R)?Keyboard.KEY_R:Keyboard.isKeyDown(Keyboard.KEY_F)?Keyboard.KEY_F:key;
        
        switch (key) {
            case Keyboard.KEY_A:
                if (keystates['d'] || keystates['d']) {
                    keystates['d'] = keystates['D'] = false;
                }keystates['a'] = keystates['A'] = true;
                break;
            case Keyboard.KEY_D:
                if (keystates['a'] || keystates['A']) {
                    keystates['a'] = keystates['A'] = false;
                }keystates['d'] = keystates['D'] = true;
                break;
            case Keyboard.KEY_W:
                if (keystates['s'] || keystates['S']) {
                    keystates['s'] = keystates['S'] = false;
                }
                keystates['w'] = keystates['W'] = true;
                break;
            case Keyboard.KEY_S:
                if (keystates['w'] || keystates['W']) {
                    keystates['w'] = keystates['W'] = false;
                }
                keystates['s'] = keystates['S'] = true;
                break;
            case Keyboard.KEY_R:
                playzoom = zoom = 1;
                shiftpos[0] = shiftpos[1] = 0;
                shspeedx = 0;
                shspeedx = 0;
                zoomtrig = 0;
                playzoomtrig = 0;
                break;
            case Keyboard.KEY_ESCAPE:
                /* Escape */
                //close();
                break;

            case Keyboard.KEY_F:
                //glutFullScreenToggle(); //non wasm
                fullscreen = !fullscreen;
                try {
                    if (fullscreen) {
                        Display.setFullscreen(true);
                    } else {
                        Display.setFullscreen(false);
                    }
                } catch (LWJGLException ex) {

                }
                break;
            case Keyboard.KEY_P:
                paused = !paused;

                if (paused) {
                    shifttime = (System.currentTimeMillis()  - shifttime);
                } else {
                    shifttime = (System.currentTimeMillis() - shifttime) ;
                }
                ;
                break;

            default:
                keystates['w'] = keystates['W'] =keystates['s'] = keystates['S'] =keystates['a'] = keystates['A'] =keystates['d'] = keystates['D'] = false;
                break;
        }
    }

    void cameraposs(int width, int height) {
        if (!paused) {
            if (shipth[0] <= 0) {
                camerapos[0] = -scrcenter[0] * ((float) shipth[0] / maxth);
            }
            if (shipth[0] > 0) {
                camerapos[0] = -scrcenter[0] * ((float) shipth[0] / maxth);
            }
            if (shipth[1] <= 0) {
                camerapos[1] = -scrcenter[1] * ((float) shipth[1] / maxth);
            }
            if (shipth[1] > 0) {
                camerapos[1] = -scrcenter[1] * ((float) shipth[1] / maxth);
            }
            camerapos[0] -= shippos[0];
            camerapos[1] -= shippos[1];
        } else {
            camerapos[0] = -shippos[0];
            camerapos[1] = -shippos[1];
        }

        /*if(!paused){
        if(mouse[0]<width/2){camerapos[0]=scrcenter[0]-scrcenter[0]*((float)mouse[0]/(width/2));}
        if(mouse[0]>width/2){camerapos[0]=-scrcenter[0]*((float)(mouse[0]-width/2)/(width/2));}
        if(mouse[1]<height/2){camerapos[1]=scrcenter[1]-scrcenter[1]*((float)mouse[1]/(height/2));}
        if(mouse[1]>height/2){camerapos[1]=-scrcenter[1]*((float)(mouse[1]-height/2)/(height/2));}
        camerapos[0]-=shippos[0];
        camerapos[1]-=shippos[1];
    }*/
    }
    static boolean cd;
    static float lasttime;
    static boolean laspam;
    static boolean lewfe1[] = new boolean[maxen];
    static boolean lewfe2[] = new boolean[maxen];
    static float lewtimen1[] = new float[maxen];
    static float lewtimen2[] = new float[maxen];

    void spawnenemy(float pass) {

        if (!paused) {
            //if ((ta < PI / 3.)&&(ta > 0.10))
            {
                lasttime += pass;
                if (lasttime > pass * 120) {
                    cd = false;
                }
                for (int ii = 0; ii < maxen; ii++) {
                    if (cd) {
                        break;
                    }
                    if (laspam) {

                        if (!en2alive[ii]) {

                            float tm[] = new float[2];
                            float tm2[] = new float[2];
                            tm[0] = planetpos4[0] + 12000 + 12500;
                            tm[1] = planetpos4[1] + 12000 + 12500;
                            tm2[0] = planetpos4[0] + 12500;
                            tm2[1] = planetpos4[1] + 12500;
                            float ret[] = new float[2];
                            ret = rotate2d(tm2, tm, ta - PI / 2.5f);
                            en2posx[ii] = ret[0];
                            en2posy[ii] = ret[1];
                            if ((Math.sqrt(Math.pow(Math.abs(en2posx[ii] - shippos[0]) + Math.abs(en2posy[ii] - shippos[1]), 2)) > 35000)) {
                                cd = true;
                                break;
                            }

                            en2thdx[ii] = 0;
                            en2thdy[ii] = 0;
                            en2alive[ii] = true;
                            en2timer[ii] = 0;
                            lewtimen2[ii] = 0;
                            lewfe2[ii] = false;
                            en2dd[ii] = false;
                            en2extimer[ii] = 0;
                            cd = true;
                            lasttime = 0;
                            en2llishit[ii] = false ? 1 : 0;

                            laspam = !laspam;
                        }
                    } else if (!en1alive[ii]) {
                        float tm[] = new float[2];
                        float tm2[] = new float[2];
                        tm[0] = planetpos4[0] + 12000 + 12500;
                        tm[1] = planetpos4[1] + 12000 + 12500;
                        tm2[0] = planetpos4[0] + 12500;
                        tm2[1] = planetpos4[1] + 12500;
                        float ret[] = new float[2];
                        ret = rotate2d(tm2, tm, ta - PI / 2.5f);
                        en1posx[ii] = ret[0];
                        en1posy[ii] = ret[1];
                        if ((Math.sqrt(Math.pow(Math.abs(en1posx[ii] - shippos[0]) + Math.abs(en1posy[ii] - shippos[1]), 2)) > 35000)) {
                            cd = true;
                            break;
                        }

                        en1thdx[ii] = 0;
                        en1thdy[ii] = 0;
                        en1alive[ii] = true;
                        en1timer[ii] = 0;
                        cd = true;
                        lasttime = 0;
                        en1lval[ii] = 1;
                        en1exval[ii] = 0;
                        en1llishit[ii] = false;
                        lewtimen1[ii] = 0;
                        en1llisex[ii] = false;
                        en1llisexb[ii] = false;
                        lewfe1[ii] = false;
                        laspam = !laspam;

                    }
                    if (ii == maxen - 1) {
                        laspam = !laspam;
                        cd = true;
                    }
                }
            }
        }

        if (!paused) {
            en1counter = 0;
            en2counter = 0;
            for (int ii = 0; ii < maxen; ii++) {
                if (en2alive[ii]) {
                    en2timer[ii] += pass;
                    tmpen2timer[en2counter] = en2timer[ii];
                    float ret[] = new float[2];
                    float tm[] = new float[2];
                    float tm2[] = new float[2];
                    float an = angle2d(shippos[0], shippos[1], en2posx[ii] - 125, en2posy[ii] - 125);

                    float tf = (float) (Math.sqrt(Math.pow(Math.abs(en2posx[ii] - shippos[0] - 125) + Math.abs(en2posy[ii] - shippos[1] - 125), 2)));
                    tm[0] = -25;
                    if (tf < 800) {
                        lewfe2[ii] = true;
                    }
                    if (!lewfe2[ii]) {
                        ret = rotate2d(tm2, tm, an);
                        en2thdx[ii] += ret[0] / 250;
                        en2thdy[ii] += ret[1] / 250;
                    } else {
                        en2thdx[ii] = en2thdx[ii] / 1.01f;
                        en2thdy[ii] = en2thdy[ii] / 1.01f;
                        lewtimen2[ii] += pass;
                        if (lewtimen2[ii] > pass * 10) {
                            lewtimen2[ii] = 0;
                            lewfe2[ii] = tf < 100;

                        }
                    }
                    if (en2dd[ii]) {
                        en2thdx[ii] = 0;
                        en2thdy[ii] = 0;
                    }
                    tmpen2posx[en2counter] = en2posx[ii] = en2posx[ii] + en2thdx[ii];
                    tmpen2posy[en2counter] = en2posy[ii] = en2posy[ii] + en2thdy[ii];
                    tmpen2posx[en2counter] += -shippos[0];
                    tmpen2posy[en2counter] += -shippos[1];
                    tmpen2llishit[en2counter] = en2llishit[ii];
                    tmpen2extimer[en2counter] = en2extimer[ii];
                    if (en2dd[ii]) {
                        en2extimer[ii] += 0.016;
                        if (en2extimer[ii] > 1.25) {
                            en2alive[ii] = false;
                            //fprintf(stderr, "mii dead\n");
                        }

                    }
                    if ((en2llishit[ii] == 1) || (tf < 1500)) {

                        if (en2llishit[ii] == 1) {
                            en2thdx[ii] = en2thdx[ii] / 1.1f;
                            en2thdy[ii] = en2thdy[ii] / 1.1f;
                        } else {
                            en2thdx[ii] = en2thdx[ii] / 1.01f;
                            en2thdy[ii] = en2thdy[ii] / 1.01f;
                        }

                    }
                    if ((tf > 35000)) {
                        en2dd[ii] = true;
                    }
                    en2llishit[ii] = false ? 1 : 0;

                    en2counter++;
                }

                if (en1alive[ii]) {
                    en1timer[ii] += pass;
                    tmpen1timer[en1counter] = en1timer[ii];
                    float ret[] = new float[2];
                    float tm[] = new float[2];
                    float tm2[] = new float[2];
                    float an = angle2d(shippos[0], shippos[1], en1posx[ii] - 125, en1posy[ii] - 125);

                    float tf = (float) (Math.sqrt(Math.pow(Math.abs(en1posx[ii] - shippos[0] - 125) + Math.abs(en1posy[ii] - shippos[1] - 125), 2)));
                    tm[0] = -25;
                    if (tf < 800) {
                        lewfe1[ii] = true;
                    }
                    if (!lewfe1[ii]) {
                        ret = rotate2d(tm2, tm, an);
                        en1thdx[ii] += ret[0] / 150;
                        en1thdy[ii] += ret[1] / 150;
                    } else {
                        lewtimen1[ii] += pass;
                        if (lewtimen1[ii] > pass * 10) {
                            lewtimen1[ii] = 0;
                            lewfe1[ii] = tf < 800;

                        }
                    }
                    if (en1llisex[ii]) {
                        en1thdx[ii] = 0;
                        en1thdy[ii] = 0;

                    }
                    tmpen1posx[en1counter] = en1posx[ii] = en1posx[ii] + en1thdx[ii];
                    tmpen1posy[en1counter] = en1posy[ii] = en1posy[ii] + en1thdy[ii];
                    tmpen1posx[en1counter] += -shippos[0];
                    tmpen1posy[en1counter] += -shippos[1];
                    if (en1llishit[ii] || (tf > 35000) || (tf < 1500)) {
                        if (en1llishit[ii]) {
                            en1thdx[ii] = en1thdx[ii] / 1.1f;
                            en1thdy[ii] = en1thdy[ii] / 1.1f;
                        } else {
                            en1thdx[ii] = en1thdx[ii] / 1.01f;
                            en1thdy[ii] = en1thdy[ii] / 1.01f;
                        }

                        if (!en1llisex[ii]) {
                            if (en1lval[ii] > 0.1) {
                                en1lval[ii] -= 0.006;
                            } else {
                                en1llisex[ii] = true;

                            }
                        }

                    }
                    if (en1llisex[ii]) {
                        if (!en1llisexb[ii]) {
                            en1exval[ii] += 0.1;
                            if (en1exval[ii] > 8) {
                                en1llisexb[ii] = true;
                            }
                        } else {
                            en1exval[ii] -= 0.15 - 0.145 * (en1exval[ii] / 8);
                            if (en1exval[ii] < 0.05) {
                                en1alive[ii] = false;
                            }
                        }
                    }
                    tmpen1lval[en1counter] = en1lval[ii];
                    tmpen1exval[en1counter] = en1exval[ii];
                    tmpen1llisex[en1counter] = en1llisexb[ii] ? 1 : 0;
                    en1llishit[ii] = false;

                    en1counter++;
                }
            }
        }

    }

    void staticplanetsmov() {
        if (!paused) {
            float ret[] = new float[2];
            float tm[] = new float[2];
            float tm2[] = new float[2];
            tm[0] = planetpos2[0] + 8000 + 7500;
            tm[1] = planetpos2[1] + 8000 + 7500;
            tm2[0] = planetpos2[0] + 7500;
            tm2[1] = planetpos2[1] + 7500;

            ta += ta > 2 * PI ? -2 * PI + PI / 8000 : PI / 8000;
            ret = rotate2d(tm2, tm, ta);
            planetpos1[0] = ret[0] - 2500;
            planetpos1[1] = ret[1] - 2500;

            tm[0] = planetpos3[0] + 12000 + 10000;
            tm[1] = planetpos3[1] + 12000 + 10000;
            tm2[0] = planetpos3[0] + 10000;
            tm2[1] = planetpos3[1] + 10000;
            ta2 += ta2 > 2 * PI ? -2 * PI + PI / 10000 : PI / 10000;
            ret = rotate2d(tm2, tm, -ta2);
            planetpos5[0] = ret[0] - 4000;
            planetpos5[1] = ret[1] - 4000;

            tm[0] = planetpos4[0] + 12000 + 12500;
            tm[1] = planetpos4[1] + 12000 + 12500;
            tm2[0] = planetpos4[0] + 12500;
            tm2[1] = planetpos4[1] + 12500;
            ret = rotate2d(tm2, tm, ta - PI / 2f);
            planetpos6[0] = ret[0] - 5250;
            planetpos6[1] = ret[1] - 5250;

            tm[0] = (float) (planetpos6[0] + 5250 + 2625 + 450 - 150.);
            tm[1] = (float) (planetpos6[1] + 5250 + 2625 + 450 - 150.);
            tm2[0] = (float) (planetpos6[0] + 5250);
            tm2[1] = (float) (planetpos6[1] + 5250);

            ret = rotate2d(tm2, tm, -ta - PI / 2.25f);
            en3pos[0] = ret[0];
            en3pos[1] = ret[1];

            tm[0] = (float) (planetpos6[0] + 5250 + 2625 + 450 - 150. + 300);
            tm[1] = (float) (planetpos6[1] + 5250 + 2625 + 450 - 150. + 300);
            tm2[0] = planetpos6[0] + 5250;
            tm2[1] = planetpos6[1] + 5250;

            ret = rotate2d(tm2, tm, -ta - PI / 2.25f - 0.11f);

            float txxx[] = new float[2];
            txxx[0] = ret[0];
            txxx[1] = ret[1];

            for (int i = 0; i < bds.size(); i++) {
                if (bds.get(i).iterator == -1) {
                    bds.get(i).origin.x = txxx[0] - 250;
                    bds.get(i).origin.y = txxx[1] - 250;
                };
                if (bds.get(i).iterator == 3) {
                    bds.get(i).origin.x = planetpos1[0] + 2500 - 250;
                    bds.get(i).origin.y = planetpos1[1] + 2500 - 250;
                };
                if (bds.get(i).iterator == 4) {
                    bds.get(i).origin.x = planetpos2[0] + 7500 - 250;
                    bds.get(i).origin.y = planetpos2[1] + 7500 - 250;
                };
                if (bds.get(i).iterator == 5) {
                    bds.get(i).origin.x = planetpos3[0] + 10000 - 250;
                    bds.get(i).origin.y = planetpos3[1] + 10000 - 250;
                };
                if (bds.get(i).iterator == 6) {
                    bds.get(i).origin.x = planetpos4[0] + 12500 - 250;
                    bds.get(i).origin.y = planetpos4[1] + 12500 - 250;
                };
                if (bds.get(i).iterator == 7) {
                    bds.get(i).origin.x = planetpos5[0] + 4000 - 250;
                    bds.get(i).origin.y = planetpos5[1] + 4000 - 250;
                };
                if (bds.get(i).iterator == 8) {
                    bds.get(i).origin.x = planetpos6[0] + 5250 - 250;
                    bds.get(i).origin.y = planetpos6[1] + 5250 - 250;
                };
            }

            for (int i = 0; i < bds2.size(); i++) {
                if (bds2.get(i).iterator == 0) {
                    bds2.get(i).origin.x = shippos[0];
                    bds2.get(i).origin.y = shippos[1];
                };
                if (bds2.get(i).iterator == 3) {
                    bds2.get(i).origin.x = planetpos1[0] + 2500 - 17;
                    bds2.get(i).origin.y = planetpos1[1] + 2500 - 17;
                };
                if (bds2.get(i).iterator == 4) {
                    bds2.get(i).origin.x = planetpos2[0] + 7500 - 17;
                    bds2.get(i).origin.y = planetpos2[1] + 7500 - 17;
                };
                if (bds2.get(i).iterator == 5) {
                    bds2.get(i).origin.x = planetpos3[0] + 10000 - 17;
                    bds2.get(i).origin.y = planetpos3[1] + 10000 - 17;
                };
                if (bds2.get(i).iterator == 6) {
                    bds2.get(i).origin.x = planetpos4[0] + 12500 - 17;
                    bds2.get(i).origin.y = planetpos4[1] + 12500 - 17;
                };
                if (bds2.get(i).iterator == 7) {
                    bds2.get(i).origin.x = planetpos5[0] + 4000 - 17;
                    bds2.get(i).origin.y = planetpos5[1] + 4000 - 17;
                };
                if (bds2.get(i).iterator == 8) {
                    bds2.get(i).origin.x = planetpos6[0] + 5250 - 17;
                    bds2.get(i).origin.y = planetpos6[1] + 5250 - 17;
                };
                if (bds2.get(i).iterator == -1) {
                    bds2.get(i).origin.x = txxx[0] - 17;
                    bds2.get(i).origin.y = txxx[1] - 17;
                };
            }

            for (int i = 0; i < bds3.size(); i++) {

                if (bds3.get(i).iterator == 3) {
                    bds3.get(i).origin.x = planetpos1[0] + 2500 - 125;
                    bds3.get(i).origin.y = planetpos1[1] + 2500 - 125;
                };
                if (bds3.get(i).iterator == 4) {
                    bds3.get(i).origin.x = planetpos2[0] + 7500 - 125;
                    bds3.get(i).origin.y = planetpos2[1] + 7500 - 125;
                };
                if (bds3.get(i).iterator == 5) {
                    bds3.get(i).origin.x = planetpos3[0] + 10000 - 125;
                    bds3.get(i).origin.y = planetpos3[1] + 10000 - 125;
                };
                if (bds3.get(i).iterator == 6) {
                    bds3.get(i).origin.x = planetpos4[0] + 12500 - 125;
                    bds3.get(i).origin.y = planetpos4[1] + 12500 - 125;
                };
                if (bds3.get(i).iterator == 7) {
                    bds3.get(i).origin.x = planetpos5[0] + 4000 - 125;
                    bds3.get(i).origin.y = planetpos5[1] + 4000 - 125;
                };
                if (bds3.get(i).iterator == 8) {
                    bds3.get(i).origin.x = planetpos6[0] + 5250 - 125;
                    bds3.get(i).origin.y = planetpos6[1] + 5250 - 125;
                };
                if (bds3.get(i).iterator == -1) {
                    bds3.get(i).origin.x = txxx[0] - 17;
                    bds3.get(i).origin.y = txxx[1] - 17;
                };
            }

        }
    }

    void allkeys_movement() {
        float x = 0;
        float y = 0;
        int maxx = 10;

        if (Keyboard.isKeyDown(Keyboard.KEY_1)) {
            if (paused) {
                zoomtrig += 0.0005 * zoom + zoom / 200;
            } else {
                playzoomtrig += 0.0005 * zoom + playzoom / 200;
            }
        }
        if (Keyboard.isKeyDown(Keyboard.KEY_2)) {
            if (paused) {
                zoomtrig -= 0.0005 * zoom + 0.1 * zoom / 200;
            } else {
                playzoomtrig -= 0.0005 * zoom + 0.1 * playzoom / 200;
            }
        }
        if (keystates['d'] || keystates['D']) {
            x += movcontrolxy;
        }
        if (keystates['a'] || keystates['A']) {
            x -= movcontrolxy;
        }
        if (!((keystates['d'] || keystates['D']) || (keystates['a'] || keystates['A']))) {
            speedx /= slowfact;
            shspeedx /= 1.1;
        };
        if (keystates['w'] || keystates['W']) {
            y += movcontrolxy;
        }
        if (keystates['s'] || keystates['S']) {
            y -= movcontrolxy;
        }
        if (!((keystates['w'] || keystates['W']) || (keystates['s'] || keystates['S']))) {
            speedy /= slowfact;
            shspeedy /= 1.1;
        };
        if (!paused) {
            zoomtrig = 0;
            playzoomtrig /= 1.1;
            float lt = playzoom;
            playzoom += ((playzoom + playzoomtrig > 0.02) && (playzoom + playzoomtrig < 2)) ? playzoomtrig : 0;
            if (!((lt + playzoomtrig > 0.02) && (lt + playzoomtrig < 2))) {
                playzoomtrig = 0;
            }
            zoom = playzoom;
            shiftpos[0] = shiftpos[1] = 0;
            shspeedx = 0;
            shspeedx = 0;
            if (Math.abs(speedx + x) < maxx) {
                speedx += x / 10;
            }
            if (Math.abs(speedy + y) < maxx) {
                speedy += y / 10;
            }
            shipth[0] += speedx;
            shipth[1] += speedy;
            animlamp += (animlampbtn) ? ((animlamp < 5.5) ? 0.2 : 0 * (animlcounter += 0.2)) : (animlamp > 1.5) ? -0.2 : 0 * (animlcounter += 0.2);
            animlcounter = (animlcounter > (0.87901 * PI) * PI) ? 0 : animlcounter;
            lpower = (float) ((animlampbtn) ? ((lpower > 5) ? lpower - 1 : 5) : ((lpower < 19) ? lpower + 1.5 : 20));

        } else {
            playzoomtrig = 0;
            playzoom = (float) (((zoom > 0.02) && (zoom < 2)) ? zoom : (zoom >= 1 ? 2 : 0.02));
            float tvalx = 1;
            if (zoom > 1) {
                tvalx = 4 / zoom;
            } else {
                tvalx = 300 / zoom;
            }

            if (Math.abs(shspeedx + x * (zoom) * tvalx) < maxx * (zoom) + zoom * tvalx) {
                shspeedx += x * (zoom) * tvalx;
            }
            if (Math.abs(shspeedy + y * (zoom) * tvalx) < maxx * (zoom) + zoom * tvalx) {
                shspeedy += y * (zoom) * tvalx;
            }
            shiftpos[0] += shspeedx;
            shiftpos[1] += shspeedy;
            zoomtrig /= 1.1;
            float lt = zoom;
            zoom += ((zoom + zoomtrig > 0.005) && (zoom + zoomtrig < 20)) ? zoomtrig : 0;
            if (!((lt + zoomtrig > 0.005) && (lt + zoomtrig < 20))) {
                zoomtrig = 0;
            }

        }

    }

    void shipmovwithgrav() {
        if (!paused) {
            if (Math.abs(shipth[0]) > maxth) {
                shipth[0] = maxth * (shipth[0] > 0 ? 1 : -1);
            }
            if (Math.abs(shipth[1]) > maxth) {
                shipth[1] = maxth * (shipth[1] > 0 ? 1 : -1);
            }

            for (int i = 0; i < bds3.size(); i++) {
                if ((bds3.get(i).iterator >= maxbullets + 10) && (bds3.get(i).iterator < maxbullets + 10 + maxen)) {
                    if (en1alive[bds3.get(i).iterator - 10 - maxbullets]) {

                        bds3.get(i).origin.x = en1posx[bds3.get(i).iterator - 10 - maxbullets] + 125 - 125;
                        bds3.get(i).origin.y = en1posy[bds3.get(i).iterator - 10 - maxbullets] + 125 - 125;
                        bds3.get(i).heading.x = en1thdx[bds3.get(i).iterator - 10 - maxbullets];
                        bds3.get(i).heading.y = en1thdy[bds3.get(i).iterator - 10 - maxbullets];
                        bds3.get(i).isstatic = en1llisex[bds3.get(i).iterator - 10 - maxbullets];
                        bds3.get(i).miilive = true;

                    } else {
                        bds3.get(i).isstatic = true;
                        bds3.get(i).miilive = false;
                    }

                }
                if ((bds3.get(i).iterator >= maxbullets + 10 + maxen)) {
                    if (en2alive[bds3.get(i).iterator - 10 - maxbullets - maxen]) {

                        bds3.get(i).origin.x = en2posx[bds3.get(i).iterator - 10 - maxbullets - maxen] + 125 - 125;
                        bds3.get(i).origin.y = en2posy[bds3.get(i).iterator - 10 - maxbullets - maxen] + 125 - 125;
                        bds3.get(i).heading.x = en2thdx[bds3.get(i).iterator - 10 - maxbullets - maxen];
                        bds3.get(i).heading.y = en2thdy[bds3.get(i).iterator - 10 - maxbullets - maxen];
                        bds3.get(i).isstatic = false;
                        bds3.get(i).miilive = true;

                    } else {
                        bds3.get(i).isstatic = true;
                        bds3.get(i).miilive = false;
                    }

                }
                bds3.get(i).sumVector(bds3);
            }
            shua = false;
            for (int i = 0; i < bds3.size(); i++) {
                if ((bds3.get(i).iterator >= maxbullets + 10) && (bds3.get(i).iterator < maxbullets + 10 + maxen)) {
                    if (en1alive[bds3.get(i).iterator - 10 - maxbullets]) {

                        if ((bds3.get(i).hit)) {
                            bds3.get(i).hit = false;
                            float ret[] = new float[2];
                            float tm[] = new float[2];
                            float tm2[] = new float[2];
                            float an = angle2d(bds3.get(i).origin.x, bds3.get(i).origin.y, bds3.get(bds3.get(i).hitid).origin.x, bds3.get(bds3.get(i).hitid).origin.y);
                            tm[0] = -5;
                            ret = rotate2d(tm2, tm, an);
                            bds3.get(i).heading.x += ret[0];
                            bds3.get(i).heading.y += ret[1];
                        }

                        en1posx[bds3.get(i).iterator - 10 - maxbullets] = bds3.get(i).origin.x - 125 + 125;
                        en1posy[bds3.get(i).iterator - 10 - maxbullets] = bds3.get(i).origin.y - 125 + 125;
                        en1thdx[bds3.get(i).iterator - 10 - maxbullets] = bds3.get(i).heading.x;
                        en1thdy[bds3.get(i).iterator - 10 - maxbullets] = bds3.get(i).heading.y;

                    }
                }

                if ((bds3.get(i).iterator >= maxbullets + 10 + maxen)) {
                    if (en2alive[bds3.get(i).iterator - 10 - maxbullets - maxen]) {

                        if ((bds3.get(i).hit)) {
                            bds3.get(i).hit = false;
                            float ret[] = new float[2];
                            float tm[] = new float[2];
                            float tm2[] = new float[2];
                            float an = angle2d(bds3.get(i).origin.x, bds3.get(i).origin.y, bds3.get(bds3.get(i).hitid).origin.x, bds3.get(bds3.get(i).hitid).origin.y);
                            tm[0] = -5;
                            ret = rotate2d(tm2, tm, an);
                            bds3.get(i).heading.x += ret[0];
                            bds3.get(i).heading.y += ret[1];
                        }

                        en2posx[bds3.get(i).iterator - 10 - maxbullets - maxen] = bds3.get(i).origin.x - 125 + 125;
                        en2posy[bds3.get(i).iterator - 10 - maxbullets - maxen] = bds3.get(i).origin.y - 125 + 125;
                        en2thdx[bds3.get(i).iterator - 10 - maxbullets - maxen] = bds3.get(i).heading.x;
                        en2thdy[bds3.get(i).iterator - 10 - maxbullets - maxen] = bds3.get(i).heading.y;
                        if (!shua) {
                            shua = (Math.sqrt(Math.abs(Math.pow(en2posx[bds3.get(i).iterator - 10 - maxbullets - maxen] - shippos[0] - 125, 2)) + Math.abs(Math.pow(en2posy[bds3.get(i).iterator - 10 - maxbullets - maxen] - shippos[1] - 125, 2)))) < 1500;
                        }

                    }
                }

            }

            for (int i = 0; i < bds2.size(); i++) {
                /*if (bds2.get(i).iterator == 0) {
                bds2.get(i).islon = (lpower < 20);
            }*/

                if ((bds2.get(i).iterator >= 10) && (bds2.get(i).iterator < maxbullets + 10)) {
                    if (bulletalive[bds2.get(i).iterator - 10]) {
                        if (isnew[bds2.get(i).iterator - 10]) {
                            isnew[bds2.get(i).iterator - 10] = bds2.get(i).hit = false;
                        }
                        bds2.get(i).origin.x = bulletposx[bds2.get(i).iterator - 10];
                        bds2.get(i).origin.y = bulletposy[bds2.get(i).iterator - 10];
                        bds2.get(i).heading.x = bullethdx[bds2.get(i).iterator - 10];
                        bds2.get(i).heading.y = bullethdy[bds2.get(i).iterator - 10];
                        bds2.get(i).isstatic = (bulletexpl[bds2.get(i).iterator - 10] && (exltimer[bds2.get(i).iterator - 10] > 4 * PI));
                        bds2.get(i).miilive = true;
                    } else {
                        bds2.get(i).isstatic = true;
                        bds2.get(i).miilive = false;
                    }

                }

                if ((bds2.get(i).iterator >= maxbullets + 10) && (bds2.get(i).iterator < maxbullets + 10 + maxen)) {
                    if (en1alive[bds2.get(i).iterator - 10 - maxbullets]) {
                        bds2.get(i).origin.x = en1posx[bds2.get(i).iterator - 10 - maxbullets] + 125 - 17;
                        bds2.get(i).origin.y = en1posy[bds2.get(i).iterator - 10 - maxbullets] + 125 - 17;
                        bds2.get(i).heading.x = en1thdx[bds2.get(i).iterator - 10 - maxbullets];
                        bds2.get(i).heading.y = en1thdy[bds2.get(i).iterator - 10 - maxbullets];
                        bds2.get(i).miilive = true;
                    } else {
                        bds2.get(i).miilive = false;
                    }

                }
                if ((bds2.get(i).iterator >= maxbullets + 10 + maxen)) {
                    if (en2alive[bds2.get(i).iterator - 10 - maxbullets - maxen]) {
                        bds2.get(i).origin.x = en2posx[bds2.get(i).iterator - 10 - maxbullets - maxen] + 125 - 17;
                        bds2.get(i).origin.y = en2posy[bds2.get(i).iterator - 10 - maxbullets - maxen] + 125 - 17;
                        bds2.get(i).heading.x = en2thdx[bds2.get(i).iterator - 10 - maxbullets - maxen];
                        bds2.get(i).heading.y = en2thdy[bds2.get(i).iterator - 10 - maxbullets - maxen];
                        bds2.get(i).miilive = true;
                    } else {
                        bds2.get(i).miilive = false;
                    }
                }

                bds2.get(i).sumVector(bds2);
            }

            for (int i = 0; i < bds2.size(); i++) {
                if ((bds2.get(i).iterator >= 10) && (bds2.get(i).iterator < maxbullets + 10)) {
                    if (bulletalive[bds2.get(i).iterator - 10]) {
                        bulletposx[bds2.get(i).iterator - 10] = bds2.get(i).origin.x;
                        bulletposy[bds2.get(i).iterator - 10] = bds2.get(i).origin.y;
                        if ((bds2.get(i).hit) && (bds2.get(bds2.get(i).hitid).iterator == -1)) {
                            bds2.get(i).hit = false;
                            float ret[] = new float[2];
                            float tm[] = new float[2];
                            float tm2[] = new float[2];
                            float an = angle2d(bds2.get(i).origin.x, bds2.get(i).origin.y, bds2.get(bds2.get(i).hitid).origin.x, bds2.get(bds2.get(i).hitid).origin.y);
                            tm[0] = -10;
                            ret = rotate2d(tm2, tm, an);
                            bds2.get(i).heading.x += ret[0];
                            bds2.get(i).heading.y += ret[1];
                        }
                        if ((bds2.get(i).hit) && (bds2.get(bds2.get(i).hitid).iterator >= maxbullets + 10) && (bds2.get(bds2.get(i).hitid).iterator < maxen + maxbullets + 10)) {
                            bds2.get(i).hit = false;
                        }

                        if ((bds2.get(i).hit) && (bds2.get(bds2.get(i).hitid).iterator >= maxbullets + 10 + maxen) && (!bulletexpl[bds2.get(i).iterator - 10])) {
                            bulletexpl[bds2.get(i).iterator - 10] = true;
                            bulletexplctrl[bds2.get(i).iterator - 10] = 0.f;
                            exltimer[bds2.get(i).iterator - 10] = 0;
                            bullettimer[bds2.get(i).iterator - 10] = 4 * PI + bullettimer[bds2.get(i).iterator - 10] - ((int) ((bullettimer[bds2.get(i).iterator - 10]) / (4 * PI))) * 4 * PI;
                        }
                        if ((bulletexpl[bds2.get(i).iterator - 10] && (exltimer[bds2.get(i).iterator - 10] > 4 * PI))) {
                            if ((bds2.get(i).hit) && (bds2.get(bds2.get(i).hitid).iterator >= maxbullets + 10 + maxen)) {
                                en2dd[bds2.get(bds2.get(i).hitid).iterator - maxbullets - 10 - maxen] = true;
                            }
                        }
                        bullethdx[bds2.get(i).iterator - 10] = (float) ((bulletexpl[bds2.get(i).iterator - 10] && (exltimer[bds2.get(i).iterator - 10] > 4 * PI)) ? 0 : ((bds2.get(i).hit) && (bds2.get(bds2.get(i).hitid).iterator >= maxbullets + 10)) ? bds2.get(i).heading.x + 0.5 * bds2.get(bds2.get(i).hitid).heading.x : bds2.get(i).heading.x);
                        bullethdy[bds2.get(i).iterator - 10] = (float) ((bulletexpl[bds2.get(i).iterator - 10] && (exltimer[bds2.get(i).iterator - 10] > 4 * PI)) ? 0 : ((bds2.get(i).hit) && (bds2.get(bds2.get(i).hitid).iterator >= maxbullets + 10)) ? bds2.get(i).heading.y + 0.5 * bds2.get(bds2.get(i).hitid).heading.y : bds2.get(i).heading.y);
                        //bullethdx[bds2.get(i).iterator - 10] = bds2.get(i).heading.x;
                        //bullethdy[bds2.get(i).iterator - 10] = bds2.get(i).heading.y;

                    }
                }

                /*if (bds2.get(i).iterator == 0) {
                if (bds2.get(i).llhit) {
                    lhitpos[0] = bds2.get(i).llhitpos[0];
                    lhitpos[1] = bds2.get(i).llhitpos[1];
                } else {
                    lhitpos[0] = 0;
                    lhitpos[1] = bds2.get(i).maxll;
                }
            }*/
            }

            for (int i = 0; i < bds.size(); i++) {
                if ((bds.get(i).iterator >= maxbullets + 10) && (bds.get(i).iterator < maxbullets + 10 + maxen)) {
                    if (en1alive[bds.get(i).iterator - 10 - maxbullets]) {
                        bds.get(i).origin.x = en1posx[bds.get(i).iterator - 10 - maxbullets] + 125 - 250;
                        bds.get(i).origin.y = en1posy[bds.get(i).iterator - 10 - maxbullets] + 125 - 250;
                        bds.get(i).heading.x = en1thdx[bds.get(i).iterator - 10 - maxbullets];
                        bds.get(i).heading.y = en1thdy[bds.get(i).iterator - 10 - maxbullets];
                        bds.get(i).miilive = true;
                    } else {
                        bds.get(i).miilive = false;
                    }

                }

                if ((bds.get(i).iterator >= maxbullets + 10 + maxen)) {
                    if (en2alive[bds.get(i).iterator - 10 - maxbullets - maxen]) {
                        bds.get(i).origin.x = en2posx[bds.get(i).iterator - 10 - maxbullets - maxen] + 125 - 250;
                        bds.get(i).origin.y = en2posy[bds.get(i).iterator - 10 - maxbullets - maxen] + 125 - 250;
                        bds.get(i).heading.x = en2thdx[bds.get(i).iterator - 10 - maxbullets - maxen];
                        bds.get(i).heading.y = en2thdy[bds.get(i).iterator - 10 - maxbullets - maxen];
                        bds.get(i).miilive = true;
                    } else {
                        bds.get(i).miilive = false;
                    }
                }

                if (bds.get(i).iterator == 0) {
                    bds.get(i).islon = (lpower < 20);
                }
                bds.get(i).sumVector(bds);

            }
            wwh = false;
            en3hit = false;
            for (int i = 0; i < bds.size(); i++) {
                if (bds.get(i).iterator == 0) {

                    if ((keystates['d'] || keystates['D']) || (keystates['a'] || keystates['A'])) {
                        bds.get(i).heading.x += shipth[0] - shipthwgr[0];
                    }
                    if ((keystates['w'] || keystates['W']) || (keystates['s'] || keystates['S'])) {
                        bds.get(i).heading.y += shipth[1] - shipthwgr[1];
                    }
                    shippos[0] = bds.get(i).origin.x;
                    shippos[1] = bds.get(i).origin.y;
                    shipthwgr[0] = (float) (Math.abs(shipth[0]) > 19.9 ? (shipth[0] > 0 ? shipth[0] - 0.25 : shipth[0] + 0.25) : shipth[0]);
                    shipthwgr[1] = (float) (Math.abs(shipth[1]) > 19.9 ? (shipth[1] > 0 ? shipth[1] - 0.25 : shipth[1] + 0.25) : shipth[1]);
                    shipthwgrt[0] = bds.get(i).heading.x;
                    shipthwgrt[1] = bds.get(i).heading.y;
                    /*if ((keystates['k'] || keystates['K'])) {
                    bds.get(i).heading.x = 0;
                    bds.get(i).heading.y = 0;
                }*/

                    if (Keyboard.isKeyDown(Keyboard.KEY_SPACE)) {
                        if (bds.get(i).hit) {
                            bds.get(i).hit = false;
                            float ret[] = new float[2];
                            float tm[] = new float[2];
                            float tm2[] = new float[2];
                            float an = angle2d(shippos[0], shippos[1], bds.get(bds.get(i).hitid).origin.x, bds.get(bds.get(i).hitid).origin.y);
                            tm[0] = -40;
                            ret = rotate2d(tm2, tm, an);
                            bds.get(i).heading.x += ret[0];
                            bds.get(i).heading.y += ret[1];
                        }
                    }

                    if (bds.get(i).llhit) {

                        if ((bds.get(bds.get(i).llhitid).iterator >= maxbullets + 10) && (bds.get(bds.get(i).llhitid).iterator < maxbullets + 10 + maxen)) {
                            en1llishit[bds.get(bds.get(i).llhitid).iterator - maxbullets - 10] = true;
                        }
                        if ((bds.get(bds.get(i).llhitid).iterator >= maxbullets + 10 + maxen)) {
                            en2llishit[bds.get(bds.get(i).llhitid).iterator - maxbullets - 10 - maxen] = true ? 1 : 0;
                        }
                        lhitpos[0] = bds.get(i).llhitpos[0];
                        lhitpos[1] = bds.get(i).llhitpos[1];
                        en3hit = (bds.get(bds.get(i).llhitid).iterator == -1);
                        wwh = (bds.get(bds.get(i).llhitid).iterator >= maxbullets + 10) || en3hit;

                    } else {
                        lhitpos[0] = 0;
                        lhitpos[1] = bds.get(i).maxll;
                    }
                    break;
                };
            }
            shipth[0] /= slowfact;
            shipth[1] /= slowfact;

        }
    }

    void inituniforms(Program program) {
        //GLint uindex;

        //glUseProgram(prog);
        program.defineUniform("time");
        program.defineUniform("iResolution");
        program.defineUniform("iMouse");
        program.defineUniform("resolution");
        program.defineUniform("angle");
        program.defineUniform("radius");
        program.defineUniform("shippos");
        program.defineUniform("shua");
        program.defineUniform("animlamp");
        program.defineUniform("animlcounter");
        program.defineUniform("lpower");
        program.defineUniform("zoom");
        program.defineUniform("bulletanimtimer");
        program.defineUniform("bulletposx");
        program.defineUniform("bulletposy");
        program.defineUniform("bullettimer");
        program.defineUniform("bulletcounter");
        program.defineUniform("paused");
        program.defineUniform("fast");
        program.defineUniform("bulletexpl");
        program.defineUniform("bulletexplctrl");
        program.defineUniform("planetpos1");
        program.defineUniform("planetpos2");
        program.defineUniform("planetpos3");
        program.defineUniform("planetpos4");
        program.defineUniform("planetpos5");
        program.defineUniform("planetpos6");
        program.defineUniform("best");

        //texture
        if (fast) {
            program.defineUniform("iChannel0");
            /*        if (!load_texture(ntxt, GL_TEXTURE_2D, &iChannel, 0, 1)) {
                    fprintf(stderr, "Failed to load texture. Aborting.\n");
                    exit(1);
                }*/
        }

        program.defineUniform("starpos1");
        program.defineUniform("starpos2");
        program.defineUniform("nebulapos");
        program.defineUniform("en3pos");
        program.defineUniform("tax");
        program.defineUniform("en1timer");
        program.defineUniform("en1posx");
        program.defineUniform("en1posy");
        program.defineUniform("en1counter");
        program.defineUniform("en2timer");
        program.defineUniform("en2posx");
        program.defineUniform("en2posy");
        program.defineUniform("en2counter");
        program.defineUniform("lhitpos");
        program.defineUniform("wwh");
        program.defineUniform("en3hit");
        program.defineUniform("en1lval");
        program.defineUniform("en1exval");
        program.defineUniform("en1llisex");
        program.defineUniform("en2llishit");
        program.defineUniform("en2extimer");
    }
    /*
void
keyboard_down_handler(unsigned char key, int x, int y) {
    keystates[key] = false;
    switch (key) {
        case 'p':
        case 'P':paused = !paused;
            struct timespec ts;
            clock_gettime(CLOCK_MONOTONIC_RAW, &ts);
            if (paused) {
                shifttime = (ts.tv_sec * 1000 + ts.tv_nsec / 1000000) - shifttime;
            } else {
                shifttime = (ts.tv_sec * 1000 + ts.tv_nsec / 1000000) - shifttime;
            };
            break;
    }
}*/
 /*
void
redisplay(int value) {
    glutPostRedisplay();
    glutTimerFunc(value, redisplay, value);
}
     */
    static long frames, last_time;
    static float pass, fps;
    static boolean cdx;

    void
            display(Program program) {

        long x0, y0, width, height, ticks;
        //GLint uindex;

        // glUseProgram(prog);
        width = Display.getWidth();
        height = Display.getHeight();
        

        ticks =  System.currentTimeMillis() ;

        if (frames == 0) {
            last_time = ticks;
        }

        frames++;
        //need pass first sec of time
        if (ticks - last_time >= 1000) {
            fps = 1000.0f * frames / (ticks - last_time);
            System.err.println("FPS: " + fps);
            pass = (ticks - last_time) / (1000.f * frames);
            frames = 0;
        }
        scrcenter[0] = width / 2 - (radius * zoom) / 2;
        scrcenter[1] = height / 2 - (radius * zoom) / 2;
        allkeys_movement();
        shipmovwithgrav();
        cameraposs((int)width, (int)height);
        staticplanetsmov();
        spawnenemy(pass);
        if (paused) {
            program.setUniform("time", (float) (shifttime / 1000.0));
        } else {
            program.setUniform("time", (float) ((ticks - shifttime) / 1000.0));
            
        }
        program.setUniform("iResolution", (float)width, (float)height, (float) 1.0);

        program.setUniform("iMouse", (int) mouse[0], (int) mouse[1], (int) mouse[2], (int) mouse[3]);

        program.setUniform("resolution", width, height);

        if (!paused) {
            if (animlampbtn) {
                float lastangle = angle;
                float nang = 0.02f;
                angle = (float) Math.atan2((mouse[1] - (shippos[1] + scrcenter[1] + camerapos[1] + ((radius * zoom) / 2))) / (radius), (mouse[0] - (shippos[0] + scrcenter[0] + camerapos[0] + ((radius * zoom) / 2))) / (radius));
                angle = lastangle + ((Math.abs(angle - lastangle) > nang) ? (((angle - lastangle) > 0) ? (((angle > (PI / 2)) && (lastangle < (-PI / 2))) ? -nang : ((angle < (-PI / 2)) && (lastangle > (PI / 2))) ? -nang : nang) : (((angle > (PI / 2)) && (lastangle < (-PI / 2))) ? nang : ((angle < (-PI / 2)) && (lastangle > (PI / 2))) ? nang : -nang)) : ((angle > (PI / 2)) && (lastangle < (-PI / 2))) ? angle - lastangle : ((angle < (-PI / 2)) && (lastangle > (PI / 2))) ? angle - lastangle : angle - lastangle);
                angle = (angle > PI) ? angle - 2 * PI : (angle < -PI) ? 2 * PI + angle : angle;

            } else {
                float lastangle = angle;
                float nang = 0.06f;
                if (lpower < 20) {
                    nang = 0.02f;
                }
                angle = (float) Math.atan2((mouse[1] - (shippos[1] + scrcenter[1] + camerapos[1] + ((radius * zoom) / 2))) / (radius), (mouse[0] - (shippos[0] + scrcenter[0] + camerapos[0] + ((radius * zoom) / 2))) / (radius));
                angle = lastangle + ((Math.abs(angle - lastangle) > nang) ? (((angle - lastangle) > 0) ? (((angle > (PI / 2)) && (lastangle < (-PI / 2))) ? -nang : ((angle < (-PI / 2)) && (lastangle > (PI / 2))) ? -nang : nang) : (((angle > (PI / 2)) && (lastangle < (-PI / 2))) ? nang : ((angle < (-PI / 2)) && (lastangle > (PI / 2))) ? nang : -nang)) : ((angle > (PI / 2)) && (lastangle < (-PI / 2))) ? angle - lastangle : ((angle < (-PI / 2)) && (lastangle > (PI / 2))) ? angle - lastangle : angle - lastangle);
                angle = (angle > PI) ? angle - 2 * PI : (angle < -PI) ? 2 * PI + angle : angle;
            }
        }
        program.setUniform("angle", PI / 2 - angle);

        program.setUniform("radius", radius * zoom);

        program.setUniform("shippos", (shippos[0] + shiftpos[0] * zoom + camerapos[0] + scrcenter[0]), (shippos[1] + shiftpos[1] * zoom + camerapos[1] + scrcenter[1]));

        program.setUniform("shua", shua ? 1 : 0);

        program.setUniform("animlamp", animlamp);

        program.setUniform("animlcounter", animlcounter);

        program.setUniform("lpower", lpower);

        program.setUniform("zoom", zoom);

        if (!paused) {
            if (animbulletbtn) {
                bulletanimtimer += pass;
                if (bulletanimtimer > 1) {
                    for (int ii = 0; ii < maxbullets; ii++) {
                        if (cdx) {
                            break;
                        }
                        if (!bulletalive[ii]) {
                            //wdrt
                            float tm[] = {137.5f + shippos[0] - shipthwgrt[0], 137.5f + shippos[1] - shipthwgrt[1]};
                            float tm2[] = {238.5f + shippos[0] - shipthwgrt[0], 238.5f + shippos[1] - shipthwgrt[1]};
                            float ret[] = new float[2];
                            ret = rotate2d(tm2, tm, angle + PI / 1.3335f);
                            bulletposx[ii] = 12.5f + -35f / 2.f + ret[0];
                            bulletposy[ii] = 12.5f + -35f / 2.f + ret[1];
                            bulletalive[ii] = isnew[ii] = true;

                            bullettimer[ii] = 0;
                            float rOffputX = (float) Math.sin(angle);
                            float rOffputY = (float) Math.cos(angle);
                            bullethdx[ii] = rOffputY * 2.f + shipthwgrt[0];
                            bullethdy[ii] = rOffputX * 2.f + shipthwgrt[1];
                            bulletexpl[ii] = false;
                            cdx = true;
                        }

                    }
                }
            } else {
                bulletcounter = 0;
                if (bulletanimtimer > 0.7) {
                    bulletanimtimer += pass;
                } else {
                    bulletanimtimer -= pass;
                }
                if (bulletanimtimer < 0) {
                    bulletanimtimer = 0;
                }
            }
            if (bulletanimtimer > 1.4) {
                bulletanimtimer = 0;
                cdx = false;
            };
        }
        program.setUniform("bulletanimtimer", bulletanimtimer);

        bulletcounter = 0;
        for (int ii = 0; ii < maxbullets; ii++) {
            if (bulletalive[ii]) {
                if ((!paused) && (!bulletexpl[ii])) {
                    tmpbulletexpl[bulletcounter] = false ? 1 : 0;
                    if ((bullettimer[ii] > maxbullets - 15)) {
                        bulletexpl[ii] = true;
                        bulletexplctrl[ii] = 0.f;
                        exltimer[ii] = 0;
                        bullettimer[ii] = 4 * PI + bullettimer[ii] - ((int) ((bullettimer[ii]) / (4 * PI))) * 4 * PI; //glsl

                        bullettimer[ii] += -pass;
                    }

                    bullettimer[ii] += pass;
                    tmpbullettimer[bulletcounter] = bullettimer[ii];
                    tmpbulletposx[bulletcounter] = bulletposx[ii] = bulletposx[ii];
                    tmpbulletposy[bulletcounter] = bulletposy[ii] = bulletposy[ii];
                    tmpbulletposx[bulletcounter] += -shippos[0];
                    tmpbulletposy[bulletcounter] += -shippos[1];
                } else {
                    tmpbulletposx[bulletcounter] = bulletposx[ii] - shippos[0];
                    tmpbulletposy[bulletcounter] = bulletposy[ii] - shippos[1];
                }
                if (!paused) {
                    if (bulletexpl[ii]) {
                        tmpbulletposx[bulletcounter] = bulletposx[ii] = bulletposx[ii];
                        tmpbulletposy[bulletcounter] = bulletposy[ii] = bulletposy[ii];
                        tmpbulletposx[bulletcounter] += -shippos[0];
                        tmpbulletposy[bulletcounter] += -shippos[1];
                        if (exltimer[ii] < 4 * PI) {//glsl

                            bullettimer[ii] += pass + 2 * (pass * ((exltimer[ii]) / (4 * PI)));
                            exltimer[ii] += pass / 1.5;
                            bulletexplctrl[ii] = tmpbulletexplctrl[bulletcounter] = bulletexplctrl[ii] + pass + 2 * (pass * ((exltimer[ii]) / (4 * PI)));
                            if (exltimer[ii] >= 4 * PI - pass) {
                                exltimer[ii] = 100;
                                bullettimer[ii] = 0;

                            }
                            tmpbulletexpl[bulletcounter] = bulletexpl[ii] ? 1 : 0;
                            tmpbullettimer[bulletcounter] = bullettimer[ii];

                        } else {

                            if (bullettimer[ii] > PI * 1.24) //glsl
                            {
                                bulletalive[ii] = false;
                                tmpbulletexpl[bulletcounter] = false ? 1 : 0;
                                bulletexpl[ii] = false;
                                continue;
                            }

                            tmpbulletexpl[bulletcounter] = bulletexpl[ii] ? 1 : 0;
                            bullettimer[ii] += pass;
                            tmpbullettimer[bulletcounter] = bullettimer[ii];
                            tmpbulletexpl[bulletcounter] = bulletexpl[ii] ? 1 : 0;
                            tmpbullettimer[bulletcounter] = bullettimer[ii];

                        }

                    }
                }

                bulletcounter++;
            }
        }
        program.setUniform("bulletposx", maxbullets, makeFloatBuffer(tmpbulletposx));

        program.setUniform("bulletposy", maxbullets, makeFloatBuffer(tmpbulletposy));

        program.setUniform("bullettimer", maxbullets, makeFloatBuffer(tmpbullettimer));

        program.setUniform("bulletcounter", bulletcounter);

        program.setUniform("paused", paused ? 1 : 0);

        program.setUniform("fast", fast ? 1 : 0);

        program.setUniform("bulletexpl", maxbullets, makeIntBuffer(tmpbulletexpl));

        program.setUniform("bulletexplctrl", maxbullets, makeFloatBuffer(tmpbulletexplctrl));

        program.setUniform("planetpos1", planetpos1[0] - shippos[0], planetpos1[1] - shippos[1]);

        program.setUniform("planetpos2", planetpos2[0] - shippos[0], planetpos2[1] - shippos[1]);

        program.setUniform("planetpos3", planetpos3[0] - shippos[0], planetpos3[1] - shippos[1]);

        program.setUniform("planetpos4", planetpos4[0] - shippos[0], planetpos4[1] - shippos[1]);

        program.setUniform("planetpos5", planetpos5[0] - shippos[0], planetpos5[1] - shippos[1]);

        program.setUniform("planetpos6", planetpos6[0] - shippos[0], planetpos6[1] - shippos[1]);

        program.setUniform("best", best ? 1 : 0);

        program.setUniform("starpos1", starpos1[0] - shippos[0], starpos1[1] - shippos[1]);

        program.setUniform("starpos2", starpos2[0] - shippos[0], starpos2[1] - shippos[1]);

        program.setUniform("nebulapos", nebulapos[0] - shippos[0], nebulapos[1] - shippos[1]);

        program.setUniform("en3pos", en3pos[0] - shippos[0], en3pos[1] - shippos[1]);

        program.setUniform("tax", ta);

        program.setUniform("en1timer", maxen, makeFloatBuffer(tmpen1timer));

        program.setUniform("en1posx", maxen, makeFloatBuffer(tmpen1posx));

        program.setUniform("en1posy", maxen, makeFloatBuffer(tmpen1posy));

        program.setUniform("en1counter", en1counter);

        program.setUniform("en2timer", maxen, makeFloatBuffer(tmpen2timer));

        program.setUniform("en2posx", maxen, makeFloatBuffer(tmpen2posx));

        program.setUniform("en2posy", maxen, makeFloatBuffer(tmpen2posy));

        program.setUniform("en2counter", en2counter);

        program.setUniform("lhitpos", lhitpos[0], lhitpos[1]);

        program.setUniform("wwh", wwh ? 1 : 0);

        program.setUniform("en3hit", en3hit ? 1 : 0);

        program.setUniform("en1lval", maxen, makeFloatBuffer(tmpen1lval));

        program.setUniform("en1exval", maxen, makeFloatBuffer(tmpen1exval));

        program.setUniform("en1llisex", maxen, makeIntBuffer(tmpen1llisex));

        program.setUniform("en2llishit", maxen, makeIntBuffer(tmpen2llishit));

        program.setUniform("en2extimer", maxen, makeFloatBuffer(tmpen2extimer));


        /*
    glClear(GL_COLOR_BUFFER_BIT);
    glRectf(-1.0, -1.0, 1.0, 1.0);

    glutSwapBuffers();*/
    }

}
