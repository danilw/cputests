// License Creative Commons Attribution-NonCommercial-ShareAlike

// opensource
// please dont use it for sell on google/apple store thanks

//this is obfuscated/optimized source, original glsl source in mysf.glsl file

#ifdef GL_ES
precision mediump float;
#endif
uniform float time;
uniform vec3 iResolution;
float iTime;
varying vec2 v_texCoord;
uniform float tax;
uniform float angle;
uniform float radius;
uniform vec2 shippos;
uniform bool shua;
uniform float animlamp;
uniform float animlcounter;
uniform float lpower;
uniform float zoom;
uniform float bulletposx[50];
uniform float bulletposy[50];
uniform float bullettimer[50];
uniform bool bulletexpl[50];
uniform float bulletexplctrl[50];
uniform int bulletcounter;
uniform float bulletanimtimer;
uniform bool paused;
uniform bool wwh;
uniform bool en3hit;
uniform float en1posx[50];
uniform float en1posy[50];
uniform float en2posx[50];
uniform float en2posy[50];
uniform float en1timer[50];
uniform float en2timer[50];
uniform float en2extimer[50];
uniform int en1counter;
uniform int en2counter;
uniform float en1lval[50];
uniform float en1exval[50];
uniform bool en1llisex[50];
uniform bool en2llishit[50];
uniform vec2 planetpos1;
uniform vec2 planetpos2;
uniform vec2 planetpos3;
uniform vec2 planetpos4;
uniform vec2 planetpos5;
uniform vec2 planetpos6;
uniform vec2 nebulapos;
uniform vec2 en3pos;
uniform vec2 lhitpos;
uniform vec2 starpos1;
uniform vec2 starpos2;
uniform bool best;
void main ()
{
  iTime = time;
  vec4 color_1;
  color_1 = vec4(0.0, 0.0, 0.0, 1.0);
  vec2 tmpvar_2;
  tmpvar_2.x = (v_texCoord.x * iResolution.x);
  tmpvar_2.y = ((1.0 - v_texCoord.y) * iResolution.y);
  vec2 fragCoord_3;
  fragCoord_3 = tmpvar_2;
  vec4 txeb_6;
  vec4 exbff_8;
  vec4 tb_9;
  vec4 mcol_10;
  vec4 buff_11;
  vec2 uv_12;
  vec2 tmpvar_13;
  tmpvar_13 = floor(tmpvar_2);
  vec2 tmpvar_14;
  tmpvar_14 = (tmpvar_2 - tmpvar_13);
  uv_12 = ((tmpvar_14 * tmpvar_14) * (3.0 - (2.0 * tmpvar_14)));
  float tmpvar_15;
  tmpvar_15 = fract((cos(
    dot (tmpvar_13, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_16;
  tmpvar_16.x = (tmpvar_13.x + 1.0);
  tmpvar_16.y = tmpvar_13.y;
  float tmpvar_17;
  tmpvar_17 = fract((cos(
    dot (tmpvar_16, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_18;
  tmpvar_18.x = tmpvar_13.x;
  tmpvar_18.y = (tmpvar_13.y + 1.0);
  float tmpvar_19;
  tmpvar_19 = fract((cos(
    dot (tmpvar_18, vec2(21.9898, 78.233))
  ) * 43758.55));
  float tmpvar_20;
  tmpvar_20 = (pow ((
    ((tmpvar_15 + ((tmpvar_17 - tmpvar_15) * uv_12.x)) + ((tmpvar_19 - tmpvar_15) * uv_12.y))
   + 
    ((((
      (tmpvar_15 - tmpvar_17)
     - tmpvar_19) + fract(
      (cos(dot ((tmpvar_13 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
    )) * uv_12.x) * uv_12.y)
  ), 40.0) * 20.0);
  float tmpvar_21;
  float tmpvar_22;
  tmpvar_22 = (time * 0.01);
  tmpvar_21 = sin(tmpvar_22);
  vec2 uv_23;
  vec2 tmpvar_24;
  tmpvar_24 = floor(vec2(tmpvar_21));
  vec2 tmpvar_25;
  tmpvar_25 = (vec2(tmpvar_21) - tmpvar_24);
  uv_23 = ((tmpvar_25 * tmpvar_25) * (3.0 - (2.0 * tmpvar_25)));
  float tmpvar_26;
  tmpvar_26 = fract((cos(
    dot (tmpvar_24, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_27;
  tmpvar_27.x = (tmpvar_24.x + 1.0);
  tmpvar_27.y = tmpvar_24.y;
  float tmpvar_28;
  tmpvar_28 = fract((cos(
    dot (tmpvar_27, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_29;
  tmpvar_29.x = tmpvar_24.x;
  tmpvar_29.y = (tmpvar_24.y + 1.0);
  float tmpvar_30;
  tmpvar_30 = fract((cos(
    dot (tmpvar_29, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 xy_31;
  xy_31 = (tmpvar_2 * ((
    (tmpvar_26 + ((tmpvar_28 - tmpvar_26) * uv_23.x))
   + 
    ((tmpvar_30 - tmpvar_26) * uv_23.y)
  ) + (
    ((((tmpvar_26 - tmpvar_28) - tmpvar_30) + fract((
      cos(dot ((tmpvar_24 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
     * 43758.55))) * uv_23.x)
   * uv_23.y)));
  vec2 uv_32;
  vec2 tmpvar_33;
  tmpvar_33 = floor(xy_31);
  vec2 tmpvar_34;
  tmpvar_34 = (xy_31 - tmpvar_33);
  uv_32 = ((tmpvar_34 * tmpvar_34) * (3.0 - (2.0 * tmpvar_34)));
  float tmpvar_35;
  tmpvar_35 = fract((cos(
    dot (tmpvar_33, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_36;
  tmpvar_36.x = (tmpvar_33.x + 1.0);
  tmpvar_36.y = tmpvar_33.y;
  float tmpvar_37;
  tmpvar_37 = fract((cos(
    dot (tmpvar_36, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_38;
  tmpvar_38.x = tmpvar_33.x;
  tmpvar_38.y = (tmpvar_33.y + 1.0);
  float tmpvar_39;
  tmpvar_39 = fract((cos(
    dot (tmpvar_38, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_40;
  tmpvar_40.x = cos(tmpvar_22);
  tmpvar_40.y = sin(tmpvar_22);
  vec2 uv_41;
  vec2 tmpvar_42;
  tmpvar_42 = floor(tmpvar_40);
  vec2 tmpvar_43;
  tmpvar_43 = (tmpvar_40 - tmpvar_42);
  uv_41 = ((tmpvar_43 * tmpvar_43) * (3.0 - (2.0 * tmpvar_43)));
  float tmpvar_44;
  tmpvar_44 = fract((cos(
    dot (tmpvar_42, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_45;
  tmpvar_45.x = (tmpvar_42.x + 1.0);
  tmpvar_45.y = tmpvar_42.y;
  float tmpvar_46;
  tmpvar_46 = fract((cos(
    dot (tmpvar_45, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_47;
  tmpvar_47.x = tmpvar_42.x;
  tmpvar_47.y = (tmpvar_42.y + 1.0);
  float tmpvar_48;
  tmpvar_48 = fract((cos(
    dot (tmpvar_47, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 xy_49;
  xy_49 = (tmpvar_2 * ((
    (tmpvar_44 + ((tmpvar_46 - tmpvar_44) * uv_41.x))
   + 
    ((tmpvar_48 - tmpvar_44) * uv_41.y)
  ) + (
    ((((tmpvar_44 - tmpvar_46) - tmpvar_48) + fract((
      cos(dot ((tmpvar_42 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
     * 43758.55))) * uv_41.x)
   * uv_41.y)));
  vec2 uv_50;
  vec2 tmpvar_51;
  tmpvar_51 = floor(xy_49);
  vec2 tmpvar_52;
  tmpvar_52 = (xy_49 - tmpvar_51);
  uv_50 = ((tmpvar_52 * tmpvar_52) * (3.0 - (2.0 * tmpvar_52)));
  float tmpvar_53;
  tmpvar_53 = fract((cos(
    dot (tmpvar_51, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_54;
  tmpvar_54.x = (tmpvar_51.x + 1.0);
  tmpvar_54.y = tmpvar_51.y;
  float tmpvar_55;
  tmpvar_55 = fract((cos(
    dot (tmpvar_54, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_56;
  tmpvar_56.x = tmpvar_51.x;
  tmpvar_56.y = (tmpvar_51.y + 1.0);
  float tmpvar_57;
  tmpvar_57 = fract((cos(
    dot (tmpvar_56, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_58;
  float tmpvar_59;
  tmpvar_59 = (time * 0.05);
  tmpvar_58.x = sin(tmpvar_59);
  tmpvar_58.y = cos(tmpvar_59);
  vec2 uv_60;
  vec2 tmpvar_61;
  tmpvar_61 = floor(tmpvar_58);
  vec2 tmpvar_62;
  tmpvar_62 = (tmpvar_58 - tmpvar_61);
  uv_60 = ((tmpvar_62 * tmpvar_62) * (3.0 - (2.0 * tmpvar_62)));
  float tmpvar_63;
  tmpvar_63 = fract((cos(
    dot (tmpvar_61, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_64;
  tmpvar_64.x = (tmpvar_61.x + 1.0);
  tmpvar_64.y = tmpvar_61.y;
  float tmpvar_65;
  tmpvar_65 = fract((cos(
    dot (tmpvar_64, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_66;
  tmpvar_66.x = tmpvar_61.x;
  tmpvar_66.y = (tmpvar_61.y + 1.0);
  float tmpvar_67;
  tmpvar_67 = fract((cos(
    dot (tmpvar_66, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 xy_68;
  xy_68 = (tmpvar_2 * ((
    (tmpvar_63 + ((tmpvar_65 - tmpvar_63) * uv_60.x))
   + 
    ((tmpvar_67 - tmpvar_63) * uv_60.y)
  ) + (
    ((((tmpvar_63 - tmpvar_65) - tmpvar_67) + fract((
      cos(dot ((tmpvar_61 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
     * 43758.55))) * uv_60.x)
   * uv_60.y)));
  vec2 uv_69;
  vec2 tmpvar_70;
  tmpvar_70 = floor(xy_68);
  vec2 tmpvar_71;
  tmpvar_71 = (xy_68 - tmpvar_70);
  uv_69 = ((tmpvar_71 * tmpvar_71) * (3.0 - (2.0 * tmpvar_71)));
  float tmpvar_72;
  tmpvar_72 = fract((cos(
    dot (tmpvar_70, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_73;
  tmpvar_73.x = (tmpvar_70.x + 1.0);
  tmpvar_73.y = tmpvar_70.y;
  float tmpvar_74;
  tmpvar_74 = fract((cos(
    dot (tmpvar_73, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_75;
  tmpvar_75.x = tmpvar_70.x;
  tmpvar_75.y = (tmpvar_70.y + 1.0);
  float tmpvar_76;
  tmpvar_76 = fract((cos(
    dot (tmpvar_75, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec3 tmpvar_77;
  tmpvar_77.x = (tmpvar_20 * ((
    (tmpvar_35 + ((tmpvar_37 - tmpvar_35) * uv_32.x))
   + 
    ((tmpvar_39 - tmpvar_35) * uv_32.y)
  ) + (
    ((((tmpvar_35 - tmpvar_37) - tmpvar_39) + fract((
      cos(dot ((tmpvar_33 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
     * 43758.55))) * uv_32.x)
   * uv_32.y)));
  tmpvar_77.y = (tmpvar_20 * ((
    (tmpvar_53 + ((tmpvar_55 - tmpvar_53) * uv_50.x))
   + 
    ((tmpvar_57 - tmpvar_53) * uv_50.y)
  ) + (
    ((((tmpvar_53 - tmpvar_55) - tmpvar_57) + fract((
      cos(dot ((tmpvar_51 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
     * 43758.55))) * uv_50.x)
   * uv_50.y)));
  tmpvar_77.z = (tmpvar_20 * ((
    (tmpvar_72 + ((tmpvar_74 - tmpvar_72) * uv_69.x))
   + 
    ((tmpvar_76 - tmpvar_72) * uv_69.y)
  ) + (
    ((((tmpvar_72 - tmpvar_74) - tmpvar_76) + fract((
      cos(dot ((tmpvar_70 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
     * 43758.55))) * uv_69.x)
   * uv_69.y)));
  vec4 tmpvar_78;
  tmpvar_78.w = 1.0;
  tmpvar_78.xyz = tmpvar_77;
  buff_11 = tmpvar_78;
  vec4 tmpvar_79;
  vec2 tmpvar_80;
  tmpvar_80 = ((tmpvar_2 - (nebulapos * zoom)) - shippos);
  vec2 x_81;
  x_81 = (tmpvar_80 - (25000.0 * zoom));
  float tmpvar_82;
  tmpvar_82 = float((sqrt(
    dot (x_81, x_81)
  ) >= (100000.0 * zoom)));
  if (((1.0 - tmpvar_82) > 0.0)) {
    vec4 cl_83;
    vec2 st_84;
    vec2 uv_85;
    vec2 tmpvar_86;
    tmpvar_86 = ((tmpvar_80 / vec2((50000.0 * zoom))) - 0.15);
    vec2 tmpvar_87;
    tmpvar_87 = (tmpvar_86 * 1.35);
    st_84 = (tmpvar_87 + vec2(((0.2 * 
      dot (tmpvar_87, tmpvar_87)
    ) - 0.5)));
    float tmpvar_88;
    tmpvar_88 = (time * 0.01);
    uv_85 = (tmpvar_86 - vec2(0.8, 0.5));
    st_84 = (st_84 + sign(dot (uv_85, uv_85)));
    uv_85 = (uv_85 + sign(dot (uv_85, uv_85)));
    uv_85 = (uv_85 - sign(dot (uv_85, uv_85)));
    vec2 tmpvar_89;
    tmpvar_89.x = (0.2 * tmpvar_88);
    tmpvar_89.y = (0.2 * tmpvar_88);
    vec2 tmpvar_90;
    tmpvar_90.x = (0.3 * tmpvar_88);
    tmpvar_90.y = (0.3 * tmpvar_88);
    vec2 tmpvar_91;
    tmpvar_91.x = (0.4 * tmpvar_88);
    tmpvar_91.y = (0.4 * tmpvar_88);
    mat2 tmpvar_92;
    tmpvar_92[0].x = cos((tmpvar_88 * 2.5));
    tmpvar_92[0].y = sin((tmpvar_88 * 2.5));
    tmpvar_92[1].x = -(sin((tmpvar_88 * 2.5)));
    tmpvar_92[1].y = cos((tmpvar_88 * 2.5));
    vec2 p_93;
    p_93 = (tmpvar_92 * ((1.5 * st_84) + tmpvar_89));
    float f_94;
    f_94 = 0.0;
    if (!(best)) {
      p_93 = (p_93 * mat2(0.9012, 0.9012, -0.9012, 1.2016));
    };
    vec2 uv_95;
    vec2 tmpvar_96;
    tmpvar_96 = floor(p_93);
    vec2 tmpvar_97;
    tmpvar_97 = (p_93 - tmpvar_96);
    uv_95 = ((tmpvar_97 * tmpvar_97) * (3.0 - (2.0 * tmpvar_97)));
    float tmpvar_98;
    tmpvar_98 = fract((cos(
      dot (tmpvar_96, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_99;
    tmpvar_99.x = (tmpvar_96.x + 1.0);
    tmpvar_99.y = tmpvar_96.y;
    float tmpvar_100;
    tmpvar_100 = fract((cos(
      dot (tmpvar_99, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_101;
    tmpvar_101.x = tmpvar_96.x;
    tmpvar_101.y = (tmpvar_96.y + 1.0);
    float tmpvar_102;
    tmpvar_102 = fract((cos(
      dot (tmpvar_101, vec2(21.9898, 78.233))
    ) * 43758.55));
    f_94 = (0.5 * ((
      (tmpvar_98 + ((tmpvar_100 - tmpvar_98) * uv_95.x))
     + 
      ((tmpvar_102 - tmpvar_98) * uv_95.y)
    ) + (
      ((((tmpvar_98 - tmpvar_100) - tmpvar_102) + fract((
        cos(dot ((tmpvar_96 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
       * 43758.55))) * uv_95.x)
     * uv_95.y)));
    p_93 = (p_93 * mat2(1.212, 1.212, -1.212, 1.616));
    vec2 uv_103;
    vec2 tmpvar_104;
    tmpvar_104 = floor(p_93);
    vec2 tmpvar_105;
    tmpvar_105 = (p_93 - tmpvar_104);
    uv_103 = ((tmpvar_105 * tmpvar_105) * (3.0 - (2.0 * tmpvar_105)));
    float tmpvar_106;
    tmpvar_106 = fract((cos(
      dot (tmpvar_104, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_107;
    tmpvar_107.x = (tmpvar_104.x + 1.0);
    tmpvar_107.y = tmpvar_104.y;
    float tmpvar_108;
    tmpvar_108 = fract((cos(
      dot (tmpvar_107, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_109;
    tmpvar_109.x = tmpvar_104.x;
    tmpvar_109.y = (tmpvar_104.y + 1.0);
    float tmpvar_110;
    tmpvar_110 = fract((cos(
      dot (tmpvar_109, vec2(21.9898, 78.233))
    ) * 43758.55));
    f_94 = (f_94 + (0.25 * (
      ((tmpvar_106 + ((tmpvar_108 - tmpvar_106) * uv_103.x)) + ((tmpvar_110 - tmpvar_106) * uv_103.y))
     + 
      ((((
        (tmpvar_106 - tmpvar_108)
       - tmpvar_110) + fract(
        (cos(dot ((tmpvar_104 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
      )) * uv_103.x) * uv_103.y)
    )));
    p_93 = (p_93 * mat2(1.218, 1.218, -1.218, 1.624));
    if (best) {
      vec2 uv_111;
      vec2 tmpvar_112;
      tmpvar_112 = floor(p_93);
      vec2 tmpvar_113;
      tmpvar_113 = (p_93 - tmpvar_112);
      uv_111 = ((tmpvar_113 * tmpvar_113) * (3.0 - (2.0 * tmpvar_113)));
      float tmpvar_114;
      tmpvar_114 = fract((cos(
        dot (tmpvar_112, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_115;
      tmpvar_115.x = (tmpvar_112.x + 1.0);
      tmpvar_115.y = tmpvar_112.y;
      float tmpvar_116;
      tmpvar_116 = fract((cos(
        dot (tmpvar_115, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_117;
      tmpvar_117.x = tmpvar_112.x;
      tmpvar_117.y = (tmpvar_112.y + 1.0);
      float tmpvar_118;
      tmpvar_118 = fract((cos(
        dot (tmpvar_117, vec2(21.9898, 78.233))
      ) * 43758.55));
      f_94 = (f_94 + (0.125 * (
        ((tmpvar_114 + ((tmpvar_116 - tmpvar_114) * uv_111.x)) + ((tmpvar_118 - tmpvar_114) * uv_111.y))
       + 
        ((((
          (tmpvar_114 - tmpvar_116)
         - tmpvar_118) + fract(
          (cos(dot ((tmpvar_112 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_111.x) * uv_111.y)
      )));
      p_93 = (p_93 * mat2(1.206, 1.206, -1.206, 1.608));
      vec2 uv_119;
      vec2 tmpvar_120;
      tmpvar_120 = floor(p_93);
      vec2 tmpvar_121;
      tmpvar_121 = (p_93 - tmpvar_120);
      uv_119 = ((tmpvar_121 * tmpvar_121) * (3.0 - (2.0 * tmpvar_121)));
      float tmpvar_122;
      tmpvar_122 = fract((cos(
        dot (tmpvar_120, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_123;
      tmpvar_123.x = (tmpvar_120.x + 1.0);
      tmpvar_123.y = tmpvar_120.y;
      float tmpvar_124;
      tmpvar_124 = fract((cos(
        dot (tmpvar_123, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_125;
      tmpvar_125.x = tmpvar_120.x;
      tmpvar_125.y = (tmpvar_120.y + 1.0);
      float tmpvar_126;
      tmpvar_126 = fract((cos(
        dot (tmpvar_125, vec2(21.9898, 78.233))
      ) * 43758.55));
      f_94 = (f_94 + (0.0625 * (
        ((tmpvar_122 + ((tmpvar_124 - tmpvar_122) * uv_119.x)) + ((tmpvar_126 - tmpvar_122) * uv_119.y))
       + 
        ((((
          (tmpvar_122 - tmpvar_124)
         - tmpvar_126) + fract(
          (cos(dot ((tmpvar_120 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_119.x) * uv_119.y)
      )));
      p_93 = (p_93 * mat2(1.224, 1.224, -1.224, 1.632));
    };
    f_94 = (f_94 / 0.79375);
    float tmpvar_127;
    tmpvar_127 = (0.23 * f_94);
    mat2 tmpvar_128;
    tmpvar_128[0].x = cos((tmpvar_88 * 2.0));
    tmpvar_128[0].y = sin((tmpvar_88 * 2.0));
    tmpvar_128[1].x = -(sin((tmpvar_88 * 2.0)));
    tmpvar_128[1].y = cos((tmpvar_88 * 2.0));
    vec2 p_129;
    p_129 = (tmpvar_128 * ((2.0 * st_84) + tmpvar_90));
    float f_130;
    f_130 = 0.0;
    if (!(best)) {
      p_129 = (p_129 * mat2(0.9012, 0.9012, -0.9012, 1.2016));
    };
    vec2 uv_131;
    vec2 tmpvar_132;
    tmpvar_132 = floor(p_129);
    vec2 tmpvar_133;
    tmpvar_133 = (p_129 - tmpvar_132);
    uv_131 = ((tmpvar_133 * tmpvar_133) * (3.0 - (2.0 * tmpvar_133)));
    float tmpvar_134;
    tmpvar_134 = fract((cos(
      dot (tmpvar_132, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_135;
    tmpvar_135.x = (tmpvar_132.x + 1.0);
    tmpvar_135.y = tmpvar_132.y;
    float tmpvar_136;
    tmpvar_136 = fract((cos(
      dot (tmpvar_135, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_137;
    tmpvar_137.x = tmpvar_132.x;
    tmpvar_137.y = (tmpvar_132.y + 1.0);
    float tmpvar_138;
    tmpvar_138 = fract((cos(
      dot (tmpvar_137, vec2(21.9898, 78.233))
    ) * 43758.55));
    f_130 = (0.5 * ((
      (tmpvar_134 + ((tmpvar_136 - tmpvar_134) * uv_131.x))
     + 
      ((tmpvar_138 - tmpvar_134) * uv_131.y)
    ) + (
      ((((tmpvar_134 - tmpvar_136) - tmpvar_138) + fract((
        cos(dot ((tmpvar_132 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
       * 43758.55))) * uv_131.x)
     * uv_131.y)));
    p_129 = (p_129 * mat2(1.212, 1.212, -1.212, 1.616));
    vec2 uv_139;
    vec2 tmpvar_140;
    tmpvar_140 = floor(p_129);
    vec2 tmpvar_141;
    tmpvar_141 = (p_129 - tmpvar_140);
    uv_139 = ((tmpvar_141 * tmpvar_141) * (3.0 - (2.0 * tmpvar_141)));
    float tmpvar_142;
    tmpvar_142 = fract((cos(
      dot (tmpvar_140, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_143;
    tmpvar_143.x = (tmpvar_140.x + 1.0);
    tmpvar_143.y = tmpvar_140.y;
    float tmpvar_144;
    tmpvar_144 = fract((cos(
      dot (tmpvar_143, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_145;
    tmpvar_145.x = tmpvar_140.x;
    tmpvar_145.y = (tmpvar_140.y + 1.0);
    float tmpvar_146;
    tmpvar_146 = fract((cos(
      dot (tmpvar_145, vec2(21.9898, 78.233))
    ) * 43758.55));
    f_130 = (f_130 + (0.25 * (
      ((tmpvar_142 + ((tmpvar_144 - tmpvar_142) * uv_139.x)) + ((tmpvar_146 - tmpvar_142) * uv_139.y))
     + 
      ((((
        (tmpvar_142 - tmpvar_144)
       - tmpvar_146) + fract(
        (cos(dot ((tmpvar_140 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
      )) * uv_139.x) * uv_139.y)
    )));
    p_129 = (p_129 * mat2(1.218, 1.218, -1.218, 1.624));
    if (best) {
      vec2 uv_147;
      vec2 tmpvar_148;
      tmpvar_148 = floor(p_129);
      vec2 tmpvar_149;
      tmpvar_149 = (p_129 - tmpvar_148);
      uv_147 = ((tmpvar_149 * tmpvar_149) * (3.0 - (2.0 * tmpvar_149)));
      float tmpvar_150;
      tmpvar_150 = fract((cos(
        dot (tmpvar_148, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_151;
      tmpvar_151.x = (tmpvar_148.x + 1.0);
      tmpvar_151.y = tmpvar_148.y;
      float tmpvar_152;
      tmpvar_152 = fract((cos(
        dot (tmpvar_151, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_153;
      tmpvar_153.x = tmpvar_148.x;
      tmpvar_153.y = (tmpvar_148.y + 1.0);
      float tmpvar_154;
      tmpvar_154 = fract((cos(
        dot (tmpvar_153, vec2(21.9898, 78.233))
      ) * 43758.55));
      f_130 = (f_130 + (0.125 * (
        ((tmpvar_150 + ((tmpvar_152 - tmpvar_150) * uv_147.x)) + ((tmpvar_154 - tmpvar_150) * uv_147.y))
       + 
        ((((
          (tmpvar_150 - tmpvar_152)
         - tmpvar_154) + fract(
          (cos(dot ((tmpvar_148 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_147.x) * uv_147.y)
      )));
      p_129 = (p_129 * mat2(1.206, 1.206, -1.206, 1.608));
      vec2 uv_155;
      vec2 tmpvar_156;
      tmpvar_156 = floor(p_129);
      vec2 tmpvar_157;
      tmpvar_157 = (p_129 - tmpvar_156);
      uv_155 = ((tmpvar_157 * tmpvar_157) * (3.0 - (2.0 * tmpvar_157)));
      float tmpvar_158;
      tmpvar_158 = fract((cos(
        dot (tmpvar_156, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_159;
      tmpvar_159.x = (tmpvar_156.x + 1.0);
      tmpvar_159.y = tmpvar_156.y;
      float tmpvar_160;
      tmpvar_160 = fract((cos(
        dot (tmpvar_159, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_161;
      tmpvar_161.x = tmpvar_156.x;
      tmpvar_161.y = (tmpvar_156.y + 1.0);
      float tmpvar_162;
      tmpvar_162 = fract((cos(
        dot (tmpvar_161, vec2(21.9898, 78.233))
      ) * 43758.55));
      f_130 = (f_130 + (0.0625 * (
        ((tmpvar_158 + ((tmpvar_160 - tmpvar_158) * uv_155.x)) + ((tmpvar_162 - tmpvar_158) * uv_155.y))
       + 
        ((((
          (tmpvar_158 - tmpvar_160)
         - tmpvar_162) + fract(
          (cos(dot ((tmpvar_156 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_155.x) * uv_155.y)
      )));
      p_129 = (p_129 * mat2(1.224, 1.224, -1.224, 1.632));
    };
    f_130 = (f_130 / 0.79375);
    float tmpvar_163;
    tmpvar_163 = (0.24 * f_130);
    mat2 tmpvar_164;
    tmpvar_164[0].x = cos((tmpvar_88 * 1.5));
    tmpvar_164[0].y = sin((tmpvar_88 * 1.5));
    tmpvar_164[1].x = -(sin((tmpvar_88 * 1.5)));
    tmpvar_164[1].y = cos((tmpvar_88 * 1.5));
    vec2 p_165;
    p_165 = (tmpvar_164 * (st_84 + tmpvar_91));
    float f_166;
    f_166 = 0.0;
    if (!(best)) {
      p_165 = (p_165 * mat2(0.9012, 0.9012, -0.9012, 1.2016));
    };
    vec2 uv_167;
    vec2 tmpvar_168;
    tmpvar_168 = floor(p_165);
    vec2 tmpvar_169;
    tmpvar_169 = (p_165 - tmpvar_168);
    uv_167 = ((tmpvar_169 * tmpvar_169) * (3.0 - (2.0 * tmpvar_169)));
    float tmpvar_170;
    tmpvar_170 = fract((cos(
      dot (tmpvar_168, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_171;
    tmpvar_171.x = (tmpvar_168.x + 1.0);
    tmpvar_171.y = tmpvar_168.y;
    float tmpvar_172;
    tmpvar_172 = fract((cos(
      dot (tmpvar_171, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_173;
    tmpvar_173.x = tmpvar_168.x;
    tmpvar_173.y = (tmpvar_168.y + 1.0);
    float tmpvar_174;
    tmpvar_174 = fract((cos(
      dot (tmpvar_173, vec2(21.9898, 78.233))
    ) * 43758.55));
    f_166 = (0.5 * ((
      (tmpvar_170 + ((tmpvar_172 - tmpvar_170) * uv_167.x))
     + 
      ((tmpvar_174 - tmpvar_170) * uv_167.y)
    ) + (
      ((((tmpvar_170 - tmpvar_172) - tmpvar_174) + fract((
        cos(dot ((tmpvar_168 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
       * 43758.55))) * uv_167.x)
     * uv_167.y)));
    p_165 = (p_165 * mat2(1.212, 1.212, -1.212, 1.616));
    vec2 uv_175;
    vec2 tmpvar_176;
    tmpvar_176 = floor(p_165);
    vec2 tmpvar_177;
    tmpvar_177 = (p_165 - tmpvar_176);
    uv_175 = ((tmpvar_177 * tmpvar_177) * (3.0 - (2.0 * tmpvar_177)));
    float tmpvar_178;
    tmpvar_178 = fract((cos(
      dot (tmpvar_176, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_179;
    tmpvar_179.x = (tmpvar_176.x + 1.0);
    tmpvar_179.y = tmpvar_176.y;
    float tmpvar_180;
    tmpvar_180 = fract((cos(
      dot (tmpvar_179, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_181;
    tmpvar_181.x = tmpvar_176.x;
    tmpvar_181.y = (tmpvar_176.y + 1.0);
    float tmpvar_182;
    tmpvar_182 = fract((cos(
      dot (tmpvar_181, vec2(21.9898, 78.233))
    ) * 43758.55));
    f_166 = (f_166 + (0.25 * (
      ((tmpvar_178 + ((tmpvar_180 - tmpvar_178) * uv_175.x)) + ((tmpvar_182 - tmpvar_178) * uv_175.y))
     + 
      ((((
        (tmpvar_178 - tmpvar_180)
       - tmpvar_182) + fract(
        (cos(dot ((tmpvar_176 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
      )) * uv_175.x) * uv_175.y)
    )));
    p_165 = (p_165 * mat2(1.218, 1.218, -1.218, 1.624));
    if (best) {
      vec2 uv_183;
      vec2 tmpvar_184;
      tmpvar_184 = floor(p_165);
      vec2 tmpvar_185;
      tmpvar_185 = (p_165 - tmpvar_184);
      uv_183 = ((tmpvar_185 * tmpvar_185) * (3.0 - (2.0 * tmpvar_185)));
      float tmpvar_186;
      tmpvar_186 = fract((cos(
        dot (tmpvar_184, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_187;
      tmpvar_187.x = (tmpvar_184.x + 1.0);
      tmpvar_187.y = tmpvar_184.y;
      float tmpvar_188;
      tmpvar_188 = fract((cos(
        dot (tmpvar_187, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_189;
      tmpvar_189.x = tmpvar_184.x;
      tmpvar_189.y = (tmpvar_184.y + 1.0);
      float tmpvar_190;
      tmpvar_190 = fract((cos(
        dot (tmpvar_189, vec2(21.9898, 78.233))
      ) * 43758.55));
      f_166 = (f_166 + (0.125 * (
        ((tmpvar_186 + ((tmpvar_188 - tmpvar_186) * uv_183.x)) + ((tmpvar_190 - tmpvar_186) * uv_183.y))
       + 
        ((((
          (tmpvar_186 - tmpvar_188)
         - tmpvar_190) + fract(
          (cos(dot ((tmpvar_184 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_183.x) * uv_183.y)
      )));
      p_165 = (p_165 * mat2(1.206, 1.206, -1.206, 1.608));
      vec2 uv_191;
      vec2 tmpvar_192;
      tmpvar_192 = floor(p_165);
      vec2 tmpvar_193;
      tmpvar_193 = (p_165 - tmpvar_192);
      uv_191 = ((tmpvar_193 * tmpvar_193) * (3.0 - (2.0 * tmpvar_193)));
      float tmpvar_194;
      tmpvar_194 = fract((cos(
        dot (tmpvar_192, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_195;
      tmpvar_195.x = (tmpvar_192.x + 1.0);
      tmpvar_195.y = tmpvar_192.y;
      float tmpvar_196;
      tmpvar_196 = fract((cos(
        dot (tmpvar_195, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_197;
      tmpvar_197.x = tmpvar_192.x;
      tmpvar_197.y = (tmpvar_192.y + 1.0);
      float tmpvar_198;
      tmpvar_198 = fract((cos(
        dot (tmpvar_197, vec2(21.9898, 78.233))
      ) * 43758.55));
      f_166 = (f_166 + (0.0625 * (
        ((tmpvar_194 + ((tmpvar_196 - tmpvar_194) * uv_191.x)) + ((tmpvar_198 - tmpvar_194) * uv_191.y))
       + 
        ((((
          (tmpvar_194 - tmpvar_196)
         - tmpvar_198) + fract(
          (cos(dot ((tmpvar_192 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_191.x) * uv_191.y)
      )));
      p_165 = (p_165 * mat2(1.224, 1.224, -1.224, 1.632));
    };
    f_166 = (f_166 / 0.79375);
    vec4 tmpvar_199;
    tmpvar_199.w = 1.0;
    tmpvar_199.x = tmpvar_127;
    tmpvar_199.y = tmpvar_163;
    tmpvar_199.z = (0.26 * f_166);
    vec4 tmpvar_200;
    tmpvar_200 = pow (tmpvar_199, vec4(1.3, 1.3, 1.3, 1.3));
    cl_83 = (tmpvar_200 + tmpvar_200);
    vec4 tmpvar_201;
    tmpvar_201 = pow ((cl_83 + cl_83), vec4(1.5, 1.5, 1.5, 1.5));
    cl_83 = (pow ((
      (tmpvar_201 + tmpvar_201)
     + tmpvar_201), vec4(1.5, 1.5, 1.5, 1.5)) * 0.7);
    vec4 tmpvar_202;
    tmpvar_202 = ((cl_83 + cl_83) * 0.15);
    cl_83 = (tmpvar_202 + (tmpvar_202 * 2.0));
    vec2 x_203;
    x_203 = (uv_85 / 2.0);
    cl_83.xyz = (cl_83.xyz + (0.5 * pow (
      (1.0 - sqrt(dot (x_203, x_203)))
    , 2.5)));
    cl_83 = (0.9 * clamp (cl_83, vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0)));
    vec4 tmpvar_204;
    tmpvar_204 = clamp (vec4(-2.333333, -2.333333, -2.333333, -2.333333), 0.0, 1.0);
    vec4 tmpvar_205;
    tmpvar_205 = clamp ((tmpvar_204 * (tmpvar_204 * 
      (3.0 - (2.0 * tmpvar_204))
    )), 0.0, 1.0);
    cl_83 = (cl_83 + (tmpvar_205 * (tmpvar_205 * 
      (3.0 - (2.0 * tmpvar_205))
    )));
    vec2 p_206;
    p_206 = (st_84 * 0.4);
    float f_207;
    f_207 = 0.0;
    if (!(best)) {
      p_206 = (p_206 * mat2(0.9012, 0.9012, -0.9012, 1.2016));
    };
    vec2 uv_208;
    vec2 tmpvar_209;
    tmpvar_209 = floor(p_206);
    vec2 tmpvar_210;
    tmpvar_210 = (p_206 - tmpvar_209);
    uv_208 = ((tmpvar_210 * tmpvar_210) * (3.0 - (2.0 * tmpvar_210)));
    float tmpvar_211;
    tmpvar_211 = fract((cos(
      dot (tmpvar_209, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_212;
    tmpvar_212.x = (tmpvar_209.x + 1.0);
    tmpvar_212.y = tmpvar_209.y;
    float tmpvar_213;
    tmpvar_213 = fract((cos(
      dot (tmpvar_212, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_214;
    tmpvar_214.x = tmpvar_209.x;
    tmpvar_214.y = (tmpvar_209.y + 1.0);
    float tmpvar_215;
    tmpvar_215 = fract((cos(
      dot (tmpvar_214, vec2(21.9898, 78.233))
    ) * 43758.55));
    f_207 = (0.5 * ((
      (tmpvar_211 + ((tmpvar_213 - tmpvar_211) * uv_208.x))
     + 
      ((tmpvar_215 - tmpvar_211) * uv_208.y)
    ) + (
      ((((tmpvar_211 - tmpvar_213) - tmpvar_215) + fract((
        cos(dot ((tmpvar_209 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
       * 43758.55))) * uv_208.x)
     * uv_208.y)));
    p_206 = (p_206 * mat2(1.212, 1.212, -1.212, 1.616));
    vec2 uv_216;
    vec2 tmpvar_217;
    tmpvar_217 = floor(p_206);
    vec2 tmpvar_218;
    tmpvar_218 = (p_206 - tmpvar_217);
    uv_216 = ((tmpvar_218 * tmpvar_218) * (3.0 - (2.0 * tmpvar_218)));
    float tmpvar_219;
    tmpvar_219 = fract((cos(
      dot (tmpvar_217, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_220;
    tmpvar_220.x = (tmpvar_217.x + 1.0);
    tmpvar_220.y = tmpvar_217.y;
    float tmpvar_221;
    tmpvar_221 = fract((cos(
      dot (tmpvar_220, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_222;
    tmpvar_222.x = tmpvar_217.x;
    tmpvar_222.y = (tmpvar_217.y + 1.0);
    float tmpvar_223;
    tmpvar_223 = fract((cos(
      dot (tmpvar_222, vec2(21.9898, 78.233))
    ) * 43758.55));
    f_207 = (f_207 + (0.25 * (
      ((tmpvar_219 + ((tmpvar_221 - tmpvar_219) * uv_216.x)) + ((tmpvar_223 - tmpvar_219) * uv_216.y))
     + 
      ((((
        (tmpvar_219 - tmpvar_221)
       - tmpvar_223) + fract(
        (cos(dot ((tmpvar_217 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
      )) * uv_216.x) * uv_216.y)
    )));
    p_206 = (p_206 * mat2(1.218, 1.218, -1.218, 1.624));
    if (best) {
      vec2 uv_224;
      vec2 tmpvar_225;
      tmpvar_225 = floor(p_206);
      vec2 tmpvar_226;
      tmpvar_226 = (p_206 - tmpvar_225);
      uv_224 = ((tmpvar_226 * tmpvar_226) * (3.0 - (2.0 * tmpvar_226)));
      float tmpvar_227;
      tmpvar_227 = fract((cos(
        dot (tmpvar_225, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_228;
      tmpvar_228.x = (tmpvar_225.x + 1.0);
      tmpvar_228.y = tmpvar_225.y;
      float tmpvar_229;
      tmpvar_229 = fract((cos(
        dot (tmpvar_228, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_230;
      tmpvar_230.x = tmpvar_225.x;
      tmpvar_230.y = (tmpvar_225.y + 1.0);
      float tmpvar_231;
      tmpvar_231 = fract((cos(
        dot (tmpvar_230, vec2(21.9898, 78.233))
      ) * 43758.55));
      f_207 = (f_207 + (0.125 * (
        ((tmpvar_227 + ((tmpvar_229 - tmpvar_227) * uv_224.x)) + ((tmpvar_231 - tmpvar_227) * uv_224.y))
       + 
        ((((
          (tmpvar_227 - tmpvar_229)
         - tmpvar_231) + fract(
          (cos(dot ((tmpvar_225 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_224.x) * uv_224.y)
      )));
      p_206 = (p_206 * mat2(1.206, 1.206, -1.206, 1.608));
      vec2 uv_232;
      vec2 tmpvar_233;
      tmpvar_233 = floor(p_206);
      vec2 tmpvar_234;
      tmpvar_234 = (p_206 - tmpvar_233);
      uv_232 = ((tmpvar_234 * tmpvar_234) * (3.0 - (2.0 * tmpvar_234)));
      float tmpvar_235;
      tmpvar_235 = fract((cos(
        dot (tmpvar_233, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_236;
      tmpvar_236.x = (tmpvar_233.x + 1.0);
      tmpvar_236.y = tmpvar_233.y;
      float tmpvar_237;
      tmpvar_237 = fract((cos(
        dot (tmpvar_236, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_238;
      tmpvar_238.x = tmpvar_233.x;
      tmpvar_238.y = (tmpvar_233.y + 1.0);
      float tmpvar_239;
      tmpvar_239 = fract((cos(
        dot (tmpvar_238, vec2(21.9898, 78.233))
      ) * 43758.55));
      f_207 = (f_207 + (0.0625 * (
        ((tmpvar_235 + ((tmpvar_237 - tmpvar_235) * uv_232.x)) + ((tmpvar_239 - tmpvar_235) * uv_232.y))
       + 
        ((((
          (tmpvar_235 - tmpvar_237)
         - tmpvar_239) + fract(
          (cos(dot ((tmpvar_233 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_232.x) * uv_232.y)
      )));
      p_206 = (p_206 * mat2(1.224, 1.224, -1.224, 1.632));
    };
    f_207 = (f_207 / 0.79375);
    vec2 p_240;
    p_240 = ((f_207 - vec2(tmpvar_88)) * 15.0);
    float f_241;
    f_241 = 0.0;
    if (!(best)) {
      p_240 = (p_240 * mat2(0.9012, 0.9012, -0.9012, 1.2016));
    };
    vec2 uv_242;
    vec2 tmpvar_243;
    tmpvar_243 = floor(p_240);
    vec2 tmpvar_244;
    tmpvar_244 = (p_240 - tmpvar_243);
    uv_242 = ((tmpvar_244 * tmpvar_244) * (3.0 - (2.0 * tmpvar_244)));
    float tmpvar_245;
    tmpvar_245 = fract((cos(
      dot (tmpvar_243, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_246;
    tmpvar_246.x = (tmpvar_243.x + 1.0);
    tmpvar_246.y = tmpvar_243.y;
    float tmpvar_247;
    tmpvar_247 = fract((cos(
      dot (tmpvar_246, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_248;
    tmpvar_248.x = tmpvar_243.x;
    tmpvar_248.y = (tmpvar_243.y + 1.0);
    float tmpvar_249;
    tmpvar_249 = fract((cos(
      dot (tmpvar_248, vec2(21.9898, 78.233))
    ) * 43758.55));
    f_241 = (0.5 * ((
      (tmpvar_245 + ((tmpvar_247 - tmpvar_245) * uv_242.x))
     + 
      ((tmpvar_249 - tmpvar_245) * uv_242.y)
    ) + (
      ((((tmpvar_245 - tmpvar_247) - tmpvar_249) + fract((
        cos(dot ((tmpvar_243 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
       * 43758.55))) * uv_242.x)
     * uv_242.y)));
    p_240 = (p_240 * mat2(1.212, 1.212, -1.212, 1.616));
    vec2 uv_250;
    vec2 tmpvar_251;
    tmpvar_251 = floor(p_240);
    vec2 tmpvar_252;
    tmpvar_252 = (p_240 - tmpvar_251);
    uv_250 = ((tmpvar_252 * tmpvar_252) * (3.0 - (2.0 * tmpvar_252)));
    float tmpvar_253;
    tmpvar_253 = fract((cos(
      dot (tmpvar_251, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_254;
    tmpvar_254.x = (tmpvar_251.x + 1.0);
    tmpvar_254.y = tmpvar_251.y;
    float tmpvar_255;
    tmpvar_255 = fract((cos(
      dot (tmpvar_254, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_256;
    tmpvar_256.x = tmpvar_251.x;
    tmpvar_256.y = (tmpvar_251.y + 1.0);
    float tmpvar_257;
    tmpvar_257 = fract((cos(
      dot (tmpvar_256, vec2(21.9898, 78.233))
    ) * 43758.55));
    f_241 = (f_241 + (0.25 * (
      ((tmpvar_253 + ((tmpvar_255 - tmpvar_253) * uv_250.x)) + ((tmpvar_257 - tmpvar_253) * uv_250.y))
     + 
      ((((
        (tmpvar_253 - tmpvar_255)
       - tmpvar_257) + fract(
        (cos(dot ((tmpvar_251 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
      )) * uv_250.x) * uv_250.y)
    )));
    p_240 = (p_240 * mat2(1.218, 1.218, -1.218, 1.624));
    if (best) {
      vec2 uv_258;
      vec2 tmpvar_259;
      tmpvar_259 = floor(p_240);
      vec2 tmpvar_260;
      tmpvar_260 = (p_240 - tmpvar_259);
      uv_258 = ((tmpvar_260 * tmpvar_260) * (3.0 - (2.0 * tmpvar_260)));
      float tmpvar_261;
      tmpvar_261 = fract((cos(
        dot (tmpvar_259, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_262;
      tmpvar_262.x = (tmpvar_259.x + 1.0);
      tmpvar_262.y = tmpvar_259.y;
      float tmpvar_263;
      tmpvar_263 = fract((cos(
        dot (tmpvar_262, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_264;
      tmpvar_264.x = tmpvar_259.x;
      tmpvar_264.y = (tmpvar_259.y + 1.0);
      float tmpvar_265;
      tmpvar_265 = fract((cos(
        dot (tmpvar_264, vec2(21.9898, 78.233))
      ) * 43758.55));
      f_241 = (f_241 + (0.125 * (
        ((tmpvar_261 + ((tmpvar_263 - tmpvar_261) * uv_258.x)) + ((tmpvar_265 - tmpvar_261) * uv_258.y))
       + 
        ((((
          (tmpvar_261 - tmpvar_263)
         - tmpvar_265) + fract(
          (cos(dot ((tmpvar_259 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_258.x) * uv_258.y)
      )));
      p_240 = (p_240 * mat2(1.206, 1.206, -1.206, 1.608));
      vec2 uv_266;
      vec2 tmpvar_267;
      tmpvar_267 = floor(p_240);
      vec2 tmpvar_268;
      tmpvar_268 = (p_240 - tmpvar_267);
      uv_266 = ((tmpvar_268 * tmpvar_268) * (3.0 - (2.0 * tmpvar_268)));
      float tmpvar_269;
      tmpvar_269 = fract((cos(
        dot (tmpvar_267, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_270;
      tmpvar_270.x = (tmpvar_267.x + 1.0);
      tmpvar_270.y = tmpvar_267.y;
      float tmpvar_271;
      tmpvar_271 = fract((cos(
        dot (tmpvar_270, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_272;
      tmpvar_272.x = tmpvar_267.x;
      tmpvar_272.y = (tmpvar_267.y + 1.0);
      float tmpvar_273;
      tmpvar_273 = fract((cos(
        dot (tmpvar_272, vec2(21.9898, 78.233))
      ) * 43758.55));
      f_241 = (f_241 + (0.0625 * (
        ((tmpvar_269 + ((tmpvar_271 - tmpvar_269) * uv_266.x)) + ((tmpvar_273 - tmpvar_269) * uv_266.y))
       + 
        ((((
          (tmpvar_269 - tmpvar_271)
         - tmpvar_273) + fract(
          (cos(dot ((tmpvar_267 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_266.x) * uv_266.y)
      )));
      p_240 = (p_240 * mat2(1.224, 1.224, -1.224, 1.632));
    };
    f_241 = (f_241 / 0.79375);
    float tmpvar_274;
    tmpvar_274 = (f_241 * ((0.2 * 
      dot (uv_85, uv_85)
    ) - 0.5));
    vec4 tmpvar_275;
    tmpvar_275 = mix (cl_83, ((cl_83 + tmpvar_274) + (tmpvar_274 + tmpvar_274)), 0.6);
    cl_83 = tmpvar_275;
    vec2 tmpvar_276;
    tmpvar_276.x = (-(time) * 0.3);
    tmpvar_276.y = (time * 0.3);
    vec2 p_277;
    p_277 = (tmpvar_276 + (uv_85 * 20.0));
    float f_278;
    f_278 = 0.0;
    if (!(best)) {
      p_277 = (p_277 * mat2(0.9012, 0.9012, -0.9012, 1.2016));
    };
    vec2 uv_279;
    vec2 tmpvar_280;
    tmpvar_280 = floor(p_277);
    vec2 tmpvar_281;
    tmpvar_281 = (p_277 - tmpvar_280);
    uv_279 = ((tmpvar_281 * tmpvar_281) * (3.0 - (2.0 * tmpvar_281)));
    float tmpvar_282;
    tmpvar_282 = fract((cos(
      dot (tmpvar_280, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_283;
    tmpvar_283.x = (tmpvar_280.x + 1.0);
    tmpvar_283.y = tmpvar_280.y;
    float tmpvar_284;
    tmpvar_284 = fract((cos(
      dot (tmpvar_283, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_285;
    tmpvar_285.x = tmpvar_280.x;
    tmpvar_285.y = (tmpvar_280.y + 1.0);
    float tmpvar_286;
    tmpvar_286 = fract((cos(
      dot (tmpvar_285, vec2(21.9898, 78.233))
    ) * 43758.55));
    f_278 = (0.5 * ((
      (tmpvar_282 + ((tmpvar_284 - tmpvar_282) * uv_279.x))
     + 
      ((tmpvar_286 - tmpvar_282) * uv_279.y)
    ) + (
      ((((tmpvar_282 - tmpvar_284) - tmpvar_286) + fract((
        cos(dot ((tmpvar_280 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
       * 43758.55))) * uv_279.x)
     * uv_279.y)));
    p_277 = (p_277 * mat2(1.212, 1.212, -1.212, 1.616));
    vec2 uv_287;
    vec2 tmpvar_288;
    tmpvar_288 = floor(p_277);
    vec2 tmpvar_289;
    tmpvar_289 = (p_277 - tmpvar_288);
    uv_287 = ((tmpvar_289 * tmpvar_289) * (3.0 - (2.0 * tmpvar_289)));
    float tmpvar_290;
    tmpvar_290 = fract((cos(
      dot (tmpvar_288, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_291;
    tmpvar_291.x = (tmpvar_288.x + 1.0);
    tmpvar_291.y = tmpvar_288.y;
    float tmpvar_292;
    tmpvar_292 = fract((cos(
      dot (tmpvar_291, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_293;
    tmpvar_293.x = tmpvar_288.x;
    tmpvar_293.y = (tmpvar_288.y + 1.0);
    float tmpvar_294;
    tmpvar_294 = fract((cos(
      dot (tmpvar_293, vec2(21.9898, 78.233))
    ) * 43758.55));
    f_278 = (f_278 + (0.25 * (
      ((tmpvar_290 + ((tmpvar_292 - tmpvar_290) * uv_287.x)) + ((tmpvar_294 - tmpvar_290) * uv_287.y))
     + 
      ((((
        (tmpvar_290 - tmpvar_292)
       - tmpvar_294) + fract(
        (cos(dot ((tmpvar_288 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
      )) * uv_287.x) * uv_287.y)
    )));
    p_277 = (p_277 * mat2(1.218, 1.218, -1.218, 1.624));
    if (best) {
      vec2 uv_295;
      vec2 tmpvar_296;
      tmpvar_296 = floor(p_277);
      vec2 tmpvar_297;
      tmpvar_297 = (p_277 - tmpvar_296);
      uv_295 = ((tmpvar_297 * tmpvar_297) * (3.0 - (2.0 * tmpvar_297)));
      float tmpvar_298;
      tmpvar_298 = fract((cos(
        dot (tmpvar_296, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_299;
      tmpvar_299.x = (tmpvar_296.x + 1.0);
      tmpvar_299.y = tmpvar_296.y;
      float tmpvar_300;
      tmpvar_300 = fract((cos(
        dot (tmpvar_299, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_301;
      tmpvar_301.x = tmpvar_296.x;
      tmpvar_301.y = (tmpvar_296.y + 1.0);
      float tmpvar_302;
      tmpvar_302 = fract((cos(
        dot (tmpvar_301, vec2(21.9898, 78.233))
      ) * 43758.55));
      f_278 = (f_278 + (0.125 * (
        ((tmpvar_298 + ((tmpvar_300 - tmpvar_298) * uv_295.x)) + ((tmpvar_302 - tmpvar_298) * uv_295.y))
       + 
        ((((
          (tmpvar_298 - tmpvar_300)
         - tmpvar_302) + fract(
          (cos(dot ((tmpvar_296 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_295.x) * uv_295.y)
      )));
      p_277 = (p_277 * mat2(1.206, 1.206, -1.206, 1.608));
      vec2 uv_303;
      vec2 tmpvar_304;
      tmpvar_304 = floor(p_277);
      vec2 tmpvar_305;
      tmpvar_305 = (p_277 - tmpvar_304);
      uv_303 = ((tmpvar_305 * tmpvar_305) * (3.0 - (2.0 * tmpvar_305)));
      float tmpvar_306;
      tmpvar_306 = fract((cos(
        dot (tmpvar_304, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_307;
      tmpvar_307.x = (tmpvar_304.x + 1.0);
      tmpvar_307.y = tmpvar_304.y;
      float tmpvar_308;
      tmpvar_308 = fract((cos(
        dot (tmpvar_307, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_309;
      tmpvar_309.x = tmpvar_304.x;
      tmpvar_309.y = (tmpvar_304.y + 1.0);
      float tmpvar_310;
      tmpvar_310 = fract((cos(
        dot (tmpvar_309, vec2(21.9898, 78.233))
      ) * 43758.55));
      f_278 = (f_278 + (0.0625 * (
        ((tmpvar_306 + ((tmpvar_308 - tmpvar_306) * uv_303.x)) + ((tmpvar_310 - tmpvar_306) * uv_303.y))
       + 
        ((((
          (tmpvar_306 - tmpvar_308)
         - tmpvar_310) + fract(
          (cos(dot ((tmpvar_304 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_303.x) * uv_303.y)
      )));
      p_277 = (p_277 * mat2(1.224, 1.224, -1.224, 1.632));
    };
    f_278 = (f_278 / 0.79375);
    cl_83 = (tmpvar_275 + (0.2 * f_278));
    cl_83 = (cl_83 - min (cl_83, vec4(-0.3, 0.0, -0.5, 1.0)));
    cl_83 = (cl_83 - (0.8 * dot (uv_85, uv_85)));
    tmpvar_79 = max (vec4(0.0, 0.0, 0.0, 0.0), cl_83);
  } else {
    tmpvar_79 = vec4(0.0, 0.0, 0.0, 0.0);
  };
  buff_11 = (tmpvar_78 + tmpvar_79);
  vec4 tmpvar_311;
  vec2 tmpvar_312;
  tmpvar_312 = ((tmpvar_2 - (planetpos1 * zoom)) - shippos);
  vec2 x_313;
  x_313 = (tmpvar_312 - (2500.0 * zoom));
  float tmpvar_314;
  tmpvar_314 = float((sqrt(
    dot (x_313, x_313)
  ) >= (3000.0 * zoom)));
  if (((1.0 - tmpvar_314) > 0.0)) {
    vec4 cxu_315;
    float bval_316;
    vec4 c_317;
    vec2 p_318;
    vec2 tmpvar_319;
    tmpvar_319 = vec2((5000.0 * zoom));
    vec2 tmpvar_320;
    tmpvar_320 = (((tmpvar_312 * 2.0) - tmpvar_319) / tmpvar_319.y);
    float tmpvar_321;
    tmpvar_321 = sqrt(dot (tmpvar_320, tmpvar_320));
    vec4 tmpvar_322;
    tmpvar_322 = (vec4(0.63, 0.62, 0.86, 1.0) + tmpvar_320.y);
    c_317 = tmpvar_322;
    p_318 = (((tmpvar_320 * 
      (sign(tmpvar_321) * (1.570796 - (sqrt(
        (1.0 - abs(tmpvar_321))
      ) * (1.570796 + 
        (abs(tmpvar_321) * (-0.2146018 + (abs(tmpvar_321) * (0.08656672 + 
          (abs(tmpvar_321) * -0.03102955)
        ))))
      ))))
    ) / tmpvar_321) - 5.0);
    p_318 = (p_318 * p_318.y);
    bval_316 = 0.021;
    if (best) {
      bval_316 = 0.1;
      float r_323;
      vec2 tmpvar_324;
      tmpvar_324 = ((0.7 * p_318) - 0.5);
      float tmpvar_325;
      tmpvar_325 = sqrt(((tmpvar_324.x * tmpvar_324.x) + (tmpvar_324.y * tmpvar_324.y)));
      float tmpvar_326;
      float tmpvar_327;
      tmpvar_327 = (min (abs(
        (tmpvar_324.y / tmpvar_324.x)
      ), 1.0) / max (abs(
        (tmpvar_324.y / tmpvar_324.x)
      ), 1.0));
      float tmpvar_328;
      tmpvar_328 = (tmpvar_327 * tmpvar_327);
      tmpvar_328 = (((
        ((((
          ((((-0.01213232 * tmpvar_328) + 0.05368138) * tmpvar_328) - 0.1173503)
         * tmpvar_328) + 0.1938925) * tmpvar_328) - 0.3326756)
       * tmpvar_328) + 0.9999793) * tmpvar_327);
      tmpvar_328 = (tmpvar_328 + (float(
        (abs((tmpvar_324.y / tmpvar_324.x)) > 1.0)
      ) * (
        (tmpvar_328 * -2.0)
       + 1.570796)));
      tmpvar_326 = (tmpvar_328 * sign((tmpvar_324.y / tmpvar_324.x)));
      if ((abs(tmpvar_324.x) > (1e-08 * abs(tmpvar_324.y)))) {
        if ((tmpvar_324.x < 0.0)) {
          if ((tmpvar_324.y >= 0.0)) {
            tmpvar_326 += 3.141593;
          } else {
            tmpvar_326 = (tmpvar_326 - 3.141593);
          };
        };
      } else {
        tmpvar_326 = (sign(tmpvar_324.y) * 1.570796);
      };
      float tmpvar_329;
      tmpvar_329 = (tmpvar_326 + (time / 100.0));
      vec2 tmpvar_330;
      tmpvar_330.x = (tmpvar_325 * cos(tmpvar_329));
      tmpvar_330.y = (tmpvar_325 * sin(tmpvar_329));
      float tmpvar_331;
      float tmpvar_332;
      tmpvar_332 = (time / 10.0);
      tmpvar_331 = (2.0 + (0.2 * cos(tmpvar_332)));
      float tmpvar_333;
      tmpvar_333 = (2.0 - (0.2 * sin(tmpvar_332)));
      vec2 v_334;
      v_334 = (10.0 * tmpvar_330);
      float amplitude_336;
      float value_337;
      value_337 = 0.0;
      amplitude_336 = 0.5;
      for (int i_335 = 0; i_335 < 2; i_335++) {
        vec2 uv_338;
        vec2 tmpvar_339;
        tmpvar_339 = floor(v_334);
        vec2 tmpvar_340;
        tmpvar_340 = (v_334 - tmpvar_339);
        uv_338 = ((tmpvar_340 * tmpvar_340) * (3.0 - (2.0 * tmpvar_340)));
        float tmpvar_341;
        tmpvar_341 = fract((cos(
          dot (tmpvar_339, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 tmpvar_342;
        tmpvar_342.x = (tmpvar_339.x + 1.0);
        tmpvar_342.y = tmpvar_339.y;
        float tmpvar_343;
        tmpvar_343 = fract((cos(
          dot (tmpvar_342, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 tmpvar_344;
        tmpvar_344.x = tmpvar_339.x;
        tmpvar_344.y = (tmpvar_339.y + 1.0);
        float tmpvar_345;
        tmpvar_345 = fract((cos(
          dot (tmpvar_344, vec2(21.9898, 78.233))
        ) * 43758.55));
        value_337 = (value_337 + (amplitude_336 * (
          ((tmpvar_341 + ((tmpvar_343 - tmpvar_341) * uv_338.x)) + ((tmpvar_345 - tmpvar_341) * uv_338.y))
         + 
          ((((
            (tmpvar_341 - tmpvar_343)
           - tmpvar_345) + fract(
            (cos(dot ((tmpvar_339 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
          )) * uv_338.x) * uv_338.y)
        )));
        v_334 = (v_334 * 2.0);
        amplitude_336 = (amplitude_336 * 0.5);
        vec2 xy_346;
        xy_346 = (v_334 * 2.0);
        vec2 uv_347;
        vec2 tmpvar_348;
        tmpvar_348 = floor(xy_346);
        vec2 tmpvar_349;
        tmpvar_349 = (xy_346 - tmpvar_348);
        uv_347 = ((tmpvar_349 * tmpvar_349) * (3.0 - (2.0 * tmpvar_349)));
        float tmpvar_350;
        tmpvar_350 = fract((cos(
          dot (tmpvar_348, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 tmpvar_351;
        tmpvar_351.x = (tmpvar_348.x + 1.0);
        tmpvar_351.y = tmpvar_348.y;
        float tmpvar_352;
        tmpvar_352 = fract((cos(
          dot (tmpvar_351, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 tmpvar_353;
        tmpvar_353.x = tmpvar_348.x;
        tmpvar_353.y = (tmpvar_348.y + 1.0);
        float tmpvar_354;
        tmpvar_354 = fract((cos(
          dot (tmpvar_353, vec2(21.9898, 78.233))
        ) * 43758.55));
        value_337 = (value_337 + ((amplitude_336 * 
          (((tmpvar_350 + (
            (tmpvar_352 - tmpvar_350)
           * uv_347.x)) + ((tmpvar_354 - tmpvar_350) * uv_347.y)) + (((
            ((tmpvar_350 - tmpvar_352) - tmpvar_354)
           + 
            fract((cos(dot (
              (tmpvar_348 + vec2(1.0, 1.0))
            , vec2(21.9898, 78.233))) * 43758.55))
          ) * uv_347.x) * uv_347.y))
        ) * 0.5));
        amplitude_336 = (amplitude_336 * 0.5);
      };
      r_323 = (sin((
        (((tmpvar_330.x * tmpvar_331) * 6.283) + ((tmpvar_330.y * tmpvar_333) * 6.283))
       + 
        (15.0 * value_337)
      )) + 1.0);
      vec4 tmpvar_355;
      tmpvar_355.w = 1.0;
      tmpvar_355.x = r_323;
      tmpvar_355.y = r_323;
      tmpvar_355.z = r_323;
      c_317 = (tmpvar_322 + ((tmpvar_355 * vec4(0.75, 1.0, 0.75, 1.0)) + (
        (1.0 - tmpvar_355)
       * vec4(0.0, 0.25, 0.0, 1.0))));
      p_318 = (p_318 * 0.4);
      c_317 = (c_317 * 0.6);
      float r_356;
      vec2 tmpvar_357;
      tmpvar_357 = ((0.7 * p_318) - 0.5);
      float tmpvar_358;
      tmpvar_358 = sqrt(((tmpvar_357.x * tmpvar_357.x) + (tmpvar_357.y * tmpvar_357.y)));
      float tmpvar_359;
      float tmpvar_360;
      tmpvar_360 = (min (abs(
        (tmpvar_357.y / tmpvar_357.x)
      ), 1.0) / max (abs(
        (tmpvar_357.y / tmpvar_357.x)
      ), 1.0));
      float tmpvar_361;
      tmpvar_361 = (tmpvar_360 * tmpvar_360);
      tmpvar_361 = (((
        ((((
          ((((-0.01213232 * tmpvar_361) + 0.05368138) * tmpvar_361) - 0.1173503)
         * tmpvar_361) + 0.1938925) * tmpvar_361) - 0.3326756)
       * tmpvar_361) + 0.9999793) * tmpvar_360);
      tmpvar_361 = (tmpvar_361 + (float(
        (abs((tmpvar_357.y / tmpvar_357.x)) > 1.0)
      ) * (
        (tmpvar_361 * -2.0)
       + 1.570796)));
      tmpvar_359 = (tmpvar_361 * sign((tmpvar_357.y / tmpvar_357.x)));
      if ((abs(tmpvar_357.x) > (1e-08 * abs(tmpvar_357.y)))) {
        if ((tmpvar_357.x < 0.0)) {
          if ((tmpvar_357.y >= 0.0)) {
            tmpvar_359 += 3.141593;
          } else {
            tmpvar_359 = (tmpvar_359 - 3.141593);
          };
        };
      } else {
        tmpvar_359 = (sign(tmpvar_357.y) * 1.570796);
      };
      float tmpvar_362;
      tmpvar_362 = (tmpvar_359 + (time / 100.0));
      vec2 tmpvar_363;
      tmpvar_363.x = (tmpvar_358 * cos(tmpvar_362));
      tmpvar_363.y = (tmpvar_358 * sin(tmpvar_362));
      float tmpvar_364;
      float tmpvar_365;
      tmpvar_365 = (time / 10.0);
      tmpvar_364 = (2.0 + (0.2 * cos(tmpvar_365)));
      float tmpvar_366;
      tmpvar_366 = (2.0 - (0.2 * sin(tmpvar_365)));
      vec2 v_367;
      v_367 = (10.0 * tmpvar_363);
      float amplitude_369;
      float value_370;
      value_370 = 0.0;
      amplitude_369 = 0.5;
      for (int i_368 = 0; i_368 < 2; i_368++) {
        vec2 uv_371;
        vec2 tmpvar_372;
        tmpvar_372 = floor(v_367);
        vec2 tmpvar_373;
        tmpvar_373 = (v_367 - tmpvar_372);
        uv_371 = ((tmpvar_373 * tmpvar_373) * (3.0 - (2.0 * tmpvar_373)));
        float tmpvar_374;
        tmpvar_374 = fract((cos(
          dot (tmpvar_372, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 tmpvar_375;
        tmpvar_375.x = (tmpvar_372.x + 1.0);
        tmpvar_375.y = tmpvar_372.y;
        float tmpvar_376;
        tmpvar_376 = fract((cos(
          dot (tmpvar_375, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 tmpvar_377;
        tmpvar_377.x = tmpvar_372.x;
        tmpvar_377.y = (tmpvar_372.y + 1.0);
        float tmpvar_378;
        tmpvar_378 = fract((cos(
          dot (tmpvar_377, vec2(21.9898, 78.233))
        ) * 43758.55));
        value_370 = (value_370 + (amplitude_369 * (
          ((tmpvar_374 + ((tmpvar_376 - tmpvar_374) * uv_371.x)) + ((tmpvar_378 - tmpvar_374) * uv_371.y))
         + 
          ((((
            (tmpvar_374 - tmpvar_376)
           - tmpvar_378) + fract(
            (cos(dot ((tmpvar_372 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
          )) * uv_371.x) * uv_371.y)
        )));
        v_367 = (v_367 * 2.0);
        amplitude_369 = (amplitude_369 * 0.5);
        vec2 xy_379;
        xy_379 = (v_367 * 2.0);
        vec2 uv_380;
        vec2 tmpvar_381;
        tmpvar_381 = floor(xy_379);
        vec2 tmpvar_382;
        tmpvar_382 = (xy_379 - tmpvar_381);
        uv_380 = ((tmpvar_382 * tmpvar_382) * (3.0 - (2.0 * tmpvar_382)));
        float tmpvar_383;
        tmpvar_383 = fract((cos(
          dot (tmpvar_381, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 tmpvar_384;
        tmpvar_384.x = (tmpvar_381.x + 1.0);
        tmpvar_384.y = tmpvar_381.y;
        float tmpvar_385;
        tmpvar_385 = fract((cos(
          dot (tmpvar_384, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 tmpvar_386;
        tmpvar_386.x = tmpvar_381.x;
        tmpvar_386.y = (tmpvar_381.y + 1.0);
        float tmpvar_387;
        tmpvar_387 = fract((cos(
          dot (tmpvar_386, vec2(21.9898, 78.233))
        ) * 43758.55));
        value_370 = (value_370 + ((amplitude_369 * 
          (((tmpvar_383 + (
            (tmpvar_385 - tmpvar_383)
           * uv_380.x)) + ((tmpvar_387 - tmpvar_383) * uv_380.y)) + (((
            ((tmpvar_383 - tmpvar_385) - tmpvar_387)
           + 
            fract((cos(dot (
              (tmpvar_381 + vec2(1.0, 1.0))
            , vec2(21.9898, 78.233))) * 43758.55))
          ) * uv_380.x) * uv_380.y))
        ) * 0.5));
        amplitude_369 = (amplitude_369 * 0.5);
      };
      r_356 = (sin((
        (((tmpvar_363.x * tmpvar_364) * 6.283) + ((tmpvar_363.y * tmpvar_366) * 6.283))
       + 
        (15.0 * value_370)
      )) + 1.0);
      vec4 tmpvar_388;
      tmpvar_388.w = 1.0;
      tmpvar_388.x = r_356;
      tmpvar_388.y = r_356;
      tmpvar_388.z = r_356;
      c_317 = (c_317 + ((tmpvar_388 * vec4(0.75, 1.0, 0.75, 1.0)) + (
        (1.0 - tmpvar_388)
       * vec4(0.0, 0.25, 0.0, 1.0))));
      p_318 = (p_318 * 0.4);
      c_317 = (c_317 * 0.6);
    };
    float r_389;
    vec2 tmpvar_390;
    tmpvar_390 = (((p_318 * bval_316) * 7.0) - 0.5);
    float tmpvar_391;
    tmpvar_391 = sqrt(((tmpvar_390.x * tmpvar_390.x) + (tmpvar_390.y * tmpvar_390.y)));
    float tmpvar_392;
    float tmpvar_393;
    tmpvar_393 = (min (abs(
      (tmpvar_390.y / tmpvar_390.x)
    ), 1.0) / max (abs(
      (tmpvar_390.y / tmpvar_390.x)
    ), 1.0));
    float tmpvar_394;
    tmpvar_394 = (tmpvar_393 * tmpvar_393);
    tmpvar_394 = (((
      ((((
        ((((-0.01213232 * tmpvar_394) + 0.05368138) * tmpvar_394) - 0.1173503)
       * tmpvar_394) + 0.1938925) * tmpvar_394) - 0.3326756)
     * tmpvar_394) + 0.9999793) * tmpvar_393);
    tmpvar_394 = (tmpvar_394 + (float(
      (abs((tmpvar_390.y / tmpvar_390.x)) > 1.0)
    ) * (
      (tmpvar_394 * -2.0)
     + 1.570796)));
    tmpvar_392 = (tmpvar_394 * sign((tmpvar_390.y / tmpvar_390.x)));
    if ((abs(tmpvar_390.x) > (1e-08 * abs(tmpvar_390.y)))) {
      if ((tmpvar_390.x < 0.0)) {
        if ((tmpvar_390.y >= 0.0)) {
          tmpvar_392 += 3.141593;
        } else {
          tmpvar_392 = (tmpvar_392 - 3.141593);
        };
      };
    } else {
      tmpvar_392 = (sign(tmpvar_390.y) * 1.570796);
    };
    float tmpvar_395;
    tmpvar_395 = (tmpvar_392 + (time / 100.0));
    vec2 tmpvar_396;
    tmpvar_396.x = (tmpvar_391 * cos(tmpvar_395));
    tmpvar_396.y = (tmpvar_391 * sin(tmpvar_395));
    float tmpvar_397;
    float tmpvar_398;
    tmpvar_398 = (time / 10.0);
    tmpvar_397 = (2.0 + (0.2 * cos(tmpvar_398)));
    float tmpvar_399;
    tmpvar_399 = (2.0 - (0.2 * sin(tmpvar_398)));
    vec2 v_400;
    v_400 = (10.0 * tmpvar_396);
    float amplitude_402;
    float value_403;
    value_403 = 0.0;
    amplitude_402 = 0.5;
    for (int i_401 = 0; i_401 < 2; i_401++) {
      vec2 uv_404;
      vec2 tmpvar_405;
      tmpvar_405 = floor(v_400);
      vec2 tmpvar_406;
      tmpvar_406 = (v_400 - tmpvar_405);
      uv_404 = ((tmpvar_406 * tmpvar_406) * (3.0 - (2.0 * tmpvar_406)));
      float tmpvar_407;
      tmpvar_407 = fract((cos(
        dot (tmpvar_405, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_408;
      tmpvar_408.x = (tmpvar_405.x + 1.0);
      tmpvar_408.y = tmpvar_405.y;
      float tmpvar_409;
      tmpvar_409 = fract((cos(
        dot (tmpvar_408, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_410;
      tmpvar_410.x = tmpvar_405.x;
      tmpvar_410.y = (tmpvar_405.y + 1.0);
      float tmpvar_411;
      tmpvar_411 = fract((cos(
        dot (tmpvar_410, vec2(21.9898, 78.233))
      ) * 43758.55));
      value_403 = (value_403 + (amplitude_402 * (
        ((tmpvar_407 + ((tmpvar_409 - tmpvar_407) * uv_404.x)) + ((tmpvar_411 - tmpvar_407) * uv_404.y))
       + 
        ((((
          (tmpvar_407 - tmpvar_409)
         - tmpvar_411) + fract(
          (cos(dot ((tmpvar_405 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_404.x) * uv_404.y)
      )));
      v_400 = (v_400 * 2.0);
      amplitude_402 = (amplitude_402 * 0.5);
      vec2 xy_412;
      xy_412 = (v_400 * 2.0);
      vec2 uv_413;
      vec2 tmpvar_414;
      tmpvar_414 = floor(xy_412);
      vec2 tmpvar_415;
      tmpvar_415 = (xy_412 - tmpvar_414);
      uv_413 = ((tmpvar_415 * tmpvar_415) * (3.0 - (2.0 * tmpvar_415)));
      float tmpvar_416;
      tmpvar_416 = fract((cos(
        dot (tmpvar_414, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_417;
      tmpvar_417.x = (tmpvar_414.x + 1.0);
      tmpvar_417.y = tmpvar_414.y;
      float tmpvar_418;
      tmpvar_418 = fract((cos(
        dot (tmpvar_417, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_419;
      tmpvar_419.x = tmpvar_414.x;
      tmpvar_419.y = (tmpvar_414.y + 1.0);
      float tmpvar_420;
      tmpvar_420 = fract((cos(
        dot (tmpvar_419, vec2(21.9898, 78.233))
      ) * 43758.55));
      value_403 = (value_403 + ((amplitude_402 * 
        (((tmpvar_416 + (
          (tmpvar_418 - tmpvar_416)
         * uv_413.x)) + ((tmpvar_420 - tmpvar_416) * uv_413.y)) + (((
          ((tmpvar_416 - tmpvar_418) - tmpvar_420)
         + 
          fract((cos(dot (
            (tmpvar_414 + vec2(1.0, 1.0))
          , vec2(21.9898, 78.233))) * 43758.55))
        ) * uv_413.x) * uv_413.y))
      ) * 0.5));
      amplitude_402 = (amplitude_402 * 0.5);
    };
    r_389 = (sin((
      (((tmpvar_396.x * tmpvar_397) * 6.283) + ((tmpvar_396.y * tmpvar_399) * 6.283))
     + 
      (15.0 * value_403)
    )) + 1.0);
    vec4 tmpvar_421;
    tmpvar_421.w = 1.0;
    tmpvar_421.x = r_389;
    tmpvar_421.y = r_389;
    tmpvar_421.z = r_389;
    c_317 = (c_317 + ((tmpvar_421 * vec4(0.75, 1.0, 0.75, 1.0)) + (
      (1.0 - tmpvar_421)
     * vec4(0.0, 0.25, 0.0, 1.0))));
    p_318 = (p_318 * 0.4);
    c_317 = (c_317 * 0.6);
    float r_422;
    vec2 tmpvar_423;
    tmpvar_423 = (((p_318 * bval_316) * 7.0) - 0.5);
    float tmpvar_424;
    tmpvar_424 = sqrt(((tmpvar_423.x * tmpvar_423.x) + (tmpvar_423.y * tmpvar_423.y)));
    float tmpvar_425;
    float tmpvar_426;
    tmpvar_426 = (min (abs(
      (tmpvar_423.y / tmpvar_423.x)
    ), 1.0) / max (abs(
      (tmpvar_423.y / tmpvar_423.x)
    ), 1.0));
    float tmpvar_427;
    tmpvar_427 = (tmpvar_426 * tmpvar_426);
    tmpvar_427 = (((
      ((((
        ((((-0.01213232 * tmpvar_427) + 0.05368138) * tmpvar_427) - 0.1173503)
       * tmpvar_427) + 0.1938925) * tmpvar_427) - 0.3326756)
     * tmpvar_427) + 0.9999793) * tmpvar_426);
    tmpvar_427 = (tmpvar_427 + (float(
      (abs((tmpvar_423.y / tmpvar_423.x)) > 1.0)
    ) * (
      (tmpvar_427 * -2.0)
     + 1.570796)));
    tmpvar_425 = (tmpvar_427 * sign((tmpvar_423.y / tmpvar_423.x)));
    if ((abs(tmpvar_423.x) > (1e-08 * abs(tmpvar_423.y)))) {
      if ((tmpvar_423.x < 0.0)) {
        if ((tmpvar_423.y >= 0.0)) {
          tmpvar_425 += 3.141593;
        } else {
          tmpvar_425 = (tmpvar_425 - 3.141593);
        };
      };
    } else {
      tmpvar_425 = (sign(tmpvar_423.y) * 1.570796);
    };
    float tmpvar_428;
    tmpvar_428 = (tmpvar_425 + (time / 100.0));
    vec2 tmpvar_429;
    tmpvar_429.x = (tmpvar_424 * cos(tmpvar_428));
    tmpvar_429.y = (tmpvar_424 * sin(tmpvar_428));
    float tmpvar_430;
    float tmpvar_431;
    tmpvar_431 = (time / 10.0);
    tmpvar_430 = (2.0 + (0.2 * cos(tmpvar_431)));
    float tmpvar_432;
    tmpvar_432 = (2.0 - (0.2 * sin(tmpvar_431)));
    vec2 v_433;
    v_433 = (10.0 * tmpvar_429);
    float amplitude_435;
    float value_436;
    value_436 = 0.0;
    amplitude_435 = 0.5;
    for (int i_434 = 0; i_434 < 2; i_434++) {
      vec2 uv_437;
      vec2 tmpvar_438;
      tmpvar_438 = floor(v_433);
      vec2 tmpvar_439;
      tmpvar_439 = (v_433 - tmpvar_438);
      uv_437 = ((tmpvar_439 * tmpvar_439) * (3.0 - (2.0 * tmpvar_439)));
      float tmpvar_440;
      tmpvar_440 = fract((cos(
        dot (tmpvar_438, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_441;
      tmpvar_441.x = (tmpvar_438.x + 1.0);
      tmpvar_441.y = tmpvar_438.y;
      float tmpvar_442;
      tmpvar_442 = fract((cos(
        dot (tmpvar_441, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_443;
      tmpvar_443.x = tmpvar_438.x;
      tmpvar_443.y = (tmpvar_438.y + 1.0);
      float tmpvar_444;
      tmpvar_444 = fract((cos(
        dot (tmpvar_443, vec2(21.9898, 78.233))
      ) * 43758.55));
      value_436 = (value_436 + (amplitude_435 * (
        ((tmpvar_440 + ((tmpvar_442 - tmpvar_440) * uv_437.x)) + ((tmpvar_444 - tmpvar_440) * uv_437.y))
       + 
        ((((
          (tmpvar_440 - tmpvar_442)
         - tmpvar_444) + fract(
          (cos(dot ((tmpvar_438 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_437.x) * uv_437.y)
      )));
      v_433 = (v_433 * 2.0);
      amplitude_435 = (amplitude_435 * 0.5);
      vec2 xy_445;
      xy_445 = (v_433 * 2.0);
      vec2 uv_446;
      vec2 tmpvar_447;
      tmpvar_447 = floor(xy_445);
      vec2 tmpvar_448;
      tmpvar_448 = (xy_445 - tmpvar_447);
      uv_446 = ((tmpvar_448 * tmpvar_448) * (3.0 - (2.0 * tmpvar_448)));
      float tmpvar_449;
      tmpvar_449 = fract((cos(
        dot (tmpvar_447, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_450;
      tmpvar_450.x = (tmpvar_447.x + 1.0);
      tmpvar_450.y = tmpvar_447.y;
      float tmpvar_451;
      tmpvar_451 = fract((cos(
        dot (tmpvar_450, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_452;
      tmpvar_452.x = tmpvar_447.x;
      tmpvar_452.y = (tmpvar_447.y + 1.0);
      float tmpvar_453;
      tmpvar_453 = fract((cos(
        dot (tmpvar_452, vec2(21.9898, 78.233))
      ) * 43758.55));
      value_436 = (value_436 + ((amplitude_435 * 
        (((tmpvar_449 + (
          (tmpvar_451 - tmpvar_449)
         * uv_446.x)) + ((tmpvar_453 - tmpvar_449) * uv_446.y)) + (((
          ((tmpvar_449 - tmpvar_451) - tmpvar_453)
         + 
          fract((cos(dot (
            (tmpvar_447 + vec2(1.0, 1.0))
          , vec2(21.9898, 78.233))) * 43758.55))
        ) * uv_446.x) * uv_446.y))
      ) * 0.5));
      amplitude_435 = (amplitude_435 * 0.5);
    };
    r_422 = (sin((
      (((tmpvar_429.x * tmpvar_430) * 6.283) + ((tmpvar_429.y * tmpvar_432) * 6.283))
     + 
      (15.0 * value_436)
    )) + 1.0);
    vec4 tmpvar_454;
    tmpvar_454.w = 1.0;
    tmpvar_454.x = r_422;
    tmpvar_454.y = r_422;
    tmpvar_454.z = r_422;
    c_317 = (c_317 + ((tmpvar_454 * vec4(0.75, 1.0, 0.75, 1.0)) + (
      (1.0 - tmpvar_454)
     * vec4(0.0, 0.25, 0.0, 1.0))));
    p_318 = (p_318 * 0.4);
    c_317 = (c_317 * 0.6);
    float r_455;
    vec2 tmpvar_456;
    tmpvar_456 = (((p_318 * bval_316) * 7.0) - 0.5);
    float tmpvar_457;
    tmpvar_457 = sqrt(((tmpvar_456.x * tmpvar_456.x) + (tmpvar_456.y * tmpvar_456.y)));
    float tmpvar_458;
    float tmpvar_459;
    tmpvar_459 = (min (abs(
      (tmpvar_456.y / tmpvar_456.x)
    ), 1.0) / max (abs(
      (tmpvar_456.y / tmpvar_456.x)
    ), 1.0));
    float tmpvar_460;
    tmpvar_460 = (tmpvar_459 * tmpvar_459);
    tmpvar_460 = (((
      ((((
        ((((-0.01213232 * tmpvar_460) + 0.05368138) * tmpvar_460) - 0.1173503)
       * tmpvar_460) + 0.1938925) * tmpvar_460) - 0.3326756)
     * tmpvar_460) + 0.9999793) * tmpvar_459);
    tmpvar_460 = (tmpvar_460 + (float(
      (abs((tmpvar_456.y / tmpvar_456.x)) > 1.0)
    ) * (
      (tmpvar_460 * -2.0)
     + 1.570796)));
    tmpvar_458 = (tmpvar_460 * sign((tmpvar_456.y / tmpvar_456.x)));
    if ((abs(tmpvar_456.x) > (1e-08 * abs(tmpvar_456.y)))) {
      if ((tmpvar_456.x < 0.0)) {
        if ((tmpvar_456.y >= 0.0)) {
          tmpvar_458 += 3.141593;
        } else {
          tmpvar_458 = (tmpvar_458 - 3.141593);
        };
      };
    } else {
      tmpvar_458 = (sign(tmpvar_456.y) * 1.570796);
    };
    float tmpvar_461;
    tmpvar_461 = (tmpvar_458 + (time / 100.0));
    vec2 tmpvar_462;
    tmpvar_462.x = (tmpvar_457 * cos(tmpvar_461));
    tmpvar_462.y = (tmpvar_457 * sin(tmpvar_461));
    float tmpvar_463;
    float tmpvar_464;
    tmpvar_464 = (time / 10.0);
    tmpvar_463 = (2.0 + (0.2 * cos(tmpvar_464)));
    float tmpvar_465;
    tmpvar_465 = (2.0 - (0.2 * sin(tmpvar_464)));
    vec2 v_466;
    v_466 = (10.0 * tmpvar_462);
    float amplitude_468;
    float value_469;
    value_469 = 0.0;
    amplitude_468 = 0.5;
    for (int i_467 = 0; i_467 < 2; i_467++) {
      vec2 uv_470;
      vec2 tmpvar_471;
      tmpvar_471 = floor(v_466);
      vec2 tmpvar_472;
      tmpvar_472 = (v_466 - tmpvar_471);
      uv_470 = ((tmpvar_472 * tmpvar_472) * (3.0 - (2.0 * tmpvar_472)));
      float tmpvar_473;
      tmpvar_473 = fract((cos(
        dot (tmpvar_471, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_474;
      tmpvar_474.x = (tmpvar_471.x + 1.0);
      tmpvar_474.y = tmpvar_471.y;
      float tmpvar_475;
      tmpvar_475 = fract((cos(
        dot (tmpvar_474, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_476;
      tmpvar_476.x = tmpvar_471.x;
      tmpvar_476.y = (tmpvar_471.y + 1.0);
      float tmpvar_477;
      tmpvar_477 = fract((cos(
        dot (tmpvar_476, vec2(21.9898, 78.233))
      ) * 43758.55));
      value_469 = (value_469 + (amplitude_468 * (
        ((tmpvar_473 + ((tmpvar_475 - tmpvar_473) * uv_470.x)) + ((tmpvar_477 - tmpvar_473) * uv_470.y))
       + 
        ((((
          (tmpvar_473 - tmpvar_475)
         - tmpvar_477) + fract(
          (cos(dot ((tmpvar_471 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_470.x) * uv_470.y)
      )));
      v_466 = (v_466 * 2.0);
      amplitude_468 = (amplitude_468 * 0.5);
      vec2 xy_478;
      xy_478 = (v_466 * 2.0);
      vec2 uv_479;
      vec2 tmpvar_480;
      tmpvar_480 = floor(xy_478);
      vec2 tmpvar_481;
      tmpvar_481 = (xy_478 - tmpvar_480);
      uv_479 = ((tmpvar_481 * tmpvar_481) * (3.0 - (2.0 * tmpvar_481)));
      float tmpvar_482;
      tmpvar_482 = fract((cos(
        dot (tmpvar_480, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_483;
      tmpvar_483.x = (tmpvar_480.x + 1.0);
      tmpvar_483.y = tmpvar_480.y;
      float tmpvar_484;
      tmpvar_484 = fract((cos(
        dot (tmpvar_483, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_485;
      tmpvar_485.x = tmpvar_480.x;
      tmpvar_485.y = (tmpvar_480.y + 1.0);
      float tmpvar_486;
      tmpvar_486 = fract((cos(
        dot (tmpvar_485, vec2(21.9898, 78.233))
      ) * 43758.55));
      value_469 = (value_469 + ((amplitude_468 * 
        (((tmpvar_482 + (
          (tmpvar_484 - tmpvar_482)
         * uv_479.x)) + ((tmpvar_486 - tmpvar_482) * uv_479.y)) + (((
          ((tmpvar_482 - tmpvar_484) - tmpvar_486)
         + 
          fract((cos(dot (
            (tmpvar_480 + vec2(1.0, 1.0))
          , vec2(21.9898, 78.233))) * 43758.55))
        ) * uv_479.x) * uv_479.y))
      ) * 0.5));
      amplitude_468 = (amplitude_468 * 0.5);
    };
    r_455 = (sin((
      (((tmpvar_462.x * tmpvar_463) * 6.283) + ((tmpvar_462.y * tmpvar_465) * 6.283))
     + 
      (15.0 * value_469)
    )) + 1.0);
    vec4 tmpvar_487;
    tmpvar_487.w = 1.0;
    tmpvar_487.x = r_455;
    tmpvar_487.y = r_455;
    tmpvar_487.z = r_455;
    c_317 = (c_317 + ((tmpvar_487 * vec4(0.75, 1.0, 0.75, 1.0)) + (
      (1.0 - tmpvar_487)
     * vec4(0.0, 0.25, 0.0, 1.0))));
    p_318 = (p_318 * 0.4);
    c_317 = (c_317 * 0.6);
    float tmpvar_488;
    tmpvar_488 = clamp (((tax - 0.23) / 0.16), 0.0, 1.0);
    float tmpvar_489;
    tmpvar_489 = clamp (((tax - 0.65) / -0.26), 0.0, 1.0);
    float tmpvar_490;
    tmpvar_490 = ((1.0 - (tmpvar_488 * 
      (tmpvar_488 * (3.0 - (2.0 * tmpvar_488)))
    )) + (1.0 - (tmpvar_489 * 
      (tmpvar_489 * (3.0 - (2.0 * tmpvar_489)))
    )));
    if (((1.0 - tmpvar_490) > 0.0)) {
      vec2 pos_491;
      vec3 col_492;
      float tmpvar_493;
      tmpvar_493 = clamp (((tax - 0.19) / 0.46), 0.0, 1.0);
      float tmpvar_494;
      tmpvar_494 = (1.0 - (tmpvar_493 * (tmpvar_493 * 
        (3.0 - (2.0 * tmpvar_493))
      )));
      float tmpvar_495;
      tmpvar_495 = (7000.0 * zoom);
      pos_491 = (tmpvar_312 + ((
        -(tmpvar_495)
       / 2.0) + (tmpvar_495 * 0.145)));
      mat2 tmpvar_496;
      float tmpvar_497;
      tmpvar_497 = (tax + 0.9817436);
      tmpvar_496[0].x = cos((tmpvar_497 + (1.57079 * 
        (1.0 - tmpvar_494)
      )));
      tmpvar_496[0].y = -(sin((tmpvar_497 + 
        (1.57079 * (1.0 - tmpvar_494))
      )));
      tmpvar_496[1].x = sin((tmpvar_497 + (1.57079 * 
        (1.0 - tmpvar_494)
      )));
      tmpvar_496[1].y = cos((tmpvar_497 + (1.57079 * 
        (1.0 - tmpvar_494)
      )));
      pos_491 = ((tmpvar_495 * 0.5) - (pos_491 * tmpvar_496));
      vec2 tmpvar_498;
      tmpvar_498 = ((pos_491 / tmpvar_495) - vec2(0.5, 0.5));
      col_492 = vec3(0.0, 0.0, 0.0);
      float tmpvar_499;
      tmpvar_499 = (dot (tmpvar_498, tmpvar_498) * 8.0);
      float tmpvar_500;
      tmpvar_500 = ((1.0 - sqrt(
        abs((1.0 - tmpvar_499))
      )) / tmpvar_499);
      vec2 p_501;
      vec2 tmpvar_502;
      tmpvar_502 = vec2((11050.0 * zoom));
      mat2 tmpvar_503;
      float tmpvar_504;
      tmpvar_504 = (tax * 3.0);
      tmpvar_503[0].x = cos(tmpvar_504);
      tmpvar_503[0].y = -(sin(tmpvar_504));
      tmpvar_503[1].x = sin(tmpvar_504);
      tmpvar_503[1].y = cos(tmpvar_504);
      p_501 = (((pos_491 - 
        (0.5 * tmpvar_502)
      ) / tmpvar_502.y) * tmpvar_503);
      float color1_505;
      vec2 x_506;
      x_506 = (2.5 * p_501);
      float tmpvar_507;
      tmpvar_507 = (4.0 - (3.0 * sqrt(
        dot (x_506, x_506)
      )));
      color1_505 = tmpvar_507;
      float tmpvar_508;
      float tmpvar_509;
      tmpvar_509 = (min (abs(
        (p_501.x / p_501.y)
      ), 1.0) / max (abs(
        (p_501.x / p_501.y)
      ), 1.0));
      float tmpvar_510;
      tmpvar_510 = (tmpvar_509 * tmpvar_509);
      tmpvar_510 = (((
        ((((
          ((((-0.01213232 * tmpvar_510) + 0.05368138) * tmpvar_510) - 0.1173503)
         * tmpvar_510) + 0.1938925) * tmpvar_510) - 0.3326756)
       * tmpvar_510) + 0.9999793) * tmpvar_509);
      tmpvar_510 = (tmpvar_510 + (float(
        (abs((p_501.x / p_501.y)) > 1.0)
      ) * (
        (tmpvar_510 * -2.0)
       + 1.570796)));
      tmpvar_508 = (tmpvar_510 * sign((p_501.x / p_501.y)));
      if ((abs(p_501.y) > (1e-08 * abs(p_501.x)))) {
        if ((p_501.y < 0.0)) {
          if ((p_501.x >= 0.0)) {
            tmpvar_508 += 3.141593;
          } else {
            tmpvar_508 = (tmpvar_508 - 3.141593);
          };
        };
      } else {
        tmpvar_508 = (sign(p_501.x) * 1.570796);
      };
      vec3 tmpvar_511;
      tmpvar_511.z = 0.5;
      tmpvar_511.x = ((tmpvar_508 / 6.2832) + 0.5);
      tmpvar_511.y = (sqrt(dot (p_501, p_501)) * 0.4);
      vec3 tmpvar_512;
      tmpvar_512.x = 0.0;
      float tmpvar_513;
      tmpvar_513 = -(time);
      tmpvar_512.y = (tmpvar_513 * 0.05);
      tmpvar_512.z = (tmpvar_513 * 0.01);
      vec3 uv_514;
      uv_514 = (tmpvar_511 + tmpvar_512);
      vec3 f_515;
      uv_514 = (uv_514 * 32.0);
      vec3 tmpvar_516;
      tmpvar_516 = (floor((vec3(mod (uv_514, 32.0)))) * vec3(1.0, 100.0, 1000.0));
      vec3 tmpvar_517;
      tmpvar_517 = (floor((vec3(mod (
        (uv_514 + 1.0)
      , 32.0)))) * vec3(1.0, 100.0, 1000.0));
      vec3 tmpvar_518;
      tmpvar_518 = fract(uv_514);
      f_515 = ((tmpvar_518 * tmpvar_518) * (3.0 - (2.0 * tmpvar_518)));
      vec4 tmpvar_519;
      tmpvar_519.x = ((tmpvar_516.x + tmpvar_516.y) + tmpvar_516.z);
      tmpvar_519.y = ((tmpvar_517.x + tmpvar_516.y) + tmpvar_516.z);
      tmpvar_519.z = ((tmpvar_516.x + tmpvar_517.y) + tmpvar_516.z);
      tmpvar_519.w = ((tmpvar_517.x + tmpvar_517.y) + tmpvar_516.z);
      vec4 tmpvar_520;
      tmpvar_520 = fract((sin(
        (tmpvar_519 * 0.1)
      ) * 1000.0));
      vec4 tmpvar_521;
      tmpvar_521 = fract((sin(
        (((tmpvar_519 + tmpvar_517.z) - tmpvar_516.z) * 0.1)
      ) * 1000.0));
      color1_505 = (tmpvar_507 + (0.15 * (
        (mix (mix (mix (tmpvar_520.x, tmpvar_520.y, f_515.x), mix (tmpvar_520.z, tmpvar_520.w, f_515.x), f_515.y), mix (mix (tmpvar_521.x, tmpvar_521.y, f_515.x), mix (tmpvar_521.z, tmpvar_521.w, f_515.x), f_515.y), f_515.z) * 2.0)
       - 1.0)));
      if (best) {
        vec3 tmpvar_522;
        tmpvar_522.x = 0.0;
        float tmpvar_523;
        tmpvar_523 = -(time);
        tmpvar_522.y = (tmpvar_523 * 0.05);
        tmpvar_522.z = (tmpvar_523 * 0.01);
        vec3 uv_524;
        uv_524 = (tmpvar_511 + tmpvar_522);
        vec3 f_525;
        uv_524 = (uv_524 * 64.0);
        vec3 tmpvar_526;
        tmpvar_526 = (floor((vec3(mod (uv_524, 64.0)))) * vec3(1.0, 100.0, 1000.0));
        vec3 tmpvar_527;
        tmpvar_527 = (floor((vec3(mod (
          (uv_524 + 1.0)
        , 64.0)))) * vec3(1.0, 100.0, 1000.0));
        vec3 tmpvar_528;
        tmpvar_528 = fract(uv_524);
        f_525 = ((tmpvar_528 * tmpvar_528) * (3.0 - (2.0 * tmpvar_528)));
        vec4 tmpvar_529;
        tmpvar_529.x = ((tmpvar_526.x + tmpvar_526.y) + tmpvar_526.z);
        tmpvar_529.y = ((tmpvar_527.x + tmpvar_526.y) + tmpvar_526.z);
        tmpvar_529.z = ((tmpvar_526.x + tmpvar_527.y) + tmpvar_526.z);
        tmpvar_529.w = ((tmpvar_527.x + tmpvar_527.y) + tmpvar_526.z);
        vec4 tmpvar_530;
        tmpvar_530 = fract((sin(
          (tmpvar_529 * 0.1)
        ) * 1000.0));
        vec4 tmpvar_531;
        tmpvar_531 = fract((sin(
          (((tmpvar_529 + tmpvar_527.z) - tmpvar_526.z) * 0.1)
        ) * 1000.0));
        color1_505 = (color1_505 + (0.0375 * (
          (mix (mix (mix (tmpvar_530.x, tmpvar_530.y, f_525.x), mix (tmpvar_530.z, tmpvar_530.w, f_525.x), f_525.y), mix (mix (tmpvar_531.x, tmpvar_531.y, f_525.x), mix (tmpvar_531.z, tmpvar_531.w, f_525.x), f_525.y), f_525.z) * 2.0)
         - 1.0)));
        vec3 tmpvar_532;
        tmpvar_532.x = 0.0;
        tmpvar_532.y = (tmpvar_523 * 0.05);
        tmpvar_532.z = (tmpvar_523 * 0.01);
        vec3 uv_533;
        uv_533 = (tmpvar_511 + tmpvar_532);
        vec3 f_534;
        uv_533 = (uv_533 * 128.0);
        vec3 tmpvar_535;
        tmpvar_535 = (floor((vec3(mod (uv_533, 128.0)))) * vec3(1.0, 100.0, 1000.0));
        vec3 tmpvar_536;
        tmpvar_536 = (floor((vec3(mod (
          (uv_533 + 1.0)
        , 128.0)))) * vec3(1.0, 100.0, 1000.0));
        vec3 tmpvar_537;
        tmpvar_537 = fract(uv_533);
        f_534 = ((tmpvar_537 * tmpvar_537) * (3.0 - (2.0 * tmpvar_537)));
        vec4 tmpvar_538;
        tmpvar_538.x = ((tmpvar_535.x + tmpvar_535.y) + tmpvar_535.z);
        tmpvar_538.y = ((tmpvar_536.x + tmpvar_535.y) + tmpvar_535.z);
        tmpvar_538.z = ((tmpvar_535.x + tmpvar_536.y) + tmpvar_535.z);
        tmpvar_538.w = ((tmpvar_536.x + tmpvar_536.y) + tmpvar_535.z);
        vec4 tmpvar_539;
        tmpvar_539 = fract((sin(
          (tmpvar_538 * 0.1)
        ) * 1000.0));
        vec4 tmpvar_540;
        tmpvar_540 = fract((sin(
          (((tmpvar_538 + tmpvar_536.z) - tmpvar_535.z) * 0.1)
        ) * 1000.0));
        color1_505 = (color1_505 + (0.01875 * (
          (mix (mix (mix (tmpvar_539.x, tmpvar_539.y, f_534.x), mix (tmpvar_539.z, tmpvar_539.w, f_534.x), f_534.y), mix (mix (tmpvar_540.x, tmpvar_540.y, f_534.x), mix (tmpvar_540.z, tmpvar_540.w, f_534.x), f_534.y), f_534.z) * 2.0)
         - 1.0)));
      };
      color1_505 = (color1_505 * 0.6);
      vec4 tmpvar_541;
      tmpvar_541.w = 1.0;
      tmpvar_541.xyz = (vec3(0.7, 0.3556, 0.364) * vec3(color1_505));
      col_492 = ((tmpvar_541.xyz * 1.4) * tmpvar_500);
      vec4 tmpvar_542;
      tmpvar_542.xyz = col_492;
      tmpvar_542.w = tmpvar_500;
      cxu_315 = tmpvar_542;
    } else {
      cxu_315 = vec4(0.0, 0.0, 0.0, 0.0);
    };
    float tmpvar_543;
    float tmpvar_544;
    tmpvar_544 = (zoom * 5000.0);
    tmpvar_543 = (tmpvar_544 / 2.1251);
    vec2 tmpvar_545;
    tmpvar_545 = (((tmpvar_2 - 
      (planetpos1 * zoom)
    ) - shippos) - (tmpvar_544 / 2.0));
    float tmpvar_546;
    tmpvar_546 = sqrt(((
      (-(tmpvar_543) * tmpvar_543)
     + 
      (tmpvar_545.x * tmpvar_545.x)
    ) + (tmpvar_545.y * tmpvar_545.y)));
    float tmpvar_547;
    tmpvar_547 = max (0.0, ((
      ((tmpvar_543 * 0.12) / tmpvar_546)
     - 0.574) + 0.3));
    vec3 tmpvar_548;
    tmpvar_548.xy = tmpvar_545;
    tmpvar_548.z = tmpvar_546;
    float tmpvar_549;
    tmpvar_549 = max (0.0, normalize(tmpvar_548).z);
    vec4 tmpvar_550;
    tmpvar_550.w = 1.0;
    tmpvar_550.x = (tmpvar_547 * tmpvar_549);
    tmpvar_550.y = (tmpvar_547 * tmpvar_549);
    tmpvar_550.z = ((10.0 * tmpvar_547) * tmpvar_549);
    float tmpvar_551;
    tmpvar_551 = clamp (((tmpvar_321 - 1.2) / -0.2), 0.0, 1.0);
    tmpvar_311 = (((
      (max (vec4(0.0, 0.0, 0.0, 0.0), ((c_317.y + 
        ((tmpvar_322 - c_317.y) * c_317.x)
      ) * clamp (
        (9.0 - ((tmpvar_321 * tmpvar_321) * 9.0))
      , 0.0, 1.0))) * (vec4((1.0 - (1.0 - tmpvar_490))) + (cxu_315 * (1.0 - tmpvar_490))))
     + 
      (tmpvar_550 * (1.0 - clamp ((9.0 - 
        ((tmpvar_321 * tmpvar_321) * 9.0)
      ), 0.0, 1.0)))
    ) + (buff_11 * 
      (1.0 - clamp ((9.0 - (
        (tmpvar_321 * tmpvar_321)
       * 9.0)), 0.0, 1.0))
    )) + ((cxu_315 * 
      (tmpvar_551 * (tmpvar_551 * (3.0 - (2.0 * tmpvar_551))))
    ) * (1.0 - tmpvar_490)));
  } else {
    tmpvar_311 = buff_11;
  };
  buff_11 = tmpvar_311;
  vec4 tmpvar_552;
  vec2 tmpvar_553;
  tmpvar_553 = ((tmpvar_2 - (planetpos2 * zoom)) - shippos);
  vec2 x_554;
  float tmpvar_555;
  tmpvar_555 = (7500.0 * zoom);
  x_554 = (tmpvar_553 - tmpvar_555);
  float tmpvar_556;
  tmpvar_556 = float((sqrt(
    dot (x_554, x_554)
  ) >= tmpvar_555));
  if (((1.0 - tmpvar_556) > 0.0)) {
    vec4 tmpc_557;
    float bval_558;
    vec4 c_559;
    vec2 p_560;
    vec2 tmpvar_561;
    tmpvar_561 = vec2((15000.0 * zoom));
    vec2 tmpvar_562;
    tmpvar_562 = (((tmpvar_553 * 2.0) - tmpvar_561) / tmpvar_561.y);
    float tmpvar_563;
    tmpvar_563 = sqrt(dot (tmpvar_562, tmpvar_562));
    vec4 tmpvar_564;
    tmpvar_564 = (vec4(0.53, 0.952, 1.8, 1.0) + tmpvar_562.y);
    c_559 = tmpvar_564;
    p_560 = (((tmpvar_562 * 
      (sign(tmpvar_563) * (1.570796 - (sqrt(
        (1.0 - abs(tmpvar_563))
      ) * (1.570796 + 
        (abs(tmpvar_563) * (-0.2146018 + (abs(tmpvar_563) * (0.08656672 + 
          (abs(tmpvar_563) * -0.03102955)
        ))))
      ))))
    ) / tmpvar_563) - 5.0);
    p_560 = (p_560 * p_560.y);
    bval_558 = 0.01951;
    if (best) {
      bval_558 = 0.1;
      vec2 p_565;
      p_565 = (p_560 * 0.1);
      vec4 k_566;
      mat4 m_567;
      mat4 tmpvar_568;
      tmpvar_568[0].x = -1.0;
      tmpvar_568[0].y = 2.0;
      tmpvar_568[0].z = -2.0;
      tmpvar_568[0].w = 0.0;
      tmpvar_568[1].x = -2.0;
      tmpvar_568[1].y = 1.0;
      tmpvar_568[1].z = 3.0;
      tmpvar_568[1].w = 0.0;
      tmpvar_568[2].x = 3.0;
      tmpvar_568[2].y = 2.0;
      tmpvar_568[2].z = 1.0;
      tmpvar_568[2].w = 0.0;
      tmpvar_568[3].xy = (800.2 * p_565);
      tmpvar_568[3].zw = (vec2(time) + 10000.0);
      mat4 tmpvar_569;
      tmpvar_569[0].x = 1.0;
      tmpvar_569[0].y = 0.0;
      tmpvar_569[0].z = 0.0;
      tmpvar_569[0].w = 0.0;
      tmpvar_569[1].x = 0.0;
      tmpvar_569[1].y = 1.0;
      tmpvar_569[1].z = 0.0;
      tmpvar_569[1].w = 0.0;
      tmpvar_569[2].x = -1.244444;
      tmpvar_569[2].y = 0.0;
      tmpvar_569[2].z = 0.5555556;
      tmpvar_569[2].w = 0.0;
      tmpvar_569[3].x = 0.0;
      tmpvar_569[3].y = 0.0;
      tmpvar_569[3].z = 0.0;
      tmpvar_569[3].w = 1.0;
      m_567 = (tmpvar_568 * tmpvar_569);
      mat4 tmpvar_570;
      tmpvar_570 = (m_567 * 0.4);
      m_567 = tmpvar_570;
      vec4 tmpvar_571;
      tmpvar_571 = (tmpvar_570[3] * tmpvar_570);
      m_567[3] = tmpvar_571;
      vec4 x_572;
      x_572 = (fract(tmpvar_571) - 0.5);
      mat4 tmpvar_573;
      tmpvar_573 = (m_567 * -0.6);
      m_567 = tmpvar_573;
      vec4 tmpvar_574;
      tmpvar_574 = (tmpvar_573[3] * tmpvar_573);
      m_567[3] = tmpvar_574;
      vec4 x_575;
      x_575 = (fract(tmpvar_574) - 0.5);
      mat4 tmpvar_576;
      tmpvar_576 = (m_567 * -1.6);
      m_567 = tmpvar_576;
      vec4 tmpvar_577;
      tmpvar_577 = (tmpvar_576[3] * tmpvar_576);
      m_567[3] = tmpvar_577;
      vec4 x_578;
      x_578 = (fract(tmpvar_577) - 0.5);
      k_566 = (min (min (
        sqrt(dot (x_572, x_572))
      , 
        sqrt(dot (x_575, x_575))
      ), sqrt(
        dot (x_578, x_578)
      )) / m_567[2]);
      vec2 p_579;
      float r_580;
      p_579.y = (p_565.y - 0.8505124);
      p_579.x = (p_565.x - 2.005062);
      float tmpvar_581;
      float tmpvar_582;
      tmpvar_582 = (min (abs(
        (p_579.y / p_579.x)
      ), 1.0) / max (abs(
        (p_579.y / p_579.x)
      ), 1.0));
      float tmpvar_583;
      tmpvar_583 = (tmpvar_582 * tmpvar_582);
      tmpvar_583 = (((
        ((((
          ((((-0.01213232 * tmpvar_583) + 0.05368138) * tmpvar_583) - 0.1173503)
         * tmpvar_583) + 0.1938925) * tmpvar_583) - 0.3326756)
       * tmpvar_583) + 0.9999793) * tmpvar_582);
      tmpvar_583 = (tmpvar_583 + (float(
        (abs((p_579.y / p_579.x)) > 1.0)
      ) * (
        (tmpvar_583 * -2.0)
       + 1.570796)));
      tmpvar_581 = (tmpvar_583 * sign((p_579.y / p_579.x)));
      if ((abs(p_579.x) > (1e-08 * abs(p_579.y)))) {
        if ((p_579.x < 0.0)) {
          if ((p_579.y >= 0.0)) {
            tmpvar_581 += 3.141593;
          } else {
            tmpvar_581 = (tmpvar_581 - 3.141593);
          };
        };
      } else {
        tmpvar_581 = (sign(p_579.y) * 1.570796);
      };
      float tmpvar_584;
      tmpvar_584 = clamp (((tmpvar_581 - 0.8471932) / 0.2), 0.0, 1.0);
      float tmpvar_585;
      tmpvar_585 = clamp (((tmpvar_581 - 2.094386) / 0.2), 0.0, 1.0);
      r_580 = (sin((3.14158 * 
        ((tmpvar_581 - 1.047193) / 1.047193)
      )) * 0.2);
      r_580 = (r_580 + (abs(
        sin(((r_580 * 10.0) + (time * 0.1)))
      ) * 0.2));
      r_580 += 0.1;
      float tmpvar_586;
      tmpvar_586 = clamp (((
        sqrt(dot (p_579, p_579))
       - 0.4) / 0.2), 0.0, 1.0);
      float tmpvar_587;
      tmpvar_587 = clamp (((
        sqrt(dot (p_579, p_579))
       - 0.8) / (
        ((abs(sin(
          ((r_580 * 10.0) + time)
        )) * 0.2) + 2.0)
       - 0.8)), 0.0, 1.0);
      r_580 = (r_580 * ((tmpvar_586 * 
        (tmpvar_586 * (3.0 - (2.0 * tmpvar_586)))
      ) - (tmpvar_587 * 
        (tmpvar_587 * (3.0 - (2.0 * tmpvar_587)))
      )));
      vec2 xy_588;
      xy_588 = (p_579 + (time * 0.5));
      vec2 uv_589;
      vec2 tmpvar_590;
      tmpvar_590 = floor(xy_588);
      vec2 tmpvar_591;
      tmpvar_591 = (xy_588 - tmpvar_590);
      uv_589 = ((tmpvar_591 * tmpvar_591) * (3.0 - (2.0 * tmpvar_591)));
      float tmpvar_592;
      tmpvar_592 = fract((cos(
        dot (tmpvar_590, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_593;
      tmpvar_593.x = (tmpvar_590.x + 1.0);
      tmpvar_593.y = tmpvar_590.y;
      float tmpvar_594;
      tmpvar_594 = fract((cos(
        dot (tmpvar_593, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_595;
      tmpvar_595.x = tmpvar_590.x;
      tmpvar_595.y = (tmpvar_590.y + 1.0);
      float tmpvar_596;
      tmpvar_596 = fract((cos(
        dot (tmpvar_595, vec2(21.9898, 78.233))
      ) * 43758.55));
      r_580 = (r_580 * abs((
        ((tmpvar_592 + ((tmpvar_594 - tmpvar_592) * uv_589.x)) + ((tmpvar_596 - tmpvar_592) * uv_589.y))
       + 
        ((((
          (tmpvar_592 - tmpvar_594)
         - tmpvar_596) + fract(
          (cos(dot ((tmpvar_590 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_589.x) * uv_589.y)
      )));
      r_580 = (r_580 * 15.0);
      vec4 tmpvar_597;
      tmpvar_597.w = 1.0;
      tmpvar_597.xyz = ((vec3(-1.29, -0.5, -0.1) * r_580) * ((tmpvar_584 * 
        (tmpvar_584 * (3.0 - (2.0 * tmpvar_584)))
      ) - (tmpvar_585 * 
        (tmpvar_585 * (3.0 - (2.0 * tmpvar_585)))
      )));
      float c_598;
      vec2 tmpvar_599;
      tmpvar_599 = (p_565 - vec2(0.5, 0.5));
      c_598 = ((cos(
        ((p_565.x * 80.0) - (time / 2.0))
      ) * 0.5) + 0.5);
      vec4 tmpvar_600;
      tmpvar_600.x = c_598;
      tmpvar_600.y = c_598;
      tmpvar_600.z = c_598;
      tmpvar_600.w = min (clamp ((1.0 - 
        sqrt(dot (tmpvar_599, tmpvar_599))
      ), 0.0, 1.0), c_598);
      c_559 = (tmpvar_564 + ((k_566 + tmpvar_597) + mix (vec4(-0.25, 0.0, 0.0, 1.0), tmpvar_600, tmpvar_600.w)));
      p_560 = (p_560 * 0.4);
      c_559 = (c_559 * 0.6);
      vec2 p_601;
      p_601 = (p_560 * 0.1);
      vec4 k_602;
      mat4 m_603;
      mat4 tmpvar_604;
      tmpvar_604[0].x = -1.0;
      tmpvar_604[0].y = 2.0;
      tmpvar_604[0].z = -2.0;
      tmpvar_604[0].w = 0.0;
      tmpvar_604[1].x = -2.0;
      tmpvar_604[1].y = 1.0;
      tmpvar_604[1].z = 3.0;
      tmpvar_604[1].w = 0.0;
      tmpvar_604[2].x = 3.0;
      tmpvar_604[2].y = 2.0;
      tmpvar_604[2].z = 1.0;
      tmpvar_604[2].w = 0.0;
      tmpvar_604[3].xy = (800.2 * p_601);
      tmpvar_604[3].zw = (vec2(time) + 10000.0);
      mat4 tmpvar_605;
      tmpvar_605[0].x = 1.0;
      tmpvar_605[0].y = 0.0;
      tmpvar_605[0].z = 0.0;
      tmpvar_605[0].w = 0.0;
      tmpvar_605[1].x = 0.0;
      tmpvar_605[1].y = 1.0;
      tmpvar_605[1].z = 0.0;
      tmpvar_605[1].w = 0.0;
      tmpvar_605[2].x = -1.244444;
      tmpvar_605[2].y = 0.0;
      tmpvar_605[2].z = 0.5555556;
      tmpvar_605[2].w = 0.0;
      tmpvar_605[3].x = 0.0;
      tmpvar_605[3].y = 0.0;
      tmpvar_605[3].z = 0.0;
      tmpvar_605[3].w = 1.0;
      m_603 = (tmpvar_604 * tmpvar_605);
      mat4 tmpvar_606;
      tmpvar_606 = (m_603 * 0.4);
      m_603 = tmpvar_606;
      vec4 tmpvar_607;
      tmpvar_607 = (tmpvar_606[3] * tmpvar_606);
      m_603[3] = tmpvar_607;
      vec4 x_608;
      x_608 = (fract(tmpvar_607) - 0.5);
      mat4 tmpvar_609;
      tmpvar_609 = (m_603 * -0.6);
      m_603 = tmpvar_609;
      vec4 tmpvar_610;
      tmpvar_610 = (tmpvar_609[3] * tmpvar_609);
      m_603[3] = tmpvar_610;
      vec4 x_611;
      x_611 = (fract(tmpvar_610) - 0.5);
      mat4 tmpvar_612;
      tmpvar_612 = (m_603 * -1.6);
      m_603 = tmpvar_612;
      vec4 tmpvar_613;
      tmpvar_613 = (tmpvar_612[3] * tmpvar_612);
      m_603[3] = tmpvar_613;
      vec4 x_614;
      x_614 = (fract(tmpvar_613) - 0.5);
      k_602 = (min (min (
        sqrt(dot (x_608, x_608))
      , 
        sqrt(dot (x_611, x_611))
      ), sqrt(
        dot (x_614, x_614)
      )) / m_603[2]);
      vec2 p_615;
      float r_616;
      p_615.y = (p_601.y - 0.8505124);
      p_615.x = (p_601.x - 2.005062);
      float tmpvar_617;
      float tmpvar_618;
      tmpvar_618 = (min (abs(
        (p_615.y / p_615.x)
      ), 1.0) / max (abs(
        (p_615.y / p_615.x)
      ), 1.0));
      float tmpvar_619;
      tmpvar_619 = (tmpvar_618 * tmpvar_618);
      tmpvar_619 = (((
        ((((
          ((((-0.01213232 * tmpvar_619) + 0.05368138) * tmpvar_619) - 0.1173503)
         * tmpvar_619) + 0.1938925) * tmpvar_619) - 0.3326756)
       * tmpvar_619) + 0.9999793) * tmpvar_618);
      tmpvar_619 = (tmpvar_619 + (float(
        (abs((p_615.y / p_615.x)) > 1.0)
      ) * (
        (tmpvar_619 * -2.0)
       + 1.570796)));
      tmpvar_617 = (tmpvar_619 * sign((p_615.y / p_615.x)));
      if ((abs(p_615.x) > (1e-08 * abs(p_615.y)))) {
        if ((p_615.x < 0.0)) {
          if ((p_615.y >= 0.0)) {
            tmpvar_617 += 3.141593;
          } else {
            tmpvar_617 = (tmpvar_617 - 3.141593);
          };
        };
      } else {
        tmpvar_617 = (sign(p_615.y) * 1.570796);
      };
      float tmpvar_620;
      tmpvar_620 = clamp (((tmpvar_617 - 0.8471932) / 0.2), 0.0, 1.0);
      float tmpvar_621;
      tmpvar_621 = clamp (((tmpvar_617 - 2.094386) / 0.2), 0.0, 1.0);
      r_616 = (sin((3.14158 * 
        ((tmpvar_617 - 1.047193) / 1.047193)
      )) * 0.2);
      r_616 = (r_616 + (abs(
        sin(((r_616 * 10.0) + (time * 0.1)))
      ) * 0.2));
      r_616 += 0.1;
      float tmpvar_622;
      tmpvar_622 = clamp (((
        sqrt(dot (p_615, p_615))
       - 0.4) / 0.2), 0.0, 1.0);
      float tmpvar_623;
      tmpvar_623 = clamp (((
        sqrt(dot (p_615, p_615))
       - 0.8) / (
        ((abs(sin(
          ((r_616 * 10.0) + time)
        )) * 0.2) + 2.0)
       - 0.8)), 0.0, 1.0);
      r_616 = (r_616 * ((tmpvar_622 * 
        (tmpvar_622 * (3.0 - (2.0 * tmpvar_622)))
      ) - (tmpvar_623 * 
        (tmpvar_623 * (3.0 - (2.0 * tmpvar_623)))
      )));
      vec2 xy_624;
      xy_624 = (p_615 + (time * 0.5));
      vec2 uv_625;
      vec2 tmpvar_626;
      tmpvar_626 = floor(xy_624);
      vec2 tmpvar_627;
      tmpvar_627 = (xy_624 - tmpvar_626);
      uv_625 = ((tmpvar_627 * tmpvar_627) * (3.0 - (2.0 * tmpvar_627)));
      float tmpvar_628;
      tmpvar_628 = fract((cos(
        dot (tmpvar_626, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_629;
      tmpvar_629.x = (tmpvar_626.x + 1.0);
      tmpvar_629.y = tmpvar_626.y;
      float tmpvar_630;
      tmpvar_630 = fract((cos(
        dot (tmpvar_629, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_631;
      tmpvar_631.x = tmpvar_626.x;
      tmpvar_631.y = (tmpvar_626.y + 1.0);
      float tmpvar_632;
      tmpvar_632 = fract((cos(
        dot (tmpvar_631, vec2(21.9898, 78.233))
      ) * 43758.55));
      r_616 = (r_616 * abs((
        ((tmpvar_628 + ((tmpvar_630 - tmpvar_628) * uv_625.x)) + ((tmpvar_632 - tmpvar_628) * uv_625.y))
       + 
        ((((
          (tmpvar_628 - tmpvar_630)
         - tmpvar_632) + fract(
          (cos(dot ((tmpvar_626 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_625.x) * uv_625.y)
      )));
      r_616 = (r_616 * 15.0);
      vec4 tmpvar_633;
      tmpvar_633.w = 1.0;
      tmpvar_633.xyz = ((vec3(-1.29, -0.5, -0.1) * r_616) * ((tmpvar_620 * 
        (tmpvar_620 * (3.0 - (2.0 * tmpvar_620)))
      ) - (tmpvar_621 * 
        (tmpvar_621 * (3.0 - (2.0 * tmpvar_621)))
      )));
      float c_634;
      vec2 tmpvar_635;
      tmpvar_635 = (p_601 - vec2(0.5, 0.5));
      c_634 = ((cos(
        ((p_601.x * 80.0) - (time / 2.0))
      ) * 0.5) + 0.5);
      vec4 tmpvar_636;
      tmpvar_636.x = c_634;
      tmpvar_636.y = c_634;
      tmpvar_636.z = c_634;
      tmpvar_636.w = min (clamp ((1.0 - 
        sqrt(dot (tmpvar_635, tmpvar_635))
      ), 0.0, 1.0), c_634);
      c_559 = (c_559 + ((k_602 + tmpvar_633) + mix (vec4(-0.25, 0.0, 0.0, 1.0), tmpvar_636, tmpvar_636.w)));
      p_560 = (p_560 * 0.4);
      c_559 = (c_559 * 0.6);
      vec2 p_637;
      p_637 = (p_560 * 0.1);
      vec4 k_638;
      mat4 m_639;
      mat4 tmpvar_640;
      tmpvar_640[0].x = -1.0;
      tmpvar_640[0].y = 2.0;
      tmpvar_640[0].z = -2.0;
      tmpvar_640[0].w = 0.0;
      tmpvar_640[1].x = -2.0;
      tmpvar_640[1].y = 1.0;
      tmpvar_640[1].z = 3.0;
      tmpvar_640[1].w = 0.0;
      tmpvar_640[2].x = 3.0;
      tmpvar_640[2].y = 2.0;
      tmpvar_640[2].z = 1.0;
      tmpvar_640[2].w = 0.0;
      tmpvar_640[3].xy = (800.2 * p_637);
      tmpvar_640[3].zw = (vec2(time) + 10000.0);
      mat4 tmpvar_641;
      tmpvar_641[0].x = 1.0;
      tmpvar_641[0].y = 0.0;
      tmpvar_641[0].z = 0.0;
      tmpvar_641[0].w = 0.0;
      tmpvar_641[1].x = 0.0;
      tmpvar_641[1].y = 1.0;
      tmpvar_641[1].z = 0.0;
      tmpvar_641[1].w = 0.0;
      tmpvar_641[2].x = -1.244444;
      tmpvar_641[2].y = 0.0;
      tmpvar_641[2].z = 0.5555556;
      tmpvar_641[2].w = 0.0;
      tmpvar_641[3].x = 0.0;
      tmpvar_641[3].y = 0.0;
      tmpvar_641[3].z = 0.0;
      tmpvar_641[3].w = 1.0;
      m_639 = (tmpvar_640 * tmpvar_641);
      mat4 tmpvar_642;
      tmpvar_642 = (m_639 * 0.4);
      m_639 = tmpvar_642;
      vec4 tmpvar_643;
      tmpvar_643 = (tmpvar_642[3] * tmpvar_642);
      m_639[3] = tmpvar_643;
      vec4 x_644;
      x_644 = (fract(tmpvar_643) - 0.5);
      mat4 tmpvar_645;
      tmpvar_645 = (m_639 * -0.6);
      m_639 = tmpvar_645;
      vec4 tmpvar_646;
      tmpvar_646 = (tmpvar_645[3] * tmpvar_645);
      m_639[3] = tmpvar_646;
      vec4 x_647;
      x_647 = (fract(tmpvar_646) - 0.5);
      mat4 tmpvar_648;
      tmpvar_648 = (m_639 * -1.6);
      m_639 = tmpvar_648;
      vec4 tmpvar_649;
      tmpvar_649 = (tmpvar_648[3] * tmpvar_648);
      m_639[3] = tmpvar_649;
      vec4 x_650;
      x_650 = (fract(tmpvar_649) - 0.5);
      k_638 = (min (min (
        sqrt(dot (x_644, x_644))
      , 
        sqrt(dot (x_647, x_647))
      ), sqrt(
        dot (x_650, x_650)
      )) / m_639[2]);
      vec2 p_651;
      float r_652;
      p_651.y = (p_637.y - 0.8505124);
      p_651.x = (p_637.x - 2.005062);
      float tmpvar_653;
      float tmpvar_654;
      tmpvar_654 = (min (abs(
        (p_651.y / p_651.x)
      ), 1.0) / max (abs(
        (p_651.y / p_651.x)
      ), 1.0));
      float tmpvar_655;
      tmpvar_655 = (tmpvar_654 * tmpvar_654);
      tmpvar_655 = (((
        ((((
          ((((-0.01213232 * tmpvar_655) + 0.05368138) * tmpvar_655) - 0.1173503)
         * tmpvar_655) + 0.1938925) * tmpvar_655) - 0.3326756)
       * tmpvar_655) + 0.9999793) * tmpvar_654);
      tmpvar_655 = (tmpvar_655 + (float(
        (abs((p_651.y / p_651.x)) > 1.0)
      ) * (
        (tmpvar_655 * -2.0)
       + 1.570796)));
      tmpvar_653 = (tmpvar_655 * sign((p_651.y / p_651.x)));
      if ((abs(p_651.x) > (1e-08 * abs(p_651.y)))) {
        if ((p_651.x < 0.0)) {
          if ((p_651.y >= 0.0)) {
            tmpvar_653 += 3.141593;
          } else {
            tmpvar_653 = (tmpvar_653 - 3.141593);
          };
        };
      } else {
        tmpvar_653 = (sign(p_651.y) * 1.570796);
      };
      float tmpvar_656;
      tmpvar_656 = clamp (((tmpvar_653 - 0.8471932) / 0.2), 0.0, 1.0);
      float tmpvar_657;
      tmpvar_657 = clamp (((tmpvar_653 - 2.094386) / 0.2), 0.0, 1.0);
      r_652 = (sin((3.14158 * 
        ((tmpvar_653 - 1.047193) / 1.047193)
      )) * 0.2);
      r_652 = (r_652 + (abs(
        sin(((r_652 * 10.0) + (time * 0.1)))
      ) * 0.2));
      r_652 += 0.1;
      float tmpvar_658;
      tmpvar_658 = clamp (((
        sqrt(dot (p_651, p_651))
       - 0.4) / 0.2), 0.0, 1.0);
      float tmpvar_659;
      tmpvar_659 = clamp (((
        sqrt(dot (p_651, p_651))
       - 0.8) / (
        ((abs(sin(
          ((r_652 * 10.0) + time)
        )) * 0.2) + 2.0)
       - 0.8)), 0.0, 1.0);
      r_652 = (r_652 * ((tmpvar_658 * 
        (tmpvar_658 * (3.0 - (2.0 * tmpvar_658)))
      ) - (tmpvar_659 * 
        (tmpvar_659 * (3.0 - (2.0 * tmpvar_659)))
      )));
      vec2 xy_660;
      xy_660 = (p_651 + (time * 0.5));
      vec2 uv_661;
      vec2 tmpvar_662;
      tmpvar_662 = floor(xy_660);
      vec2 tmpvar_663;
      tmpvar_663 = (xy_660 - tmpvar_662);
      uv_661 = ((tmpvar_663 * tmpvar_663) * (3.0 - (2.0 * tmpvar_663)));
      float tmpvar_664;
      tmpvar_664 = fract((cos(
        dot (tmpvar_662, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_665;
      tmpvar_665.x = (tmpvar_662.x + 1.0);
      tmpvar_665.y = tmpvar_662.y;
      float tmpvar_666;
      tmpvar_666 = fract((cos(
        dot (tmpvar_665, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_667;
      tmpvar_667.x = tmpvar_662.x;
      tmpvar_667.y = (tmpvar_662.y + 1.0);
      float tmpvar_668;
      tmpvar_668 = fract((cos(
        dot (tmpvar_667, vec2(21.9898, 78.233))
      ) * 43758.55));
      r_652 = (r_652 * abs((
        ((tmpvar_664 + ((tmpvar_666 - tmpvar_664) * uv_661.x)) + ((tmpvar_668 - tmpvar_664) * uv_661.y))
       + 
        ((((
          (tmpvar_664 - tmpvar_666)
         - tmpvar_668) + fract(
          (cos(dot ((tmpvar_662 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_661.x) * uv_661.y)
      )));
      r_652 = (r_652 * 15.0);
      vec4 tmpvar_669;
      tmpvar_669.w = 1.0;
      tmpvar_669.xyz = ((vec3(-1.29, -0.5, -0.1) * r_652) * ((tmpvar_656 * 
        (tmpvar_656 * (3.0 - (2.0 * tmpvar_656)))
      ) - (tmpvar_657 * 
        (tmpvar_657 * (3.0 - (2.0 * tmpvar_657)))
      )));
      float c_670;
      vec2 tmpvar_671;
      tmpvar_671 = (p_637 - vec2(0.5, 0.5));
      c_670 = ((cos(
        ((p_637.x * 80.0) - (time / 2.0))
      ) * 0.5) + 0.5);
      vec4 tmpvar_672;
      tmpvar_672.x = c_670;
      tmpvar_672.y = c_670;
      tmpvar_672.z = c_670;
      tmpvar_672.w = min (clamp ((1.0 - 
        sqrt(dot (tmpvar_671, tmpvar_671))
      ), 0.0, 1.0), c_670);
      c_559 = (c_559 + ((k_638 + tmpvar_669) + mix (vec4(-0.25, 0.0, 0.0, 1.0), tmpvar_672, tmpvar_672.w)));
      p_560 = (p_560 * 0.4);
      c_559 = (c_559 * 0.6);
    };
    vec2 p_673;
    p_673 = (p_560 * bval_558);
    vec4 k_674;
    mat4 m_675;
    mat4 tmpvar_676;
    tmpvar_676[0].x = -1.0;
    tmpvar_676[0].y = 2.0;
    tmpvar_676[0].z = -2.0;
    tmpvar_676[0].w = 0.0;
    tmpvar_676[1].x = -2.0;
    tmpvar_676[1].y = 1.0;
    tmpvar_676[1].z = 3.0;
    tmpvar_676[1].w = 0.0;
    tmpvar_676[2].x = 3.0;
    tmpvar_676[2].y = 2.0;
    tmpvar_676[2].z = 1.0;
    tmpvar_676[2].w = 0.0;
    tmpvar_676[3].xy = (800.2 * p_673);
    tmpvar_676[3].zw = (vec2(time) + 10000.0);
    mat4 tmpvar_677;
    tmpvar_677[0].x = 1.0;
    tmpvar_677[0].y = 0.0;
    tmpvar_677[0].z = 0.0;
    tmpvar_677[0].w = 0.0;
    tmpvar_677[1].x = 0.0;
    tmpvar_677[1].y = 1.0;
    tmpvar_677[1].z = 0.0;
    tmpvar_677[1].w = 0.0;
    tmpvar_677[2].x = -1.244444;
    tmpvar_677[2].y = 0.0;
    tmpvar_677[2].z = 0.5555556;
    tmpvar_677[2].w = 0.0;
    tmpvar_677[3].x = 0.0;
    tmpvar_677[3].y = 0.0;
    tmpvar_677[3].z = 0.0;
    tmpvar_677[3].w = 1.0;
    m_675 = (tmpvar_676 * tmpvar_677);
    mat4 tmpvar_678;
    tmpvar_678 = (m_675 * 0.4);
    m_675 = tmpvar_678;
    vec4 tmpvar_679;
    tmpvar_679 = (tmpvar_678[3] * tmpvar_678);
    m_675[3] = tmpvar_679;
    vec4 x_680;
    x_680 = (fract(tmpvar_679) - 0.5);
    mat4 tmpvar_681;
    tmpvar_681 = (m_675 * -0.6);
    m_675 = tmpvar_681;
    vec4 tmpvar_682;
    tmpvar_682 = (tmpvar_681[3] * tmpvar_681);
    m_675[3] = tmpvar_682;
    vec4 x_683;
    x_683 = (fract(tmpvar_682) - 0.5);
    mat4 tmpvar_684;
    tmpvar_684 = (m_675 * -1.6);
    m_675 = tmpvar_684;
    vec4 tmpvar_685;
    tmpvar_685 = (tmpvar_684[3] * tmpvar_684);
    m_675[3] = tmpvar_685;
    vec4 x_686;
    x_686 = (fract(tmpvar_685) - 0.5);
    k_674 = (min (min (
      sqrt(dot (x_680, x_680))
    , 
      sqrt(dot (x_683, x_683))
    ), sqrt(
      dot (x_686, x_686)
    )) / m_675[2]);
    vec2 p_687;
    float r_688;
    p_687.y = (p_673.y - 0.8505124);
    p_687.x = (p_673.x - 2.005062);
    float tmpvar_689;
    float tmpvar_690;
    tmpvar_690 = (min (abs(
      (p_687.y / p_687.x)
    ), 1.0) / max (abs(
      (p_687.y / p_687.x)
    ), 1.0));
    float tmpvar_691;
    tmpvar_691 = (tmpvar_690 * tmpvar_690);
    tmpvar_691 = (((
      ((((
        ((((-0.01213232 * tmpvar_691) + 0.05368138) * tmpvar_691) - 0.1173503)
       * tmpvar_691) + 0.1938925) * tmpvar_691) - 0.3326756)
     * tmpvar_691) + 0.9999793) * tmpvar_690);
    tmpvar_691 = (tmpvar_691 + (float(
      (abs((p_687.y / p_687.x)) > 1.0)
    ) * (
      (tmpvar_691 * -2.0)
     + 1.570796)));
    tmpvar_689 = (tmpvar_691 * sign((p_687.y / p_687.x)));
    if ((abs(p_687.x) > (1e-08 * abs(p_687.y)))) {
      if ((p_687.x < 0.0)) {
        if ((p_687.y >= 0.0)) {
          tmpvar_689 += 3.141593;
        } else {
          tmpvar_689 = (tmpvar_689 - 3.141593);
        };
      };
    } else {
      tmpvar_689 = (sign(p_687.y) * 1.570796);
    };
    float tmpvar_692;
    tmpvar_692 = clamp (((tmpvar_689 - 0.8471932) / 0.2), 0.0, 1.0);
    float tmpvar_693;
    tmpvar_693 = clamp (((tmpvar_689 - 2.094386) / 0.2), 0.0, 1.0);
    r_688 = (sin((3.14158 * 
      ((tmpvar_689 - 1.047193) / 1.047193)
    )) * 0.2);
    r_688 = (r_688 + (abs(
      sin(((r_688 * 10.0) + (time * 0.1)))
    ) * 0.2));
    r_688 += 0.1;
    float tmpvar_694;
    tmpvar_694 = clamp (((
      sqrt(dot (p_687, p_687))
     - 0.4) / 0.2), 0.0, 1.0);
    float tmpvar_695;
    tmpvar_695 = clamp (((
      sqrt(dot (p_687, p_687))
     - 0.8) / (
      ((abs(sin(
        ((r_688 * 10.0) + time)
      )) * 0.2) + 2.0)
     - 0.8)), 0.0, 1.0);
    r_688 = (r_688 * ((tmpvar_694 * 
      (tmpvar_694 * (3.0 - (2.0 * tmpvar_694)))
    ) - (tmpvar_695 * 
      (tmpvar_695 * (3.0 - (2.0 * tmpvar_695)))
    )));
    vec2 xy_696;
    xy_696 = (p_687 + (time * 0.5));
    vec2 uv_697;
    vec2 tmpvar_698;
    tmpvar_698 = floor(xy_696);
    vec2 tmpvar_699;
    tmpvar_699 = (xy_696 - tmpvar_698);
    uv_697 = ((tmpvar_699 * tmpvar_699) * (3.0 - (2.0 * tmpvar_699)));
    float tmpvar_700;
    tmpvar_700 = fract((cos(
      dot (tmpvar_698, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_701;
    tmpvar_701.x = (tmpvar_698.x + 1.0);
    tmpvar_701.y = tmpvar_698.y;
    float tmpvar_702;
    tmpvar_702 = fract((cos(
      dot (tmpvar_701, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_703;
    tmpvar_703.x = tmpvar_698.x;
    tmpvar_703.y = (tmpvar_698.y + 1.0);
    float tmpvar_704;
    tmpvar_704 = fract((cos(
      dot (tmpvar_703, vec2(21.9898, 78.233))
    ) * 43758.55));
    r_688 = (r_688 * abs((
      ((tmpvar_700 + ((tmpvar_702 - tmpvar_700) * uv_697.x)) + ((tmpvar_704 - tmpvar_700) * uv_697.y))
     + 
      ((((
        (tmpvar_700 - tmpvar_702)
       - tmpvar_704) + fract(
        (cos(dot ((tmpvar_698 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
      )) * uv_697.x) * uv_697.y)
    )));
    r_688 = (r_688 * 15.0);
    vec4 tmpvar_705;
    tmpvar_705.w = 1.0;
    tmpvar_705.xyz = ((vec3(-1.29, -0.5, -0.1) * r_688) * ((tmpvar_692 * 
      (tmpvar_692 * (3.0 - (2.0 * tmpvar_692)))
    ) - (tmpvar_693 * 
      (tmpvar_693 * (3.0 - (2.0 * tmpvar_693)))
    )));
    float c_706;
    vec2 tmpvar_707;
    tmpvar_707 = (p_673 - vec2(0.5, 0.5));
    c_706 = ((cos(
      ((p_673.x * 80.0) - (time / 2.0))
    ) * 0.5) + 0.5);
    vec4 tmpvar_708;
    tmpvar_708.x = c_706;
    tmpvar_708.y = c_706;
    tmpvar_708.z = c_706;
    tmpvar_708.w = min (clamp ((1.0 - 
      sqrt(dot (tmpvar_707, tmpvar_707))
    ), 0.0, 1.0), c_706);
    c_559 = (c_559 + ((k_674 + tmpvar_705) + mix (vec4(-0.25, 0.0, 0.0, 1.0), tmpvar_708, tmpvar_708.w)));
    p_560 = (p_560 * 0.4);
    c_559 = (c_559 * 0.6);
    vec2 p_709;
    p_709 = (p_560 * bval_558);
    vec4 k_710;
    mat4 m_711;
    mat4 tmpvar_712;
    tmpvar_712[0].x = -1.0;
    tmpvar_712[0].y = 2.0;
    tmpvar_712[0].z = -2.0;
    tmpvar_712[0].w = 0.0;
    tmpvar_712[1].x = -2.0;
    tmpvar_712[1].y = 1.0;
    tmpvar_712[1].z = 3.0;
    tmpvar_712[1].w = 0.0;
    tmpvar_712[2].x = 3.0;
    tmpvar_712[2].y = 2.0;
    tmpvar_712[2].z = 1.0;
    tmpvar_712[2].w = 0.0;
    tmpvar_712[3].xy = (800.2 * p_709);
    tmpvar_712[3].zw = (vec2(time) + 10000.0);
    mat4 tmpvar_713;
    tmpvar_713[0].x = 1.0;
    tmpvar_713[0].y = 0.0;
    tmpvar_713[0].z = 0.0;
    tmpvar_713[0].w = 0.0;
    tmpvar_713[1].x = 0.0;
    tmpvar_713[1].y = 1.0;
    tmpvar_713[1].z = 0.0;
    tmpvar_713[1].w = 0.0;
    tmpvar_713[2].x = -1.244444;
    tmpvar_713[2].y = 0.0;
    tmpvar_713[2].z = 0.5555556;
    tmpvar_713[2].w = 0.0;
    tmpvar_713[3].x = 0.0;
    tmpvar_713[3].y = 0.0;
    tmpvar_713[3].z = 0.0;
    tmpvar_713[3].w = 1.0;
    m_711 = (tmpvar_712 * tmpvar_713);
    mat4 tmpvar_714;
    tmpvar_714 = (m_711 * 0.4);
    m_711 = tmpvar_714;
    vec4 tmpvar_715;
    tmpvar_715 = (tmpvar_714[3] * tmpvar_714);
    m_711[3] = tmpvar_715;
    vec4 x_716;
    x_716 = (fract(tmpvar_715) - 0.5);
    mat4 tmpvar_717;
    tmpvar_717 = (m_711 * -0.6);
    m_711 = tmpvar_717;
    vec4 tmpvar_718;
    tmpvar_718 = (tmpvar_717[3] * tmpvar_717);
    m_711[3] = tmpvar_718;
    vec4 x_719;
    x_719 = (fract(tmpvar_718) - 0.5);
    mat4 tmpvar_720;
    tmpvar_720 = (m_711 * -1.6);
    m_711 = tmpvar_720;
    vec4 tmpvar_721;
    tmpvar_721 = (tmpvar_720[3] * tmpvar_720);
    m_711[3] = tmpvar_721;
    vec4 x_722;
    x_722 = (fract(tmpvar_721) - 0.5);
    k_710 = (min (min (
      sqrt(dot (x_716, x_716))
    , 
      sqrt(dot (x_719, x_719))
    ), sqrt(
      dot (x_722, x_722)
    )) / m_711[2]);
    vec2 p_723;
    float r_724;
    p_723.y = (p_709.y - 0.8505124);
    p_723.x = (p_709.x - 2.005062);
    float tmpvar_725;
    float tmpvar_726;
    tmpvar_726 = (min (abs(
      (p_723.y / p_723.x)
    ), 1.0) / max (abs(
      (p_723.y / p_723.x)
    ), 1.0));
    float tmpvar_727;
    tmpvar_727 = (tmpvar_726 * tmpvar_726);
    tmpvar_727 = (((
      ((((
        ((((-0.01213232 * tmpvar_727) + 0.05368138) * tmpvar_727) - 0.1173503)
       * tmpvar_727) + 0.1938925) * tmpvar_727) - 0.3326756)
     * tmpvar_727) + 0.9999793) * tmpvar_726);
    tmpvar_727 = (tmpvar_727 + (float(
      (abs((p_723.y / p_723.x)) > 1.0)
    ) * (
      (tmpvar_727 * -2.0)
     + 1.570796)));
    tmpvar_725 = (tmpvar_727 * sign((p_723.y / p_723.x)));
    if ((abs(p_723.x) > (1e-08 * abs(p_723.y)))) {
      if ((p_723.x < 0.0)) {
        if ((p_723.y >= 0.0)) {
          tmpvar_725 += 3.141593;
        } else {
          tmpvar_725 = (tmpvar_725 - 3.141593);
        };
      };
    } else {
      tmpvar_725 = (sign(p_723.y) * 1.570796);
    };
    float tmpvar_728;
    tmpvar_728 = clamp (((tmpvar_725 - 0.8471932) / 0.2), 0.0, 1.0);
    float tmpvar_729;
    tmpvar_729 = clamp (((tmpvar_725 - 2.094386) / 0.2), 0.0, 1.0);
    r_724 = (sin((3.14158 * 
      ((tmpvar_725 - 1.047193) / 1.047193)
    )) * 0.2);
    r_724 = (r_724 + (abs(
      sin(((r_724 * 10.0) + (time * 0.1)))
    ) * 0.2));
    r_724 += 0.1;
    float tmpvar_730;
    tmpvar_730 = clamp (((
      sqrt(dot (p_723, p_723))
     - 0.4) / 0.2), 0.0, 1.0);
    float tmpvar_731;
    tmpvar_731 = clamp (((
      sqrt(dot (p_723, p_723))
     - 0.8) / (
      ((abs(sin(
        ((r_724 * 10.0) + time)
      )) * 0.2) + 2.0)
     - 0.8)), 0.0, 1.0);
    r_724 = (r_724 * ((tmpvar_730 * 
      (tmpvar_730 * (3.0 - (2.0 * tmpvar_730)))
    ) - (tmpvar_731 * 
      (tmpvar_731 * (3.0 - (2.0 * tmpvar_731)))
    )));
    vec2 xy_732;
    xy_732 = (p_723 + (time * 0.5));
    vec2 uv_733;
    vec2 tmpvar_734;
    tmpvar_734 = floor(xy_732);
    vec2 tmpvar_735;
    tmpvar_735 = (xy_732 - tmpvar_734);
    uv_733 = ((tmpvar_735 * tmpvar_735) * (3.0 - (2.0 * tmpvar_735)));
    float tmpvar_736;
    tmpvar_736 = fract((cos(
      dot (tmpvar_734, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_737;
    tmpvar_737.x = (tmpvar_734.x + 1.0);
    tmpvar_737.y = tmpvar_734.y;
    float tmpvar_738;
    tmpvar_738 = fract((cos(
      dot (tmpvar_737, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_739;
    tmpvar_739.x = tmpvar_734.x;
    tmpvar_739.y = (tmpvar_734.y + 1.0);
    float tmpvar_740;
    tmpvar_740 = fract((cos(
      dot (tmpvar_739, vec2(21.9898, 78.233))
    ) * 43758.55));
    r_724 = (r_724 * abs((
      ((tmpvar_736 + ((tmpvar_738 - tmpvar_736) * uv_733.x)) + ((tmpvar_740 - tmpvar_736) * uv_733.y))
     + 
      ((((
        (tmpvar_736 - tmpvar_738)
       - tmpvar_740) + fract(
        (cos(dot ((tmpvar_734 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
      )) * uv_733.x) * uv_733.y)
    )));
    r_724 = (r_724 * 15.0);
    vec4 tmpvar_741;
    tmpvar_741.w = 1.0;
    tmpvar_741.xyz = ((vec3(-1.29, -0.5, -0.1) * r_724) * ((tmpvar_728 * 
      (tmpvar_728 * (3.0 - (2.0 * tmpvar_728)))
    ) - (tmpvar_729 * 
      (tmpvar_729 * (3.0 - (2.0 * tmpvar_729)))
    )));
    float c_742;
    vec2 tmpvar_743;
    tmpvar_743 = (p_709 - vec2(0.5, 0.5));
    c_742 = ((cos(
      ((p_709.x * 80.0) - (time / 2.0))
    ) * 0.5) + 0.5);
    vec4 tmpvar_744;
    tmpvar_744.x = c_742;
    tmpvar_744.y = c_742;
    tmpvar_744.z = c_742;
    tmpvar_744.w = min (clamp ((1.0 - 
      sqrt(dot (tmpvar_743, tmpvar_743))
    ), 0.0, 1.0), c_742);
    c_559 = (c_559 + ((k_710 + tmpvar_741) + mix (vec4(-0.25, 0.0, 0.0, 1.0), tmpvar_744, tmpvar_744.w)));
    p_560 = (p_560 * 0.4);
    c_559 = (c_559 * 0.6);
    vec4 tmpvar_745;
    tmpvar_745 = max (vec4(0.0, 0.0, 0.0, 0.0), ((
      (c_559.y + ((tmpvar_564 - c_559.y) * c_559.x))
     * 
      clamp ((9.0 - ((tmpvar_563 * tmpvar_563) * 9.0)), 0.0, 1.0)
    ) + (tmpvar_311 * 
      (1.0 - clamp ((9.0 - (
        (tmpvar_563 * tmpvar_563)
       * 9.0)), 0.0, 1.0))
    )));
    tmpc_557.zw = tmpvar_745.zw;
    tmpc_557.x = (tmpvar_745.x * 0.55);
    tmpc_557.y = (tmpvar_745.y * 0.725);
    tmpvar_552 = tmpc_557;
  } else {
    tmpvar_552 = tmpvar_311;
  };
  buff_11 = tmpvar_552;
  vec4 tmpvar_746;
  vec2 tmpvar_747;
  tmpvar_747 = ((tmpvar_2 - (planetpos3 * zoom)) - shippos);
  vec2 x_748;
  float tmpvar_749;
  tmpvar_749 = (10000.0 * zoom);
  x_748 = (tmpvar_747 - tmpvar_749);
  float tmpvar_750;
  tmpvar_750 = float((sqrt(
    dot (x_748, x_748)
  ) >= tmpvar_749));
  if (((1.0 - tmpvar_750) > 0.0)) {
    vec4 c_751;
    vec2 p_752;
    vec2 tmpvar_753;
    tmpvar_753 = vec2((20000.0 * zoom));
    vec2 tmpvar_754;
    tmpvar_754 = (((tmpvar_747 * 2.0) - tmpvar_753) / tmpvar_753.y);
    float tmpvar_755;
    tmpvar_755 = sqrt(dot (tmpvar_754, tmpvar_754));
    vec4 tmpvar_756;
    tmpvar_756 = (vec4(0.43, 0.442, 0.4, 1.0) + tmpvar_754.y);
    c_751 = tmpvar_756;
    p_752 = (((tmpvar_754 * 
      (sign(tmpvar_755) * (1.570796 - (sqrt(
        (1.0 - abs(tmpvar_755))
      ) * (1.570796 + 
        (abs(tmpvar_755) * (-0.2146018 + (abs(tmpvar_755) * (0.08656672 + 
          (abs(tmpvar_755) * -0.03102955)
        ))))
      ))))
    ) / tmpvar_755) - 5.0);
    p_752 = (p_752 * p_752.y);
    if (best) {
      vec2 fragCoord_757;
      fragCoord_757 = (p_752 * 0.0390151);
      vec3 color_758;
      vec2 tmpvar_759;
      tmpvar_759 = (fragCoord_757 * 0.51);
      vec2 tmpvar_760;
      tmpvar_760.y = 0.5;
      tmpvar_760.x = (0.5 - (0.015 * sin(
        (time / 3.0)
      )));
      vec2 tmpvar_761;
      tmpvar_761.x = tmpvar_760.x;
      tmpvar_761.y = 0.5;
      vec2 tmpvar_762;
      tmpvar_762 = (mat2(0.866, 0.5, -0.5, 0.866) * (tmpvar_759 - tmpvar_761));
      vec2 x_763;
      x_763 = (tmpvar_759 - tmpvar_761);
      vec3 tmpvar_764;
      tmpvar_764 = mix (mix (mix (vec3(1.5, 1.294, 1.908235), vec3(1.0, 0.0504019, -0.806), 
        (0.5 * (1.0 + sin((60.0 * tmpvar_762.y))))
      ), vec3(1.0, 1.0, 0.5), (0.5 * 
        (1.0 + sin(((80.0 * tmpvar_762.y) * tmpvar_762.y)))
      )), color_758, pow (sqrt(
        dot (x_763, x_763)
      ), 80.0));
      color_758 = tmpvar_764;
      vec4 tmpvar_765;
      tmpvar_765.w = 1.0;
      tmpvar_765.xyz = tmpvar_764;
      vec4 d_766;
      vec2 tmpvar_767;
      tmpvar_767 = ((fragCoord_757 * 0.525) + 2.9);
      d_766.zw = vec2((time * 0.081));
      d_766.y = (tmpvar_767.y * 0.015);
      d_766.x = (tmpvar_767.x * 0.725);
      d_766.xyw = (d_766.xyw * mat3(-1.0, -0.5, 1.0, 1.5, -1.0, 0.5, 0.5, 1.0, 1.0));
      vec3 x_768;
      x_768 = (0.5 - fract(d_766.xyw));
      d_766.xyw = (d_766.xyw * mat3(-0.8, -0.4, 0.8, 1.2, -0.8, 0.4, 0.4, 0.8, 0.8));
      vec3 x_769;
      x_769 = (0.5 - fract(d_766.xyw));
      d_766.xyw = (d_766.xyw * mat3(-0.6, -0.3, 0.6, 0.9, -0.6, 0.3, 0.3, 0.6, 0.6));
      vec3 x_770;
      x_770 = (0.5 - fract(d_766.xyw));
      c_751 = (tmpvar_756 + (tmpvar_765 * mix (vec4(0.208, 0.108, 0.0, 1.0), vec4(0.462, 0.44, 0.81, 1.0), 
        ((pow (min (
          min (sqrt(dot (x_768, x_768)), sqrt(dot (x_769, x_769)))
        , 
          sqrt(dot (x_770, x_770))
        ), 4.0) * 13.37) + (tmpvar_767.y * 1.55))
      )));
      p_752 = (p_752 * 0.4);
      c_751 = (c_751 * 0.3856);
    };
    vec2 fragCoord_771;
    fragCoord_771 = (p_752 * 0.0390151);
    vec3 color_772;
    vec2 tmpvar_773;
    tmpvar_773 = (fragCoord_771 * 0.51);
    vec2 tmpvar_774;
    tmpvar_774.y = 0.5;
    tmpvar_774.x = (0.5 - (0.015 * sin(
      (time / 3.0)
    )));
    vec2 tmpvar_775;
    tmpvar_775.x = tmpvar_774.x;
    tmpvar_775.y = 0.5;
    vec2 tmpvar_776;
    tmpvar_776 = (mat2(0.866, 0.5, -0.5, 0.866) * (tmpvar_773 - tmpvar_775));
    vec2 x_777;
    x_777 = (tmpvar_773 - tmpvar_775);
    vec3 tmpvar_778;
    tmpvar_778 = mix (mix (mix (vec3(1.5, 1.294, 1.908235), vec3(1.0, 0.0504019, -0.806), 
      (0.5 * (1.0 + sin((60.0 * tmpvar_776.y))))
    ), vec3(1.0, 1.0, 0.5), (0.5 * 
      (1.0 + sin(((80.0 * tmpvar_776.y) * tmpvar_776.y)))
    )), color_772, pow (sqrt(
      dot (x_777, x_777)
    ), 80.0));
    color_772 = tmpvar_778;
    vec4 tmpvar_779;
    tmpvar_779.w = 1.0;
    tmpvar_779.xyz = tmpvar_778;
    vec4 d_780;
    vec2 tmpvar_781;
    tmpvar_781 = ((fragCoord_771 * 0.525) + 2.9);
    d_780.zw = vec2((time * 0.081));
    d_780.y = (tmpvar_781.y * 0.015);
    d_780.x = (tmpvar_781.x * 0.725);
    d_780.xyw = (d_780.xyw * mat3(-1.0, -0.5, 1.0, 1.5, -1.0, 0.5, 0.5, 1.0, 1.0));
    vec3 x_782;
    x_782 = (0.5 - fract(d_780.xyw));
    d_780.xyw = (d_780.xyw * mat3(-0.8, -0.4, 0.8, 1.2, -0.8, 0.4, 0.4, 0.8, 0.8));
    vec3 x_783;
    x_783 = (0.5 - fract(d_780.xyw));
    d_780.xyw = (d_780.xyw * mat3(-0.6, -0.3, 0.6, 0.9, -0.6, 0.3, 0.3, 0.6, 0.6));
    vec3 x_784;
    x_784 = (0.5 - fract(d_780.xyw));
    c_751 = (c_751 + (tmpvar_779 * mix (vec4(0.208, 0.108, 0.0, 1.0), vec4(0.462, 0.44, 0.81, 1.0), 
      ((pow (min (
        min (sqrt(dot (x_782, x_782)), sqrt(dot (x_783, x_783)))
      , 
        sqrt(dot (x_784, x_784))
      ), 4.0) * 13.37) + (tmpvar_781.y * 1.55))
    )));
    p_752 = (p_752 * 0.4);
    c_751 = (c_751 * 0.3856);
    tmpvar_746 = (max (vec4(0.0, 0.0, 0.0, 0.0), (
      (c_751 * clamp ((9.0 - (
        (tmpvar_755 * tmpvar_755)
       * 9.0)), 0.0, 1.0))
     + 
      (tmpvar_552 * (1.0 - clamp ((9.0 - 
        ((tmpvar_755 * tmpvar_755) * 9.0)
      ), 0.0, 1.0)))
    )) * 0.755);
  } else {
    tmpvar_746 = tmpvar_552;
  };
  buff_11 = tmpvar_746;
  vec4 tmpvar_785;
  vec2 tmpvar_786;
  tmpvar_786 = ((tmpvar_2 - (planetpos4 * zoom)) - shippos);
  vec2 x_787;
  float tmpvar_788;
  tmpvar_788 = (12500.0 * zoom);
  x_787 = (tmpvar_786 - tmpvar_788);
  float tmpvar_789;
  tmpvar_789 = float((sqrt(
    dot (x_787, x_787)
  ) >= tmpvar_788));
  if (((1.0 - tmpvar_789) > 0.0)) {
    vec4 tmpc_790;
    vec4 c_791;
    vec2 p_792;
    vec2 tmpvar_793;
    tmpvar_793 = vec2((25000.0 * zoom));
    vec2 tmpvar_794;
    tmpvar_794 = (((tmpvar_786 * 2.0) - tmpvar_793) / tmpvar_793.y);
    float tmpvar_795;
    tmpvar_795 = sqrt(dot (tmpvar_794, tmpvar_794));
    vec4 tmpvar_796;
    tmpvar_796 = (vec4(0.43, 0.42, 0.678, 1.0) - min (0.59, abs(tmpvar_794.y)));
    c_791 = tmpvar_796;
    p_792 = (((tmpvar_794 * 
      (sign(tmpvar_795) * (1.570796 - (sqrt(
        (1.0 - abs(tmpvar_795))
      ) * (1.570796 + 
        (abs(tmpvar_795) * (-0.2146018 + (abs(tmpvar_795) * (0.08656672 + 
          (abs(tmpvar_795) * -0.03102955)
        ))))
      ))))
    ) / tmpvar_795) - 5.0);
    p_792 = (p_792 * p_792.y);
    vec4 col_797;
    float gg_799;
    float b_800;
    vec2 p_801;
    vec2 uv_802;
    vec2 tmpvar_803;
    tmpvar_803 = ((0.1851 * p_792) - 4.5);
    uv_802 = tmpvar_803;
    p_801 = tmpvar_803;
    float tmpvar_804;
    tmpvar_804 = (1.0 + sqrt(dot (tmpvar_803, tmpvar_803)));
    b_800 = tmpvar_804;
    vec2 g_805;
    g_805 = (tmpvar_803 * 1.4);
    vec4 f_806;
    f_806 = vec4(1.0, 1.0, 1.0, 1.0);
    vec2 U_807;
    vec4 O_808;
    U_807 = (g_805 * 200.0);
    O_808 = vec4(1.0, 1.0, 1.0, 1.0);
    vec2 tmpvar_809;
    tmpvar_809 = (U_807 / 8.0);
    U_807 = tmpvar_809;
    vec2 tmpvar_810;
    tmpvar_810 = ceil(tmpvar_809);
    float tmpvar_811;
    tmpvar_811 = sin((100000.0 * sqrt(
      dot (tmpvar_810, tmpvar_810)
    )));
    float tmpvar_812;
    if ((tmpvar_811 < 0.0)) {
      tmpvar_812 = tmpvar_809.x;
    } else {
      tmpvar_812 = tmpvar_809.y;
    };
    O_808 = (vec4(1.0, 1.0, 1.0, 1.0) + ((0.1 / 
      fract(tmpvar_812)
    ) - vec4(1.0, 1.0, 1.0, 1.0)));
    g_805 = (g_805 * 8.0);
    g_805.x = (g_805.x * 5.25);
    float tmpvar_813;
    float tmpvar_814;
    tmpvar_814 = (min (abs(
      (g_805.x / g_805.y)
    ), 1.0) / max (abs(
      (g_805.x / g_805.y)
    ), 1.0));
    float tmpvar_815;
    tmpvar_815 = (tmpvar_814 * tmpvar_814);
    tmpvar_815 = (((
      ((((
        ((((-0.01213232 * tmpvar_815) + 0.05368138) * tmpvar_815) - 0.1173503)
       * tmpvar_815) + 0.1938925) * tmpvar_815) - 0.3326756)
     * tmpvar_815) + 0.9999793) * tmpvar_814);
    tmpvar_815 = (tmpvar_815 + (float(
      (abs((g_805.x / g_805.y)) > 1.0)
    ) * (
      (tmpvar_815 * -2.0)
     + 1.570796)));
    tmpvar_813 = (tmpvar_815 * sign((g_805.x / g_805.y)));
    if ((abs(g_805.y) > (1e-08 * abs(g_805.x)))) {
      if ((g_805.y < 0.0)) {
        if ((g_805.x >= 0.0)) {
          tmpvar_813 += 3.141593;
        } else {
          tmpvar_813 = (tmpvar_813 - 3.141593);
        };
      };
    } else {
      tmpvar_813 = (sign(g_805.x) * 1.570796);
    };
    float tmpvar_816;
    tmpvar_816 = sqrt(dot (g_805, g_805));
    g_805.y = tmpvar_816;
    g_805.x = ((tmpvar_813 * 1.7) * floor(tmpvar_816));
    vec2 tmpvar_817;
    tmpvar_817 = floor(g_805);
    float tmpvar_818;
    tmpvar_818 = cos((60000.0 * sqrt(
      dot (tmpvar_817, tmpvar_817)
    )));
    float tmpvar_819;
    if ((tmpvar_818 < -0.8)) {
      tmpvar_819 = g_805.x;
    } else {
      tmpvar_819 = g_805.y;
    };
    f_806 = (vec4(1.0, 1.0, 1.0, 1.0) + (float(
      (0.6 >= (0.1 / fract(tmpvar_819)))
    ) - vec4(1.0, 1.0, 1.0, 1.0)));
    b_800 = (tmpvar_804 + ((f_806 * 
      max (0.0, (0.6 - O_808.x))
    ).x * 0.1));
    b_800 = (b_800 + (sin(time) * 0.01));
    p_801 = (tmpvar_803 * b_800);
    float tmpvar_820;
    tmpvar_820 = (time * 0.2);
    p_801.x = (p_801.x + (sin(tmpvar_820) * 2.0));
    p_801.y = (p_801.y + (cos(tmpvar_820) * 2.0));
    vec2 p_821;
    p_821 = ((p_801 * 0.1) + tmpvar_803);
    float q_823;
    q_823 = 0.0;
    for (float i_822 = 0.0; i_822 < 5.0; i_822 += 1.0) {
      q_823 = (q_823 + (0.028 + (i_822 * 0.01)));
      p_821.x = (p_821.x + ((
        (p_821.y * sin((iTime * 0.021)))
       * 0.1) + (
        sin((iTime * 0.05))
       * 1.2)));
      p_821.y = (p_821.y - ((
        (p_821.x * cos((iTime * 0.031)))
       * 0.1) + (
        cos((iTime * 0.05))
       * 1.2)));
      vec4 tmpvar_824;
      vec2 g_825;
      g_825 = ((vec2(mod (p_821, 4.0))) * 0.25);
      vec4 f_826;
      f_826 = vec4(1.0, 1.0, 1.0, 1.0);
      vec2 U_827;
      vec4 O_828;
      U_827 = (g_825 * 200.0);
      O_828 = vec4(1.0, 1.0, 1.0, 1.0);
      vec2 tmpvar_829;
      tmpvar_829 = (U_827 / 8.0);
      U_827 = tmpvar_829;
      vec2 tmpvar_830;
      tmpvar_830 = ceil(tmpvar_829);
      float tmpvar_831;
      tmpvar_831 = sin((100000.0 * sqrt(
        dot (tmpvar_830, tmpvar_830)
      )));
      float tmpvar_832;
      if ((tmpvar_831 < 0.0)) {
        tmpvar_832 = tmpvar_829.x;
      } else {
        tmpvar_832 = tmpvar_829.y;
      };
      O_828 = (vec4(1.0, 1.0, 1.0, 1.0) + ((0.1 / 
        fract(tmpvar_832)
      ) - vec4(1.0, 1.0, 1.0, 1.0)));
      g_825 = (g_825 * 8.0);
      g_825.x = (g_825.x * 5.25);
      float tmpvar_833;
      float tmpvar_834;
      tmpvar_834 = (min (abs(
        (g_825.x / g_825.y)
      ), 1.0) / max (abs(
        (g_825.x / g_825.y)
      ), 1.0));
      float tmpvar_835;
      tmpvar_835 = (tmpvar_834 * tmpvar_834);
      tmpvar_835 = (((
        ((((
          ((((-0.01213232 * tmpvar_835) + 0.05368138) * tmpvar_835) - 0.1173503)
         * tmpvar_835) + 0.1938925) * tmpvar_835) - 0.3326756)
       * tmpvar_835) + 0.9999793) * tmpvar_834);
      tmpvar_835 = (tmpvar_835 + (float(
        (abs((g_825.x / g_825.y)) > 1.0)
      ) * (
        (tmpvar_835 * -2.0)
       + 1.570796)));
      tmpvar_833 = (tmpvar_835 * sign((g_825.x / g_825.y)));
      if ((abs(g_825.y) > (1e-08 * abs(g_825.x)))) {
        if ((g_825.y < 0.0)) {
          if ((g_825.x >= 0.0)) {
            tmpvar_833 += 3.141593;
          } else {
            tmpvar_833 = (tmpvar_833 - 3.141593);
          };
        };
      } else {
        tmpvar_833 = (sign(g_825.x) * 1.570796);
      };
      float tmpvar_836;
      tmpvar_836 = sqrt(dot (g_825, g_825));
      g_825.y = tmpvar_836;
      g_825.x = ((tmpvar_833 * 1.7) * floor(tmpvar_836));
      vec2 tmpvar_837;
      tmpvar_837 = floor(g_825);
      float tmpvar_838;
      tmpvar_838 = cos((60000.0 * sqrt(
        dot (tmpvar_837, tmpvar_837)
      )));
      float tmpvar_839;
      if ((tmpvar_838 < -0.8)) {
        tmpvar_839 = g_825.x;
      } else {
        tmpvar_839 = g_825.y;
      };
      f_826 = (vec4(1.0, 1.0, 1.0, 1.0) + (float(
        (0.6 >= (0.1 / fract(tmpvar_839)))
      ) - vec4(1.0, 1.0, 1.0, 1.0)));
      tmpvar_824 = (f_826 * max (0.0, (0.6 - O_828.x)));
      if ((tmpvar_824.x < 0.1360704)) {
        break;
      };
      p_821 = (p_821 * 1.2);
    };
    gg_799 = 0.0;
    for (float g_798 = 0.0; g_798 < 4.0; g_798 += 1.0) {
      float tmpvar_840;
      tmpvar_840 = pow ((g_798 / 20.0), 0.5);
      vec2 p_841;
      p_841 = ((p_801 * 0.1) + (uv_802 * (tmpvar_840 + 
        (fract((cos(
          (dot ((uv_802 + p_801), vec2(2.31, 53.21)) * 124.123)
        ) * 412.0)) * (tmpvar_840 - pow ((
          (g_798 - 1.0)
         / 20.0), 0.5)))
      )));
      float q_843;
      q_843 = 0.0;
      for (float i_842 = 0.0; i_842 < 5.0; i_842 += 1.0) {
        q_843 = (q_843 + (0.028 + (i_842 * 0.01)));
        p_841.x = (p_841.x + ((
          (p_841.y * sin((iTime * 0.021)))
         * 0.1) + (
          sin((iTime * 0.05))
         * 1.2)));
        p_841.y = (p_841.y - ((
          (p_841.x * cos((iTime * 0.031)))
         * 0.1) + (
          cos((iTime * 0.05))
         * 1.2)));
        vec4 tmpvar_844;
        vec2 g_845;
        g_845 = ((vec2(mod (p_841, 4.0))) * 0.25);
        vec4 f_846;
        f_846 = vec4(1.0, 1.0, 1.0, 1.0);
        vec2 U_847;
        vec4 O_848;
        U_847 = (g_845 * 200.0);
        O_848 = vec4(1.0, 1.0, 1.0, 1.0);
        vec2 tmpvar_849;
        tmpvar_849 = (U_847 / 8.0);
        U_847 = tmpvar_849;
        vec2 tmpvar_850;
        tmpvar_850 = ceil(tmpvar_849);
        float tmpvar_851;
        tmpvar_851 = sin((100000.0 * sqrt(
          dot (tmpvar_850, tmpvar_850)
        )));
        float tmpvar_852;
        if ((tmpvar_851 < 0.0)) {
          tmpvar_852 = tmpvar_849.x;
        } else {
          tmpvar_852 = tmpvar_849.y;
        };
        O_848 = (vec4(1.0, 1.0, 1.0, 1.0) + ((0.1 / 
          fract(tmpvar_852)
        ) - vec4(1.0, 1.0, 1.0, 1.0)));
        g_845 = (g_845 * 8.0);
        g_845.x = (g_845.x * 5.25);
        float tmpvar_853;
        float tmpvar_854;
        tmpvar_854 = (min (abs(
          (g_845.x / g_845.y)
        ), 1.0) / max (abs(
          (g_845.x / g_845.y)
        ), 1.0));
        float tmpvar_855;
        tmpvar_855 = (tmpvar_854 * tmpvar_854);
        tmpvar_855 = (((
          ((((
            ((((-0.01213232 * tmpvar_855) + 0.05368138) * tmpvar_855) - 0.1173503)
           * tmpvar_855) + 0.1938925) * tmpvar_855) - 0.3326756)
         * tmpvar_855) + 0.9999793) * tmpvar_854);
        tmpvar_855 = (tmpvar_855 + (float(
          (abs((g_845.x / g_845.y)) > 1.0)
        ) * (
          (tmpvar_855 * -2.0)
         + 1.570796)));
        tmpvar_853 = (tmpvar_855 * sign((g_845.x / g_845.y)));
        if ((abs(g_845.y) > (1e-08 * abs(g_845.x)))) {
          if ((g_845.y < 0.0)) {
            if ((g_845.x >= 0.0)) {
              tmpvar_853 += 3.141593;
            } else {
              tmpvar_853 = (tmpvar_853 - 3.141593);
            };
          };
        } else {
          tmpvar_853 = (sign(g_845.x) * 1.570796);
        };
        float tmpvar_856;
        tmpvar_856 = sqrt(dot (g_845, g_845));
        g_845.y = tmpvar_856;
        g_845.x = ((tmpvar_853 * 1.7) * floor(tmpvar_856));
        vec2 tmpvar_857;
        tmpvar_857 = floor(g_845);
        float tmpvar_858;
        tmpvar_858 = cos((60000.0 * sqrt(
          dot (tmpvar_857, tmpvar_857)
        )));
        float tmpvar_859;
        if ((tmpvar_858 < -0.8)) {
          tmpvar_859 = g_845.x;
        } else {
          tmpvar_859 = g_845.y;
        };
        f_846 = (vec4(1.0, 1.0, 1.0, 1.0) + (float(
          (0.6 >= (0.1 / fract(tmpvar_859)))
        ) - vec4(1.0, 1.0, 1.0, 1.0)));
        tmpvar_844 = (f_846 * max (0.0, (0.6 - O_848.x)));
        if ((tmpvar_844.x < 0.1360704)) {
          break;
        };
        p_841 = (p_841 * 1.2);
      };
      gg_799 = (gg_799 + q_843);
    };
    float tmpvar_860;
    tmpvar_860 = mix ((gg_799 * 0.125), q_823, 0.25);
    vec4 tmpvar_861;
    tmpvar_861.w = 1.0;
    tmpvar_861.x = (tmpvar_860 * 4.0);
    tmpvar_861.y = (tmpvar_860 * 3.0);
    tmpvar_861.z = tmpvar_860;
    col_797 = (tmpvar_861 / (b_800 - 0.61));
    float tmpvar_862;
    tmpvar_862 = fract((cos(
      (dot ((tmpvar_803 + col_797.xy), vec2(2.31, 53.21)) * 124.123)
    ) * 412.0));
    vec4 tmpvar_863;
    tmpvar_863.w = 0.0;
    tmpvar_863.x = tmpvar_862;
    tmpvar_863.y = tmpvar_862;
    tmpvar_863.z = tmpvar_862;
    col_797 = (col_797 - (tmpvar_863 * 0.025));
    float tmpvar_864;
    tmpvar_864 = ((col_797.x + col_797.y) + col_797.z);
    vec4 tmpvar_865;
    tmpvar_865.w = 1.0;
    tmpvar_865.x = tmpvar_864;
    tmpvar_865.y = tmpvar_864;
    tmpvar_865.z = tmpvar_864;
    c_791 = (tmpvar_796 + mix (col_797, (tmpvar_865 * 0.85), tmpvar_864));
    p_792 = (p_792 * 0.4);
    c_791 = (c_791 * 0.76);
    vec4 tmpvar_866;
    tmpvar_866 = max (vec4(0.0, 0.0, 0.0, 0.0), ((c_791 * 
      clamp ((9.0 - ((tmpvar_795 * tmpvar_795) * 9.0)), 0.0, 1.0)
    ) + (tmpvar_746 * 
      (1.0 - clamp ((9.0 - (
        (tmpvar_795 * tmpvar_795)
       * 9.0)), 0.0, 1.0))
    )));
    tmpc_790.xyw = tmpvar_866.xyw;
    tmpc_790.z = (tmpvar_866.z * 0.51);
    tmpvar_785 = tmpc_790;
  } else {
    tmpvar_785 = tmpvar_746;
  };
  buff_11 = tmpvar_785;
  vec4 tmpvar_867;
  vec2 tmpvar_868;
  tmpvar_868 = ((tmpvar_2 - (planetpos5 * zoom)) - shippos);
  vec2 x_869;
  float tmpvar_870;
  tmpvar_870 = (4000.0 * zoom);
  x_869 = (tmpvar_868 - tmpvar_870);
  float tmpvar_871;
  tmpvar_871 = float((sqrt(
    dot (x_869, x_869)
  ) >= tmpvar_870));
  if (((1.0 - tmpvar_871) > 0.0)) {
    vec4 tmpc_872;
    vec4 c_873;
    vec2 p_874;
    vec2 tmpvar_875;
    tmpvar_875 = vec2((8000.0 * zoom));
    vec2 tmpvar_876;
    tmpvar_876 = (((tmpvar_868 * 2.0) - tmpvar_875) / tmpvar_875.y);
    float tmpvar_877;
    tmpvar_877 = sqrt(dot (tmpvar_876, tmpvar_876));
    vec4 tmpvar_878;
    tmpvar_878 = (vec4(0.4643, 0.22, 0.28, 1.0) + (tmpvar_876.y / 1.5));
    c_873 = tmpvar_878;
    p_874 = (((tmpvar_876 * 
      (sign(tmpvar_877) * (1.570796 - (sqrt(
        (1.0 - abs(tmpvar_877))
      ) * (1.570796 + 
        (abs(tmpvar_877) * (-0.2146018 + (abs(tmpvar_877) * (0.08656672 + 
          (abs(tmpvar_877) * -0.03102955)
        ))))
      ))))
    ) / tmpvar_877) - 5.0);
    p_874 = (p_874 * p_874.y);
    if (best) {
      vec4 fcx_879;
      vec2 uv_880;
      vec2 tmpvar_881;
      tmpvar_881 = (0.45 * p_874);
      uv_880.y = tmpvar_881.y;
      uv_880.x = (tmpvar_881.x + (time * 0.11));
      vec2 uv_882;
      vec2 frac_884;
      vec2 cell_885;
      float minDistance_886;
      vec3 tmpvar_887;
      tmpvar_887.yz = vec2(0.02, 0.02);
      tmpvar_887.x = (0.09 + (abs(
        sin((time * 0.75))
      ) * 0.03));
      minDistance_886 = 1.0;
      uv_882 = (uv_880 * 3.0);
      cell_885 = floor(uv_882);
      frac_884 = fract(uv_882);
      for (int i_883 = -1; i_883 <= 1; i_883++) {
        for (int j_888 = -1; j_888 <= 1; j_888++) {
          vec2 tmpvar_889;
          tmpvar_889.x = float(i_883);
          tmpvar_889.y = float(j_888);
          vec2 tmpvar_890;
          tmpvar_890.x = dot ((cell_885 + tmpvar_889), vec2(127.1, 311.7));
          tmpvar_890.y = dot ((cell_885 + tmpvar_889), vec2(269.5, 183.3));
          vec2 uv_891;
          vec2 tmpvar_892;
          tmpvar_892 = floor(uv_882);
          vec2 tmpvar_893;
          tmpvar_893 = (uv_882 - tmpvar_892);
          uv_891 = ((tmpvar_893 * tmpvar_893) * (3.0 - (2.0 * tmpvar_893)));
          float tmpvar_894;
          tmpvar_894 = fract((cos(
            dot (tmpvar_892, vec2(21.9898, 78.233))
          ) * 43758.55));
          vec2 tmpvar_895;
          tmpvar_895.x = (tmpvar_892.x + 1.0);
          tmpvar_895.y = tmpvar_892.y;
          float tmpvar_896;
          tmpvar_896 = fract((cos(
            dot (tmpvar_895, vec2(21.9898, 78.233))
          ) * 43758.55));
          vec2 tmpvar_897;
          tmpvar_897.x = tmpvar_892.x;
          tmpvar_897.y = (tmpvar_892.y + 1.0);
          float tmpvar_898;
          tmpvar_898 = fract((cos(
            dot (tmpvar_897, vec2(21.9898, 78.233))
          ) * 43758.55));
          vec2 x_899;
          x_899 = ((tmpvar_889 + (
            fract((sin(tmpvar_890) * 43758.55))
           + 
            ((((
              (tmpvar_894 + ((tmpvar_896 - tmpvar_894) * uv_891.x))
             + 
              ((tmpvar_898 - tmpvar_894) * uv_891.y)
            ) + (
              ((((tmpvar_894 - tmpvar_896) - tmpvar_898) + fract((
                cos(dot ((tmpvar_892 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
               * 43758.55))) * uv_891.x)
             * uv_891.y)) / 5.0) * 1.5)
          )) - frac_884);
          minDistance_886 = min (minDistance_886, sqrt(dot (x_899, x_899)));
        };
      };
      float tmpvar_900;
      tmpvar_900 = (time * 1.5);
      fcx_879.xyz = (fcx_879.xyz + mix (tmpvar_887, (vec3(1.725, 0.5175, 0.0) * 
        pow (minDistance_886, (2.5 + ((
          sin(((uv_882.x * 2.0) + tmpvar_900))
         + 
          sin(((uv_882.y * 2.0) + tmpvar_900))
        ) * 0.95)))
      ), minDistance_886));
      vec2 uv_901;
      vec2 frac_902;
      vec2 cell_903;
      float minDistance_904;
      vec3 tmpvar_905;
      tmpvar_905.yz = vec2(0.02, 0.02);
      float tmpvar_906;
      tmpvar_906 = (time * 0.75);
      tmpvar_905.x = (0.09 + (abs(
        sin(tmpvar_906)
      ) * 0.03));
      uv_901 = (uv_880 * 6.0);
      cell_903 = floor(uv_901);
      frac_902 = fract(uv_901);
      vec2 tmpvar_907;
      tmpvar_907.x = dot ((cell_903 + vec2(-1.0, -1.0)), vec2(127.1, 311.7));
      tmpvar_907.y = dot ((cell_903 + vec2(-1.0, -1.0)), vec2(269.5, 183.3));
      vec2 x_908;
      x_908 = ((vec2(-1.0, -1.0) + fract(
        (sin(tmpvar_907) * 43758.55)
      )) - frac_902);
      minDistance_904 = min (1.0, sqrt(dot (x_908, x_908)));
      vec2 tmpvar_909;
      tmpvar_909.x = dot ((cell_903 + vec2(-1.0, 0.0)), vec2(127.1, 311.7));
      tmpvar_909.y = dot ((cell_903 + vec2(-1.0, 0.0)), vec2(269.5, 183.3));
      vec2 x_910;
      x_910 = ((vec2(-1.0, 0.0) + fract(
        (sin(tmpvar_909) * 43758.55)
      )) - frac_902);
      minDistance_904 = min (minDistance_904, sqrt(dot (x_910, x_910)));
      vec2 tmpvar_911;
      tmpvar_911.x = dot ((cell_903 + vec2(-1.0, 1.0)), vec2(127.1, 311.7));
      tmpvar_911.y = dot ((cell_903 + vec2(-1.0, 1.0)), vec2(269.5, 183.3));
      vec2 x_912;
      x_912 = ((vec2(-1.0, 1.0) + fract(
        (sin(tmpvar_911) * 43758.55)
      )) - frac_902);
      minDistance_904 = min (minDistance_904, sqrt(dot (x_912, x_912)));
      vec2 tmpvar_913;
      tmpvar_913.x = dot ((cell_903 + vec2(0.0, -1.0)), vec2(127.1, 311.7));
      tmpvar_913.y = dot ((cell_903 + vec2(0.0, -1.0)), vec2(269.5, 183.3));
      vec2 x_914;
      x_914 = ((vec2(0.0, -1.0) + fract(
        (sin(tmpvar_913) * 43758.55)
      )) - frac_902);
      minDistance_904 = min (minDistance_904, sqrt(dot (x_914, x_914)));
      vec2 tmpvar_915;
      tmpvar_915.x = dot (cell_903, vec2(127.1, 311.7));
      tmpvar_915.y = dot (cell_903, vec2(269.5, 183.3));
      vec2 x_916;
      x_916 = (fract((
        sin(tmpvar_915)
       * 43758.55)) - frac_902);
      minDistance_904 = min (minDistance_904, sqrt(dot (x_916, x_916)));
      vec2 tmpvar_917;
      tmpvar_917.x = dot ((cell_903 + vec2(0.0, 1.0)), vec2(127.1, 311.7));
      tmpvar_917.y = dot ((cell_903 + vec2(0.0, 1.0)), vec2(269.5, 183.3));
      vec2 x_918;
      x_918 = ((vec2(0.0, 1.0) + fract(
        (sin(tmpvar_917) * 43758.55)
      )) - frac_902);
      minDistance_904 = min (minDistance_904, sqrt(dot (x_918, x_918)));
      vec2 tmpvar_919;
      tmpvar_919.x = dot ((cell_903 + vec2(1.0, -1.0)), vec2(127.1, 311.7));
      tmpvar_919.y = dot ((cell_903 + vec2(1.0, -1.0)), vec2(269.5, 183.3));
      vec2 x_920;
      x_920 = ((vec2(1.0, -1.0) + fract(
        (sin(tmpvar_919) * 43758.55)
      )) - frac_902);
      minDistance_904 = min (minDistance_904, sqrt(dot (x_920, x_920)));
      vec2 tmpvar_921;
      tmpvar_921.x = dot ((cell_903 + vec2(1.0, 0.0)), vec2(127.1, 311.7));
      tmpvar_921.y = dot ((cell_903 + vec2(1.0, 0.0)), vec2(269.5, 183.3));
      vec2 x_922;
      x_922 = ((vec2(1.0, 0.0) + fract(
        (sin(tmpvar_921) * 43758.55)
      )) - frac_902);
      minDistance_904 = min (minDistance_904, sqrt(dot (x_922, x_922)));
      vec2 tmpvar_923;
      tmpvar_923.x = dot ((cell_903 + vec2(1.0, 1.0)), vec2(127.1, 311.7));
      tmpvar_923.y = dot ((cell_903 + vec2(1.0, 1.0)), vec2(269.5, 183.3));
      vec2 x_924;
      x_924 = ((vec2(1.0, 1.0) + fract(
        (sin(tmpvar_923) * 43758.55)
      )) - frac_902);
      minDistance_904 = min (minDistance_904, sqrt(dot (x_924, x_924)));
      fcx_879.xyz = (fcx_879.xyz + mix (tmpvar_905, (vec3(0.6, 0.0, 0.0) * 
        pow (minDistance_904, (3.0 + ((
          sin(((uv_901.x * 2.0) + time))
         + 
          sin(((uv_901.y * 2.0) + time))
        ) * 0.95)))
      ), minDistance_904));
      vec2 uv_925;
      vec2 frac_927;
      vec2 cell_928;
      float minDistance_929;
      vec3 tmpvar_930;
      tmpvar_930.yz = vec2(0.02, 0.02);
      tmpvar_930.x = (0.09 + (abs(
        sin(tmpvar_906)
      ) * 0.03));
      minDistance_929 = 1.0;
      uv_925 = (uv_880 * 8.0);
      cell_928 = floor(uv_925);
      frac_927 = fract(uv_925);
      for (int i_926 = -1; i_926 <= 1; i_926++) {
        for (int j_931 = -1; j_931 <= 1; j_931++) {
          vec2 randPoint_932;
          vec2 tmpvar_933;
          tmpvar_933.x = float(i_926);
          tmpvar_933.y = float(j_931);
          vec2 tmpvar_934;
          tmpvar_934.x = dot ((cell_928 + tmpvar_933), vec2(127.1, 311.7));
          tmpvar_934.y = dot ((cell_928 + tmpvar_933), vec2(269.5, 183.3));
          vec2 uv_935;
          vec2 tmpvar_936;
          tmpvar_936 = floor(uv_925);
          vec2 tmpvar_937;
          tmpvar_937 = (uv_925 - tmpvar_936);
          uv_935 = ((tmpvar_937 * tmpvar_937) * (3.0 - (2.0 * tmpvar_937)));
          float tmpvar_938;
          tmpvar_938 = fract((cos(
            dot (tmpvar_936, vec2(21.9898, 78.233))
          ) * 43758.55));
          vec2 tmpvar_939;
          tmpvar_939.x = (tmpvar_936.x + 1.0);
          tmpvar_939.y = tmpvar_936.y;
          float tmpvar_940;
          tmpvar_940 = fract((cos(
            dot (tmpvar_939, vec2(21.9898, 78.233))
          ) * 43758.55));
          vec2 tmpvar_941;
          tmpvar_941.x = tmpvar_936.x;
          tmpvar_941.y = (tmpvar_936.y + 1.0);
          float tmpvar_942;
          tmpvar_942 = fract((cos(
            dot (tmpvar_941, vec2(21.9898, 78.233))
          ) * 43758.55));
          randPoint_932 = (fract((
            sin(tmpvar_934)
           * 43758.55)) + ((
            (((tmpvar_938 + (
              (tmpvar_940 - tmpvar_938)
             * uv_935.x)) + ((tmpvar_942 - tmpvar_938) * uv_935.y)) + (((
              ((tmpvar_938 - tmpvar_940) - tmpvar_942)
             + 
              fract((cos(dot (
                (tmpvar_936 + vec2(1.0, 1.0))
              , vec2(21.9898, 78.233))) * 43758.55))
            ) * uv_935.x) * uv_935.y))
           / 5.0) * 0.5));
          vec2 tmpvar_943;
          tmpvar_943 = (0.5 + (0.5 * sin(
            ((iTime * 0.35) + (6.2831 * randPoint_932))
          )));
          randPoint_932 = tmpvar_943;
          vec2 x_944;
          x_944 = ((tmpvar_933 + tmpvar_943) - frac_927);
          minDistance_929 = min (minDistance_929, sqrt(dot (x_944, x_944)));
        };
      };
      float tmpvar_945;
      tmpvar_945 = (time * 1.9);
      fcx_879.xyz = (fcx_879.xyz + mix (tmpvar_930, (vec3(0.24, 0.08000001, 0.0) * 
        pow (minDistance_929, (4.0 + ((
          sin(((uv_925.x * 2.0) + tmpvar_945))
         + 
          sin(((uv_925.y * 2.0) + tmpvar_945))
        ) * 0.95)))
      ), minDistance_929));
      c_873 = (tmpvar_878 + fcx_879);
      p_874 = (p_874 * 0.4);
      c_873 = (c_873 * 0.6);
    };
    vec4 fcx_946;
    vec2 uv_947;
    vec2 tmpvar_948;
    tmpvar_948 = (0.45 * p_874);
    uv_947.y = tmpvar_948.y;
    uv_947.x = (tmpvar_948.x + (time * 0.11));
    vec2 uv_949;
    vec2 frac_951;
    vec2 cell_952;
    float minDistance_953;
    vec3 tmpvar_954;
    tmpvar_954.yz = vec2(0.02, 0.02);
    tmpvar_954.x = (0.09 + (abs(
      sin((time * 0.75))
    ) * 0.03));
    minDistance_953 = 1.0;
    uv_949 = (uv_947 * 3.0);
    cell_952 = floor(uv_949);
    frac_951 = fract(uv_949);
    for (int i_950 = -1; i_950 <= 1; i_950++) {
      for (int j_955 = -1; j_955 <= 1; j_955++) {
        vec2 tmpvar_956;
        tmpvar_956.x = float(i_950);
        tmpvar_956.y = float(j_955);
        vec2 tmpvar_957;
        tmpvar_957.x = dot ((cell_952 + tmpvar_956), vec2(127.1, 311.7));
        tmpvar_957.y = dot ((cell_952 + tmpvar_956), vec2(269.5, 183.3));
        vec2 uv_958;
        vec2 tmpvar_959;
        tmpvar_959 = floor(uv_949);
        vec2 tmpvar_960;
        tmpvar_960 = (uv_949 - tmpvar_959);
        uv_958 = ((tmpvar_960 * tmpvar_960) * (3.0 - (2.0 * tmpvar_960)));
        float tmpvar_961;
        tmpvar_961 = fract((cos(
          dot (tmpvar_959, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 tmpvar_962;
        tmpvar_962.x = (tmpvar_959.x + 1.0);
        tmpvar_962.y = tmpvar_959.y;
        float tmpvar_963;
        tmpvar_963 = fract((cos(
          dot (tmpvar_962, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 tmpvar_964;
        tmpvar_964.x = tmpvar_959.x;
        tmpvar_964.y = (tmpvar_959.y + 1.0);
        float tmpvar_965;
        tmpvar_965 = fract((cos(
          dot (tmpvar_964, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 x_966;
        x_966 = ((tmpvar_956 + (
          fract((sin(tmpvar_957) * 43758.55))
         + 
          ((((
            (tmpvar_961 + ((tmpvar_963 - tmpvar_961) * uv_958.x))
           + 
            ((tmpvar_965 - tmpvar_961) * uv_958.y)
          ) + (
            ((((tmpvar_961 - tmpvar_963) - tmpvar_965) + fract((
              cos(dot ((tmpvar_959 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
             * 43758.55))) * uv_958.x)
           * uv_958.y)) / 5.0) * 1.5)
        )) - frac_951);
        minDistance_953 = min (minDistance_953, sqrt(dot (x_966, x_966)));
      };
    };
    float tmpvar_967;
    tmpvar_967 = (time * 1.5);
    fcx_946.xyz = (fcx_946.xyz + mix (tmpvar_954, (vec3(1.725, 0.5175, 0.0) * 
      pow (minDistance_953, (2.5 + ((
        sin(((uv_949.x * 2.0) + tmpvar_967))
       + 
        sin(((uv_949.y * 2.0) + tmpvar_967))
      ) * 0.95)))
    ), minDistance_953));
    vec2 uv_968;
    vec2 frac_969;
    vec2 cell_970;
    float minDistance_971;
    vec3 tmpvar_972;
    tmpvar_972.yz = vec2(0.02, 0.02);
    float tmpvar_973;
    tmpvar_973 = (time * 0.75);
    tmpvar_972.x = (0.09 + (abs(
      sin(tmpvar_973)
    ) * 0.03));
    uv_968 = (uv_947 * 6.0);
    cell_970 = floor(uv_968);
    frac_969 = fract(uv_968);
    vec2 tmpvar_974;
    tmpvar_974.x = dot ((cell_970 + vec2(-1.0, -1.0)), vec2(127.1, 311.7));
    tmpvar_974.y = dot ((cell_970 + vec2(-1.0, -1.0)), vec2(269.5, 183.3));
    vec2 x_975;
    x_975 = ((vec2(-1.0, -1.0) + fract(
      (sin(tmpvar_974) * 43758.55)
    )) - frac_969);
    minDistance_971 = min (1.0, sqrt(dot (x_975, x_975)));
    vec2 tmpvar_976;
    tmpvar_976.x = dot ((cell_970 + vec2(-1.0, 0.0)), vec2(127.1, 311.7));
    tmpvar_976.y = dot ((cell_970 + vec2(-1.0, 0.0)), vec2(269.5, 183.3));
    vec2 x_977;
    x_977 = ((vec2(-1.0, 0.0) + fract(
      (sin(tmpvar_976) * 43758.55)
    )) - frac_969);
    minDistance_971 = min (minDistance_971, sqrt(dot (x_977, x_977)));
    vec2 tmpvar_978;
    tmpvar_978.x = dot ((cell_970 + vec2(-1.0, 1.0)), vec2(127.1, 311.7));
    tmpvar_978.y = dot ((cell_970 + vec2(-1.0, 1.0)), vec2(269.5, 183.3));
    vec2 x_979;
    x_979 = ((vec2(-1.0, 1.0) + fract(
      (sin(tmpvar_978) * 43758.55)
    )) - frac_969);
    minDistance_971 = min (minDistance_971, sqrt(dot (x_979, x_979)));
    vec2 tmpvar_980;
    tmpvar_980.x = dot ((cell_970 + vec2(0.0, -1.0)), vec2(127.1, 311.7));
    tmpvar_980.y = dot ((cell_970 + vec2(0.0, -1.0)), vec2(269.5, 183.3));
    vec2 x_981;
    x_981 = ((vec2(0.0, -1.0) + fract(
      (sin(tmpvar_980) * 43758.55)
    )) - frac_969);
    minDistance_971 = min (minDistance_971, sqrt(dot (x_981, x_981)));
    vec2 tmpvar_982;
    tmpvar_982.x = dot (cell_970, vec2(127.1, 311.7));
    tmpvar_982.y = dot (cell_970, vec2(269.5, 183.3));
    vec2 x_983;
    x_983 = (fract((
      sin(tmpvar_982)
     * 43758.55)) - frac_969);
    minDistance_971 = min (minDistance_971, sqrt(dot (x_983, x_983)));
    vec2 tmpvar_984;
    tmpvar_984.x = dot ((cell_970 + vec2(0.0, 1.0)), vec2(127.1, 311.7));
    tmpvar_984.y = dot ((cell_970 + vec2(0.0, 1.0)), vec2(269.5, 183.3));
    vec2 x_985;
    x_985 = ((vec2(0.0, 1.0) + fract(
      (sin(tmpvar_984) * 43758.55)
    )) - frac_969);
    minDistance_971 = min (minDistance_971, sqrt(dot (x_985, x_985)));
    vec2 tmpvar_986;
    tmpvar_986.x = dot ((cell_970 + vec2(1.0, -1.0)), vec2(127.1, 311.7));
    tmpvar_986.y = dot ((cell_970 + vec2(1.0, -1.0)), vec2(269.5, 183.3));
    vec2 x_987;
    x_987 = ((vec2(1.0, -1.0) + fract(
      (sin(tmpvar_986) * 43758.55)
    )) - frac_969);
    minDistance_971 = min (minDistance_971, sqrt(dot (x_987, x_987)));
    vec2 tmpvar_988;
    tmpvar_988.x = dot ((cell_970 + vec2(1.0, 0.0)), vec2(127.1, 311.7));
    tmpvar_988.y = dot ((cell_970 + vec2(1.0, 0.0)), vec2(269.5, 183.3));
    vec2 x_989;
    x_989 = ((vec2(1.0, 0.0) + fract(
      (sin(tmpvar_988) * 43758.55)
    )) - frac_969);
    minDistance_971 = min (minDistance_971, sqrt(dot (x_989, x_989)));
    vec2 tmpvar_990;
    tmpvar_990.x = dot ((cell_970 + vec2(1.0, 1.0)), vec2(127.1, 311.7));
    tmpvar_990.y = dot ((cell_970 + vec2(1.0, 1.0)), vec2(269.5, 183.3));
    vec2 x_991;
    x_991 = ((vec2(1.0, 1.0) + fract(
      (sin(tmpvar_990) * 43758.55)
    )) - frac_969);
    minDistance_971 = min (minDistance_971, sqrt(dot (x_991, x_991)));
    fcx_946.xyz = (fcx_946.xyz + mix (tmpvar_972, (vec3(0.6, 0.0, 0.0) * 
      pow (minDistance_971, (3.0 + ((
        sin(((uv_968.x * 2.0) + time))
       + 
        sin(((uv_968.y * 2.0) + time))
      ) * 0.95)))
    ), minDistance_971));
    vec2 uv_992;
    vec2 frac_994;
    vec2 cell_995;
    float minDistance_996;
    vec3 tmpvar_997;
    tmpvar_997.yz = vec2(0.02, 0.02);
    tmpvar_997.x = (0.09 + (abs(
      sin(tmpvar_973)
    ) * 0.03));
    minDistance_996 = 1.0;
    uv_992 = (uv_947 * 8.0);
    cell_995 = floor(uv_992);
    frac_994 = fract(uv_992);
    for (int i_993 = -1; i_993 <= 1; i_993++) {
      for (int j_998 = -1; j_998 <= 1; j_998++) {
        vec2 randPoint_999;
        vec2 tmpvar_1000;
        tmpvar_1000.x = float(i_993);
        tmpvar_1000.y = float(j_998);
        vec2 tmpvar_1001;
        tmpvar_1001.x = dot ((cell_995 + tmpvar_1000), vec2(127.1, 311.7));
        tmpvar_1001.y = dot ((cell_995 + tmpvar_1000), vec2(269.5, 183.3));
        vec2 uv_1002;
        vec2 tmpvar_1003;
        tmpvar_1003 = floor(uv_992);
        vec2 tmpvar_1004;
        tmpvar_1004 = (uv_992 - tmpvar_1003);
        uv_1002 = ((tmpvar_1004 * tmpvar_1004) * (3.0 - (2.0 * tmpvar_1004)));
        float tmpvar_1005;
        tmpvar_1005 = fract((cos(
          dot (tmpvar_1003, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 tmpvar_1006;
        tmpvar_1006.x = (tmpvar_1003.x + 1.0);
        tmpvar_1006.y = tmpvar_1003.y;
        float tmpvar_1007;
        tmpvar_1007 = fract((cos(
          dot (tmpvar_1006, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 tmpvar_1008;
        tmpvar_1008.x = tmpvar_1003.x;
        tmpvar_1008.y = (tmpvar_1003.y + 1.0);
        float tmpvar_1009;
        tmpvar_1009 = fract((cos(
          dot (tmpvar_1008, vec2(21.9898, 78.233))
        ) * 43758.55));
        randPoint_999 = (fract((
          sin(tmpvar_1001)
         * 43758.55)) + ((
          (((tmpvar_1005 + (
            (tmpvar_1007 - tmpvar_1005)
           * uv_1002.x)) + ((tmpvar_1009 - tmpvar_1005) * uv_1002.y)) + (((
            ((tmpvar_1005 - tmpvar_1007) - tmpvar_1009)
           + 
            fract((cos(dot (
              (tmpvar_1003 + vec2(1.0, 1.0))
            , vec2(21.9898, 78.233))) * 43758.55))
          ) * uv_1002.x) * uv_1002.y))
         / 5.0) * 0.5));
        vec2 tmpvar_1010;
        tmpvar_1010 = (0.5 + (0.5 * sin(
          ((iTime * 0.35) + (6.2831 * randPoint_999))
        )));
        randPoint_999 = tmpvar_1010;
        vec2 x_1011;
        x_1011 = ((tmpvar_1000 + tmpvar_1010) - frac_994);
        minDistance_996 = min (minDistance_996, sqrt(dot (x_1011, x_1011)));
      };
    };
    float tmpvar_1012;
    tmpvar_1012 = (time * 1.9);
    fcx_946.xyz = (fcx_946.xyz + mix (tmpvar_997, (vec3(0.24, 0.08000001, 0.0) * 
      pow (minDistance_996, (4.0 + ((
        sin(((uv_992.x * 2.0) + tmpvar_1012))
       + 
        sin(((uv_992.y * 2.0) + tmpvar_1012))
      ) * 0.95)))
    ), minDistance_996));
    c_873 = (c_873 + fcx_946);
    p_874 = (p_874 * 0.4);
    c_873 = (c_873 * 0.6);
    vec4 tmpvar_1013;
    tmpvar_1013 = max (vec4(0.0, 0.0, 0.0, 0.0), ((c_873 * 
      clamp ((9.0 - ((tmpvar_877 * tmpvar_877) * 9.0)), 0.0, 1.0)
    ) + (tmpvar_785 * 
      (1.0 - clamp ((9.0 - (
        (tmpvar_877 * tmpvar_877)
       * 9.0)), 0.0, 1.0))
    )));
    tmpc_872.xyw = tmpvar_1013.xyw;
    tmpc_872.z = (tmpvar_1013.z * -2.51);
    tmpvar_867 = tmpc_872;
  } else {
    tmpvar_867 = tmpvar_785;
  };
  buff_11 = tmpvar_867;
  vec4 tmpvar_1014;
  vec2 tmpvar_1015;
  tmpvar_1015 = ((tmpvar_2 - (planetpos6 * zoom)) - shippos);
  vec2 x_1016;
  float tmpvar_1017;
  tmpvar_1017 = (5250.0 * zoom);
  x_1016 = (tmpvar_1015 - tmpvar_1017);
  float tmpvar_1018;
  tmpvar_1018 = float((sqrt(
    dot (x_1016, x_1016)
  ) >= tmpvar_1017));
  if (((1.0 - tmpvar_1018) > 0.0)) {
    vec3 p_1019;
    vec4 s_1020;
    vec2 v_1021;
    vec2 tmpvar_1022;
    tmpvar_1022 = (vec2(10500.0, 10500.0) * zoom);
    float tmpvar_1023;
    vec2 fragCoord_1024;
    fragCoord_1024 = ((tmpvar_1015 - (tmpvar_1022 / vec2(2.0, 2.0))) / tmpvar_1022.y);
    vec2 p_1025;
    p_1025 = ((fragCoord_1024 + vec2(0.25, 0.25)) * 2.0);
    vec2 tmpvar_1026;
    tmpvar_1026 = (p_1025 - 0.5);
    p_1025 = tmpvar_1026;
    float tmpvar_1027;
    tmpvar_1027 = (0.1 + (0.5 * (1.0 - 
      dot (tmpvar_1026, tmpvar_1026)
    )));
    vec2 tmpvar_1028;
    tmpvar_1028 = (fract((
      ((fragCoord_1024 / tmpvar_1027) * 25.0)
     + 
      (time / 2.0)
    )) - 0.5);
    float tmpvar_1029;
    tmpvar_1029 = (3.0 * (1.0 - dot (tmpvar_1028, tmpvar_1028)));
    float tmpvar_1030;
    tmpvar_1030 = (((
      (tmpvar_1029 * tmpvar_1027)
     / 6.0) * tmpvar_1029) * tmpvar_1027);
    tmpvar_1023 = (abs((
      pow ((tmpvar_1030 * 9.9), 7.6)
     * 
      cos((tmpvar_1030 * 9.0))
    )) + sin((tmpvar_1030 * 10.5)));
    float tmpvar_1031;
    tmpvar_1031 = clamp (((tax - 0.19) / 0.3), 0.0, 1.0);
    float tmpvar_1032;
    tmpvar_1032 = clamp (((tax - 0.7) / -0.21), 0.0, 1.0);
    float tmpvar_1033;
    tmpvar_1033 = ((1.0 - (tmpvar_1031 * 
      (tmpvar_1031 * (3.0 - (2.0 * tmpvar_1031)))
    )) + (1.0 - (tmpvar_1032 * 
      (tmpvar_1032 * (3.0 - (2.0 * tmpvar_1032)))
    )));
    float tmpvar_1034;
    tmpvar_1034 = -(tmpvar_1033);
    vec3 tmpvar_1035;
    tmpvar_1035.x = 1.0;
    tmpvar_1035.y = (tmpvar_1034 / 5.0);
    tmpvar_1035.z = tmpvar_1034;
    vec3 tmpvar_1036;
    tmpvar_1036 = normalize(tmpvar_1035);
    float tmpvar_1037;
    tmpvar_1037 = min (tmpvar_1022.x, tmpvar_1022.y);
    mat2 tmpvar_1038;
    float tmpvar_1039;
    tmpvar_1039 = (tax + 0.7305999);
    tmpvar_1038[0].x = cos((tmpvar_1039 - (0.2617983 * tmpvar_1033)));
    tmpvar_1038[0].y = -(sin((tmpvar_1039 - 
      (0.2617983 * tmpvar_1033)
    )));
    tmpvar_1038[1].x = sin((tmpvar_1039 - (0.2617983 * tmpvar_1033)));
    tmpvar_1038[1].y = cos((tmpvar_1039 - (0.2617983 * tmpvar_1033)));
    v_1021 = (((tmpvar_1015 - 
      (tmpvar_1022 / 2.0)
    ) / tmpvar_1037) * tmpvar_1038);
    float tmpvar_1040;
    tmpvar_1040 = (sqrt(dot (v_1021, v_1021)) - 0.4);
    float edge0_1041;
    edge0_1041 = -((5.0 / tmpvar_1037));
    float tmpvar_1042;
    tmpvar_1042 = clamp (((tmpvar_1040 - edge0_1041) / -(edge0_1041)), 0.0, 1.0);
    float tmpvar_1043;
    tmpvar_1043 = (1.0 - (tmpvar_1042 * (tmpvar_1042 * 
      (3.0 - (2.0 * tmpvar_1042))
    )));
    vec3 tmpvar_1044;
    tmpvar_1044.z = 0.0;
    tmpvar_1044.xy = (v_1021 / 0.4);
    float tmpvar_1045;
    tmpvar_1045 = sqrt(dot (tmpvar_1044, tmpvar_1044));
    if ((tmpvar_1045 < 1.0)) {
      vec3 tmpvar_1046;
      tmpvar_1046.xy = tmpvar_1044.xy;
      tmpvar_1046.z = sqrt(((1.0 - 
        (tmpvar_1044.x * tmpvar_1044.x)
      ) - (tmpvar_1044.y * tmpvar_1044.y)));
      float tmpvar_1047;
      tmpvar_1047 = clamp (((
        (pow ((dot (tmpvar_1046, tmpvar_1036) * (1.0 - tmpvar_1033)), 0.75) - 0.5)
       - -0.05) / 0.1), 0.0, 1.0);
      s_1020 = (tmpvar_1043 * mix ((0.1 * vec4(tmpvar_1023)), vec4(tmpvar_1023), (tmpvar_1047 * 
        (tmpvar_1047 * (3.0 - (2.0 * tmpvar_1047)))
      )));
    } else {
      s_1020 = vec4(0.0, 0.0, 0.0, 0.0);
    };
    vec3 tmpvar_1048;
    tmpvar_1048.z = 0.0;
    tmpvar_1048.xy = (v_1021 / 0.4);
    p_1019 = tmpvar_1048;
    float tmpvar_1049;
    tmpvar_1049 = sqrt(dot (tmpvar_1048, tmpvar_1048));
    if ((tmpvar_1049 < 1.0)) {
      vec3 tmpvar_1050;
      tmpvar_1050.xy = tmpvar_1048.xy;
      tmpvar_1050.z = sqrt(((1.0 - 
        (tmpvar_1048.x * tmpvar_1048.x)
      ) - (tmpvar_1048.y * tmpvar_1048.y)));
      p_1019 = tmpvar_1050;
    } else {
      p_1019 = normalize(p_1019);
    };
    p_1019 = (p_1019 - vec3(0.0, 0.0, 0.406));
    float tmpvar_1051;
    tmpvar_1051 = clamp ((tmpvar_1040 / 0.006), 0.0, 1.0);
    vec2 x_1052;
    x_1052 = (tmpvar_1015 - (5250.0 * zoom));
    tmpvar_1014 = ((s_1020 + (
      clamp ((dot (p_1019, tmpvar_1036) * (1.0 - tmpvar_1033)), 0.0, 1.0)
     * 
      (vec4(5.0, 1.225, 0.7, 0.25) * (1.0 - (tmpvar_1051 * (tmpvar_1051 * 
        (3.0 - (2.0 * tmpvar_1051))
      ))))
    )) + (tmpvar_867 * float(
      (sqrt(dot (x_1052, x_1052)) >= (4195.0 * zoom))
    )));
  } else {
    tmpvar_1014 = tmpvar_867;
  };
  buff_11 = tmpvar_1014;
  vec4 tmpvar_1053;
  if (paused) {
    tmpvar_1053 = vec4(0.0, 0.0, 0.0, 1.0);
  } else {
    vec2 tmpvar_1054;
    float tmpvar_1055;
    tmpvar_1055 = (radius / 2.0);
    tmpvar_1054 = (((shippos + tmpvar_1055) / iResolution.xy) - 0.5);
    vec2 tmpvar_1056;
    tmpvar_1056 = (((
      (tmpvar_2 - (-(shippos) + iResolution.xy))
     + tmpvar_1055) + (
      (radius * 3.0)
     * tmpvar_1054)) / iResolution.xy);
    float tmpvar_1057;
    float tmpvar_1058;
    tmpvar_1058 = (min (abs(
      (tmpvar_1056.x / tmpvar_1056.y)
    ), 1.0) / max (abs(
      (tmpvar_1056.x / tmpvar_1056.y)
    ), 1.0));
    float tmpvar_1059;
    tmpvar_1059 = (tmpvar_1058 * tmpvar_1058);
    tmpvar_1059 = (((
      ((((
        ((((-0.01213232 * tmpvar_1059) + 0.05368138) * tmpvar_1059) - 0.1173503)
       * tmpvar_1059) + 0.1938925) * tmpvar_1059) - 0.3326756)
     * tmpvar_1059) + 0.9999793) * tmpvar_1058);
    tmpvar_1059 = (tmpvar_1059 + (float(
      (abs((tmpvar_1056.x / tmpvar_1056.y)) > 1.0)
    ) * (
      (tmpvar_1059 * -2.0)
     + 1.570796)));
    tmpvar_1057 = (tmpvar_1059 * sign((tmpvar_1056.x / tmpvar_1056.y)));
    if ((abs(tmpvar_1056.y) > (1e-08 * abs(tmpvar_1056.x)))) {
      if ((tmpvar_1056.y < 0.0)) {
        if ((tmpvar_1056.x >= 0.0)) {
          tmpvar_1057 += 3.141593;
        } else {
          tmpvar_1057 = (tmpvar_1057 - 3.141593);
        };
      };
    } else {
      tmpvar_1057 = (sign(tmpvar_1056.x) * 1.570796);
    };
    float tmpvar_1060;
    tmpvar_1060 = ceil((tmpvar_1057 * 600.0));
    float tmpvar_1061;
    tmpvar_1061 = cos(tmpvar_1060);
    float tmpvar_1062;
    tmpvar_1062 = (tmpvar_1061 / dot (tmpvar_1056, tmpvar_1056));
    vec2 x_1063;
    x_1063 = (tmpvar_1054 * zoom);
    tmpvar_1053 = vec4(max (0.0, (min (1.0, 
      (exp((fract(
        ((tmpvar_1062 + (tmpvar_1061 * tmpvar_1060)) + time)
      ) * -100.0)) / tmpvar_1062)
    ) * abs(
      sqrt(dot (x_1063, x_1063))
    ))));
  };
  buff_11 = (tmpvar_1014 + tmpvar_1053);
  mcol_10 = buff_11;
  vec2 pos_1064;
  pos_1064 = ((tmpvar_2 - (en3pos * zoom)) - shippos);
  mat2 tmpvar_1065;
  float tmpvar_1066;
  tmpvar_1066 = (tax + 1.57079);
  tmpvar_1065[0].x = cos((tmpvar_1066 + 0.7305999));
  tmpvar_1065[0].y = -(sin((tmpvar_1066 + 0.7305999)));
  tmpvar_1065[1].x = sin((tmpvar_1066 + 0.7305999));
  tmpvar_1065[1].y = cos((tmpvar_1066 + 0.7305999));
  pos_1064 = (pos_1064 * tmpvar_1065);
  vec4 tmpvar_1067;
  float tmpvar_1068;
  tmpvar_1068 = (900.0 * zoom);
  if ((((
    (pos_1064.x > -((300.0 * zoom)))
   && 
    (pos_1064.x < (tmpvar_1068 + (300.0 * zoom)))
  ) && (pos_1064.y > 
    -((300.0 * zoom))
  )) && (pos_1064.y < (tmpvar_1068 + 
    (300.0 * zoom)
  )))) {
    float boxx_1069;
    vec3 color_1070;
    vec2 tmpvar_1071;
    tmpvar_1071 = (pos_1064 / tmpvar_1068);
    vec2 tmpvar_1072;
    tmpvar_1072 = (-(tmpvar_1071) + 0.5);
    float tmpvar_1073;
    tmpvar_1073 = (0.9 + cos((time + 
      (sqrt(dot (tmpvar_1072, tmpvar_1072)) * 10.0)
    )));
    color_1070 = vec3(0.0, 0.0, 0.0);
    float tmpvar_1074;
    float tmpvar_1075;
    tmpvar_1075 = (tax / 0.29);
    tmpvar_1074 = clamp (tmpvar_1075, 0.0, 1.0);
    float tmpvar_1076;
    float tmpvar_1077;
    tmpvar_1077 = (tax - 0.7);
    tmpvar_1076 = clamp ((tmpvar_1077 / -0.41), 0.0, 1.0);
    float tmpvar_1078;
    tmpvar_1078 = ((1.0 - (tmpvar_1074 * 
      (tmpvar_1074 * (3.0 - (2.0 * tmpvar_1074)))
    )) + (1.0 - (tmpvar_1076 * 
      (tmpvar_1076 * (3.0 - (2.0 * tmpvar_1076)))
    )));
    vec2 tmpvar_1079;
    tmpvar_1079.x = 0.08;
    tmpvar_1079.y = (0.3 - (0.07 * tmpvar_1078));
    float tmpvar_1080;
    tmpvar_1080 = clamp (tmpvar_1075, 0.0, 1.0);
    float tmpvar_1081;
    tmpvar_1081 = clamp ((tmpvar_1077 / -0.41), 0.0, 1.0);
    vec2 tmpvar_1082;
    tmpvar_1082.x = 9.0;
    tmpvar_1082.y = (((
      (1.0 - (tmpvar_1080 * (tmpvar_1080 * (3.0 - 
        (2.0 * tmpvar_1080)
      ))))
     + 
      (1.0 - (tmpvar_1081 * (tmpvar_1081 * (3.0 - 
        (2.0 * tmpvar_1081)
      ))))
    ) * 2.0) + 7.0);
    vec2 pos_1083;
    pos_1083 = (abs((
      ((pos_1064 / (900.0 * zoom)) - 0.5)
     * 50.0)) - tmpvar_1082);
    if ((pos_1083.x < pos_1083.y)) {
      pos_1083 = pos_1083.yx;
    };
    pos_1083 = (abs(pos_1083) - (tmpvar_1082 * 0.5));
    if ((pos_1083.x < pos_1083.y)) {
      pos_1083 = pos_1083.yx;
    };
    pos_1083 = (abs(pos_1083) - (tmpvar_1082 * 0.25));
    if ((pos_1083.x < pos_1083.y)) {
      pos_1083 = pos_1083.yx;
    };
    pos_1083 = (abs(pos_1083) - (tmpvar_1082 * 0.125));
    if ((pos_1083.x < pos_1083.y)) {
      pos_1083 = pos_1083.yx;
    };
    pos_1083 = (abs(pos_1083) - (tmpvar_1082 * 0.0625));
    if ((pos_1083.x < pos_1083.y)) {
      pos_1083 = pos_1083.yx;
    };
    float tmpvar_1084;
    tmpvar_1084 = abs(pos_1083.x);
    bool tmpvar_1085;
    if ((tmpvar_1084 < 0.683)) {
      tmpvar_1085 = (abs(pos_1083.y) < 0.83);
    } else {
      tmpvar_1085 = bool(0);
    };
    vec2 tmpvar_1086;
    if (tmpvar_1085) {
      float tmpvar_1087;
      tmpvar_1087 = clamp (((
        sqrt(dot (pos_1083, pos_1083))
       - 0.1) / 2.9), 0.0, 1.0);
      vec2 tmpvar_1088;
      tmpvar_1088.x = 1.0;
      tmpvar_1088.y = (tmpvar_1087 * (tmpvar_1087 * (3.0 - 
        (2.0 * tmpvar_1087)
      )));
      tmpvar_1086 = tmpvar_1088;
    } else {
      float tmpvar_1089;
      tmpvar_1089 = clamp (((
        sqrt(dot (pos_1083, pos_1083))
       - 1.5) / -1.5), 0.0, 1.0);
      vec2 tmpvar_1090;
      tmpvar_1090.x = 0.0;
      tmpvar_1090.y = (tmpvar_1089 * (tmpvar_1089 * (3.0 - 
        (2.0 * tmpvar_1089)
      )));
      tmpvar_1086 = tmpvar_1090;
    };
    vec2 tmpvar_1091;
    tmpvar_1091 = max ((abs(
      (tmpvar_1071 - vec2(0.5, 0.5))
    ) - tmpvar_1079), 0.0);
    float tmpvar_1092;
    tmpvar_1092 = clamp (((tax - 0.19) / 0.2), 0.0, 1.0);
    float tmpvar_1093;
    tmpvar_1093 = clamp (((tax - 0.65) / -0.26), 0.0, 1.0);
    boxx_1069 = ((1.0 - float(
      (sqrt(dot (tmpvar_1091, tmpvar_1091)) >= 0.001)
    )) * (float(
      (abs((pos_1064.x - (
        (sin(((pos_1064.y / -0.22) + time)) * 222.0)
       + 
        ((900.0 * zoom) / 2.0)
      ))) < (15.0 / zoom))
    ) * (1.0 - 
      (0.9 * ((1.0 - (tmpvar_1092 * 
        (tmpvar_1092 * (3.0 - (2.0 * tmpvar_1092)))
      )) + (1.0 - (tmpvar_1093 * 
        (tmpvar_1093 * (3.0 - (2.0 * tmpvar_1093)))
      ))))
    )));
    float tmpvar_1094;
    tmpvar_1094 = clamp (((tmpvar_1086.y - 0.05) / -0.05), 0.0, 1.0);
    float tmpvar_1095;
    tmpvar_1095 = clamp (((tmpvar_1086.y - 0.001) / -0.001), 0.0, 1.0);
    float tmpvar_1096;
    tmpvar_1096 = clamp ((0.039 / (tmpvar_1086.y - -0.002)), 0.0, 1.0);
    vec3 tmpvar_1097;
    tmpvar_1097.xz = vec2(0.0, 1.0);
    tmpvar_1097.y = (0.4 + (0.9 * (1.0 - tmpvar_1078)));
    color_1070 = (((
      (0.85 * (tmpvar_1094 * (tmpvar_1094 * (3.0 - 
        (2.0 * tmpvar_1094)
      ))))
     * tmpvar_1086.x) + (
      (0.1 * (tmpvar_1095 * (tmpvar_1095 * (3.0 - 
        (2.0 * tmpvar_1095)
      ))))
     * tmpvar_1086.x)) + ((tmpvar_1073 * 
      (tmpvar_1096 * (tmpvar_1096 * (3.0 - (2.0 * tmpvar_1096))))
    ) * (tmpvar_1097 * tmpvar_1086.x)));
    vec4 tmpvar_1098;
    tmpvar_1098.w = 1.0;
    tmpvar_1098.xyz = color_1070;
    vec3 finalColor_1099;
    float tmpvar_1100;
    if (en3hit) {
      float tmpvar_1101;
      tmpvar_1101 = clamp (((lpower - 20.0) / -20.0), 0.0, 1.0);
      tmpvar_1100 = (2.0 * (tmpvar_1101 * (tmpvar_1101 * 
        (3.0 - (2.0 * tmpvar_1101))
      )));
    } else {
      tmpvar_1100 = 0.0;
    };
    float tmpvar_1102;
    float tmpvar_1103;
    tmpvar_1103 = sin(time);
    tmpvar_1102 = (0.015 + ((tmpvar_1100 / 50.0) * cos(tmpvar_1103)));
    vec2 tmpvar_1104;
    tmpvar_1104 = (((pos_1064 / 
      (900.0 * zoom)
    ) * 2.0) - 1.0);
    finalColor_1099 = vec3(0.0, 0.0, 0.0);
    vec3 tmpvar_1105;
    tmpvar_1105.y = 0.5;
    tmpvar_1105.x = (0.3 + tmpvar_1100);
    tmpvar_1105.z = (2.5 - abs((tmpvar_1100 * 
      cos(tmpvar_1103)
    )));
    vec2 x_1106;
    x_1106 = ((tmpvar_1104 / 1.6) * 0.5);
    vec2 tmpvar_1107;
    tmpvar_1107 = max (((
      -(tmpvar_1104)
     / 1.6) - vec2(0.572, 0.0915)), sqrt(dot (x_1106, x_1106)));
    float tmpvar_1108;
    tmpvar_1108 = sqrt(dot (tmpvar_1107, tmpvar_1107));
    float y_over_x_1109;
    y_over_x_1109 = (tmpvar_1104.y / tmpvar_1104.x);
    float tmpvar_1110;
    tmpvar_1110 = (min (abs(y_over_x_1109), 1.0) / max (abs(y_over_x_1109), 1.0));
    float tmpvar_1111;
    tmpvar_1111 = (tmpvar_1110 * tmpvar_1110);
    tmpvar_1111 = (((
      ((((
        ((((-0.01213232 * tmpvar_1111) + 0.05368138) * tmpvar_1111) - 0.1173503)
       * tmpvar_1111) + 0.1938925) * tmpvar_1111) - 0.3326756)
     * tmpvar_1111) + 0.9999793) * tmpvar_1110);
    tmpvar_1111 = (tmpvar_1111 + (float(
      (abs(y_over_x_1109) > 1.0)
    ) * (
      (tmpvar_1111 * -2.0)
     + 1.570796)));
    float tmpvar_1112;
    tmpvar_1112 = sin(((
      (tmpvar_1111 * sign(y_over_x_1109))
     * 30.0) + (time * -10.0)));
    float v_1113;
    vec2 xy_1114;
    xy_1114 = (tmpvar_1104 * 200.0);
    vec2 uv_1115;
    vec2 tmpvar_1116;
    tmpvar_1116 = floor(xy_1114);
    vec2 tmpvar_1117;
    tmpvar_1117 = (xy_1114 - tmpvar_1116);
    uv_1115 = ((tmpvar_1117 * tmpvar_1117) * (3.0 - (2.0 * tmpvar_1117)));
    float tmpvar_1118;
    tmpvar_1118 = fract((cos(
      dot (tmpvar_1116, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_1119;
    tmpvar_1119.x = (tmpvar_1116.x + 1.0);
    tmpvar_1119.y = tmpvar_1116.y;
    float tmpvar_1120;
    tmpvar_1120 = fract((cos(
      dot (tmpvar_1119, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_1121;
    tmpvar_1121.x = tmpvar_1116.x;
    tmpvar_1121.y = (tmpvar_1116.y + 1.0);
    float tmpvar_1122;
    tmpvar_1122 = fract((cos(
      dot (tmpvar_1121, vec2(21.9898, 78.233))
    ) * 43758.55));
    v_1113 = (((
      (tmpvar_1118 + ((tmpvar_1120 - tmpvar_1118) * uv_1115.x))
     + 
      ((tmpvar_1122 - tmpvar_1118) * uv_1115.y)
    ) + (
      ((((tmpvar_1118 - tmpvar_1120) - tmpvar_1122) + fract((
        cos(dot ((tmpvar_1116 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
       * 43758.55))) * uv_1115.x)
     * uv_1115.y)) * 0.5);
    if (best) {
      vec2 xy_1123;
      xy_1123 = (tmpvar_1104 * 100.0);
      vec2 uv_1124;
      vec2 tmpvar_1125;
      tmpvar_1125 = floor(xy_1123);
      vec2 tmpvar_1126;
      tmpvar_1126 = (xy_1123 - tmpvar_1125);
      uv_1124 = ((tmpvar_1126 * tmpvar_1126) * (3.0 - (2.0 * tmpvar_1126)));
      float tmpvar_1127;
      tmpvar_1127 = fract((cos(
        dot (tmpvar_1125, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_1128;
      tmpvar_1128.x = (tmpvar_1125.x + 1.0);
      tmpvar_1128.y = tmpvar_1125.y;
      float tmpvar_1129;
      tmpvar_1129 = fract((cos(
        dot (tmpvar_1128, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_1130;
      tmpvar_1130.x = tmpvar_1125.x;
      tmpvar_1130.y = (tmpvar_1125.y + 1.0);
      float tmpvar_1131;
      tmpvar_1131 = fract((cos(
        dot (tmpvar_1130, vec2(21.9898, 78.233))
      ) * 43758.55));
      v_1113 = (v_1113 + ((
        ((tmpvar_1127 + ((tmpvar_1129 - tmpvar_1127) * uv_1124.x)) + ((tmpvar_1131 - tmpvar_1127) * uv_1124.y))
       + 
        ((((
          (tmpvar_1127 - tmpvar_1129)
         - tmpvar_1131) + fract(
          (cos(dot ((tmpvar_1125 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_1124.x) * uv_1124.y)
      ) * 0.25));
      vec2 xy_1132;
      xy_1132 = (tmpvar_1104 * 50.0);
      vec2 uv_1133;
      vec2 tmpvar_1134;
      tmpvar_1134 = floor(xy_1132);
      vec2 tmpvar_1135;
      tmpvar_1135 = (xy_1132 - tmpvar_1134);
      uv_1133 = ((tmpvar_1135 * tmpvar_1135) * (3.0 - (2.0 * tmpvar_1135)));
      float tmpvar_1136;
      tmpvar_1136 = fract((cos(
        dot (tmpvar_1134, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_1137;
      tmpvar_1137.x = (tmpvar_1134.x + 1.0);
      tmpvar_1137.y = tmpvar_1134.y;
      float tmpvar_1138;
      tmpvar_1138 = fract((cos(
        dot (tmpvar_1137, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_1139;
      tmpvar_1139.x = tmpvar_1134.x;
      tmpvar_1139.y = (tmpvar_1134.y + 1.0);
      float tmpvar_1140;
      tmpvar_1140 = fract((cos(
        dot (tmpvar_1139, vec2(21.9898, 78.233))
      ) * 43758.55));
      v_1113 = (v_1113 + ((
        ((tmpvar_1136 + ((tmpvar_1138 - tmpvar_1136) * uv_1133.x)) + ((tmpvar_1140 - tmpvar_1136) * uv_1133.y))
       + 
        ((((
          (tmpvar_1136 - tmpvar_1138)
         - tmpvar_1140) + fract(
          (cos(dot ((tmpvar_1134 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_1133.x) * uv_1133.y)
      ) * 0.125));
    };
    finalColor_1099 = (tmpvar_1105 * abs((0.003 / 
      (tmpvar_1108 - (0.206 + (0.5 * (
        (((tmpvar_1102 * tmpvar_1112) * 0.5) + 0.5)
       + 
        (v_1113 * 0.15)
      ))))
    )));
    vec3 tmpvar_1141;
    tmpvar_1141.z = 0.5;
    tmpvar_1141.x = (1.3 + tmpvar_1100);
    tmpvar_1141.y = (0.5 + abs((tmpvar_1100 * 
      sin(cos(time))
    )));
    vec2 x_1142;
    x_1142 = ((tmpvar_1104 / 1.6) * 0.5);
    vec2 tmpvar_1143;
    tmpvar_1143 = max (((
      -(tmpvar_1104)
     / 1.6) - vec2(0.572, 0.0915)), sqrt(dot (x_1142, x_1142)));
    float tmpvar_1144;
    tmpvar_1144 = sqrt(dot (tmpvar_1143, tmpvar_1143));
    float y_over_x_1145;
    y_over_x_1145 = (tmpvar_1104.y / tmpvar_1104.x);
    float tmpvar_1146;
    tmpvar_1146 = (min (abs(y_over_x_1145), 1.0) / max (abs(y_over_x_1145), 1.0));
    float tmpvar_1147;
    tmpvar_1147 = (tmpvar_1146 * tmpvar_1146);
    tmpvar_1147 = (((
      ((((
        ((((-0.01213232 * tmpvar_1147) + 0.05368138) * tmpvar_1147) - 0.1173503)
       * tmpvar_1147) + 0.1938925) * tmpvar_1147) - 0.3326756)
     * tmpvar_1147) + 0.9999793) * tmpvar_1146);
    tmpvar_1147 = (tmpvar_1147 + (float(
      (abs(y_over_x_1145) > 1.0)
    ) * (
      (tmpvar_1147 * -2.0)
     + 1.570796)));
    float tmpvar_1148;
    tmpvar_1148 = sin(((
      (tmpvar_1147 * sign(y_over_x_1145))
     * 30.0) + (time * 5.0)));
    float v_1149;
    vec2 xy_1150;
    xy_1150 = (tmpvar_1104 * 30.0);
    vec2 uv_1151;
    vec2 tmpvar_1152;
    tmpvar_1152 = floor(xy_1150);
    vec2 tmpvar_1153;
    tmpvar_1153 = (xy_1150 - tmpvar_1152);
    uv_1151 = ((tmpvar_1153 * tmpvar_1153) * (3.0 - (2.0 * tmpvar_1153)));
    float tmpvar_1154;
    tmpvar_1154 = fract((cos(
      dot (tmpvar_1152, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_1155;
    tmpvar_1155.x = (tmpvar_1152.x + 1.0);
    tmpvar_1155.y = tmpvar_1152.y;
    float tmpvar_1156;
    tmpvar_1156 = fract((cos(
      dot (tmpvar_1155, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_1157;
    tmpvar_1157.x = tmpvar_1152.x;
    tmpvar_1157.y = (tmpvar_1152.y + 1.0);
    float tmpvar_1158;
    tmpvar_1158 = fract((cos(
      dot (tmpvar_1157, vec2(21.9898, 78.233))
    ) * 43758.55));
    v_1149 = (((
      (tmpvar_1154 + ((tmpvar_1156 - tmpvar_1154) * uv_1151.x))
     + 
      ((tmpvar_1158 - tmpvar_1154) * uv_1151.y)
    ) + (
      ((((tmpvar_1154 - tmpvar_1156) - tmpvar_1158) + fract((
        cos(dot ((tmpvar_1152 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
       * 43758.55))) * uv_1151.x)
     * uv_1151.y)) * 0.5);
    if (best) {
      vec2 xy_1159;
      xy_1159 = (tmpvar_1104 * 6.0);
      vec2 uv_1160;
      vec2 tmpvar_1161;
      tmpvar_1161 = floor(xy_1159);
      vec2 tmpvar_1162;
      tmpvar_1162 = (xy_1159 - tmpvar_1161);
      uv_1160 = ((tmpvar_1162 * tmpvar_1162) * (3.0 - (2.0 * tmpvar_1162)));
      float tmpvar_1163;
      tmpvar_1163 = fract((cos(
        dot (tmpvar_1161, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_1164;
      tmpvar_1164.x = (tmpvar_1161.x + 1.0);
      tmpvar_1164.y = tmpvar_1161.y;
      float tmpvar_1165;
      tmpvar_1165 = fract((cos(
        dot (tmpvar_1164, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_1166;
      tmpvar_1166.x = tmpvar_1161.x;
      tmpvar_1166.y = (tmpvar_1161.y + 1.0);
      float tmpvar_1167;
      tmpvar_1167 = fract((cos(
        dot (tmpvar_1166, vec2(21.9898, 78.233))
      ) * 43758.55));
      v_1149 = (v_1149 + ((
        ((tmpvar_1163 + ((tmpvar_1165 - tmpvar_1163) * uv_1160.x)) + ((tmpvar_1167 - tmpvar_1163) * uv_1160.y))
       + 
        ((((
          (tmpvar_1163 - tmpvar_1165)
         - tmpvar_1167) + fract(
          (cos(dot ((tmpvar_1161 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_1160.x) * uv_1160.y)
      ) * 0.25));
      vec2 xy_1168;
      xy_1168 = (tmpvar_1104 * 5.0);
      vec2 uv_1169;
      vec2 tmpvar_1170;
      tmpvar_1170 = floor(xy_1168);
      vec2 tmpvar_1171;
      tmpvar_1171 = (xy_1168 - tmpvar_1170);
      uv_1169 = ((tmpvar_1171 * tmpvar_1171) * (3.0 - (2.0 * tmpvar_1171)));
      float tmpvar_1172;
      tmpvar_1172 = fract((cos(
        dot (tmpvar_1170, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_1173;
      tmpvar_1173.x = (tmpvar_1170.x + 1.0);
      tmpvar_1173.y = tmpvar_1170.y;
      float tmpvar_1174;
      tmpvar_1174 = fract((cos(
        dot (tmpvar_1173, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_1175;
      tmpvar_1175.x = tmpvar_1170.x;
      tmpvar_1175.y = (tmpvar_1170.y + 1.0);
      float tmpvar_1176;
      tmpvar_1176 = fract((cos(
        dot (tmpvar_1175, vec2(21.9898, 78.233))
      ) * 43758.55));
      v_1149 = (v_1149 + ((
        ((tmpvar_1172 + ((tmpvar_1174 - tmpvar_1172) * uv_1169.x)) + ((tmpvar_1176 - tmpvar_1172) * uv_1169.y))
       + 
        ((((
          (tmpvar_1172 - tmpvar_1174)
         - tmpvar_1176) + fract(
          (cos(dot ((tmpvar_1170 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_1169.x) * uv_1169.y)
      ) * 0.125));
    };
    finalColor_1099 = (finalColor_1099 + (tmpvar_1141 * abs(
      (0.003 / (tmpvar_1144 - (0.2 + (0.5 * 
        ((((tmpvar_1102 * tmpvar_1148) * 0.5) + 0.5) + (v_1149 * 0.15))
      ))))
    )));
    if (best) {
      vec3 tmpvar_1177;
      tmpvar_1177.z = 0.652;
      tmpvar_1177.x = (0.1 + tmpvar_1100);
      tmpvar_1177.y = (0.951 + abs((tmpvar_1100 * 
        sin(cos(time))
      )));
      vec2 x_1178;
      x_1178 = ((tmpvar_1104 / 1.6) * 0.5);
      vec2 tmpvar_1179;
      tmpvar_1179 = max (((
        -(tmpvar_1104)
       / 1.6) - vec2(0.572, 0.0915)), sqrt(dot (x_1178, x_1178)));
      float tmpvar_1180;
      tmpvar_1180 = sqrt(dot (tmpvar_1179, tmpvar_1179));
      float y_over_x_1181;
      y_over_x_1181 = (tmpvar_1104.y / tmpvar_1104.x);
      float tmpvar_1182;
      tmpvar_1182 = (min (abs(y_over_x_1181), 1.0) / max (abs(y_over_x_1181), 1.0));
      float tmpvar_1183;
      tmpvar_1183 = (tmpvar_1182 * tmpvar_1182);
      tmpvar_1183 = (((
        ((((
          ((((-0.01213232 * tmpvar_1183) + 0.05368138) * tmpvar_1183) - 0.1173503)
         * tmpvar_1183) + 0.1938925) * tmpvar_1183) - 0.3326756)
       * tmpvar_1183) + 0.9999793) * tmpvar_1182);
      tmpvar_1183 = (tmpvar_1183 + (float(
        (abs(y_over_x_1181) > 1.0)
      ) * (
        (tmpvar_1183 * -2.0)
       + 1.570796)));
      float tmpvar_1184;
      tmpvar_1184 = sin(((
        (tmpvar_1183 * sign(y_over_x_1181))
       * 30.0) + (time * 4.0)));
      float v_1185;
      vec2 xy_1186;
      xy_1186 = (tmpvar_1104 * 20.0);
      vec2 uv_1187;
      vec2 tmpvar_1188;
      tmpvar_1188 = floor(xy_1186);
      vec2 tmpvar_1189;
      tmpvar_1189 = (xy_1186 - tmpvar_1188);
      uv_1187 = ((tmpvar_1189 * tmpvar_1189) * (3.0 - (2.0 * tmpvar_1189)));
      float tmpvar_1190;
      tmpvar_1190 = fract((cos(
        dot (tmpvar_1188, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_1191;
      tmpvar_1191.x = (tmpvar_1188.x + 1.0);
      tmpvar_1191.y = tmpvar_1188.y;
      float tmpvar_1192;
      tmpvar_1192 = fract((cos(
        dot (tmpvar_1191, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_1193;
      tmpvar_1193.x = tmpvar_1188.x;
      tmpvar_1193.y = (tmpvar_1188.y + 1.0);
      float tmpvar_1194;
      tmpvar_1194 = fract((cos(
        dot (tmpvar_1193, vec2(21.9898, 78.233))
      ) * 43758.55));
      v_1185 = (((
        (tmpvar_1190 + ((tmpvar_1192 - tmpvar_1190) * uv_1187.x))
       + 
        ((tmpvar_1194 - tmpvar_1190) * uv_1187.y)
      ) + (
        ((((tmpvar_1190 - tmpvar_1192) - tmpvar_1194) + fract((
          cos(dot ((tmpvar_1188 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
         * 43758.55))) * uv_1187.x)
       * uv_1187.y)) * 0.5);
      if (best) {
        vec2 xy_1195;
        xy_1195 = (tmpvar_1104 * 30.0);
        vec2 uv_1196;
        vec2 tmpvar_1197;
        tmpvar_1197 = floor(xy_1195);
        vec2 tmpvar_1198;
        tmpvar_1198 = (xy_1195 - tmpvar_1197);
        uv_1196 = ((tmpvar_1198 * tmpvar_1198) * (3.0 - (2.0 * tmpvar_1198)));
        float tmpvar_1199;
        tmpvar_1199 = fract((cos(
          dot (tmpvar_1197, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 tmpvar_1200;
        tmpvar_1200.x = (tmpvar_1197.x + 1.0);
        tmpvar_1200.y = tmpvar_1197.y;
        float tmpvar_1201;
        tmpvar_1201 = fract((cos(
          dot (tmpvar_1200, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 tmpvar_1202;
        tmpvar_1202.x = tmpvar_1197.x;
        tmpvar_1202.y = (tmpvar_1197.y + 1.0);
        float tmpvar_1203;
        tmpvar_1203 = fract((cos(
          dot (tmpvar_1202, vec2(21.9898, 78.233))
        ) * 43758.55));
        v_1185 = (v_1185 + ((
          ((tmpvar_1199 + ((tmpvar_1201 - tmpvar_1199) * uv_1196.x)) + ((tmpvar_1203 - tmpvar_1199) * uv_1196.y))
         + 
          ((((
            (tmpvar_1199 - tmpvar_1201)
           - tmpvar_1203) + fract(
            (cos(dot ((tmpvar_1197 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
          )) * uv_1196.x) * uv_1196.y)
        ) * 0.25));
        vec2 xy_1204;
        xy_1204 = (tmpvar_1104 * 70.0);
        vec2 uv_1205;
        vec2 tmpvar_1206;
        tmpvar_1206 = floor(xy_1204);
        vec2 tmpvar_1207;
        tmpvar_1207 = (xy_1204 - tmpvar_1206);
        uv_1205 = ((tmpvar_1207 * tmpvar_1207) * (3.0 - (2.0 * tmpvar_1207)));
        float tmpvar_1208;
        tmpvar_1208 = fract((cos(
          dot (tmpvar_1206, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 tmpvar_1209;
        tmpvar_1209.x = (tmpvar_1206.x + 1.0);
        tmpvar_1209.y = tmpvar_1206.y;
        float tmpvar_1210;
        tmpvar_1210 = fract((cos(
          dot (tmpvar_1209, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 tmpvar_1211;
        tmpvar_1211.x = tmpvar_1206.x;
        tmpvar_1211.y = (tmpvar_1206.y + 1.0);
        float tmpvar_1212;
        tmpvar_1212 = fract((cos(
          dot (tmpvar_1211, vec2(21.9898, 78.233))
        ) * 43758.55));
        v_1185 = (v_1185 + ((
          ((tmpvar_1208 + ((tmpvar_1210 - tmpvar_1208) * uv_1205.x)) + ((tmpvar_1212 - tmpvar_1208) * uv_1205.y))
         + 
          ((((
            (tmpvar_1208 - tmpvar_1210)
           - tmpvar_1212) + fract(
            (cos(dot ((tmpvar_1206 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
          )) * uv_1205.x) * uv_1205.y)
        ) * 0.125));
      };
      finalColor_1099 = (finalColor_1099 + (tmpvar_1177 * (0.51 * 
        abs((0.003 / (tmpvar_1180 - (0.186 + 
          (0.5 * (((
            (tmpvar_1102 * tmpvar_1184)
           * 0.5) + 0.5) + (v_1185 * 0.15)))
        ))))
      )));
    };
    vec4 tmpvar_1213;
    tmpvar_1213.w = 1.0;
    tmpvar_1213.xyz = finalColor_1099;
    float tmpvar_1214;
    float tmpvar_1215;
    tmpvar_1215 = clamp (((tmpvar_1071.y - 1.3) / -0.4), 0.0, 1.0);
    tmpvar_1214 = (tmpvar_1215 * (tmpvar_1215 * (3.0 - 
      (2.0 * tmpvar_1215)
    )));
    float tmpvar_1216;
    float tmpvar_1217;
    tmpvar_1217 = clamp ((tmpvar_1071.y / 0.1), 0.0, 1.0);
    tmpvar_1216 = (tmpvar_1217 * (tmpvar_1217 * (3.0 - 
      (2.0 * tmpvar_1217)
    )));
    float tmpvar_1218;
    float tmpvar_1219;
    tmpvar_1219 = clamp (((tmpvar_1071.x - -0.3) / 0.4), 0.0, 1.0);
    tmpvar_1218 = (tmpvar_1219 * (tmpvar_1219 * (3.0 - 
      (2.0 * tmpvar_1219)
    )));
    float tmpvar_1220;
    float tmpvar_1221;
    tmpvar_1221 = clamp (((tmpvar_1071.x - 1.3) / -0.4), 0.0, 1.0);
    tmpvar_1220 = (tmpvar_1221 * (tmpvar_1221 * (3.0 - 
      (2.0 * tmpvar_1221)
    )));
    vec2 pos_1222;
    pos_1222.x = pos_1064.x;
    vec3 color_1223;
    pos_1222.y = (pos_1064.y - (pos_1064.x / 4.0));
    float x_1224;
    float timed_1225;
    timed_1225 = (time * 6.0);
    x_1224 = 0.0;
    float y_1226;
    y_1226 = 0.0;
    vec2 position_1227;
    vec2 tmpvar_1228;
    tmpvar_1228.x = x_1224;
    tmpvar_1228.y = y_1226;
    float tmpvar_1229;
    tmpvar_1229 = (900.0 * zoom);
    position_1227 = ((pos_1222 + tmpvar_1228) / tmpvar_1229);
    position_1227 = (position_1227 * 2.0);
    position_1227 = (position_1227 - 1.25);
    position_1227.x = (position_1227.x + 0.8632537);
    position_1227.x = (position_1227.x * 8.5);
    position_1227.y = (position_1227.y * 1.4);
    position_1227.y = (position_1227.y + 0.4);
    position_1227 = -(position_1227);
    vec2 tmpvar_1230;
    tmpvar_1230.x = 0.04;
    tmpvar_1230.y = (((2.0 * position_1227.y) * (position_1227.x * position_1227.x)) - pow (sin(
      ((pow (position_1227.x, 3.0) * 2.5) - timed_1225)
    ), 0.5));
    color_1223 = ((0.1 / sqrt(
      dot (tmpvar_1230, tmpvar_1230)
    )) * vec3(0.0, 0.4, 1.0));
    vec2 tmpvar_1231;
    tmpvar_1231.x = 0.04;
    tmpvar_1231.y = (((2.0 * position_1227.y) * (position_1227.x * position_1227.x)) + pow (sin(
      ((pow (position_1227.x, 3.0) * 2.5) - timed_1225)
    ), 0.5));
    color_1223 = (color_1223 + ((0.1 / 
      sqrt(dot (tmpvar_1231, tmpvar_1231))
    ) * vec3(0.0, 0.4, 1.0)));
    vec2 tmpvar_1232;
    tmpvar_1232.x = 0.01;
    tmpvar_1232.y = (((3.0 * position_1227.y) * (position_1227.x * position_1227.x)) + (sin(
      (((pow (position_1227.x, 3.0) * 8.0) + ((position_1227.x * position_1227.x) * 32.0)) + timed_1225)
    ) * sin(
      (((position_1227.y * position_1227.x) * (position_1227.x * 16.0)) + sin((timed_1225 / 8.0)))
    )));
    color_1223 = (color_1223 + ((0.1 / 
      sqrt(dot (tmpvar_1232, tmpvar_1232))
    ) * vec3(2.0, 0.3525, 1.8)));
    color_1223 = (color_1223 * float((
      (position_1227.x - 0.9)
     >= 0.0)));
    y_1226 = 1.0;
    x_1224 = 1.0;
    vec4 tmpvar_1233;
    tmpvar_1233.w = 1.0;
    tmpvar_1233.xyz = color_1223;
    vec4 tmpvar_1234;
    tmpvar_1234 = max (vec4(0.0, 0.0, 0.0, 0.0), tmpvar_1233);
    float tmpvar_1235;
    float tmpvar_1236;
    float tmpvar_1237;
    tmpvar_1237 = sin(time);
    tmpvar_1236 = clamp (((
      (tmpvar_1071.y - (0.1 * tmpvar_1237))
     - 0.8) / -0.1), 0.0, 1.0);
    tmpvar_1235 = (tmpvar_1236 * (tmpvar_1236 * (3.0 - 
      (2.0 * tmpvar_1236)
    )));
    float tmpvar_1238;
    float tmpvar_1239;
    tmpvar_1239 = clamp (((
      (tmpvar_1071.y + (0.1 * tmpvar_1237))
     - 0.2) / 0.1), 0.0, 1.0);
    tmpvar_1238 = (tmpvar_1239 * (tmpvar_1239 * (3.0 - 
      (2.0 * tmpvar_1239)
    )));
    float tmpvar_1240;
    float tmpvar_1241;
    tmpvar_1241 = clamp (((tmpvar_1071.x - -0.3) / 0.4), 0.0, 1.0);
    tmpvar_1240 = (tmpvar_1241 * (tmpvar_1241 * (3.0 - 
      (2.0 * tmpvar_1241)
    )));
    vec2 pos_1242;
    pos_1242.x = pos_1064.x;
    vec3 color_1243;
    pos_1242.y = (pos_1064.y + (pos_1064.x / 4.0));
    float x_1244;
    float timed_1245;
    timed_1245 = (-(time) * 6.0);
    x_1244 = 0.0;
    float y_1246;
    y_1246 = 0.0;
    vec2 position_1247;
    vec2 tmpvar_1248;
    tmpvar_1248.x = x_1244;
    tmpvar_1248.y = y_1246;
    position_1247 = ((pos_1242 + tmpvar_1248) / tmpvar_1229);
    position_1247 = (position_1247 * 2.0);
    position_1247 = (position_1247 - 1.25);
    position_1247.x = (position_1247.x + -0.3674636);
    position_1247.y = (position_1247.y + -0.5);
    position_1247.x = (position_1247.x * 8.5);
    position_1247.y = (position_1247.y * 1.4);
    position_1247.y = (position_1247.y + 0.4);
    vec2 tmpvar_1249;
    tmpvar_1249.x = 0.04;
    tmpvar_1249.y = (((2.0 * position_1247.y) * (position_1247.x * position_1247.x)) - pow (sin(
      ((pow (position_1247.x, 3.0) * 2.5) - timed_1245)
    ), 0.5));
    color_1243 = ((0.1 / sqrt(
      dot (tmpvar_1249, tmpvar_1249)
    )) * vec3(0.0, 0.4, 1.0));
    vec2 tmpvar_1250;
    tmpvar_1250.x = 0.04;
    tmpvar_1250.y = (((2.0 * position_1247.y) * (position_1247.x * position_1247.x)) + pow (sin(
      ((pow (position_1247.x, 3.0) * 2.5) - timed_1245)
    ), 0.5));
    color_1243 = (color_1243 + ((0.1 / 
      sqrt(dot (tmpvar_1250, tmpvar_1250))
    ) * vec3(0.0, 0.4, 1.0)));
    vec2 tmpvar_1251;
    tmpvar_1251.x = 0.01;
    tmpvar_1251.y = (((3.0 * position_1247.y) * (position_1247.x * position_1247.x)) + (sin(
      (((pow (position_1247.x, 3.0) * 8.0) + ((position_1247.x * position_1247.x) * 32.0)) + timed_1245)
    ) * sin(
      (((position_1247.y * position_1247.x) * (position_1247.x * 16.0)) + sin((timed_1245 / 8.0)))
    )));
    color_1243 = (color_1243 + ((0.1 / 
      sqrt(dot (tmpvar_1251, tmpvar_1251))
    ) * vec3(2.0, 0.3525, 1.8)));
    color_1243 = (color_1243 * float((
      (position_1247.x - 0.9)
     >= 0.0)));
    y_1246 = 1.0;
    x_1244 = 1.0;
    vec4 tmpvar_1252;
    tmpvar_1252.w = 1.0;
    tmpvar_1252.xyz = color_1243;
    vec4 tmpvar_1253;
    tmpvar_1253 = max (vec4(0.0, 0.0, 0.0, 0.0), tmpvar_1252);
    float tmpvar_1254;
    float tmpvar_1255;
    tmpvar_1255 = clamp (((
      (tmpvar_1071.y - (0.1 * tmpvar_1237))
     - 0.8) / -0.1), 0.0, 1.0);
    tmpvar_1254 = (tmpvar_1255 * (tmpvar_1255 * (3.0 - 
      (2.0 * tmpvar_1255)
    )));
    float tmpvar_1256;
    float tmpvar_1257;
    tmpvar_1257 = clamp (((
      (tmpvar_1071.y + (0.1 * tmpvar_1237))
     - 0.2) / 0.1), 0.0, 1.0);
    tmpvar_1256 = (tmpvar_1257 * (tmpvar_1257 * (3.0 - 
      (2.0 * tmpvar_1257)
    )));
    float tmpvar_1258;
    float tmpvar_1259;
    tmpvar_1259 = clamp (((tmpvar_1071.x - 1.3) / -0.4), 0.0, 1.0);
    tmpvar_1258 = (tmpvar_1259 * (tmpvar_1259 * (3.0 - 
      (2.0 * tmpvar_1259)
    )));
    vec3 final_1260;
    vec3 color_1261;
    vec2 st_1262;
    vec2 tmpvar_1263;
    tmpvar_1263 = (pos_1064 / tmpvar_1229);
    st_1262.x = tmpvar_1263.x;
    st_1262.y = (tmpvar_1263.y + 0.4);
    st_1262 = (st_1262 - vec2(0.5, 0.5));
    float tmpvar_1264;
    tmpvar_1264 = clamp (((tax - 0.19) / 0.2), 0.0, 1.0);
    float tmpvar_1265;
    tmpvar_1265 = clamp (((tax - 0.65) / -0.26), 0.0, 1.0);
    float tmpvar_1266;
    tmpvar_1266 = ((1.0 - (tmpvar_1264 * 
      (tmpvar_1264 * (3.0 - (2.0 * tmpvar_1264)))
    )) + (1.0 - (tmpvar_1265 * 
      (tmpvar_1265 * (3.0 - (2.0 * tmpvar_1265)))
    )));
    float tmpvar_1267;
    tmpvar_1267 = (0.8 * (1.0 - tmpvar_1266));
    vec3 tmpvar_1268;
    tmpvar_1268 = (vec3(pow (abs(st_1262.y), (
      (0.5 - (tmpvar_1267 * 0.4))
     * 5.0))) * vec3(0.849, 0.08369, 0.08));
    color_1261 = tmpvar_1268;
    final_1260 = ((vec3(0.08, 0.003, 0.02) + tmpvar_1268) + vec3(((0.75 + 
      (tmpvar_1267 * 0.2)
    ) - pow (
      abs(st_1262.x)
    , 0.324))));
    float tmpvar_1269;
    tmpvar_1269 = (0.5 + (tmpvar_1267 * 0.5));
    float tmpvar_1270;
    tmpvar_1270 = (sqrt(dot (st_1262, st_1262)) * 2.0);
    float tmpvar_1271;
    float tmpvar_1272;
    tmpvar_1272 = (min (abs(
      (st_1262.y / st_1262.x)
    ), 1.0) / max (abs(
      (st_1262.y / st_1262.x)
    ), 1.0));
    float tmpvar_1273;
    tmpvar_1273 = (tmpvar_1272 * tmpvar_1272);
    tmpvar_1273 = (((
      ((((
        ((((-0.01213232 * tmpvar_1273) + 0.05368138) * tmpvar_1273) - 0.1173503)
       * tmpvar_1273) + 0.1938925) * tmpvar_1273) - 0.3326756)
     * tmpvar_1273) + 0.9999793) * tmpvar_1272);
    tmpvar_1273 = (tmpvar_1273 + (float(
      (abs((st_1262.y / st_1262.x)) > 1.0)
    ) * (
      (tmpvar_1273 * -2.0)
     + 1.570796)));
    tmpvar_1271 = (tmpvar_1273 * sign((st_1262.y / st_1262.x)));
    if ((abs(st_1262.x) > (1e-08 * abs(st_1262.y)))) {
      if ((st_1262.x < 0.0)) {
        if ((st_1262.y >= 0.0)) {
          tmpvar_1271 += 3.141593;
        } else {
          tmpvar_1271 = (tmpvar_1271 - 3.141593);
        };
      };
    } else {
      tmpvar_1271 = (sign(st_1262.y) * 1.570796);
    };
    float tmpvar_1274;
    tmpvar_1274 = (abs(cos(tmpvar_1271)) * 0.01);
    float tmpvar_1275;
    tmpvar_1275 = clamp (((tmpvar_1270 - tmpvar_1274) / (
      ((tmpvar_1274 + 0.02) + (tmpvar_1269 * 0.1))
     - tmpvar_1274)), 0.0, 1.0);
    color_1261 = (vec3((1.0 - (tmpvar_1275 * 
      (tmpvar_1275 * (3.0 - (2.0 * tmpvar_1275)))
    ))) * vec3(0.86, 0.759, 0.41));
    final_1260 = (final_1260 + color_1261);
    float tmpvar_1276;
    tmpvar_1276 = clamp (((tax - 0.19) / 0.46), 0.0, 1.0);
    vec4 tmpvar_1277;
    tmpvar_1277.w = 1.0;
    tmpvar_1277.xyz = final_1260;
    float edge0_1278;
    edge0_1278 = (0.05 + (0.05 * st_1262.y));
    float tmpvar_1279;
    tmpvar_1279 = clamp (((
      abs(st_1262.x)
     - edge0_1278) / (0.04 - edge0_1278)), 0.0, 1.0);
    float edge0_1280;
    edge0_1280 = (2.5 + (3.0 * (1.0 - 
      (1.0 - (tmpvar_1276 * (tmpvar_1276 * (3.0 - 
        (2.0 * tmpvar_1276)
      ))))
    )));
    float tmpvar_1281;
    tmpvar_1281 = clamp (((
      sqrt(dot (st_1262, st_1262))
     - edge0_1280) / -(edge0_1280)), 0.0, 1.0);
    tmpvar_1067 = (((
      (((tmpvar_1098 + (boxx_1069 * 
        ((1.0 - (tmpvar_1086.y * 2.0)) - tmpvar_1086.x)
      )) + ((tmpvar_1213 * tmpvar_1214) * (
        (tmpvar_1216 * tmpvar_1218)
       * tmpvar_1220))) + (((
        (tmpvar_1234 * tmpvar_1235)
       * tmpvar_1238) * (1.0 - tmpvar_1086.x)) * tmpvar_1240))
     + 
      ((((tmpvar_1253 * tmpvar_1254) * tmpvar_1256) * (1.0 - tmpvar_1086.x)) * tmpvar_1258)
    ) + (
      (((tmpvar_1277 * (tmpvar_1279 * 
        (tmpvar_1279 * (3.0 - (2.0 * tmpvar_1279)))
      )) * float((st_1262.y >= 0.0))) * (1.0 - tmpvar_1266))
     * 
      (tmpvar_1281 * (tmpvar_1281 * (3.0 - (2.0 * tmpvar_1281))))
    )) + (buff_11 * (1.0 - tmpvar_1086.x)));
  } else {
    vec3 final_1282;
    vec3 color_1283;
    vec2 st_1284;
    vec2 tmpvar_1285;
    tmpvar_1285 = (pos_1064 / (900.0 * zoom));
    st_1284.x = tmpvar_1285.x;
    st_1284.y = (tmpvar_1285.y + 0.4);
    st_1284 = (st_1284 - vec2(0.5, 0.5));
    float tmpvar_1286;
    tmpvar_1286 = clamp (((tax - 0.19) / 0.2), 0.0, 1.0);
    float tmpvar_1287;
    tmpvar_1287 = clamp (((tax - 0.65) / -0.26), 0.0, 1.0);
    float tmpvar_1288;
    tmpvar_1288 = ((1.0 - (tmpvar_1286 * 
      (tmpvar_1286 * (3.0 - (2.0 * tmpvar_1286)))
    )) + (1.0 - (tmpvar_1287 * 
      (tmpvar_1287 * (3.0 - (2.0 * tmpvar_1287)))
    )));
    float tmpvar_1289;
    tmpvar_1289 = (0.8 * (1.0 - tmpvar_1288));
    vec3 tmpvar_1290;
    tmpvar_1290 = (vec3(pow (abs(st_1284.y), (
      (0.5 - (tmpvar_1289 * 0.4))
     * 5.0))) * vec3(0.849, 0.08369, 0.08));
    color_1283 = tmpvar_1290;
    final_1282 = ((vec3(0.08, 0.003, 0.02) + tmpvar_1290) + vec3(((0.75 + 
      (tmpvar_1289 * 0.2)
    ) - pow (
      abs(st_1284.x)
    , 0.324))));
    float tmpvar_1291;
    tmpvar_1291 = (0.5 + (tmpvar_1289 * 0.5));
    float tmpvar_1292;
    tmpvar_1292 = (sqrt(dot (st_1284, st_1284)) * 2.0);
    float tmpvar_1293;
    float tmpvar_1294;
    tmpvar_1294 = (min (abs(
      (st_1284.y / st_1284.x)
    ), 1.0) / max (abs(
      (st_1284.y / st_1284.x)
    ), 1.0));
    float tmpvar_1295;
    tmpvar_1295 = (tmpvar_1294 * tmpvar_1294);
    tmpvar_1295 = (((
      ((((
        ((((-0.01213232 * tmpvar_1295) + 0.05368138) * tmpvar_1295) - 0.1173503)
       * tmpvar_1295) + 0.1938925) * tmpvar_1295) - 0.3326756)
     * tmpvar_1295) + 0.9999793) * tmpvar_1294);
    tmpvar_1295 = (tmpvar_1295 + (float(
      (abs((st_1284.y / st_1284.x)) > 1.0)
    ) * (
      (tmpvar_1295 * -2.0)
     + 1.570796)));
    tmpvar_1293 = (tmpvar_1295 * sign((st_1284.y / st_1284.x)));
    if ((abs(st_1284.x) > (1e-08 * abs(st_1284.y)))) {
      if ((st_1284.x < 0.0)) {
        if ((st_1284.y >= 0.0)) {
          tmpvar_1293 += 3.141593;
        } else {
          tmpvar_1293 = (tmpvar_1293 - 3.141593);
        };
      };
    } else {
      tmpvar_1293 = (sign(st_1284.y) * 1.570796);
    };
    float tmpvar_1296;
    tmpvar_1296 = (abs(cos(tmpvar_1293)) * 0.01);
    float tmpvar_1297;
    tmpvar_1297 = clamp (((tmpvar_1292 - tmpvar_1296) / (
      ((tmpvar_1296 + 0.02) + (tmpvar_1291 * 0.1))
     - tmpvar_1296)), 0.0, 1.0);
    color_1283 = (vec3((1.0 - (tmpvar_1297 * 
      (tmpvar_1297 * (3.0 - (2.0 * tmpvar_1297)))
    ))) * vec3(0.86, 0.759, 0.41));
    final_1282 = (final_1282 + color_1283);
    float tmpvar_1298;
    tmpvar_1298 = clamp (((tax - 0.19) / 0.46), 0.0, 1.0);
    vec4 tmpvar_1299;
    tmpvar_1299.w = 1.0;
    tmpvar_1299.xyz = final_1282;
    float edge0_1300;
    edge0_1300 = (0.05 + (0.05 * st_1284.y));
    float tmpvar_1301;
    tmpvar_1301 = clamp (((
      abs(st_1284.x)
     - edge0_1300) / (0.04 - edge0_1300)), 0.0, 1.0);
    float edge0_1302;
    edge0_1302 = (2.5 + (3.0 * (1.0 - 
      (1.0 - (tmpvar_1298 * (tmpvar_1298 * (3.0 - 
        (2.0 * tmpvar_1298)
      ))))
    )));
    float tmpvar_1303;
    tmpvar_1303 = clamp (((
      sqrt(dot (st_1284, st_1284))
     - edge0_1302) / -(edge0_1302)), 0.0, 1.0);
    tmpvar_1067 = (buff_11 + ((
      ((tmpvar_1299 * (tmpvar_1301 * (tmpvar_1301 * 
        (3.0 - (2.0 * tmpvar_1301))
      ))) * float((st_1284.y >= 0.0)))
     * 
      (1.0 - tmpvar_1288)
    ) * (tmpvar_1303 * 
      (tmpvar_1303 * (3.0 - (2.0 * tmpvar_1303)))
    )));
  };
  buff_11 = tmpvar_1067;
  tb_9 = mcol_10;
  exbff_8 = vec4(0.0, 0.0, 0.0, 0.0);
  for(int i_7=0;i_7<50;i_7++) {
    if ((i_7 >= 50)) {
      break;
    };
    if ((i_7 >= en1counter)) {
      break;
    };
    vec2 tmpvar_1304;
    tmpvar_1304.x = en1posx[i_7];
    tmpvar_1304.y = en1posy[i_7];
    float tshift_1305;
    tshift_1305 = en1timer[i_7];
    vec2 pos_1306;
    pos_1306 = fragCoord_3;
    float cpower_1307;
    cpower_1307 = en1exval[i_7];
    float chpower_1308;
    chpower_1308 = en1lval[i_7];
    vec4 tcc_1309;
    bool xxex_1310;
    xxex_1310 = en1llisex[i_7];
    vec4 tmpvar_1311;
    float R_1312;
    float tmpvar_1313;
    float tmpvar_1314;
    tmpvar_1314 = (125.0 * zoom);
    tmpvar_1313 = ((tmpvar_1304.y * zoom) - tmpvar_1314);
    float tmpvar_1315;
    tmpvar_1315 = ((tmpvar_1304.x * zoom) - tmpvar_1314);
    float tmpvar_1316;
    float tmpvar_1317;
    tmpvar_1317 = (min (abs(
      (tmpvar_1313 / tmpvar_1315)
    ), 1.0) / max (abs(
      (tmpvar_1313 / tmpvar_1315)
    ), 1.0));
    float tmpvar_1318;
    tmpvar_1318 = (tmpvar_1317 * tmpvar_1317);
    tmpvar_1318 = (((
      ((((
        ((((-0.01213232 * tmpvar_1318) + 0.05368138) * tmpvar_1318) - 0.1173503)
       * tmpvar_1318) + 0.1938925) * tmpvar_1318) - 0.3326756)
     * tmpvar_1318) + 0.9999793) * tmpvar_1317);
    tmpvar_1318 = (tmpvar_1318 + (float(
      (abs((tmpvar_1313 / tmpvar_1315)) > 1.0)
    ) * (
      (tmpvar_1318 * -2.0)
     + 1.570796)));
    tmpvar_1316 = (tmpvar_1318 * sign((tmpvar_1313 / tmpvar_1315)));
    if ((abs(tmpvar_1315) > (1e-08 * abs(tmpvar_1313)))) {
      if ((tmpvar_1315 < 0.0)) {
        if ((tmpvar_1313 >= 0.0)) {
          tmpvar_1316 += 3.141593;
        } else {
          tmpvar_1316 = (tmpvar_1316 - 3.141593);
        };
      };
    } else {
      tmpvar_1316 = (sign(tmpvar_1313) * 1.570796);
    };
    float tmpvar_1319;
    tmpvar_1319 = -(tmpvar_1316);
    pos_1306 = ((fragCoord_3 - (tmpvar_1304 * zoom)) - shippos);
    R_1312 = 250.0;
    vec2 x_1320;
    x_1320 = (pos_1306 - (125.0 * zoom));
    float tmpvar_1321;
    tmpvar_1321 = float((sqrt(
      dot (x_1320, x_1320)
    ) >= (
      ((300.0 + (500.0 * cpower_1307)) / 2.0)
     * zoom)));
    if (((1.0 - tmpvar_1321) > 0.0)) {
      vec4 tr2_1322;
      float b_1323;
      vec2 uv_1324;
      R_1312 = (250.0 * zoom);
      uv_1324 = (((pos_1306 / R_1312) - 0.5) * 2.0);
      mat2 tmpvar_1325;
      tmpvar_1325[0].x = cos(tmpvar_1319);
      tmpvar_1325[0].y = -(sin(tmpvar_1319));
      tmpvar_1325[1].x = sin(tmpvar_1319);
      tmpvar_1325[1].y = cos(tmpvar_1319);
      uv_1324 = (uv_1324 * tmpvar_1325);
      float tmpvar_1326;
      float tmpvar_1327;
      tmpvar_1327 = (min (abs(
        (uv_1324.y / uv_1324.x)
      ), 1.0) / max (abs(
        (uv_1324.y / uv_1324.x)
      ), 1.0));
      float tmpvar_1328;
      tmpvar_1328 = (tmpvar_1327 * tmpvar_1327);
      tmpvar_1328 = (((
        ((((
          ((((-0.01213232 * tmpvar_1328) + 0.05368138) * tmpvar_1328) - 0.1173503)
         * tmpvar_1328) + 0.1938925) * tmpvar_1328) - 0.3326756)
       * tmpvar_1328) + 0.9999793) * tmpvar_1327);
      tmpvar_1328 = (tmpvar_1328 + (float(
        (abs((uv_1324.y / uv_1324.x)) > 1.0)
      ) * (
        (tmpvar_1328 * -2.0)
       + 1.570796)));
      tmpvar_1326 = (tmpvar_1328 * sign((uv_1324.y / uv_1324.x)));
      if ((abs(uv_1324.x) > (1e-08 * abs(uv_1324.y)))) {
        if ((uv_1324.x < 0.0)) {
          if ((uv_1324.y >= 0.0)) {
            tmpvar_1326 += 3.141593;
          } else {
            tmpvar_1326 = (tmpvar_1326 - 3.141593);
          };
        };
      } else {
        tmpvar_1326 = (sign(uv_1324.y) * 1.570796);
      };
      float radius_1329;
      radius_1329 = (0.6 + ((
        ((chpower_1308 - 1.0) * max (0.0, (exp(
          (-(((
            -(cos(tmpvar_1326))
           * 0.5) + 0.5)) * 14.0)
        ) - 0.05)))
       * 
        (0.5 + (0.5 * sin((
          (tmpvar_1326 - tshift_1305)
         * 15.0))))
      ) / 10.0));
      float tmpvar_1330;
      tmpvar_1330 = (0.1 * ((
        -(cos(tmpvar_1326))
       * 0.5) + 0.5));
      float tmpvar_1331;
      tmpvar_1331 = sqrt(dot (uv_1324, uv_1324));
      float edge0_1332;
      edge0_1332 = ((radius_1329 - tmpvar_1330) - 0.01);
      float tmpvar_1333;
      tmpvar_1333 = clamp (((tmpvar_1331 - edge0_1332) / (
        (radius_1329 - tmpvar_1330)
       - edge0_1332)), 0.0, 1.0);
      float edge0_1334;
      edge0_1334 = (radius_1329 + tmpvar_1330);
      float tmpvar_1335;
      tmpvar_1335 = clamp (((tmpvar_1331 - edge0_1334) / (
        ((radius_1329 + tmpvar_1330) + 0.01)
       - edge0_1334)), 0.0, 1.0);
      float edge0_1336;
      edge0_1336 = (radius_1329 + tmpvar_1330);
      float tmpvar_1337;
      tmpvar_1337 = clamp (((tmpvar_1331 - edge0_1336) / (
        ((radius_1329 + tmpvar_1330) + 0.01)
       - edge0_1336)), 0.0, 1.0);
      float tmpvar_1338;
      float edge0_1339;
      edge0_1339 = ((radius_1329 - tmpvar_1330) - 0.01);
      float tmpvar_1340;
      tmpvar_1340 = clamp (((tmpvar_1331 - edge0_1339) / (
        (radius_1329 - tmpvar_1330)
       - edge0_1339)), 0.0, 1.0);
      tmpvar_1338 = (tmpvar_1340 * (tmpvar_1340 * (3.0 - 
        (2.0 * tmpvar_1340)
      )));
      vec3 tmpvar_1341;
      tmpvar_1341.x = ((tmpvar_1333 * (tmpvar_1333 * 
        (3.0 - (2.0 * tmpvar_1333))
      )) - (tmpvar_1335 * (tmpvar_1335 * 
        (3.0 - (2.0 * tmpvar_1335))
      )));
      tmpvar_1341.y = (1.0 - (tmpvar_1337 * (tmpvar_1337 * 
        (3.0 - (2.0 * tmpvar_1337))
      )));
      tmpvar_1341.z = tmpvar_1338;
      float tmpvar_1342;
      tmpvar_1342 = tmpvar_1341.x;
      b_1323 = 0.0;
      if ((tshift_1305 < 1.2)) {
        float timex_1343;
        vec2 tmpvar_1344;
        tmpvar_1344 = (((pos_1306 / 
          (250.0 * zoom)
        ) * 2.0) - 1.0);
        timex_1343 = (tshift_1305 + 5.7);
        float tmpvar_1345;
        tmpvar_1345 = ((sin(
          (timex_1343 * 2.0)
        ) + 1.0) * 5.0);
        float tmpvar_1346;
        tmpvar_1346 = ((sin(
          (timex_1343 * 3.0)
        ) / 2.0) + 0.5);
        float tmpvar_1347;
        tmpvar_1347 = (((
          sin((timex_1343 * 5.0))
         / 2.0) + 1.0) * 40.0);
        float tmpvar_1348;
        tmpvar_1348 = sqrt((pow (
          abs(tmpvar_1344.x)
        , tmpvar_1345) + pow (
          abs(tmpvar_1344.y)
        , tmpvar_1345)));
        float tmpvar_1349;
        tmpvar_1349 = clamp (((tmpvar_1346 - tmpvar_1348) * 250.0), 0.0, 1.0);
        b_1323 = max (0.0, (tmpvar_1349 + (
          (1.0 - tmpvar_1349)
         * 
          (1.0 + (((
            (tmpvar_1346 - tmpvar_1348)
           * 250.0) + tmpvar_1347) / tmpvar_1347))
        )));
      } else {
        b_1323 = 1.0;
      };
      vec2 uv_1350;
      uv_1350.y = uv_1324.y;
      float dir_1351;
      vec2 relative_1352;
      vec2 branch_1353;
      uv_1350.x = (uv_1324.x - 0.05);
      uv_1350 = (uv_1350 * 0.08);
      branch_1353 = vec2(0.0, 0.0);
      relative_1352 = (uv_1350 * (uv_1350 * uv_1350));
      float tmpvar_1354;
      float tmpvar_1355;
      tmpvar_1355 = (min (abs(
        (relative_1352.y / relative_1352.x)
      ), 1.0) / max (abs(
        (relative_1352.y / relative_1352.x)
      ), 1.0));
      float tmpvar_1356;
      tmpvar_1356 = (tmpvar_1355 * tmpvar_1355);
      tmpvar_1356 = (((
        ((((
          ((((-0.01213232 * tmpvar_1356) + 0.05368138) * tmpvar_1356) - 0.1173503)
         * tmpvar_1356) + 0.1938925) * tmpvar_1356) - 0.3326756)
       * tmpvar_1356) + 0.9999793) * tmpvar_1355);
      tmpvar_1356 = (tmpvar_1356 + (float(
        (abs((relative_1352.y / relative_1352.x)) > 1.0)
      ) * (
        (tmpvar_1356 * -2.0)
       + 1.570796)));
      tmpvar_1354 = (tmpvar_1356 * sign((relative_1352.y / relative_1352.x)));
      if ((abs(relative_1352.x) > (1e-08 * abs(relative_1352.y)))) {
        if ((relative_1352.x < 0.0)) {
          if ((relative_1352.y >= 0.0)) {
            tmpvar_1354 += 3.141593;
          } else {
            tmpvar_1354 = (tmpvar_1354 - 3.141593);
          };
        };
      } else {
        tmpvar_1354 = (sign(relative_1352.y) * 1.570796);
      };
      dir_1351 = (tmpvar_1354 * 3.0);
      dir_1351 = (dir_1351 - (tshift_1305 * 1.5));
      vec2 tmpvar_1357;
      tmpvar_1357.x = cos(dir_1351);
      tmpvar_1357.y = sin(dir_1351);
      relative_1352 = ((tmpvar_1357 / 3.0) - 0.7831919);
      branch_1353 = ((relative_1352 / 100.0) / sqrt(dot (uv_1350, uv_1350)));
      vec2 tmpvar_1358;
      tmpvar_1358 = (uv_1350 - branch_1353);
      float tmpvar_1359;
      tmpvar_1359 = ((2.0 + (0.5 * 
        sin(tshift_1305)
      )) + (10.0 * chpower_1308));
      float tmpvar_1360;
      tmpvar_1360 = clamp (((
        (sqrt(dot (uv_1350, uv_1350)) * 2.0)
       - 0.1) / -0.1), 0.0, 1.0);
      float tmpvar_1361;
      tmpvar_1361 = clamp (((
        (sqrt(dot (uv_1350, uv_1350)) * 2.0)
       - 0.1) / -0.1), 0.0, 1.0);
      float tmpvar_1362;
      tmpvar_1362 = clamp (((
        (sqrt(dot (uv_1350, uv_1350)) * 2.0)
       - 0.1) / -0.1), 0.0, 1.0);
      vec4 tmpvar_1363;
      tmpvar_1363.w = 1.0;
      tmpvar_1363.x = abs(((
        sin(tmpvar_1359)
       - 1.0) - (
        (1.0 - sin(tshift_1305))
       * 
        (tmpvar_1360 * (tmpvar_1360 * (3.0 - (2.0 * tmpvar_1360))))
      )));
      tmpvar_1363.y = abs(((0.5 + 
        sin(tmpvar_1359)
      ) - (
        (0.5 - sin(tshift_1305))
       * 
        (tmpvar_1361 * (tmpvar_1361 * (3.0 - (2.0 * tmpvar_1361))))
      )));
      tmpvar_1363.z = abs(((0.5 - 
        sin(tmpvar_1359)
      ) - (
        (0.5 - sin(tshift_1305))
       * 
        (tmpvar_1362 * (tmpvar_1362 * (3.0 - (2.0 * tmpvar_1362))))
      )));
      float tmpvar_1364;
      tmpvar_1364 = clamp (((
        (sqrt(dot (uv_1350, uv_1350)) / 2.0)
       - 0.1) / 0.8), 0.0, 1.0);
      vec4 tmpvar_1365;
      tmpvar_1365 = (min (vec4(1.0, 1.0, 1.0, 1.0), (tmpvar_1363 * 
        (sqrt(dot (tmpvar_1358, tmpvar_1358)) / chpower_1308)
      )) - (tmpvar_1364 * (tmpvar_1364 * 
        (3.0 - (2.0 * tmpvar_1364))
      )));
      tr2_1322 = ((tmpvar_1365 * b_1323) + ((
        (5.0 * tmpvar_1365)
       * 
        (1.0 - b_1323)
      ) * b_1323));
      vec2 p_1366;
      vec2 tmpvar_1367;
      float tmpvar_1368;
      tmpvar_1368 = (250.0 * zoom);
      tmpvar_1367 = (((pos_1306 / tmpvar_1368) * 2.0) - 1.0);
      p_1366.y = tmpvar_1367.y;
      p_1366.x = (tmpvar_1367.x - 0.051);
      vec4 tmpvar_1369;
      tmpvar_1369.w = 1.0;
      tmpvar_1369.xyz = (vec3(0.1, 0.1, 0.2) * abs((0.32076 / 
        (((p_1366.x * p_1366.x) + (tmpvar_1367.y * tmpvar_1367.y)) - (0.2880836 * abs(sin(
          ((((
            (p_1366.x * tmpvar_1367.y)
           * 50.0) + iTime) + (tmpvar_1368 * p_1366.x)) + (tmpvar_1368 * tmpvar_1367.y))
        ))))
      )));
      vec4 tmpvar_1370;
      tmpvar_1370 = (-(tmpvar_1369) * b_1323);
      float intensity_1371;
      vec2 tmpvar_1372;
      tmpvar_1372 = vec2((tmpvar_1368 / 2.0));
      vec2 x_1373;
      x_1373 = (tmpvar_1372 - pos_1306);
      float tmpvar_1374;
      tmpvar_1374 = exp((-(
        abs((pos_1306.x - tmpvar_1372.x))
      ) * (0.02 / 
        (tmpvar_1368 / 500.0)
      )));
      intensity_1371 = (pow ((
        (cpower_1307 * (tmpvar_1368 / 2.0))
       / 
        sqrt(dot (x_1373, x_1373))
      ), 4.0) + pow ((
        (32.0 * (tmpvar_1374 * tmpvar_1374))
       / 
        abs(((tmpvar_1368 / 2.0) - pos_1306.y))
      ), 0.5));
      intensity_1371 = (intensity_1371 + (intensity_1371 * intensity_1371));
      vec3 tmpvar_1375;
      tmpvar_1375.yz = vec2(0.25, 0.97);
      tmpvar_1375.x = (0.91 + ((0.05 * 
        sin((-(tshift_1305) * 50.0))
      ) * float(
        (cpower_1307 >= 0.5)
      )));
      vec4 tmpvar_1376;
      tmpvar_1376.w = 1.0;
      tmpvar_1376.xyz = ((tmpvar_1375 * intensity_1371) * 0.8);
      vec4 tmpvar_1377;
      tmpvar_1377 = ((min (vec4(1.0, 1.0, 1.0, 1.0), tmpvar_1376) * cpower_1307) * b_1323);
      uv_1324.x = (uv_1324.x + 0.1);
      if ((xxex_1310 || (cpower_1307 > 0.0))) {
        float edge0_1378;
        edge0_1378 = (0.7 + (2.0 * cpower_1307));
        float tmpvar_1379;
        tmpvar_1379 = clamp (((
          sqrt(dot (uv_1324, uv_1324))
         - edge0_1378) / (0.5 - edge0_1378)), 0.0, 1.0);
        tcc_1309 = (tmpvar_1377 * (tmpvar_1379 * (tmpvar_1379 * 
          (3.0 - (2.0 * tmpvar_1379))
        )));
        tmpvar_1311 = tcc_1309;
      } else {
        vec3 tmpvar_1380;
        tmpvar_1380.x = -(tmpvar_1341.x);
        tmpvar_1380.y = tmpvar_1342;
        tmpvar_1380.z = tmpvar_1342;
        vec4 tmpvar_1381;
        tmpvar_1381.w = 1.0;
        tmpvar_1381.xyz = -(tmpvar_1380);
        float tmpvar_1382;
        tmpvar_1382 = clamp (((
          sqrt(dot (uv_1324, uv_1324))
         - 0.7) / -0.2), 0.0, 1.0);
        float edge0_1383;
        edge0_1383 = (0.7 + (2.0 * cpower_1307));
        float tmpvar_1384;
        tmpvar_1384 = clamp (((
          sqrt(dot (uv_1324, uv_1324))
         - edge0_1383) / (0.5 - edge0_1383)), 0.0, 1.0);
        tcc_1309 = ((max (vec4(0.0, 0.0, 0.0, 0.0), 
          ((((
            (tmpvar_1381 * tr2_1322)
           * 
            (tmpvar_1341.y * 0.57)
          ) + (tr2_1322 * tmpvar_1341.y)) + (tmpvar_1370 * tmpvar_1341.y)) + ((tr2_1322 * (1.0 - tmpvar_1341.y)) * (tmpvar_1382 * (tmpvar_1382 * 
            (3.0 - (2.0 * tmpvar_1382))
          ))))
        ) + (tmpvar_1377 * 
          (tmpvar_1384 * (tmpvar_1384 * (3.0 - (2.0 * tmpvar_1384))))
        )) + (tb_9 * (1.0 - tmpvar_1341.x)));
        vec3 tmpvar_1385;
        tmpvar_1385.x = -(tmpvar_1341.x);
        tmpvar_1385.y = tmpvar_1342;
        tmpvar_1385.z = tmpvar_1342;
        vec4 tmpvar_1386;
        tmpvar_1386.w = 1.0;
        tmpvar_1386.xyz = -(tmpvar_1385);
        float tmpvar_1387;
        tmpvar_1387 = clamp (((
          sqrt(dot (uv_1324, uv_1324))
         - 0.7) / -0.2), 0.0, 1.0);
        float edge0_1388;
        edge0_1388 = (0.7 + (2.0 * cpower_1307));
        float tmpvar_1389;
        tmpvar_1389 = clamp (((
          sqrt(dot (uv_1324, uv_1324))
         - edge0_1388) / (0.5 - edge0_1388)), 0.0, 1.0);
        tmpvar_1311 = (((
          max (vec4(0.0, 0.0, 0.0, 0.0), (((
            ((tmpvar_1386 * tr2_1322) * (tmpvar_1341.y * 0.57))
           + 
            (tr2_1322 * tmpvar_1341.y)
          ) + (tmpvar_1370 * tmpvar_1341.y)) + ((tr2_1322 * 
            (1.0 - tmpvar_1341.y)
          ) * (tmpvar_1387 * 
            (tmpvar_1387 * (3.0 - (2.0 * tmpvar_1387)))
          ))))
         + 
          (tmpvar_1377 * (tmpvar_1389 * (tmpvar_1389 * (3.0 - 
            (2.0 * tmpvar_1389)
          ))))
        ) + (buff_11 * 
          (1.0 - (tmpvar_1341.y * b_1323))
        )) + (tb_9 * (1.0 - 
          (tmpvar_1338 * b_1323)
        )));
      };
    } else {
      if ((xxex_1310 || (cpower_1307 > 0.0))) {
        tcc_1309 = vec4(0.0, 0.0, 0.0, 0.0);
        tmpvar_1311 = vec4(0.0, 0.0, 0.0, 0.0);
      } else {
        tcc_1309 = tb_9;
        tmpvar_1311 = buff_11;
      };
    };
    if ((en1llisex[i_7] || (en1exval[i_7] > 0.0))) {
      exbff_8 = (exbff_8 + min (vec4(1.0, 1.0, 1.0, 1.0), tmpvar_1311));
    } else {
      buff_11 = tmpvar_1311;
      tb_9 = tcc_1309;
    };

  };
  mcol_10 = buff_11;
  txeb_6 = vec4(0.0, 0.0, 0.0, 0.0);
  for(int i_5=0;i_5<50;i_5++) {
    if ((i_5 >= 50)) {
      break;
    };
    if ((i_5 >= en2counter)) {
      break;
    };
    vec2 tmpvar_1390;
    tmpvar_1390.x = en2posx[i_5];
    tmpvar_1390.y = en2posy[i_5];
    vec4 col_1391;
    col_1391 = mcol_10;
    vec2 pos_1392;
    float tshift_1393;
    tshift_1393 = en2timer[i_5];
    vec4 lux_1394;
    bool naa_1395;
    naa_1395 = en2llishit[i_5];
    float botmr_1396;
    botmr_1396 = en2extimer[i_5];
    vec4 tmpvar_1397;
    vec2 tmpvar_1398;
    float tmpvar_1399;
    tmpvar_1399 = (125.0 * zoom);
    tmpvar_1398 = ((tmpvar_1390 * zoom) - tmpvar_1399);
    pos_1392 = ((fragCoord_3 - (tmpvar_1390 * zoom)) - shippos);
    bool tmpvar_1400;
    tmpvar_1400 = ((float(
      ((1500.0 * zoom) >= sqrt(dot (tmpvar_1398, tmpvar_1398)))
    ) > 0.0) && (botmr_1396 < 0.001));
    float tmpvar_1401;
    tmpvar_1401 = ((tmpvar_1390.y * zoom) - tmpvar_1399);
    float tmpvar_1402;
    tmpvar_1402 = ((tmpvar_1390.x * zoom) - tmpvar_1399);
    float tmpvar_1403;
    float tmpvar_1404;
    tmpvar_1404 = (min (abs(
      (tmpvar_1401 / tmpvar_1402)
    ), 1.0) / max (abs(
      (tmpvar_1401 / tmpvar_1402)
    ), 1.0));
    float tmpvar_1405;
    tmpvar_1405 = (tmpvar_1404 * tmpvar_1404);
    tmpvar_1405 = (((
      ((((
        ((((-0.01213232 * tmpvar_1405) + 0.05368138) * tmpvar_1405) - 0.1173503)
       * tmpvar_1405) + 0.1938925) * tmpvar_1405) - 0.3326756)
     * tmpvar_1405) + 0.9999793) * tmpvar_1404);
    tmpvar_1405 = (tmpvar_1405 + (float(
      (abs((tmpvar_1401 / tmpvar_1402)) > 1.0)
    ) * (
      (tmpvar_1405 * -2.0)
     + 1.570796)));
    tmpvar_1403 = (tmpvar_1405 * sign((tmpvar_1401 / tmpvar_1402)));
    if ((abs(tmpvar_1402) > (1e-08 * abs(tmpvar_1401)))) {
      if ((tmpvar_1402 < 0.0)) {
        if ((tmpvar_1401 >= 0.0)) {
          tmpvar_1403 += 3.141593;
        } else {
          tmpvar_1403 = (tmpvar_1403 - 3.141593);
        };
      };
    } else {
      tmpvar_1403 = (sign(tmpvar_1401) * 1.570796);
    };
    float tmpvar_1406;
    tmpvar_1406 = (-(tmpvar_1403) - 1.57079);
    vec2 x_1407;
    x_1407 = (pos_1392 - (125.0 * zoom));
    float tmpvar_1408;
    tmpvar_1408 = float((sqrt(
      dot (x_1407, x_1407)
    ) >= (150.0 * zoom)));
    if ((((1.0 - tmpvar_1408) > 0.0) || tmpvar_1400)) {
      vec4 lc_1409;
      vec4 tret_1410;
      float b_1411;
      vec2 tuvv_1412;
      float tuv_1413;
      vec4 cl1_1414;
      vec2 z_1415;
      vec2 sp_1416;
      vec2 uv_1417;
      vec2 tmpvar_1418;
      tmpvar_1418 = vec2((250.0 * zoom));
      mat2 tmpvar_1419;
      tmpvar_1419[0].x = cos(tmpvar_1406);
      tmpvar_1419[0].y = -(sin(tmpvar_1406));
      tmpvar_1419[1].x = sin(tmpvar_1406);
      tmpvar_1419[1].y = cos(tmpvar_1406);
      uv_1417 = (abs((
        ((pos_1392 - (tmpvar_1418 / 2.0)) / tmpvar_1418.y)
       * 8.0)) * tmpvar_1419);
      vec3 tmpvar_1420;
      tmpvar_1420.x = dot (uv_1417, vec2(1.5, 0.5));
      tmpvar_1420.y = dot (uv_1417, vec2(-1.0, 0.5));
      tmpvar_1420.z = uv_1417.y;
      vec3 tmpvar_1421;
      tmpvar_1421 = fract(tmpvar_1420);
      vec3 tmpvar_1422;
      tmpvar_1422 = fract(-(tmpvar_1420));
      float tmpvar_1423;
      tmpvar_1423 = (uv_1417.x - (uv_1417.y / 2.0));
      vec2 tmpvar_1424;
      tmpvar_1424.x = ((floor(tmpvar_1423) * 2.0) + float((
        fract(tmpvar_1423)
       >= 
        fract((1.0 - uv_1417.y))
      )));
      tmpvar_1424.y = floor(uv_1417.y);
      float tmpvar_1425;
      tmpvar_1425 = float((min (
        (0.2 + min (min (tmpvar_1421.x, tmpvar_1421.y), tmpvar_1421.z))
      , 
        min (min (tmpvar_1422.x, tmpvar_1422.y), tmpvar_1422.z)
      ) >= (0.12 + 
        (sin(((
          (fract((cos(
            dot (tmpvar_1424, vec2(21.9898, 78.233))
          ) * 43758.55)) * 2.0)
         + 
          (tmpvar_1424.x / 16.0)
        ) + (
          -(tshift_1393)
         * 2.0))) * 0.2)
      )));
      uv_1417 = ((pos_1392 / tmpvar_1418) - 0.5);
      mat2 tmpvar_1426;
      tmpvar_1426[0].x = cos(tmpvar_1406);
      tmpvar_1426[0].y = -(sin(tmpvar_1406));
      tmpvar_1426[1].x = sin(tmpvar_1406);
      tmpvar_1426[1].y = cos(tmpvar_1406);
      uv_1417 = (uv_1417 * tmpvar_1426);
      sp_1416.x = uv_1417.x;
      sp_1416.y = (uv_1417.y + -0.291);
      z_1415 = pow (vec2(0.0, 0.0), abs(sp_1416));
      z_1415 = (z_1415 + pow (vec2(0.0, 1.0), abs(sp_1416)));
      z_1415 = (z_1415 + pow (vec2(1.0, 0.0), abs(sp_1416)));
      vec2 tmpvar_1427;
      tmpvar_1427 = pow ((abs(sp_1416) * 1000000.0), vec2(0.1, 0.1));
      float tmpvar_1428;
      tmpvar_1428 = sqrt(dot (tmpvar_1427, tmpvar_1427));
      float tmpvar_1429;
      float tmpvar_1430;
      tmpvar_1430 = (min (abs(
        (tmpvar_1427.x / tmpvar_1427.y)
      ), 1.0) / max (abs(
        (tmpvar_1427.x / tmpvar_1427.y)
      ), 1.0));
      float tmpvar_1431;
      tmpvar_1431 = (tmpvar_1430 * tmpvar_1430);
      tmpvar_1431 = (((
        ((((
          ((((-0.01213232 * tmpvar_1431) + 0.05368138) * tmpvar_1431) - 0.1173503)
         * tmpvar_1431) + 0.1938925) * tmpvar_1431) - 0.3326756)
       * tmpvar_1431) + 0.9999793) * tmpvar_1430);
      tmpvar_1431 = (tmpvar_1431 + (float(
        (abs((tmpvar_1427.x / tmpvar_1427.y)) > 1.0)
      ) * (
        (tmpvar_1431 * -2.0)
       + 1.570796)));
      tmpvar_1429 = (tmpvar_1431 * sign((tmpvar_1427.x / tmpvar_1427.y)));
      if ((abs(tmpvar_1427.y) > (1e-08 * abs(tmpvar_1427.x)))) {
        if ((tmpvar_1427.y < 0.0)) {
          if ((tmpvar_1427.x >= 0.0)) {
            tmpvar_1429 += 3.141593;
          } else {
            tmpvar_1429 = (tmpvar_1429 - 3.141593);
          };
        };
      } else {
        tmpvar_1429 = (sign(tmpvar_1427.x) * 1.570796);
      };
      float tmpvar_1432;
      tmpvar_1432 = (((tmpvar_1427.y * 
        (log(tmpvar_1428) - 1.0)
      ) + (tmpvar_1429 * 
        ((tmpvar_1427.x * 0.15) + 1.5)
      )) - tshift_1393);
      vec2 tmpvar_1433;
      tmpvar_1433.x = sin(tmpvar_1432);
      tmpvar_1433.y = cos(tmpvar_1432);
      z_1415 = (z_1415 + ((3.963319 * 
        exp((((
          log(tmpvar_1428)
         * 
          (tmpvar_1427.x + 0.5)
        ) - (tmpvar_1427.y * tmpvar_1429)) - tmpvar_1427.x))
      ) * tmpvar_1433));
      float tmpvar_1434;
      tmpvar_1434 = sin(z_1415.x);
      float tmpvar_1435;
      tmpvar_1435 = sin(z_1415.y);
      vec4 tmpvar_1436;
      tmpvar_1436.w = 1.0;
      tmpvar_1436.x = tmpvar_1434;
      tmpvar_1436.y = (cos(z_1415.x) + cos(z_1415.y));
      tmpvar_1436.z = tmpvar_1435;
      cl1_1414 = tmpvar_1436;
      if (tmpvar_1400) {
        cl1_1414 = (vec4(((tmpvar_1434 * tmpvar_1436.y) * tmpvar_1435)) + (tmpvar_1436 * 0.21));
      } else {
        cl1_1414 = vec4(((cl1_1414.x * cl1_1414.y) * cl1_1414.z));
      };
      float tmpvar_1437;
      tmpvar_1437 = clamp (((
        sqrt(dot (uv_1417, uv_1417))
       - 0.3) / -0.01000002), 0.0, 1.0);
      float tmpvar_1438;
      tmpvar_1438 = ((tmpvar_1437 * (tmpvar_1437 * 
        (3.0 - (2.0 * tmpvar_1437))
      )) * 2.0);
      tuv_1413 = tmpvar_1438;
      float tmpvar_1439;
      float tmpvar_1440;
      tmpvar_1440 = clamp (((
        sqrt(dot (uv_1417, uv_1417))
       - 0.3) / -0.01000002), 0.0, 1.0);
      tmpvar_1439 = (tmpvar_1440 * (tmpvar_1440 * (3.0 - 
        (2.0 * tmpvar_1440)
      )));
      tuvv_1412 = uv_1417;
      b_1411 = 0.0;
      if ((tshift_1393 < 1.2)) {
        float timex_1441;
        vec2 tmpvar_1442;
        tmpvar_1442 = (((pos_1392 / 
          (250.0 * zoom)
        ) * 2.0) - 1.0);
        timex_1441 = (tshift_1393 + 5.7);
        float tmpvar_1443;
        tmpvar_1443 = ((sin(
          (timex_1441 * 2.0)
        ) + 1.0) * 5.0);
        float tmpvar_1444;
        tmpvar_1444 = ((sin(
          (timex_1441 * 3.0)
        ) / 2.0) + 0.5);
        float tmpvar_1445;
        tmpvar_1445 = (((
          sin((timex_1441 * 5.0))
         / 2.0) + 1.0) * 40.0);
        float tmpvar_1446;
        tmpvar_1446 = sqrt((pow (
          abs(tmpvar_1442.x)
        , tmpvar_1443) + pow (
          abs(tmpvar_1442.y)
        , tmpvar_1443)));
        float tmpvar_1447;
        tmpvar_1447 = clamp (((tmpvar_1444 - tmpvar_1446) * 250.0), 0.0, 1.0);
        b_1411 = max (0.0, (tmpvar_1447 + (
          (1.0 - tmpvar_1447)
         * 
          (1.0 + (((
            (tmpvar_1444 - tmpvar_1446)
           * 250.0) + tmpvar_1445) / tmpvar_1445))
        )));
      } else {
        if ((botmr_1396 > 0.0)) {
          float timex_1448;
          vec2 tmpvar_1449;
          tmpvar_1449 = (((pos_1392 / 
            (250.0 * zoom)
          ) * 2.0) - 1.0);
          timex_1448 = (botmr_1396 + 1.0);
          float tmpvar_1450;
          tmpvar_1450 = ((sin(
            (timex_1448 * 2.0)
          ) + 1.0) * 5.0);
          float tmpvar_1451;
          tmpvar_1451 = ((sin(
            (timex_1448 * 3.0)
          ) / 2.0) + 0.5);
          float tmpvar_1452;
          tmpvar_1452 = (((
            sin((timex_1448 * 5.0))
           / 2.0) + 1.0) * 40.0);
          float tmpvar_1453;
          tmpvar_1453 = sqrt((pow (
            abs(tmpvar_1449.x)
          , tmpvar_1450) + pow (
            abs(tmpvar_1449.y)
          , tmpvar_1450)));
          float tmpvar_1454;
          tmpvar_1454 = clamp (((tmpvar_1451 - tmpvar_1453) * 250.0), 0.0, 1.0);
          b_1411 = max (0.0, (tmpvar_1454 + (
            (1.0 - tmpvar_1454)
           * 
            (1.0 + (((
              (tmpvar_1451 - tmpvar_1453)
             * 250.0) + tmpvar_1452) / tmpvar_1452))
          )));
        } else {
          b_1411 = 1.0;
        };
      };
      col_1391 = (((buff_11 * 
        (1.0 - (tmpvar_1425 * b_1411))
      ) * tmpvar_1439) + (buff_11 * (1.0 - tmpvar_1439)));
      float tmpvar_1455;
      tmpvar_1455 = clamp (((
        sqrt(dot (uv_1417, uv_1417))
       - 0.3) / -0.1), 0.0, 1.0);
      tret_1410 = (((tmpvar_1425 * cl1_1414) * (tmpvar_1438 * b_1411)) + ((
        ((3.0 * cl1_1414) * (1.0 - b_1411))
       * b_1411) * (tmpvar_1455 * 
        (tmpvar_1455 * (3.0 - (2.0 * tmpvar_1455)))
      )));
      tuv_1413 = (2.0 - tmpvar_1438);
      uv_1417 = ((pos_1392.yx / tmpvar_1418) - 0.5);
      mat2 tmpvar_1456;
      tmpvar_1456[0].x = cos(-(tmpvar_1406));
      tmpvar_1456[0].y = -(sin(-(tmpvar_1406)));
      tmpvar_1456[1].x = sin(-(tmpvar_1406));
      tmpvar_1456[1].y = cos(-(tmpvar_1406));
      uv_1417 = (uv_1417 * tmpvar_1456);
      lc_1409 = vec4(0.0, 0.0, 0.0, 0.0);
      if (tmpvar_1400) {
        float dy_1457;
        vec2 tmpvar_1458;
        tmpvar_1458.y = 0.0;
        tmpvar_1458.x = uv_1417.x;
        vec2 x_1459;
        x_1459 = (uv_1417 - tmpvar_1458);
        vec2 tmpvar_1460;
        tmpvar_1460.y = 0.0;
        tmpvar_1460.x = uv_1417.x;
        vec2 x_1461;
        x_1461 = (uv_1417 - tmpvar_1460);
        float tmpvar_1462;
        tmpvar_1462 = clamp (((
          sqrt(dot (x_1461, x_1461))
         - 0.1) / -0.05), 0.0, 1.0);
        vec2 tmpvar_1463;
        tmpvar_1463.y = 0.0;
        tmpvar_1463.x = tuvv_1412.x;
        vec2 tmpvar_1464;
        tmpvar_1464 = max (vec2(0.0, 0.0), (tuvv_1412 - tmpvar_1463));
        dy_1457 = (((
          (1.0/((25.0 * sqrt(dot (x_1459, x_1459)))))
         * 
          (tmpvar_1462 * (tmpvar_1462 * (3.0 - (2.0 * tmpvar_1462))))
        ) * tuv_1413) * float((
          sqrt(dot (tmpvar_1464, tmpvar_1464))
         >= 0.1)));
        vec4 tmpvar_1465;
        tmpvar_1465.w = 1.0;
        tmpvar_1465.x = ((uv_1417.x + cl1_1414.x) * dy_1457);
        tmpvar_1465.yz = (cl1_1414.yz * vec2(dy_1457));
        lc_1409 = tmpvar_1465;
      };
      vec2 x_1466;
      x_1466 = (pos_1392 - (125.0 * zoom));
      lux_1394 = (lc_1409 * float((
        sqrt(dot (tmpvar_1398, tmpvar_1398))
       >= 
        sqrt(dot (x_1466, x_1466))
      )));
      vec2 uv_1467;
      float an_1468;
      float light_1469;
      an_1468 = (tmpvar_1406 + -0.7853949);
      vec2 tmpvar_1470;
      tmpvar_1470 = vec2((250.0 * zoom));
      uv_1467 = ((pos_1392 - (tmpvar_1470 / 2.0)) / tmpvar_1470.y);
      mat2 tmpvar_1471;
      tmpvar_1471[0].x = cos(an_1468);
      tmpvar_1471[0].y = -(sin(an_1468));
      tmpvar_1471[1].x = sin(an_1468);
      tmpvar_1471[1].y = cos(an_1468);
      uv_1467 = (uv_1467 * tmpvar_1471);
      uv_1467 = (uv_1467 * 3.0);
      vec2 tmpvar_1472;
      tmpvar_1472 = ((uv_1467 / 1.75) + 0.9975);
      float tmpvar_1473;
      tmpvar_1473 = (float(mod (((iTime * 6.283159) / 6.666667), 6.283159)));
      vec2 tmpvar_1474;
      tmpvar_1474 = ((tmpvar_1472 + vec2(0.1, 0.1)) - ((vec2(0.1, 0.1) * tmpvar_1472) * cos(vec2(tmpvar_1473))));
      vec2 tmpvar_1475;
      tmpvar_1475 = ((tmpvar_1472 - vec2(0.1, 0.1)) + abs((
        (vec2(0.1, 0.1) * tmpvar_1472)
       * 
        cos(vec2(tmpvar_1473))
      )));
      float tmpvar_1476;
      if (naa_1395) {
        tmpvar_1476 = 1.0;
      } else {
        tmpvar_1476 = 0.0;
      };
      vec3 tmpvar_1477;
      tmpvar_1477.yz = vec2(0.365, 0.25);
      tmpvar_1477.x = (0.49 + (2.0 * tmpvar_1476));
      vec2 tmpvar_1478;
      tmpvar_1478 = (normalize(uv_1467) - uv_1467);
      light_1469 = (0.015 / sqrt(dot (tmpvar_1478, tmpvar_1478)));
      float tmpvar_1479;
      tmpvar_1479 = sqrt(dot (uv_1467, uv_1467));
      if ((tmpvar_1479 < 1.0)) {
        float tmpvar_1480;
        if (naa_1395) {
          tmpvar_1480 = 1.0;
        } else {
          tmpvar_1480 = 0.0;
        };
        vec2 tmpvar_1481;
        tmpvar_1481 = (normalize((uv_1467 - tmpvar_1475)) - (uv_1467 - tmpvar_1475));
        light_1469 = (light_1469 + ((tmpvar_1480 * 0.51) / sqrt(
          dot (tmpvar_1481, tmpvar_1481)
        )));
        float tmpvar_1482;
        if (naa_1395) {
          tmpvar_1482 = 1.0;
        } else {
          tmpvar_1482 = 0.0;
        };
        vec2 tmpvar_1483;
        tmpvar_1483 = (normalize((uv_1467 - tmpvar_1474)) - (uv_1467 - tmpvar_1474));
        light_1469 = (light_1469 + ((tmpvar_1482 * 0.51) / sqrt(
          dot (tmpvar_1483, tmpvar_1483)
        )));
        vec2 tmpvar_1484;
        tmpvar_1484 = (normalize((uv_1467 - tmpvar_1472)) - (uv_1467 - tmpvar_1472));
        light_1469 = (light_1469 * (0.0511 / sqrt(
          dot (tmpvar_1484, tmpvar_1484)
        )));
        vec2 tmpvar_1485;
        tmpvar_1485 = (normalize(uv_1467) - uv_1467);
        light_1469 = (light_1469 * (0.18521 / sqrt(
          dot (tmpvar_1485, tmpvar_1485)
        )));
      };
      float tmpvar_1486;
      tmpvar_1486 = clamp (((
        sqrt(dot (uv_1467, uv_1467))
       - 1.5) / -1.5), 0.0, 1.0);
      vec4 tmpvar_1487;
      tmpvar_1487.w = 1.0;
      tmpvar_1487.xyz = ((light_1469 * tmpvar_1477) * (tmpvar_1486 * (tmpvar_1486 * 
        (3.0 - (2.0 * tmpvar_1486))
      )));
      tmpvar_1397 = ((tret_1410 + col_1391) + (tmpvar_1487 * b_1411));
    } else {
      lux_1394 = vec4(0.0, 0.0, 0.0, 0.0);
      tmpvar_1397 = buff_11;
    };
    buff_11 = tmpvar_1397;
    txeb_6 = (txeb_6 + lux_1394);
  };
  mcol_10 = buff_11;
  buff_11 = (buff_11 + exbff_8);
  vec4 tmpvar_1488;
  vec2 tmpvar_1489;
  tmpvar_1489 = ((tmpvar_2 - (starpos1 * zoom)) - shippos);
  vec2 x_1490;
  x_1490 = (tmpvar_1489 - (125000.0 * zoom));
  float tmpvar_1491;
  tmpvar_1491 = float((sqrt(
    dot (x_1490, x_1490)
  ) >= (125175.0 * zoom)));
  if (((1.0 - tmpvar_1491) > 0.0)) {
    float c_1492;
    vec2 tmpvar_1493;
    tmpvar_1493 = vec2((250000.0 * zoom));
    vec2 tmpvar_1494;
    tmpvar_1494 = (((tmpvar_1489 * 200.0) - (100.0 * tmpvar_1493)) / tmpvar_1493.y);
    vec2 tmpvar_1495;
    tmpvar_1495 = ((tmpvar_1489 / tmpvar_1493) - 0.5);
    vec4 tmpvar_1496;
    tmpvar_1496.w = 1.0;
    tmpvar_1496.xyz = ((vec3(0.2463, 0.254, 0.9729) / dot (tmpvar_1495, tmpvar_1495)) / 3.59);
    vec4 tmpvar_1497;
    tmpvar_1497 = min (vec4(1.0, 1.0, 1.0, 1.0), tmpvar_1496);
    c_1492 = 0.0;
    float tmpvar_1498;
    tmpvar_1498 = pow ((clamp (
      (((250.0 - sqrt(
        dot (tmpvar_1494, tmpvar_1494)
      )) + 100.0) - 40.0)
    , 0.0, 250.0) / 250.0), 6.0);
    float n_1499;
    float tmpvar_1500;
    float tmpvar_1501;
    tmpvar_1501 = (min (abs(
      (tmpvar_1494.y / tmpvar_1494.x)
    ), 1.0) / max (abs(
      (tmpvar_1494.y / tmpvar_1494.x)
    ), 1.0));
    float tmpvar_1502;
    tmpvar_1502 = (tmpvar_1501 * tmpvar_1501);
    tmpvar_1502 = (((
      ((((
        ((((-0.01213232 * tmpvar_1502) + 0.05368138) * tmpvar_1502) - 0.1173503)
       * tmpvar_1502) + 0.1938925) * tmpvar_1502) - 0.3326756)
     * tmpvar_1502) + 0.9999793) * tmpvar_1501);
    tmpvar_1502 = (tmpvar_1502 + (float(
      (abs((tmpvar_1494.y / tmpvar_1494.x)) > 1.0)
    ) * (
      (tmpvar_1502 * -2.0)
     + 1.570796)));
    tmpvar_1500 = (tmpvar_1502 * sign((tmpvar_1494.y / tmpvar_1494.x)));
    if ((abs(tmpvar_1494.x) > (1e-08 * abs(tmpvar_1494.y)))) {
      if ((tmpvar_1494.x < 0.0)) {
        if ((tmpvar_1494.y >= 0.0)) {
          tmpvar_1500 += 3.141593;
        } else {
          tmpvar_1500 = (tmpvar_1500 - 3.141593);
        };
      };
    } else {
      tmpvar_1500 = (sign(tmpvar_1494.y) * 1.570796);
    };
    float tmpvar_1503;
    tmpvar_1503 = (time * 0.4);
    vec2 tmpvar_1504;
    tmpvar_1504.x = (((1.326885 + 
      (tmpvar_1503 * 0.1)
    ) + (
      cos(((tmpvar_1498 * 13.8) + (fract(
        abs(sin(((tmpvar_1503 + tmpvar_1500) + 1.2637)))
      ) * 3.0)))
     * 0.2)) + (tmpvar_1500 * 8.225723));
    tmpvar_1504.y = ((1.2637 + tmpvar_1503) + tmpvar_1500);
    float tmpvar_1505;
    vec2 uv_1506;
    vec2 tmpvar_1507;
    tmpvar_1507 = floor(tmpvar_1504);
    vec2 tmpvar_1508;
    tmpvar_1508 = (tmpvar_1504 - tmpvar_1507);
    uv_1506 = ((tmpvar_1508 * tmpvar_1508) * (3.0 - (2.0 * tmpvar_1508)));
    float tmpvar_1509;
    tmpvar_1509 = fract((cos(
      dot (tmpvar_1507, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_1510;
    tmpvar_1510.x = (tmpvar_1507.x + 1.0);
    tmpvar_1510.y = tmpvar_1507.y;
    float tmpvar_1511;
    tmpvar_1511 = fract((cos(
      dot (tmpvar_1510, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_1512;
    tmpvar_1512.x = tmpvar_1507.x;
    tmpvar_1512.y = (tmpvar_1507.y + 1.0);
    float tmpvar_1513;
    tmpvar_1513 = fract((cos(
      dot (tmpvar_1512, vec2(21.9898, 78.233))
    ) * 43758.55));
    tmpvar_1505 = (((tmpvar_1509 + 
      ((tmpvar_1511 - tmpvar_1509) * uv_1506.x)
    ) + (
      (tmpvar_1513 - tmpvar_1509)
     * uv_1506.y)) + ((
      (((tmpvar_1509 - tmpvar_1511) - tmpvar_1513) + fract((cos(
        dot ((tmpvar_1507 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))
      ) * 43758.55)))
     * uv_1506.x) * uv_1506.y));
    vec2 tmpvar_1514;
    tmpvar_1514.x = (((245.1578 + 
      (tmpvar_1500 * 8.225723)
    ) + tmpvar_1503) + (cos(
      ((((tmpvar_1498 * 2.0) * tmpvar_1505) + (tmpvar_1503 * 1.1)) + tmpvar_1500)
    ) * 2.8));
    tmpvar_1514.y = ((1.2637 + tmpvar_1503) + tmpvar_1500);
    vec2 xy_1515;
    xy_1515 = (tmpvar_1514 + tmpvar_1498);
    vec2 uv_1516;
    vec2 tmpvar_1517;
    tmpvar_1517 = floor(xy_1515);
    vec2 tmpvar_1518;
    tmpvar_1518 = (xy_1515 - tmpvar_1517);
    uv_1516 = ((tmpvar_1518 * tmpvar_1518) * (3.0 - (2.0 * tmpvar_1518)));
    float tmpvar_1519;
    tmpvar_1519 = fract((cos(
      dot (tmpvar_1517, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_1520;
    tmpvar_1520.x = (tmpvar_1517.x + 1.0);
    tmpvar_1520.y = tmpvar_1517.y;
    float tmpvar_1521;
    tmpvar_1521 = fract((cos(
      dot (tmpvar_1520, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_1522;
    tmpvar_1522.x = tmpvar_1517.x;
    tmpvar_1522.y = (tmpvar_1517.y + 1.0);
    float tmpvar_1523;
    tmpvar_1523 = fract((cos(
      dot (tmpvar_1522, vec2(21.9898, 78.233))
    ) * 43758.55));
    float tmpvar_1524;
    tmpvar_1524 = (((tmpvar_1519 + 
      ((tmpvar_1521 - tmpvar_1519) * uv_1516.x)
    ) + (
      (tmpvar_1523 - tmpvar_1519)
     * uv_1516.y)) + ((
      (((tmpvar_1519 - tmpvar_1521) - tmpvar_1523) + fract((cos(
        dot ((tmpvar_1517 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))
      ) * 43758.55)))
     * uv_1516.x) * uv_1516.y));
    n_1499 = (tmpvar_1505 * (tmpvar_1524 * tmpvar_1524));
    vec2 tmpvar_1525;
    tmpvar_1525.x = (((169.3358 + 
      (tmpvar_1500 * 8.225723)
    ) + tmpvar_1503) + (cos(
      ((((tmpvar_1498 * 2.2) * n_1499) + (tmpvar_1503 * 1.1)) + tmpvar_1500)
    ) * 1.1));
    tmpvar_1525.y = ((1.2637 + tmpvar_1503) + tmpvar_1500);
    vec2 xy_1526;
    xy_1526 = (tmpvar_1525 + tmpvar_1498);
    vec2 uv_1527;
    vec2 tmpvar_1528;
    tmpvar_1528 = floor(xy_1526);
    vec2 tmpvar_1529;
    tmpvar_1529 = (xy_1526 - tmpvar_1528);
    uv_1527 = ((tmpvar_1529 * tmpvar_1529) * (3.0 - (2.0 * tmpvar_1529)));
    float tmpvar_1530;
    tmpvar_1530 = fract((cos(
      dot (tmpvar_1528, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_1531;
    tmpvar_1531.x = (tmpvar_1528.x + 1.0);
    tmpvar_1531.y = tmpvar_1528.y;
    float tmpvar_1532;
    tmpvar_1532 = fract((cos(
      dot (tmpvar_1531, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_1533;
    tmpvar_1533.x = tmpvar_1528.x;
    tmpvar_1533.y = (tmpvar_1528.y + 1.0);
    float tmpvar_1534;
    tmpvar_1534 = fract((cos(
      dot (tmpvar_1533, vec2(21.9898, 78.233))
    ) * 43758.55));
    n_1499 = (n_1499 * pow ((
      ((tmpvar_1530 + ((tmpvar_1532 - tmpvar_1530) * uv_1527.x)) + ((tmpvar_1534 - tmpvar_1530) * uv_1527.y))
     + 
      ((((
        (tmpvar_1530 - tmpvar_1532)
       - tmpvar_1534) + fract(
        (cos(dot ((tmpvar_1528 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
      )) * uv_1527.x) * uv_1527.y)
    ), 3.0));
    vec2 tmpvar_1535;
    tmpvar_1535.x = (((155.4351 + 
      (tmpvar_1500 * 8.225723)
    ) + tmpvar_1503) + (cos(
      ((((tmpvar_1498 * 2.3) * n_1499) + (tmpvar_1503 * 1.1)) + tmpvar_1500)
    ) * 0.8));
    tmpvar_1535.y = ((1.2637 + tmpvar_1503) + tmpvar_1500);
    vec2 xy_1536;
    xy_1536 = (tmpvar_1535 + tmpvar_1498);
    vec2 uv_1537;
    vec2 tmpvar_1538;
    tmpvar_1538 = floor(xy_1536);
    vec2 tmpvar_1539;
    tmpvar_1539 = (xy_1536 - tmpvar_1538);
    uv_1537 = ((tmpvar_1539 * tmpvar_1539) * (3.0 - (2.0 * tmpvar_1539)));
    float tmpvar_1540;
    tmpvar_1540 = fract((cos(
      dot (tmpvar_1538, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_1541;
    tmpvar_1541.x = (tmpvar_1538.x + 1.0);
    tmpvar_1541.y = tmpvar_1538.y;
    float tmpvar_1542;
    tmpvar_1542 = fract((cos(
      dot (tmpvar_1541, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_1543;
    tmpvar_1543.x = tmpvar_1538.x;
    tmpvar_1543.y = (tmpvar_1538.y + 1.0);
    float tmpvar_1544;
    tmpvar_1544 = fract((cos(
      dot (tmpvar_1543, vec2(21.9898, 78.233))
    ) * 43758.55));
    n_1499 = (n_1499 * pow ((
      ((tmpvar_1540 + ((tmpvar_1542 - tmpvar_1540) * uv_1537.x)) + ((tmpvar_1544 - tmpvar_1540) * uv_1537.y))
     + 
      ((((
        (tmpvar_1540 - tmpvar_1542)
       - tmpvar_1544) + fract(
        (cos(dot ((tmpvar_1538 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
      )) * uv_1537.x) * uv_1537.y)
    ), 4.0));
    n_1499 = (n_1499 * pow (tmpvar_1498, 2.96));
    n_1499 = (n_1499 * ((
      (tmpvar_1500 + 3.14158)
     / 3.0) * (
      (6.283159 - tmpvar_1500)
     - 3.14158)));
    n_1499 = (n_1499 + (sqrt(
      (tmpvar_1498 * tmpvar_1498)
    ) * 0.26));
    float tmpvar_1545;
    tmpvar_1545 = (n_1499 * 2.1);
    c_1492 = ((tmpvar_1545 * tmpvar_1545) * 3.5);
    float tmpvar_1546;
    tmpvar_1546 = clamp (c_1492, 0.0, 1.0);
    c_1492 = tmpvar_1546;
    float tmpvar_1547;
    tmpvar_1547 = clamp (((
      sqrt(dot (tmpvar_1495, tmpvar_1495))
     - 0.5) / -0.16), 0.0, 1.0);
    tmpvar_1488 = ((min (
      max (tmpvar_1546, 0.0)
    , 1.0) * tmpvar_1497) * (tmpvar_1547 * (tmpvar_1547 * 
      (3.0 - (2.0 * tmpvar_1547))
    )));
  } else {
    tmpvar_1488 = vec4(0.0, 0.0, 0.0, 0.0);
  };
  buff_11 = (buff_11 + tmpvar_1488);
  vec4 tmpvar_1548;
  vec2 tmpvar_1549;
  tmpvar_1549 = ((tmpvar_2 - (starpos2 * zoom)) - shippos);
  vec2 x_1550;
  x_1550 = (tmpvar_1549 - (50000.0 * zoom));
  float tmpvar_1551;
  tmpvar_1551 = float((sqrt(
    dot (x_1550, x_1550)
  ) >= (100000.0 * zoom)));
  if (((1.0 - tmpvar_1551) > 0.0)) {
    vec4 fragColor_1552;
    float b_1553;
    float r_1554;
    vec2 p_1555;
    vec2 tmpvar_1556;
    tmpvar_1556 = vec2((100000.0 * zoom));
    vec2 tmpvar_1557;
    tmpvar_1557 = ((tmpvar_1549 / tmpvar_1556) - 0.5);
    p_1555 = ((tmpvar_1549 / tmpvar_1556.y) - 0.35);
    float tmpvar_1558;
    float tmpvar_1559;
    tmpvar_1559 = (min (abs(
      (p_1555.y / p_1555.x)
    ), 1.0) / max (abs(
      (p_1555.y / p_1555.x)
    ), 1.0));
    float tmpvar_1560;
    tmpvar_1560 = (tmpvar_1559 * tmpvar_1559);
    tmpvar_1560 = (((
      ((((
        ((((-0.01213232 * tmpvar_1560) + 0.05368138) * tmpvar_1560) - 0.1173503)
       * tmpvar_1560) + 0.1938925) * tmpvar_1560) - 0.3326756)
     * tmpvar_1560) + 0.9999793) * tmpvar_1559);
    tmpvar_1560 = (tmpvar_1560 + (float(
      (abs((p_1555.y / p_1555.x)) > 1.0)
    ) * (
      (tmpvar_1560 * -2.0)
     + 1.570796)));
    tmpvar_1558 = (tmpvar_1560 * sign((p_1555.y / p_1555.x)));
    if ((abs(p_1555.x) > (1e-08 * abs(p_1555.y)))) {
      if ((p_1555.x < 0.0)) {
        if ((p_1555.y >= 0.0)) {
          tmpvar_1558 += 3.141593;
        } else {
          tmpvar_1558 = (tmpvar_1558 - 3.141593);
        };
      };
    } else {
      tmpvar_1558 = (sign(p_1555.y) * 1.570796);
    };
    vec2 x_1561;
    x_1561 = (p_1555 / 2.0);
    float tmpvar_1562;
    tmpvar_1562 = (sqrt(dot (x_1561, x_1561)) + 0.0001);
    r_1554 = tmpvar_1562;
    float tmpvar_1563;
    tmpvar_1563 = (1.9 * sin((
      ((8.0 * tmpvar_1562) - time)
     - 
      (2.0 * tmpvar_1558)
    )));
    b_1553 = ((0.3125 / tmpvar_1562) + (cos(
      ((7.0 * tmpvar_1558) + (tmpvar_1563 * tmpvar_1563))
    ) / (100.0 * tmpvar_1562)));
    float tmpvar_1564;
    tmpvar_1564 = clamp ((b_1553 / 0.4), 0.0, 1.0);
    b_1553 = (b_1553 * (tmpvar_1564 * (tmpvar_1564 * 
      (3.0 - (2.0 * tmpvar_1564))
    )));
    vec4 tmpvar_1565;
    tmpvar_1565.w = 1.0;
    tmpvar_1565.x = (b_1553 * 0.3);
    tmpvar_1565.y = ((0.3 * b_1553) + (0.2 * sin(
      (tmpvar_1558 + time)
    )));
    tmpvar_1565.z = (b_1553 * 0.5);
    fragColor_1552 = tmpvar_1565;
    p_1555 = ((tmpvar_1549 / (100000.0 * zoom)) - 0.628);
    float tmpvar_1566;
    float tmpvar_1567;
    tmpvar_1567 = (min (abs(
      (p_1555.y / p_1555.x)
    ), 1.0) / max (abs(
      (p_1555.y / p_1555.x)
    ), 1.0));
    float tmpvar_1568;
    tmpvar_1568 = (tmpvar_1567 * tmpvar_1567);
    tmpvar_1568 = (((
      ((((
        ((((-0.01213232 * tmpvar_1568) + 0.05368138) * tmpvar_1568) - 0.1173503)
       * tmpvar_1568) + 0.1938925) * tmpvar_1568) - 0.3326756)
     * tmpvar_1568) + 0.9999793) * tmpvar_1567);
    tmpvar_1568 = (tmpvar_1568 + (float(
      (abs((p_1555.y / p_1555.x)) > 1.0)
    ) * (
      (tmpvar_1568 * -2.0)
     + 1.570796)));
    tmpvar_1566 = (tmpvar_1568 * sign((p_1555.y / p_1555.x)));
    if ((abs(p_1555.x) > (1e-08 * abs(p_1555.y)))) {
      if ((p_1555.x < 0.0)) {
        if ((p_1555.y >= 0.0)) {
          tmpvar_1566 += 3.141593;
        } else {
          tmpvar_1566 = (tmpvar_1566 - 3.141593);
        };
      };
    } else {
      tmpvar_1566 = (sign(p_1555.y) * 1.570796);
    };
    vec2 x_1569;
    x_1569 = (p_1555 / 2.0);
    r_1554 = (sqrt(dot (x_1569, x_1569)) + 0.0001);
    b_1553 = (1.9 * sin((
      ((8.0 * r_1554) + time)
     - 
      (2.0 * tmpvar_1566)
    )));
    b_1553 = ((0.3125 / r_1554) + (cos(
      ((7.0 * tmpvar_1566) + (b_1553 * b_1553))
    ) / (100.0 * r_1554)));
    float tmpvar_1570;
    tmpvar_1570 = clamp ((b_1553 / 0.4), 0.0, 1.0);
    b_1553 = (b_1553 * (tmpvar_1570 * (tmpvar_1570 * 
      (3.0 - (2.0 * tmpvar_1570))
    )));
    vec4 tmpvar_1571;
    tmpvar_1571.w = 1.0;
    tmpvar_1571.x = (b_1553 * 0.3);
    tmpvar_1571.y = ((0.3 * b_1553) + (0.2 * sin(
      (tmpvar_1566 + time)
    )));
    tmpvar_1571.z = (b_1553 * 0.5);
    fragColor_1552 = (tmpvar_1565 * tmpvar_1571);
    float tmpvar_1572;
    tmpvar_1572 = clamp (((
      sqrt(dot (tmpvar_1557, tmpvar_1557))
     - 0.8) / -0.3), 0.0, 1.0);
    fragColor_1552 = (fragColor_1552 * (tmpvar_1572 * (tmpvar_1572 * 
      (3.0 - (2.0 * tmpvar_1572))
    )));
    tmpvar_1548 = fragColor_1552;
  } else {
    tmpvar_1548 = vec4(0.0, 0.0, 0.0, 0.0);
  };
  buff_11 = (buff_11 + tmpvar_1548);
  vec4 tmpvar_1573;
  tmpvar_1573 = min (max (buff_11, 0.0), 1.0);
  buff_11 = tmpvar_1573;
  vec2 poss_1574;
  vec4 tmpvar_1575;
  vec2 pos_1576;
  poss_1574 = (tmpvar_2 - shippos);
  pos_1576 = poss_1574;
  if ((((
    (poss_1574.x > 0.0)
   && 
    (poss_1574.x < radius)
  ) && (poss_1574.y > 0.0)) && (poss_1574.y < radius))) {
    vec4 ancl_1577;
    vec2 ttpos_1578;
    vec4 cl_1579;
    vec3 result_1580;
    float b_1581;
    vec2 position_1582;
    vec3 color_1583;
    vec2 p_1584;
    vec4 tmpc_1585;
    float d_1586;
    vec4 cc_1587;
    vec2 uv_1588;
    float val_1589;
    float t_1590;
    float n_1591;
    pos_1576 = (((poss_1574 * 2.0) - vec2(radius)) / radius);
    mat2 tmpvar_1592;
    float tmpvar_1593;
    tmpvar_1593 = cos(angle);
    tmpvar_1592[0].x = tmpvar_1593;
    float tmpvar_1594;
    tmpvar_1594 = sin(angle);
    tmpvar_1592[0].y = -(tmpvar_1594);
    tmpvar_1592[1].x = tmpvar_1594;
    tmpvar_1592[1].y = tmpvar_1593;
    pos_1576 = (pos_1576 * tmpvar_1592);
    pos_1576.x = abs(pos_1576.x);
    mat2 tmpvar_1595;
    tmpvar_1595[0].x = 0.4084875;
    tmpvar_1595[0].y = -0.912764;
    tmpvar_1595[1].x = 0.912764;
    tmpvar_1595[1].y = 0.4084875;
    pos_1576 = (pos_1576 * tmpvar_1595);
    vec2 tmpvar_1596;
    tmpvar_1596.x = (0.7 * pos_1576.x);
    tmpvar_1596.y = (pos_1576.y - 0.5);
    float tmpvar_1597;
    float tmpvar_1598;
    tmpvar_1598 = (4.0 / radius);
    tmpvar_1597 = clamp (((0.5 - 
      sqrt(dot (tmpvar_1596, tmpvar_1596))
    ) / tmpvar_1598), 0.0, 1.0);
    vec2 x_1599;
    x_1599 = (pos_1576 - vec2(0.0, -0.8));
    float tmpvar_1600;
    tmpvar_1600 = clamp (((1.9 - 
      sqrt(dot (x_1599, x_1599))
    ) / tmpvar_1598), 0.0, 1.0);
    vec2 x_1601;
    x_1601 = (pos_1576 - vec2(0.0, -0.8));
    float tmpvar_1602;
    tmpvar_1602 = clamp (((1.28 - 
      sqrt(dot (x_1601, x_1601))
    ) / tmpvar_1598), 0.0, 1.0);
    vec2 x_1603;
    x_1603 = (pos_1576 - vec2(0.0, -0.8));
    float tmpvar_1604;
    tmpvar_1604 = clamp (((1.18 - 
      sqrt(dot (x_1603, x_1603))
    ) / tmpvar_1598), 0.0, 1.0);
    vec2 x_1605;
    x_1605 = (pos_1576 - vec2(0.0, -0.8));
    float tmpvar_1606;
    tmpvar_1606 = clamp (((1.14 - 
      sqrt(dot (x_1605, x_1605))
    ) / tmpvar_1598), 0.0, 1.0);
    float tmpvar_1607;
    tmpvar_1607 = clamp (((
      ((-(pos_1576.x) * 1.2) + pos_1576.y)
     - 0.2) / tmpvar_1598), 0.0, 1.0);
    float edge0_1608;
    edge0_1608 = ((pos_1576.y - 0.2) - 0.01);
    float tmpvar_1609;
    tmpvar_1609 = clamp (((0.15 - edge0_1608) / (
      ((pos_1576.y - 0.2) + 0.01)
     - edge0_1608)), 0.0, 1.0);
    float tmpvar_1610;
    tmpvar_1610 = clamp (((
      -(pos_1576.x)
     + 
      ((pos_1576.y + 0.97) / 4.5)
    ) / tmpvar_1598), 0.0, 1.0);
    float tmpvar_1611;
    tmpvar_1611 = clamp (((0.2 - pos_1576.y) / 0.01), 0.0, 1.0);
    n_1591 = (max ((
      ((((
        (tmpvar_1597 * (tmpvar_1597 * (3.0 - (2.0 * tmpvar_1597))))
       - 
        (tmpvar_1600 * (tmpvar_1600 * (3.0 - (2.0 * tmpvar_1600))))
      ) + (tmpvar_1602 * 
        (tmpvar_1602 * (3.0 - (2.0 * tmpvar_1602)))
      )) - (tmpvar_1604 * (tmpvar_1604 * 
        (3.0 - (2.0 * tmpvar_1604))
      ))) + (tmpvar_1606 * (tmpvar_1606 * (3.0 - 
        (2.0 * tmpvar_1606)
      ))))
     - 
      ((tmpvar_1607 * (tmpvar_1607 * (3.0 - 
        (2.0 * tmpvar_1607)
      ))) * (tmpvar_1609 * (tmpvar_1609 * (3.0 - 
        (2.0 * tmpvar_1609)
      ))))
    ), 0.0) + ((tmpvar_1610 * 
      (tmpvar_1610 * (3.0 - (2.0 * tmpvar_1610)))
    ) * (tmpvar_1611 * 
      (tmpvar_1611 * (3.0 - (2.0 * tmpvar_1611)))
    )));
    float tmpvar_1612;
    tmpvar_1612 = sign(min (n_1591, 1.0));
    n_1591 = tmpvar_1612;
    mat2 tmpvar_1613;
    tmpvar_1613[0].x = tmpvar_1593;
    tmpvar_1613[0].y = -(tmpvar_1594);
    tmpvar_1613[1].x = tmpvar_1594;
    tmpvar_1613[1].y = tmpvar_1593;
    vec2 x_1614;
    x_1614 = (10.0 * ((
      ((poss_1574 * 2.0) - vec2(radius))
     / radius) * tmpvar_1613));
    float md_1617;
    vec2 mr_1618;
    vec2 mg_1619;
    vec2 f_1620;
    vec2 n_1621;
    n_1621 = floor(x_1614);
    f_1620 = fract(x_1614);
    md_1617 = 8.0;
    for (int j_1616 = -1; j_1616 <= 1; j_1616++) {
      vec2 tmpvar_1622;
      tmpvar_1622.x = -1.0;
      tmpvar_1622.y = float(j_1616);
      vec2 tmpvar_1623;
      tmpvar_1623.x = dot ((n_1621 + tmpvar_1622), vec2(127.1, 311.7));
      tmpvar_1623.y = dot ((n_1621 + tmpvar_1622), vec2(269.5, 183.3));
      vec2 tmpvar_1624;
      tmpvar_1624 = ((tmpvar_1622 + (0.5 + 
        (0.5 * sin((iTime + (6.2831 * 
          fract((sin(tmpvar_1623) * 43758.55))
        ))))
      )) - f_1620);
      float tmpvar_1625;
      tmpvar_1625 = dot (tmpvar_1624, tmpvar_1624);
      if ((tmpvar_1625 < md_1617)) {
        md_1617 = tmpvar_1625;
        mr_1618 = tmpvar_1624;
        mg_1619 = tmpvar_1622;
      };
      vec2 tmpvar_1626;
      tmpvar_1626.x = 0.0;
      tmpvar_1626.y = float(j_1616);
      vec2 tmpvar_1627;
      tmpvar_1627.x = dot ((n_1621 + tmpvar_1626), vec2(127.1, 311.7));
      tmpvar_1627.y = dot ((n_1621 + tmpvar_1626), vec2(269.5, 183.3));
      vec2 tmpvar_1628;
      tmpvar_1628 = ((tmpvar_1626 + (0.5 + 
        (0.5 * sin((iTime + (6.2831 * 
          fract((sin(tmpvar_1627) * 43758.55))
        ))))
      )) - f_1620);
      float tmpvar_1629;
      tmpvar_1629 = dot (tmpvar_1628, tmpvar_1628);
      if ((tmpvar_1629 < md_1617)) {
        md_1617 = tmpvar_1629;
        mr_1618 = tmpvar_1628;
        mg_1619 = tmpvar_1626;
      };
      vec2 tmpvar_1630;
      tmpvar_1630.x = 1.0;
      tmpvar_1630.y = float(j_1616);
      vec2 tmpvar_1631;
      tmpvar_1631.x = dot ((n_1621 + tmpvar_1630), vec2(127.1, 311.7));
      tmpvar_1631.y = dot ((n_1621 + tmpvar_1630), vec2(269.5, 183.3));
      vec2 tmpvar_1632;
      tmpvar_1632 = ((tmpvar_1630 + (0.5 + 
        (0.5 * sin((iTime + (6.2831 * 
          fract((sin(tmpvar_1631) * 43758.55))
        ))))
      )) - f_1620);
      float tmpvar_1633;
      tmpvar_1633 = dot (tmpvar_1632, tmpvar_1632);
      if ((tmpvar_1633 < md_1617)) {
        md_1617 = tmpvar_1633;
        mr_1618 = tmpvar_1632;
        mg_1619 = tmpvar_1630;
      };
    };
    md_1617 = 8.0;
    for (int j_1615 = -2; j_1615 <= 2; j_1615++) {
      vec2 tmpvar_1634;
      tmpvar_1634.x = -2.0;
      tmpvar_1634.y = float(j_1615);
      vec2 tmpvar_1635;
      tmpvar_1635 = (mg_1619 + tmpvar_1634);
      vec2 tmpvar_1636;
      tmpvar_1636.x = dot ((n_1621 + tmpvar_1635), vec2(127.1, 311.7));
      tmpvar_1636.y = dot ((n_1621 + tmpvar_1635), vec2(269.5, 183.3));
      vec2 tmpvar_1637;
      tmpvar_1637 = ((tmpvar_1635 + (0.5 + 
        (0.5 * sin((iTime + (6.2831 * 
          fract((sin(tmpvar_1636) * 43758.55))
        ))))
      )) - f_1620);
      float tmpvar_1638;
      tmpvar_1638 = dot ((mr_1618 - tmpvar_1637), (mr_1618 - tmpvar_1637));
      if ((tmpvar_1638 > 1e-05)) {
        md_1617 = min (md_1617, dot ((0.5 * 
          (mr_1618 + tmpvar_1637)
        ), normalize(
          (tmpvar_1637 - mr_1618)
        )));
      };
      vec2 tmpvar_1639;
      tmpvar_1639.x = -1.0;
      tmpvar_1639.y = float(j_1615);
      vec2 tmpvar_1640;
      tmpvar_1640 = (mg_1619 + tmpvar_1639);
      vec2 tmpvar_1641;
      tmpvar_1641.x = dot ((n_1621 + tmpvar_1640), vec2(127.1, 311.7));
      tmpvar_1641.y = dot ((n_1621 + tmpvar_1640), vec2(269.5, 183.3));
      vec2 tmpvar_1642;
      tmpvar_1642 = ((tmpvar_1640 + (0.5 + 
        (0.5 * sin((iTime + (6.2831 * 
          fract((sin(tmpvar_1641) * 43758.55))
        ))))
      )) - f_1620);
      float tmpvar_1643;
      tmpvar_1643 = dot ((mr_1618 - tmpvar_1642), (mr_1618 - tmpvar_1642));
      if ((tmpvar_1643 > 1e-05)) {
        md_1617 = min (md_1617, dot ((0.5 * 
          (mr_1618 + tmpvar_1642)
        ), normalize(
          (tmpvar_1642 - mr_1618)
        )));
      };
      vec2 tmpvar_1644;
      tmpvar_1644.x = 0.0;
      tmpvar_1644.y = float(j_1615);
      vec2 tmpvar_1645;
      tmpvar_1645 = (mg_1619 + tmpvar_1644);
      vec2 tmpvar_1646;
      tmpvar_1646.x = dot ((n_1621 + tmpvar_1645), vec2(127.1, 311.7));
      tmpvar_1646.y = dot ((n_1621 + tmpvar_1645), vec2(269.5, 183.3));
      vec2 tmpvar_1647;
      tmpvar_1647 = ((tmpvar_1645 + (0.5 + 
        (0.5 * sin((iTime + (6.2831 * 
          fract((sin(tmpvar_1646) * 43758.55))
        ))))
      )) - f_1620);
      float tmpvar_1648;
      tmpvar_1648 = dot ((mr_1618 - tmpvar_1647), (mr_1618 - tmpvar_1647));
      if ((tmpvar_1648 > 1e-05)) {
        md_1617 = min (md_1617, dot ((0.5 * 
          (mr_1618 + tmpvar_1647)
        ), normalize(
          (tmpvar_1647 - mr_1618)
        )));
      };
      vec2 tmpvar_1649;
      tmpvar_1649.x = 1.0;
      tmpvar_1649.y = float(j_1615);
      vec2 tmpvar_1650;
      tmpvar_1650 = (mg_1619 + tmpvar_1649);
      vec2 tmpvar_1651;
      tmpvar_1651.x = dot ((n_1621 + tmpvar_1650), vec2(127.1, 311.7));
      tmpvar_1651.y = dot ((n_1621 + tmpvar_1650), vec2(269.5, 183.3));
      vec2 tmpvar_1652;
      tmpvar_1652 = ((tmpvar_1650 + (0.5 + 
        (0.5 * sin((iTime + (6.2831 * 
          fract((sin(tmpvar_1651) * 43758.55))
        ))))
      )) - f_1620);
      float tmpvar_1653;
      tmpvar_1653 = dot ((mr_1618 - tmpvar_1652), (mr_1618 - tmpvar_1652));
      if ((tmpvar_1653 > 1e-05)) {
        md_1617 = min (md_1617, dot ((0.5 * 
          (mr_1618 + tmpvar_1652)
        ), normalize(
          (tmpvar_1652 - mr_1618)
        )));
      };
      vec2 tmpvar_1654;
      tmpvar_1654.x = 2.0;
      tmpvar_1654.y = float(j_1615);
      vec2 tmpvar_1655;
      tmpvar_1655 = (mg_1619 + tmpvar_1654);
      vec2 tmpvar_1656;
      tmpvar_1656.x = dot ((n_1621 + tmpvar_1655), vec2(127.1, 311.7));
      tmpvar_1656.y = dot ((n_1621 + tmpvar_1655), vec2(269.5, 183.3));
      vec2 tmpvar_1657;
      tmpvar_1657 = ((tmpvar_1655 + (0.5 + 
        (0.5 * sin((iTime + (6.2831 * 
          fract((sin(tmpvar_1656) * 43758.55))
        ))))
      )) - f_1620);
      float tmpvar_1658;
      tmpvar_1658 = dot ((mr_1618 - tmpvar_1657), (mr_1618 - tmpvar_1657));
      if ((tmpvar_1658 > 1e-05)) {
        md_1617 = min (md_1617, dot ((0.5 * 
          (mr_1618 + tmpvar_1657)
        ), normalize(
          (tmpvar_1657 - mr_1618)
        )));
      };
    };
    t_1590 = time;
    vec2 tmpvar_1659;
    tmpvar_1659.x = (0.67 * pos_1576.x);
    tmpvar_1659.y = (pos_1576.y - 0.05);
    float tmpvar_1660;
    tmpvar_1660 = (sqrt(dot (tmpvar_1659, tmpvar_1659)) * 1.9);
    val_1589 = (tmpvar_1612 + ((2.0 * md_1617) * (0.5 + 
      (0.5 * sin((64.0 * md_1617)))
    )));
    float tmpvar_1661;
    tmpvar_1661 = (0.02 / (0.015 + abs(
      (tmpvar_1660 - 1.0)
    )));
    float tmpvar_1662;
    if (shua) {
      tmpvar_1662 = 1.0;
    } else {
      tmpvar_1662 = 0.0;
    };
    float tmpvar_1663;
    if (shua) {
      tmpvar_1663 = 1.0;
    } else {
      tmpvar_1663 = 0.0;
    };
    float tmpvar_1664;
    if (shua) {
      tmpvar_1664 = 1.0;
    } else {
      tmpvar_1664 = 0.0;
    };
    vec4 tmpvar_1665;
    tmpvar_1665.w = 1.0;
    tmpvar_1665.x = ((0.3 + (2.0 * tmpvar_1662)) + (3.35 * exbff_8.x));
    tmpvar_1665.y = ((0.7 - (0.5 * exbff_8.y)) - (0.3 * tmpvar_1663));
    tmpvar_1665.z = ((1.0 - (0.8 * tmpvar_1664)) - (0.9 * exbff_8.z));
    float tmpvar_1666;
    tmpvar_1666 = clamp (((tmpvar_1660 - 1.0) / -0.15), 0.0, 1.0);
    float tmpvar_1667;
    tmpvar_1667 = clamp (((tmpvar_1660 - 1.0) / -0.15), 0.0, 1.0);
    vec4 tmpvar_1668;
    tmpvar_1668.xyw = vec3(0.0, 0.0, 1.0);
    tmpvar_1668.z = (((0.8 * txeb_6.x) * (1.0 - 
      (min (1.0, float((1.0 >= tmpvar_1660))) * val_1589)
    )) * (1.0 - min (1.0, 
      (tmpvar_1667 * (tmpvar_1667 * (3.0 - (2.0 * tmpvar_1667))))
    )));
    vec4 tmpvar_1669;
    tmpvar_1669 = ((tmpvar_1665 - (
      ((0.8 * txeb_6) * (1.0 - (min (1.0, 
        float((1.0 >= tmpvar_1660))
      ) * val_1589)))
     * 
      (1.0 - min (1.0, (tmpvar_1666 * (tmpvar_1666 * 
        (3.0 - (2.0 * tmpvar_1666))
      ))))
    )) + tmpvar_1668);
    float tmpvar_1670;
    if (shua) {
      tmpvar_1670 = 1.0;
    } else {
      tmpvar_1670 = 0.0;
    };
    float tmpvar_1671;
    if (shua) {
      tmpvar_1671 = 1.0;
    } else {
      tmpvar_1671 = 0.0;
    };
    float tmpvar_1672;
    if (shua) {
      tmpvar_1672 = 1.0;
    } else {
      tmpvar_1672 = 0.0;
    };
    vec4 tmpvar_1673;
    tmpvar_1673.w = 1.0;
    tmpvar_1673.x = ((0.3 - (0.535 * exbff_8.x)) + (0.5 * tmpvar_1670));
    tmpvar_1673.y = ((0.7 - (1.875 * exbff_8.y)) - (0.3 * tmpvar_1671));
    tmpvar_1673.z = ((1.0 - (2.25 * exbff_8.z)) - (0.8 * tmpvar_1672));
    float tmpvar_1674;
    tmpvar_1674 = clamp (((tmpvar_1660 - 1.1) / -0.1), 0.0, 1.0);
    vec4 tmpvar_1675;
    tmpvar_1675 = (tmpvar_1673 + ((txeb_6 * 
      (1.0 - (min (1.0, float(
        (1.0 >= tmpvar_1660)
      )) * val_1589))
    ) * (1.0 - 
      min (1.0, (tmpvar_1674 * (tmpvar_1674 * (3.0 - 
        (2.0 * tmpvar_1674)
      ))))
    )));
    mat2 tmpvar_1676;
    float tmpvar_1677;
    tmpvar_1677 = cos(angle);
    tmpvar_1676[0].x = tmpvar_1677;
    float tmpvar_1678;
    tmpvar_1678 = sin(angle);
    tmpvar_1676[0].y = -(tmpvar_1678);
    tmpvar_1676[1].x = tmpvar_1678;
    tmpvar_1676[1].y = tmpvar_1677;
    float tmpvar_1679;
    tmpvar_1679 = (radius / 2.0);
    uv_1588 = (((poss_1574 / tmpvar_1679) - 1.0) * tmpvar_1676);
    uv_1588.x = abs(uv_1588.x);
    cc_1587.w = 1.0;
    d_1586 = (sqrt(dot (uv_1588, uv_1588)) - time);
    cc_1587.x = (abs((float(mod (
      (uv_1588.y - ((uv_1588.x * 2.0) * d_1586))
    , 
      (uv_1588.x * 1.1)
    )))) / 2.5);
    cc_1587.y = (abs((float(mod (
      (uv_1588.y - ((uv_1588.x * 2.0) * d_1586))
    , 
      (uv_1588.x * 1.1)
    )))) / 2.5);
    cc_1587.z = (abs((float(mod (
      (uv_1588.y - ((uv_1588.x * 2.0) * d_1586))
    , 
      (uv_1588.x * 1.1)
    )))) * 2.0);
    uv_1588 = ((poss_1574 / tmpvar_1679) - 1.0);
    mat2 tmpvar_1680;
    tmpvar_1680[0].x = tmpvar_1677;
    tmpvar_1680[0].y = -(tmpvar_1678);
    tmpvar_1680[1].x = tmpvar_1678;
    tmpvar_1680[1].y = tmpvar_1677;
    mat2 tmpvar_1681;
    tmpvar_1681[0].x = 6.5128e-06;
    tmpvar_1681[0].y = 1.0;
    tmpvar_1681[1].x = -1.0;
    tmpvar_1681[1].y = 6.5128e-06;
    uv_1588 = (uv_1588 * (tmpvar_1680 * tmpvar_1681));
    vec2 tmpvar_1682;
    tmpvar_1682 = (15.0 * uv_1588);
    p_1584 = tmpvar_1682;
    t_1590 = (time * 10.0);
    color_1583.xy = vec2(0.0, 0.0);
    float tmpvar_1683;
    tmpvar_1683 = sqrt(dot (tmpvar_1682, tmpvar_1682));
    vec2 tmpvar_1684;
    tmpvar_1684 = (tmpvar_1682 * 10.0);
    vec2 tmpvar_1685;
    tmpvar_1685 = (0.2 * tmpvar_1684);
    float tmpvar_1686;
    tmpvar_1686 = (1.0/(cos(tmpvar_1682.y)));
    color_1583.z = clamp (1.0, 0.0, ((5.0 * 
      sin(((tmpvar_1684.x * tmpvar_1686) + t_1590))
    ) - 2.0));
    color_1583.z = (color_1583.z + clamp (1.0, 0.0, (
      (3.0 * sin(((
        (0.9 * tmpvar_1684.x)
       * tmpvar_1686) + (t_1590 * 0.6))))
     - 2.5)));
    vec2 x_1687;
    x_1687 = ((tmpvar_1682 * sin(tmpvar_1685.x)) * sin((
      (0.4 * t_1590)
     - tmpvar_1685.y)));
    color_1583 = (color_1583 * ((6.0 * 
      (clamp (1.0, 0.0, (ceil(
        (1.0 - clamp (1.0, 0.0, tmpvar_1683))
      ) * sqrt(
        dot (x_1687, x_1687)
      ))) + (-1.4 + (sin(
        (tmpvar_1682.y + (t_1590 * 0.2))
      ) * 2.0)))
    ) * (1.0 - tmpvar_1683)));
    vec3 tmpvar_1688;
    tmpvar_1688.x = (color_1583.z * 0.6);
    tmpvar_1688.y = (color_1583.z * 0.7);
    tmpvar_1688.z = (color_1583.z * 3.0);
    color_1583 = (tmpvar_1688 * (1.0 - clamp (1.0, 0.0, 
      sqrt(dot (tmpvar_1682, tmpvar_1682))
    )));
    color_1583 = ((color_1583 + sqrt(
      dot (tmpvar_1682, tmpvar_1682)
    )) * color_1583.x);
    vec3 tmpvar_1689;
    tmpvar_1689 = clamp (vec3(1.0, 1.0, 1.0), vec3(0.0, 0.0, 0.0), color_1583);
    color_1583 = tmpvar_1689;
    vec4 tmpvar_1690;
    tmpvar_1690.w = 1.0;
    tmpvar_1690.xyz = tmpvar_1689;
    tmpc_1585 = (cc_1587 + tmpvar_1690);
    mat2 tmpvar_1691;
    tmpvar_1691[0].x = tmpvar_1677;
    tmpvar_1691[0].y = -(tmpvar_1678);
    tmpvar_1691[1].x = tmpvar_1678;
    tmpvar_1691[1].y = tmpvar_1677;
    position_1582 = (((poss_1574 / tmpvar_1679) - 1.0) * tmpvar_1691);
    position_1582.y = (position_1582.y - 0.55);
    position_1582 = (position_1582 - (position_1582 * 0.5));
    vec3 tmpvar_1692;
    tmpvar_1692.y = 0.05;
    float tmpvar_1693;
    tmpvar_1693 = (animlamp - 1.5);
    tmpvar_1692.x = (tmpvar_1693 / 4.5);
    tmpvar_1692.z = (0.05 + (0.35 * (1.0 - 
      (tmpvar_1693 / 4.5)
    )));
    float tmpvar_1694;
    tmpvar_1694 = (animlamp / 2.0);
    b_1581 = (cos((
      ((12.56632 * animlamp) * position_1582.x)
     - 
      (tmpvar_1694 * animlcounter)
    )) / 8.0);
    b_1581 = (b_1581 + (cos(
      (((50.26527 * animlamp) * position_1582.x) - (tmpvar_1694 * animlcounter))
    ) / 32.0));
    b_1581 = ((0.15 + (0.2 * b_1581)) * (0.1 / abs(
      (position_1582.y - (0.045 * b_1581))
    )));
    result_1580 = (max ((b_1581 * tmpvar_1692), 0.4) - 0.4);
    cl_1579 = vec4(0.0, 0.0, 0.0, 1.0);
    ttpos_1578 = vec2(0.0, 0.0);
    if ((lpower < 20.0)) {
      vec2 q_1695;
      float tmpvar_1696;
      tmpvar_1696 = (radius / 2.0);
      vec2 tmpvar_1697;
      tmpvar_1697 = (poss_1574 - vec2(tmpvar_1696));
      ttpos_1578.x = tmpvar_1697.x;
      vec2 tmpvar_1698;
      tmpvar_1698 = ((poss_1574 - (250.0 * zoom)) / radius);
      vec2 tmpvar_1699;
      tmpvar_1699 = ((lhitpos * zoom) / radius);
      float tmpvar_1700;
      tmpvar_1700 = (radius / 500.0);
      ttpos_1578.y = (tmpvar_1697.y - (20.0 * (tmpvar_1700 / zoom)));
      mat2 tmpvar_1701;
      float tmpvar_1702;
      tmpvar_1702 = cos(angle);
      tmpvar_1701[0].x = tmpvar_1702;
      float tmpvar_1703;
      tmpvar_1703 = sin(angle);
      tmpvar_1701[0].y = -(tmpvar_1703);
      tmpvar_1701[1].x = tmpvar_1703;
      tmpvar_1701[1].y = tmpvar_1702;
      ttpos_1578 = (ttpos_1578 * (tmpvar_1701 * 2.0));
      mat2 tmpvar_1704;
      tmpvar_1704[0].x = tmpvar_1702;
      tmpvar_1704[0].y = -(tmpvar_1703);
      tmpvar_1704[1].x = tmpvar_1703;
      tmpvar_1704[1].y = tmpvar_1702;
      q_1695 = (((poss_1574 - vec2(tmpvar_1696)) / (50.0 * tmpvar_1700)) * tmpvar_1704);
      q_1695.y = (q_1695.y - 2.75);
      q_1695.y = (q_1695.y / (tmpvar_1700 / zoom));
      q_1695.x = abs(q_1695.x);
      p_1584 = (15.0 * q_1695);
      vec3 tmpvar_1705;
      tmpvar_1705.x = (0.1 * max (0.0, p_1584.y));
      tmpvar_1705.y = ((float(
        (ttpos_1578.y >= 0.0)
      ) * 0.05) * max (0.0, p_1584.x));
      tmpvar_1705.z = ((float(
        (ttpos_1578.y >= 0.0)
      ) * 0.5) * max (0.0, p_1584.x));
      vec2 x_1706;
      x_1706 = (q_1695 * (q_1695.x * 15.1));
      vec4 tmpvar_1707;
      tmpvar_1707.w = 1.0;
      tmpvar_1707.xyz = (tmpvar_1705 / abs((
        (((8.0 * p_1584.x) * sqrt(dot (q_1695, q_1695))) + cos(((
          -(time)
         * 15.0) + p_1584.y)))
       * 
        sqrt(dot (x_1706, x_1706))
      )));
      float tmpvar_1708;
      tmpvar_1708 = sqrt(dot (tmpvar_1699, tmpvar_1699));
      float tmpvar_1709;
      if (wwh) {
        tmpvar_1709 = 0.0;
      } else {
        tmpvar_1709 = 1.0;
      };
      float tmpvar_1710;
      tmpvar_1710 = sqrt(dot (tmpvar_1699, tmpvar_1699));
      float tmpvar_1711;
      if (wwh) {
        tmpvar_1711 = 0.0;
      } else {
        tmpvar_1711 = 1.0;
      };
      float tmpvar_1712;
      float tmpvar_1713;
      tmpvar_1713 = clamp ((sqrt(
        dot (tmpvar_1699, tmpvar_1699)
      ) / 5.0), 0.0, 1.0);
      tmpvar_1712 = (tmpvar_1713 * (tmpvar_1713 * (3.0 - 
        (2.0 * tmpvar_1713)
      )));
      float tmpvar_1714;
      if (wwh) {
        tmpvar_1714 = 0.0;
      } else {
        tmpvar_1714 = 1.0;
      };
      float edge0_1715;
      edge0_1715 = ((tmpvar_1708 + 0.05) + (0.2 * tmpvar_1709));
      float tmpvar_1716;
      tmpvar_1716 = clamp (((
        sqrt(dot (tmpvar_1698, tmpvar_1698))
       - edge0_1715) / (
        ((tmpvar_1710 + (0.15 * tmpvar_1711)) - ((2.55 * tmpvar_1712) * tmpvar_1714))
       - edge0_1715)), 0.0, 1.0);
      cl_1579 = ((tmpvar_1707 * (1.0 - tmpvar_1689.x)) * (tmpvar_1716 * (tmpvar_1716 * 
        (3.0 - (2.0 * tmpvar_1716))
      )));
    };
    ancl_1577 = vec4(0.0, 0.0, 0.0, 0.0);
    if ((bulletanimtimer > 0.0)) {
      vec3 V_1717;
      uv_1588 = ((poss_1574 / (radius / 2.0)) - 1.0);
      mat2 tmpvar_1718;
      float tmpvar_1719;
      tmpvar_1719 = cos(angle);
      tmpvar_1718[0].x = tmpvar_1719;
      float tmpvar_1720;
      tmpvar_1720 = sin(angle);
      tmpvar_1718[0].y = -(tmpvar_1720);
      tmpvar_1718[1].x = tmpvar_1720;
      tmpvar_1718[1].y = tmpvar_1719;
      uv_1588 = (uv_1588 * tmpvar_1718);
      uv_1588 = (uv_1588 - vec2(0.0, 0.55));
      uv_1588 = (uv_1588 - (uv_1588 * 0.5));
      uv_1588.y = (uv_1588.y * 20.5);
      uv_1588.x = (uv_1588.x * 5.5);
      uv_1588 = (uv_1588 + (sin(
        (((uv_1588.x * 10.0) * (uv_1588.y * 1.11)) + (time * 2.0))
      ) * 0.15));
      vec3 tmpvar_1721;
      tmpvar_1721.yz = vec2(1.0, 2.0);
      tmpvar_1721.x = ((uv_1588.x * 0.1) + (bulletanimtimer * 0.725));
      V_1717.z = (2.0 * clamp ((
        abs(((vec3(mod ((
          (tmpvar_1721.x * 6.0)
         + vec3(0.0, 0.0, 2.0)), 6.0))) - 2.0))
       - 1.0), 0.0, 0.5)).z;
      V_1717 = (V_1717 * clamp ((
        (0.7 - abs(uv_1588.y))
       * 3.0), 0.0, 1.0));
      V_1717 = (V_1717 * (1.0 - (
        sin(((uv_1588.y * uv_1588.y) * 30.0))
       * 0.26)));
      vec4 tmpvar_1722;
      tmpvar_1722.w = 1.0;
      tmpvar_1722.xyz = V_1717;
      ancl_1577 = tmpvar_1722;
    };
    vec2 tmpvar_1723;
    tmpvar_1723.x = (0.67 * pos_1576.x);
    tmpvar_1723.y = (pos_1576.y + 0.05);
    float tmpvar_1724;
    tmpvar_1724 = (sqrt(dot (tmpvar_1723, tmpvar_1723)) * 1.9);
    vec4 tmpvar_1725;
    tmpvar_1725.w = 1.0;
    tmpvar_1725.xyz = result_1580;
    vec4 tmpvar_1726;
    tmpvar_1726.w = 1.0;
    tmpvar_1726.xyz = result_1580;
    float tmpvar_1727;
    tmpvar_1727 = clamp (((tmpvar_1660 - 1.4) / -0.3), 0.0, 1.0);
    tmpvar_1575 = (((
      ((mix ((
        ((min (1.0, (
          float((1.0 >= tmpvar_1660))
         * val_1589)) * tmpvar_1669) + (tmpvar_1726 * float((1.0 >= tmpvar_1724))))
       + 
        (ancl_1577 * float((1.0 >= tmpvar_1724)))
      ), (
        (tmpc_1585 + (tmpvar_1725 * 0.3))
       * tmpvar_1612), val_1589) + (tmpvar_1661 * tmpvar_1675)) + (((
        (cl_1579 * ttpos_1578.y)
       / lpower) * (20.0 - lpower)) / lpower))
     + 
      (((1.0 - (
        min (1.0, float((1.0 >= tmpvar_1660)))
       * val_1589)) * min (1.0, float(
        (1.0 >= tmpvar_1660)
      ))) * mcol_10)
    ) + (
      (1.0 - min (1.0, float((1.0 >= tmpvar_1660))))
     * tmpvar_1573)) + ((
      (0.3 * txeb_6)
     * 
      (1.0 - (min (1.0, float(
        (1.0 >= tmpvar_1660)
      )) * val_1589))
    ) * (1.0 - 
      min (1.0, (tmpvar_1727 * (tmpvar_1727 * (3.0 - 
        (2.0 * tmpvar_1727)
      ))))
    )));
  } else {
    pos_1576 = (((pos_1576 * 2.0) - vec2(radius)) / radius);
    mat2 tmpvar_1728;
    float tmpvar_1729;
    tmpvar_1729 = cos(angle);
    tmpvar_1728[0].x = tmpvar_1729;
    float tmpvar_1730;
    tmpvar_1730 = sin(angle);
    tmpvar_1728[0].y = -(tmpvar_1730);
    tmpvar_1728[1].x = tmpvar_1730;
    tmpvar_1728[1].y = tmpvar_1729;
    pos_1576 = (pos_1576 * tmpvar_1728);
    pos_1576.x = abs(pos_1576.x);
    mat2 tmpvar_1731;
    tmpvar_1731[0].x = 0.4084875;
    tmpvar_1731[0].y = -0.912764;
    tmpvar_1731[1].x = 0.912764;
    tmpvar_1731[1].y = 0.4084875;
    pos_1576 = (pos_1576 * tmpvar_1731);
    vec2 tmpvar_1732;
    tmpvar_1732.x = (0.67 * pos_1576.x);
    tmpvar_1732.y = (pos_1576.y - 0.05);
    float tmpvar_1733;
    tmpvar_1733 = (0.02 / (0.015 + abs(
      ((sqrt(dot (tmpvar_1732, tmpvar_1732)) * 1.9) - 1.0)
    )));
    float tmpvar_1734;
    if (shua) {
      tmpvar_1734 = 1.0;
    } else {
      tmpvar_1734 = 0.0;
    };
    float tmpvar_1735;
    if (shua) {
      tmpvar_1735 = 1.0;
    } else {
      tmpvar_1735 = 0.0;
    };
    float tmpvar_1736;
    if (shua) {
      tmpvar_1736 = 1.0;
    } else {
      tmpvar_1736 = 0.0;
    };
    vec4 tmpvar_1737;
    tmpvar_1737.w = 1.0;
    tmpvar_1737.x = ((0.3 - (0.535 * exbff_8.x)) + (0.5 * tmpvar_1734));
    tmpvar_1737.y = ((0.7 - (1.875 * exbff_8.y)) - (0.3 * tmpvar_1735));
    tmpvar_1737.z = ((1.0 - (2.25 * exbff_8.z)) - (0.8 * tmpvar_1736));
    vec4 tmpvar_1738;
    tmpvar_1738 = (tmpvar_1737 + txeb_6);
    if ((lpower < 20.0)) {
      vec2 ttpos_1739;
      vec2 q_1740;
      float tmpvar_1741;
      tmpvar_1741 = (radius / 2.0);
      vec2 tmpvar_1742;
      tmpvar_1742 = (poss_1574 - vec2(tmpvar_1741));
      ttpos_1739.x = tmpvar_1742.x;
      vec2 tmpvar_1743;
      tmpvar_1743 = ((poss_1574 - (250.0 * zoom)) / radius);
      vec2 tmpvar_1744;
      tmpvar_1744 = ((lhitpos * zoom) / radius);
      float tmpvar_1745;
      tmpvar_1745 = (radius / 500.0);
      ttpos_1739.y = (tmpvar_1742.y - (20.0 * (tmpvar_1745 / zoom)));
      mat2 tmpvar_1746;
      float tmpvar_1747;
      tmpvar_1747 = cos(angle);
      tmpvar_1746[0].x = tmpvar_1747;
      float tmpvar_1748;
      tmpvar_1748 = sin(angle);
      tmpvar_1746[0].y = -(tmpvar_1748);
      tmpvar_1746[1].x = tmpvar_1748;
      tmpvar_1746[1].y = tmpvar_1747;
      ttpos_1739 = (ttpos_1739 * (tmpvar_1746 * 2.0));
      mat2 tmpvar_1749;
      tmpvar_1749[0].x = tmpvar_1747;
      tmpvar_1749[0].y = -(tmpvar_1748);
      tmpvar_1749[1].x = tmpvar_1748;
      tmpvar_1749[1].y = tmpvar_1747;
      q_1740 = (((poss_1574 - vec2(tmpvar_1741)) / (50.0 * tmpvar_1745)) * tmpvar_1749);
      q_1740.y = (q_1740.y - 2.75);
      q_1740.y = (q_1740.y / (tmpvar_1745 / zoom));
      q_1740.x = abs(q_1740.x);
      vec2 tmpvar_1750;
      tmpvar_1750 = (15.0 * q_1740);
      vec3 tmpvar_1751;
      tmpvar_1751.x = (0.1 * max (0.0, tmpvar_1750.y));
      tmpvar_1751.y = ((float(
        (ttpos_1739.y >= 0.0)
      ) * 0.05) * max (0.0, tmpvar_1750.x));
      tmpvar_1751.z = ((float(
        (ttpos_1739.y >= 0.0)
      ) * 0.5) * max (0.0, tmpvar_1750.x));
      vec2 x_1752;
      x_1752 = (q_1740 * (q_1740.x * 15.1));
      vec4 tmpvar_1753;
      tmpvar_1753.w = 1.0;
      tmpvar_1753.xyz = (tmpvar_1751 / abs((
        (((8.0 * tmpvar_1750.x) * sqrt(dot (q_1740, q_1740))) + cos(((
          -(time)
         * 15.0) + tmpvar_1750.y)))
       * 
        sqrt(dot (x_1752, x_1752))
      )));
      float tmpvar_1754;
      tmpvar_1754 = sqrt(dot (tmpvar_1744, tmpvar_1744));
      float tmpvar_1755;
      if (wwh) {
        tmpvar_1755 = 0.0;
      } else {
        tmpvar_1755 = 1.0;
      };
      float tmpvar_1756;
      tmpvar_1756 = sqrt(dot (tmpvar_1744, tmpvar_1744));
      float tmpvar_1757;
      if (wwh) {
        tmpvar_1757 = 0.0;
      } else {
        tmpvar_1757 = 1.0;
      };
      float tmpvar_1758;
      float tmpvar_1759;
      tmpvar_1759 = clamp ((sqrt(
        dot (tmpvar_1744, tmpvar_1744)
      ) / 5.0), 0.0, 1.0);
      tmpvar_1758 = (tmpvar_1759 * (tmpvar_1759 * (3.0 - 
        (2.0 * tmpvar_1759)
      )));
      float tmpvar_1760;
      if (wwh) {
        tmpvar_1760 = 0.0;
      } else {
        tmpvar_1760 = 1.0;
      };
      float edge0_1761;
      edge0_1761 = ((tmpvar_1754 + 0.05) + (0.2 * tmpvar_1755));
      float tmpvar_1762;
      tmpvar_1762 = clamp (((
        sqrt(dot (tmpvar_1743, tmpvar_1743))
       - edge0_1761) / (
        ((tmpvar_1756 + (0.15 * tmpvar_1757)) - ((2.55 * tmpvar_1758) * tmpvar_1760))
       - edge0_1761)), 0.0, 1.0);
      tmpvar_1575 = (((
        (tmpvar_1733 * tmpvar_1738)
       + tmpvar_1573) + (
        ((((tmpvar_1753 * 
          (tmpvar_1762 * (tmpvar_1762 * (3.0 - (2.0 * tmpvar_1762))))
        ) * ttpos_1739.y) / lpower) * (20.0 - lpower))
       / lpower)) + (0.3 * txeb_6));
    } else {
      tmpvar_1575 = (((tmpvar_1733 * tmpvar_1738) + tmpvar_1573) + (0.3 * txeb_6));
    };
  };
  buff_11 = tmpvar_1575;
  for(int i_4=0;i_4<50;i_4++) {
    if ((i_4 >= 50)) {
      break;
    };
    if ((i_4 >= bulletcounter)) {
      break;
    };
    if (bulletexpl[i_4]) {
      vec2 tmpvar_1763;
      tmpvar_1763.x = bulletposx[i_4];
      tmpvar_1763.y = bulletposy[i_4];
      vec2 pos_1764;
      float tshift_1765;
      tshift_1765 = bullettimer[i_4];
      float period_1766;
      period_1766 = bulletexplctrl[i_4];
      vec4 tmpvar_1767;
      pos_1764 = ((fragCoord_3 - (tmpvar_1763 * zoom)) - shippos);
      if ((((
        (pos_1764.x > 0.0)
       && 
        (pos_1764.x < (35.0 * zoom))
      ) && (pos_1764.y > 0.0)) && (pos_1764.y < (35.0 * zoom)))) {
        vec2 uv_1768;
        uv_1768 = ((pos_1764 / 17.5) / zoom);
        float tmpvar_1769;
        tmpvar_1769 = (tshift_1765 * 3.5);
        float tmpvar_1770;
        tmpvar_1770 = (tmpvar_1769 + 2.8);
        float tmpvar_1771;
        tmpvar_1771 = (4.6 + (tshift_1765 / 0.5));
        float tmpvar_1772;
        tmpvar_1772 = clamp (((period_1766 - 10.0) / 28.0), 0.0, 1.0);
        float tmpvar_1773;
        tmpvar_1773 = clamp (((period_1766 - 10.0) / 28.0), 0.0, 1.0);
        vec3 tmpvar_1774;
        tmpvar_1774.y = 1.0;
        tmpvar_1774.x = (4.0 - (4.0 * (tmpvar_1772 * 
          (tmpvar_1772 * (3.0 - (2.0 * tmpvar_1772)))
        )));
        tmpvar_1774.z = (1.0 + (4.0 * (tmpvar_1773 * 
          (tmpvar_1773 * (3.0 - (2.0 * tmpvar_1773)))
        )));
        vec2 tmpvar_1775;
        tmpvar_1775 = (uv_1768 - 1.0);
        float tmpvar_1776;
        tmpvar_1776 = sqrt(dot (tmpvar_1775, tmpvar_1775));
        float vec_y_1777;
        vec_y_1777 = (tmpvar_1775.x + cos(tmpvar_1771));
        float vec_x_1778;
        vec_x_1778 = (tmpvar_1775.y + sin(tmpvar_1771));
        float tmpvar_1779;
        float tmpvar_1780;
        tmpvar_1780 = (min (abs(
          (vec_y_1777 / vec_x_1778)
        ), 1.0) / max (abs(
          (vec_y_1777 / vec_x_1778)
        ), 1.0));
        float tmpvar_1781;
        tmpvar_1781 = (tmpvar_1780 * tmpvar_1780);
        tmpvar_1781 = (((
          ((((
            ((((-0.01213232 * tmpvar_1781) + 0.05368138) * tmpvar_1781) - 0.1173503)
           * tmpvar_1781) + 0.1938925) * tmpvar_1781) - 0.3326756)
         * tmpvar_1781) + 0.9999793) * tmpvar_1780);
        tmpvar_1781 = (tmpvar_1781 + (float(
          (abs((vec_y_1777 / vec_x_1778)) > 1.0)
        ) * (
          (tmpvar_1781 * -2.0)
         + 1.570796)));
        tmpvar_1779 = (tmpvar_1781 * sign((vec_y_1777 / vec_x_1778)));
        if ((abs(vec_x_1778) > (1e-08 * abs(vec_y_1777)))) {
          if ((vec_x_1778 < 0.0)) {
            if ((vec_y_1777 >= 0.0)) {
              tmpvar_1779 += 3.141593;
            } else {
              tmpvar_1779 = (tmpvar_1779 - 3.141593);
            };
          };
        } else {
          tmpvar_1779 = (sign(vec_y_1777) * 1.570796);
        };
        float edge0_1782;
        edge0_1782 = (0.5 + (0.4 * cos(tmpvar_1771)));
        float tmpvar_1783;
        tmpvar_1783 = clamp (((tmpvar_1776 - edge0_1782) / (1.0 - edge0_1782)), 0.0, 1.0);
        float edge0_1784;
        edge0_1784 = (0.5 + (0.4 * sin(tmpvar_1771)));
        float tmpvar_1785;
        tmpvar_1785 = clamp (((tmpvar_1776 - edge0_1784) / (1.0 - edge0_1784)), 0.0, 1.0);
        vec3 tmpvar_1786;
        tmpvar_1786 = (((tmpvar_1774 * 
          (1.0 - (tmpvar_1783 * (tmpvar_1783 * (3.0 - 
            (2.0 * tmpvar_1783)
          ))))
        ) * sin(
          ((tmpvar_1769 + tmpvar_1776) + (tmpvar_1779 * period_1766))
        )) / sqrt(dot (uv_1768, uv_1768)));
        uv_1768 = (-(zoom) + (pos_1764 / 17.5));
        float tmpvar_1787;
        tmpvar_1787 = clamp (((period_1766 - 36.9) / 0.5999985), 0.0, 1.0);
        uv_1768 = (uv_1768 / (zoom - (zoom * 
          (tmpvar_1787 * (tmpvar_1787 * (3.0 - (2.0 * tmpvar_1787))))
        )));
        vec4 tmpvar_1788;
        tmpvar_1788.w = 1.0;
        tmpvar_1788.xyz = (max (vec3(0.0, 0.0, 0.0), (
          mix (tmpvar_1786, (vec3(1.0, 1.0, 4.0) * (1.0 - (tmpvar_1785 * 
            (tmpvar_1785 * (3.0 - (2.0 * tmpvar_1785)))
          ))), sin(((tmpvar_1770 + tmpvar_1776) + (tmpvar_1779 * period_1766))))
         / 
          sqrt(dot (uv_1768, uv_1768))
        )) * abs((
          float((sqrt(dot (uv_1768, uv_1768)) >= 1.0))
         - 1.0)));
        float tmpvar_1789;
        tmpvar_1789 = clamp (((period_1766 - 38.0) / -2.0), 0.0, 1.0);
        tmpvar_1767 = (tmpvar_1788 * (tmpvar_1789 * (tmpvar_1789 * 
          (3.0 - (2.0 * tmpvar_1789))
        )));
      } else {
        vec4 tmpvar_1790;
        tmpvar_1790.w = 1.0;
        tmpvar_1790.xyz = vec3(0.0, 0.0, 0.0);
        tmpvar_1767 = tmpvar_1790;
      };
      buff_11 = (buff_11 + (tmpvar_1767 * (1.0 - 
        float((6.283159 >= bullettimer[i_4]))
      )));
      vec2 tmpvar_1791;
      tmpvar_1791.x = bulletposx[i_4];
      tmpvar_1791.y = bulletposy[i_4];
      float tshift_1792;
      tshift_1792 = bullettimer[i_4];
      vec4 tmpvar_1793;
      vec2 uv_1794;
      vec2 pos_1795;
      vec2 tmpvar_1796;
      tmpvar_1796 = ((fragCoord_3 - (tmpvar_1791 * zoom)) - shippos);
      pos_1795 = tmpvar_1796;
      uv_1794 = (((tmpvar_1796 / 
        (125.0 * zoom)
      ) * 2.0) - 0.3);
      uv_1794 = (uv_1794 * 0.5);
      float tmpvar_1797;
      tmpvar_1797 = float((sqrt(
        dot (uv_1794, uv_1794)
      ) >= 1.0));
      if (((tmpvar_1797 - 1.0) <= -1.0)) {
        vec4 ret_1798;
        vec2 uxx_1799;
        mat2 tmpvar_1800;
        tmpvar_1800[0].x = cos((iTime - tshift_1792));
        tmpvar_1800[0].y = -(sin((iTime - tshift_1792)));
        tmpvar_1800[1].x = sin((iTime - tshift_1792));
        tmpvar_1800[1].y = cos((iTime - tshift_1792));
        pos_1795 = (tmpvar_1800 * uv_1794);
        uxx_1799.y = (pos_1795.y * 2.0);
        uxx_1799.x = (pos_1795.x * 1.5);
        int i_1801;
        i_1801 = 0;
        for(int i=0;i<3;i++) {
          if ((i_1801 >= 3)) {
            break;
          };
          i_1801++;
        };
        int i_1802;
        i_1802 = 0;
        for(int i=0;i<3;i++) {
          if ((i_1802 >= 3)) {
            break;
          };
          i_1802++;
        };
        int i_1803;
        i_1803 = 0;
        for(int i=0;i<3;i++) {
          if ((i_1803 >= 3)) {
            break;
          };
          i_1803++;
        };
        int i_1804;
        i_1804 = 0;
        for(int i=0;i<3;i++) {
          if ((i_1804 >= 3)) {
            break;
          };
          i_1804++;
        };
        float tmpvar_1805;
        tmpvar_1805 = abs(pos_1795.y);
        vec2 p_1806;
        p_1806 = ((pos_1795 * 50.0) + 220.0);
        float tshift_1807;
        tshift_1807 = tshift_1792;
        float wc_1809;
        float w_1810;
        float a_1811;
        p_1806 = (p_1806 * 1.2);
        a_1811 = 0.0;
        w_1810 = 1.0;
        wc_1809 = 0.0;
        for(int i_1808=0;i_1808<3;i_1808++) {
          if ((i_1808 >= 3)) {
            break;
          };
          vec3 tmpvar_1812;
          tmpvar_1812.z = 1.0;
          tmpvar_1812.xy = p_1806;
          vec3 f_1813;
          vec3 tmpvar_1814;
          tmpvar_1814 = floor(tmpvar_1812);
          vec3 tmpvar_1815;
          tmpvar_1815 = fract(tmpvar_1812);
          f_1813 = ((tmpvar_1815 * tmpvar_1815) * (3.0 - (2.0 * tmpvar_1815)));
          float tmpvar_1816;
          tmpvar_1816 = ((tmpvar_1814.x + (tmpvar_1814.y * 971.0)) + (883.0 * tmpvar_1814.z));
          vec3 x_1817;
          x_1817 = (tmpvar_1812 + 0.5);
          vec3 f_1818;
          vec3 tmpvar_1819;
          tmpvar_1819 = floor(x_1817);
          vec3 tmpvar_1820;
          tmpvar_1820 = fract(x_1817);
          f_1818 = ((tmpvar_1820 * tmpvar_1820) * (3.0 - (2.0 * tmpvar_1820)));
          float tmpvar_1821;
          tmpvar_1821 = ((tmpvar_1819.x + (tmpvar_1819.y * 157.0)) + (113.0 * tmpvar_1819.z));
          a_1811 = (a_1811 + clamp ((
            (2.0 * abs((0.5 - (
              mix (mix (mix (fract(
                (sin(tmpvar_1816) * 758.5453)
              ), fract(
                (sin((tmpvar_1816 + 1.0)) * 758.5453)
              ), f_1813.x), mix (fract(
                (sin((tmpvar_1816 + 971.0)) * 758.5453)
              ), fract(
                (sin((972.0 + tmpvar_1816)) * 758.5453)
              ), f_1813.x), f_1813.y), mix (mix (fract(
                (sin((tmpvar_1816 + 883.0)) * 758.5453)
              ), fract(
                (sin((884.0 + tmpvar_1816)) * 758.5453)
              ), f_1813.x), mix (fract(
                (sin((tmpvar_1816 + 1854.0)) * 758.5453)
              ), fract(
                (sin((1855.0 + tmpvar_1816)) * 758.5453)
              ), f_1813.x), f_1813.y), f_1813.z)
             * 
              mix (mix (mix (fract(
                (sin(tmpvar_1821) * 758.5453)
              ), fract(
                (sin((tmpvar_1821 + 1.0)) * 758.5453)
              ), f_1818.x), mix (fract(
                (sin((tmpvar_1821 + 157.0)) * 758.5453)
              ), fract(
                (sin((158.0 + tmpvar_1821)) * 758.5453)
              ), f_1818.x), f_1818.y), mix (mix (fract(
                (sin((tmpvar_1821 + 113.0)) * 758.5453)
              ), fract(
                (sin((114.0 + tmpvar_1821)) * 758.5453)
              ), f_1818.x), mix (fract(
                (sin((tmpvar_1821 + 270.0)) * 758.5453)
              ), fract(
                (sin((271.0 + tmpvar_1821)) * 758.5453)
              ), f_1818.x), f_1818.y), f_1818.z)
            ))))
           * w_1810), 0.0, 1.0));
          wc_1809 = (wc_1809 + ((w_1810 * 
            (1.0 - sin((min (iTime, 3.110164) / 1.4)))
          ) + 0.00271));
          w_1810 = (w_1810 * 0.5);
          p_1806 = ((p_1806 * 3.0) / sin(min (tshift_1807, 3.110164)));
        };
        float tmpvar_1822;
        tmpvar_1822 = clamp (((
          (((1.0/((1.0 + 
            (20.0 * tmpvar_1805)
          ))) * (a_1811 / wc_1809)) * (1.0 - abs(pos_1795.x)))
         - 0.1) / 0.4), 0.0, 1.0);
        vec2 tmpvar_1823;
        tmpvar_1823.x = iTime;
        tmpvar_1823.y = -(tshift_1792);
        vec2 tmpvar_1824;
        tmpvar_1824.x = -(iTime);
        tmpvar_1824.y = tshift_1792;
        vec3 tmpvar_1825;
        tmpvar_1825.y = 0.8;
        tmpvar_1825.x = (0.9 + (1.5 * fract(
          (cos(dot (tmpvar_1823, vec2(21.9898, 78.233))) * 43758.55)
        )));
        tmpvar_1825.z = (0.8 + (2.0 * fract(
          (cos(dot (tmpvar_1824, vec2(21.9898, 78.233))) * 43758.55)
        )));
        vec3 tmpvar_1826;
        tmpvar_1826 = (vec3(-0.32, -0.21, -0.0) * (1.0 + (
          (tmpvar_1822 * (tmpvar_1822 * (3.0 - (2.0 * tmpvar_1822))))
         - 1.0)));
        float tmpvar_1827;
        tmpvar_1827 = abs(pos_1795.y);
        vec2 p_1828;
        p_1828 = (pos_1795 * 3.0);
        float tshift_1829;
        tshift_1829 = tshift_1792;
        float wc_1831;
        float w_1832;
        float a_1833;
        p_1828 = (p_1828 * 1.2);
        a_1833 = 0.0;
        w_1832 = 1.0;
        wc_1831 = 0.0;
        for(int i_1830=0;i_1830<3;i_1830++) {
          if ((i_1830 >= 3)) {
            break;
          };
          vec3 tmpvar_1834;
          tmpvar_1834.z = 1.0;
          tmpvar_1834.xy = p_1828;
          vec3 f_1835;
          vec3 tmpvar_1836;
          tmpvar_1836 = floor(tmpvar_1834);
          vec3 tmpvar_1837;
          tmpvar_1837 = fract(tmpvar_1834);
          f_1835 = ((tmpvar_1837 * tmpvar_1837) * (3.0 - (2.0 * tmpvar_1837)));
          float tmpvar_1838;
          tmpvar_1838 = ((tmpvar_1836.x + (tmpvar_1836.y * 971.0)) + (883.0 * tmpvar_1836.z));
          vec3 x_1839;
          x_1839 = (tmpvar_1834 + 0.5);
          vec3 f_1840;
          vec3 tmpvar_1841;
          tmpvar_1841 = floor(x_1839);
          vec3 tmpvar_1842;
          tmpvar_1842 = fract(x_1839);
          f_1840 = ((tmpvar_1842 * tmpvar_1842) * (3.0 - (2.0 * tmpvar_1842)));
          float tmpvar_1843;
          tmpvar_1843 = ((tmpvar_1841.x + (tmpvar_1841.y * 157.0)) + (113.0 * tmpvar_1841.z));
          a_1833 = (a_1833 + clamp ((
            (2.0 * abs((0.5 - (
              mix (mix (mix (fract(
                (sin(tmpvar_1838) * 758.5453)
              ), fract(
                (sin((tmpvar_1838 + 1.0)) * 758.5453)
              ), f_1835.x), mix (fract(
                (sin((tmpvar_1838 + 971.0)) * 758.5453)
              ), fract(
                (sin((972.0 + tmpvar_1838)) * 758.5453)
              ), f_1835.x), f_1835.y), mix (mix (fract(
                (sin((tmpvar_1838 + 883.0)) * 758.5453)
              ), fract(
                (sin((884.0 + tmpvar_1838)) * 758.5453)
              ), f_1835.x), mix (fract(
                (sin((tmpvar_1838 + 1854.0)) * 758.5453)
              ), fract(
                (sin((1855.0 + tmpvar_1838)) * 758.5453)
              ), f_1835.x), f_1835.y), f_1835.z)
             * 
              mix (mix (mix (fract(
                (sin(tmpvar_1843) * 758.5453)
              ), fract(
                (sin((tmpvar_1843 + 1.0)) * 758.5453)
              ), f_1840.x), mix (fract(
                (sin((tmpvar_1843 + 157.0)) * 758.5453)
              ), fract(
                (sin((158.0 + tmpvar_1843)) * 758.5453)
              ), f_1840.x), f_1840.y), mix (mix (fract(
                (sin((tmpvar_1843 + 113.0)) * 758.5453)
              ), fract(
                (sin((114.0 + tmpvar_1843)) * 758.5453)
              ), f_1840.x), mix (fract(
                (sin((tmpvar_1843 + 270.0)) * 758.5453)
              ), fract(
                (sin((271.0 + tmpvar_1843)) * 758.5453)
              ), f_1840.x), f_1840.y), f_1840.z)
            ))))
           * w_1832), 0.0, 1.0));
          wc_1831 = (wc_1831 + ((w_1832 * 
            (1.0 - sin((min (iTime, 3.110164) / 1.4)))
          ) + 0.00271));
          w_1832 = (w_1832 * 0.5);
          p_1828 = ((p_1828 * 3.0) / sin(min (tshift_1829, 3.110164)));
        };
        float tmpvar_1844;
        tmpvar_1844 = clamp (((
          sqrt(dot (uxx_1799, uxx_1799))
         - 1.6) / -0.95), 0.0, 1.0);
        vec4 tmpvar_1845;
        tmpvar_1845.w = 1.0;
        tmpvar_1845.xyz = (min (vec3(1.0, 1.0, 1.0), (
          ((tmpvar_1826 * abs(sin(
            (tshift_1792 / 2.0)
          ))) + (((
            (1.6 * tmpvar_1825)
           * 
            (1.0/((1.0 + (30.0 * tmpvar_1827))))
          ) * (a_1833 / wc_1831)) * (1.0 - abs(pos_1795.x))))
         * 
          abs(sin(min (tshift_1792, 3.110164)))
        )) * (tmpvar_1844 * (tmpvar_1844 * 
          (3.0 - (2.0 * tmpvar_1844))
        )));
        ret_1798.w = tmpvar_1845.w;
        float tmpvar_1846;
        tmpvar_1846 = clamp (((tshift_1792 - 3.267243) / -0.439821), 0.0, 1.0);
        ret_1798.y = (tmpvar_1845.y * (tmpvar_1846 * (tmpvar_1846 * 
          (3.0 - (2.0 * tmpvar_1846))
        )));
        float tmpvar_1847;
        tmpvar_1847 = clamp (((tshift_1792 - 3.14158) / -0.314158), 0.0, 1.0);
        ret_1798.x = (tmpvar_1845.x * (tmpvar_1847 * (tmpvar_1847 * 
          (3.0 - (2.0 * tmpvar_1847))
        )));
        float tmpvar_1848;
        tmpvar_1848 = clamp (((tshift_1792 - 3.330074) / -0.5026526), 0.0, 1.0);
        ret_1798.z = (tmpvar_1845.z * (3.0 * (tmpvar_1848 * 
          (tmpvar_1848 * (3.0 - (2.0 * tmpvar_1848)))
        )));
        tmpvar_1793 = ret_1798;
      } else {
        tmpvar_1793 = vec4(0.0, 0.0, 0.0, 0.0);
      };
      buff_11 = (buff_11 + (tmpvar_1793 * float(
        (6.283159 >= bullettimer[i_4])
      )));
    } else {
      vec2 tmpvar_1849;
      tmpvar_1849.x = bulletposx[i_4];
      tmpvar_1849.y = bulletposy[i_4];
      vec2 pos_1850;
      float tshift_1851;
      tshift_1851 = bullettimer[i_4];
      vec4 tmpvar_1852;
      pos_1850 = ((fragCoord_3 - (tmpvar_1849 * zoom)) - shippos);
      if ((((
        (pos_1850.x > 0.0)
       && 
        (pos_1850.x < (35.0 * zoom))
      ) && (pos_1850.y > 0.0)) && (pos_1850.y < (35.0 * zoom)))) {
        vec2 uv_1853;
        uv_1853 = ((pos_1850 / 17.5) / zoom);
        float tmpvar_1854;
        tmpvar_1854 = (tshift_1851 * 3.5);
        float tmpvar_1855;
        tmpvar_1855 = (tmpvar_1854 + 2.8);
        float tmpvar_1856;
        tmpvar_1856 = (4.6 + (tshift_1851 / 0.5));
        float tmpvar_1857;
        tmpvar_1857 = clamp (-0.3214286, 0.0, 1.0);
        vec3 tmpvar_1858;
        tmpvar_1858.y = 1.0;
        tmpvar_1858.x = (4.0 - (4.0 * (tmpvar_1857 * 
          (tmpvar_1857 * (3.0 - (2.0 * tmpvar_1857)))
        )));
        tmpvar_1858.z = (1.0 + (4.0 * (tmpvar_1857 * 
          (tmpvar_1857 * (3.0 - (2.0 * tmpvar_1857)))
        )));
        vec2 tmpvar_1859;
        tmpvar_1859 = (uv_1853 - 1.0);
        float tmpvar_1860;
        tmpvar_1860 = sqrt(dot (tmpvar_1859, tmpvar_1859));
        float vec_y_1861;
        vec_y_1861 = (tmpvar_1859.x + cos(tmpvar_1856));
        float vec_x_1862;
        vec_x_1862 = (tmpvar_1859.y + sin(tmpvar_1856));
        float tmpvar_1863;
        float tmpvar_1864;
        tmpvar_1864 = (min (abs(
          (vec_y_1861 / vec_x_1862)
        ), 1.0) / max (abs(
          (vec_y_1861 / vec_x_1862)
        ), 1.0));
        float tmpvar_1865;
        tmpvar_1865 = (tmpvar_1864 * tmpvar_1864);
        tmpvar_1865 = (((
          ((((
            ((((-0.01213232 * tmpvar_1865) + 0.05368138) * tmpvar_1865) - 0.1173503)
           * tmpvar_1865) + 0.1938925) * tmpvar_1865) - 0.3326756)
         * tmpvar_1865) + 0.9999793) * tmpvar_1864);
        tmpvar_1865 = (tmpvar_1865 + (float(
          (abs((vec_y_1861 / vec_x_1862)) > 1.0)
        ) * (
          (tmpvar_1865 * -2.0)
         + 1.570796)));
        tmpvar_1863 = (tmpvar_1865 * sign((vec_y_1861 / vec_x_1862)));
        if ((abs(vec_x_1862) > (1e-08 * abs(vec_y_1861)))) {
          if ((vec_x_1862 < 0.0)) {
            if ((vec_y_1861 >= 0.0)) {
              tmpvar_1863 += 3.141593;
            } else {
              tmpvar_1863 = (tmpvar_1863 - 3.141593);
            };
          };
        } else {
          tmpvar_1863 = (sign(vec_y_1861) * 1.570796);
        };
        float edge0_1866;
        edge0_1866 = (0.5 + (0.4 * cos(tmpvar_1856)));
        float tmpvar_1867;
        tmpvar_1867 = clamp (((tmpvar_1860 - edge0_1866) / (1.0 - edge0_1866)), 0.0, 1.0);
        float edge0_1868;
        edge0_1868 = (0.5 + (0.4 * sin(tmpvar_1856)));
        float tmpvar_1869;
        tmpvar_1869 = clamp (((tmpvar_1860 - edge0_1868) / (1.0 - edge0_1868)), 0.0, 1.0);
        vec3 tmpvar_1870;
        tmpvar_1870 = (((tmpvar_1858 * 
          (1.0 - (tmpvar_1867 * (tmpvar_1867 * (3.0 - 
            (2.0 * tmpvar_1867)
          ))))
        ) * sin(
          ((tmpvar_1854 + tmpvar_1860) + tmpvar_1863)
        )) / sqrt(dot (uv_1853, uv_1853)));
        uv_1853 = (-(zoom) + (pos_1850 / 17.5));
        float tmpvar_1871;
        tmpvar_1871 = clamp (-59.83349, 0.0, 1.0);
        uv_1853 = (uv_1853 / (zoom - (zoom * 
          (tmpvar_1871 * (tmpvar_1871 * (3.0 - (2.0 * tmpvar_1871))))
        )));
        vec4 tmpvar_1872;
        tmpvar_1872.w = 1.0;
        tmpvar_1872.xyz = (max (vec3(0.0, 0.0, 0.0), (
          mix (tmpvar_1870, (vec3(1.0, 1.0, 4.0) * (1.0 - (tmpvar_1869 * 
            (tmpvar_1869 * (3.0 - (2.0 * tmpvar_1869)))
          ))), sin(((tmpvar_1855 + tmpvar_1860) + tmpvar_1863)))
         / 
          sqrt(dot (uv_1853, uv_1853))
        )) * abs((
          float((sqrt(dot (uv_1853, uv_1853)) >= 1.0))
         - 1.0)));
        float tmpvar_1873;
        tmpvar_1873 = clamp (18.5, 0.0, 1.0);
        tmpvar_1852 = (tmpvar_1872 * (tmpvar_1873 * (tmpvar_1873 * 
          (3.0 - (2.0 * tmpvar_1873))
        )));
      } else {
        vec4 tmpvar_1874;
        tmpvar_1874.w = 1.0;
        tmpvar_1874.xyz = vec3(0.0, 0.0, 0.0);
        tmpvar_1852 = tmpvar_1874;
      };
      buff_11 = (buff_11 + tmpvar_1852);
    };
  };
  color_1.xyz = buff_11.xyz;
  color_1.w = 1.0;
  gl_FragColor = color_1;
}

