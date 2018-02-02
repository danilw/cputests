// License Creative Commons Attribution-NonCommercial-ShareAlike

// opensource
// please dont use it for sell on google/apple store thanks

//this is obfuscated/optimized source, original glsl source in mysf.glsl file

uniform float time;
uniform vec3 iResolution;
float iTime;
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
  vec2 fragCoord_2;
  fragCoord_2 = gl_FragCoord.xy;
  vec4 txeb_5;
  vec4 exbff_7;
  vec4 tb_8;
  vec4 mcol_9;
  vec4 buff_10;
  vec2 uv_11;
  vec2 tmpvar_12;
  tmpvar_12 = floor(gl_FragCoord.xy);
  vec2 tmpvar_13;
  tmpvar_13 = (gl_FragCoord.xy - tmpvar_12);
  uv_11 = ((tmpvar_13 * tmpvar_13) * (3.0 - (2.0 * tmpvar_13)));
  float tmpvar_14;
  tmpvar_14 = fract((cos(
    dot (tmpvar_12, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_15;
  tmpvar_15.x = (tmpvar_12.x + 1.0);
  tmpvar_15.y = tmpvar_12.y;
  float tmpvar_16;
  tmpvar_16 = fract((cos(
    dot (tmpvar_15, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_17;
  tmpvar_17.x = tmpvar_12.x;
  tmpvar_17.y = (tmpvar_12.y + 1.0);
  float tmpvar_18;
  tmpvar_18 = fract((cos(
    dot (tmpvar_17, vec2(21.9898, 78.233))
  ) * 43758.55));
  float tmpvar_19;
  tmpvar_19 = (pow ((
    ((tmpvar_14 + ((tmpvar_16 - tmpvar_14) * uv_11.x)) + ((tmpvar_18 - tmpvar_14) * uv_11.y))
   + 
    ((((
      (tmpvar_14 - tmpvar_16)
     - tmpvar_18) + fract(
      (cos(dot ((tmpvar_12 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
    )) * uv_11.x) * uv_11.y)
  ), 40.0) * 20.0);
  float tmpvar_20;
  float tmpvar_21;
  tmpvar_21 = (time * 0.01);
  tmpvar_20 = sin(tmpvar_21);
  vec2 uv_22;
  vec2 tmpvar_23;
  tmpvar_23 = floor(vec2(tmpvar_20));
  vec2 tmpvar_24;
  tmpvar_24 = (vec2(tmpvar_20) - tmpvar_23);
  uv_22 = ((tmpvar_24 * tmpvar_24) * (3.0 - (2.0 * tmpvar_24)));
  float tmpvar_25;
  tmpvar_25 = fract((cos(
    dot (tmpvar_23, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_26;
  tmpvar_26.x = (tmpvar_23.x + 1.0);
  tmpvar_26.y = tmpvar_23.y;
  float tmpvar_27;
  tmpvar_27 = fract((cos(
    dot (tmpvar_26, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_28;
  tmpvar_28.x = tmpvar_23.x;
  tmpvar_28.y = (tmpvar_23.y + 1.0);
  float tmpvar_29;
  tmpvar_29 = fract((cos(
    dot (tmpvar_28, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 xy_30;
  xy_30 = (gl_FragCoord.xy * ((
    (tmpvar_25 + ((tmpvar_27 - tmpvar_25) * uv_22.x))
   + 
    ((tmpvar_29 - tmpvar_25) * uv_22.y)
  ) + (
    ((((tmpvar_25 - tmpvar_27) - tmpvar_29) + fract((
      cos(dot ((tmpvar_23 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
     * 43758.55))) * uv_22.x)
   * uv_22.y)));
  vec2 uv_31;
  vec2 tmpvar_32;
  tmpvar_32 = floor(xy_30);
  vec2 tmpvar_33;
  tmpvar_33 = (xy_30 - tmpvar_32);
  uv_31 = ((tmpvar_33 * tmpvar_33) * (3.0 - (2.0 * tmpvar_33)));
  float tmpvar_34;
  tmpvar_34 = fract((cos(
    dot (tmpvar_32, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_35;
  tmpvar_35.x = (tmpvar_32.x + 1.0);
  tmpvar_35.y = tmpvar_32.y;
  float tmpvar_36;
  tmpvar_36 = fract((cos(
    dot (tmpvar_35, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_37;
  tmpvar_37.x = tmpvar_32.x;
  tmpvar_37.y = (tmpvar_32.y + 1.0);
  float tmpvar_38;
  tmpvar_38 = fract((cos(
    dot (tmpvar_37, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_39;
  tmpvar_39.x = cos(tmpvar_21);
  tmpvar_39.y = sin(tmpvar_21);
  vec2 uv_40;
  vec2 tmpvar_41;
  tmpvar_41 = floor(tmpvar_39);
  vec2 tmpvar_42;
  tmpvar_42 = (tmpvar_39 - tmpvar_41);
  uv_40 = ((tmpvar_42 * tmpvar_42) * (3.0 - (2.0 * tmpvar_42)));
  float tmpvar_43;
  tmpvar_43 = fract((cos(
    dot (tmpvar_41, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_44;
  tmpvar_44.x = (tmpvar_41.x + 1.0);
  tmpvar_44.y = tmpvar_41.y;
  float tmpvar_45;
  tmpvar_45 = fract((cos(
    dot (tmpvar_44, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_46;
  tmpvar_46.x = tmpvar_41.x;
  tmpvar_46.y = (tmpvar_41.y + 1.0);
  float tmpvar_47;
  tmpvar_47 = fract((cos(
    dot (tmpvar_46, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 xy_48;
  xy_48 = (gl_FragCoord.xy * ((
    (tmpvar_43 + ((tmpvar_45 - tmpvar_43) * uv_40.x))
   + 
    ((tmpvar_47 - tmpvar_43) * uv_40.y)
  ) + (
    ((((tmpvar_43 - tmpvar_45) - tmpvar_47) + fract((
      cos(dot ((tmpvar_41 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
     * 43758.55))) * uv_40.x)
   * uv_40.y)));
  vec2 uv_49;
  vec2 tmpvar_50;
  tmpvar_50 = floor(xy_48);
  vec2 tmpvar_51;
  tmpvar_51 = (xy_48 - tmpvar_50);
  uv_49 = ((tmpvar_51 * tmpvar_51) * (3.0 - (2.0 * tmpvar_51)));
  float tmpvar_52;
  tmpvar_52 = fract((cos(
    dot (tmpvar_50, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_53;
  tmpvar_53.x = (tmpvar_50.x + 1.0);
  tmpvar_53.y = tmpvar_50.y;
  float tmpvar_54;
  tmpvar_54 = fract((cos(
    dot (tmpvar_53, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_55;
  tmpvar_55.x = tmpvar_50.x;
  tmpvar_55.y = (tmpvar_50.y + 1.0);
  float tmpvar_56;
  tmpvar_56 = fract((cos(
    dot (tmpvar_55, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_57;
  float tmpvar_58;
  tmpvar_58 = (time * 0.05);
  tmpvar_57.x = sin(tmpvar_58);
  tmpvar_57.y = cos(tmpvar_58);
  vec2 uv_59;
  vec2 tmpvar_60;
  tmpvar_60 = floor(tmpvar_57);
  vec2 tmpvar_61;
  tmpvar_61 = (tmpvar_57 - tmpvar_60);
  uv_59 = ((tmpvar_61 * tmpvar_61) * (3.0 - (2.0 * tmpvar_61)));
  float tmpvar_62;
  tmpvar_62 = fract((cos(
    dot (tmpvar_60, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_63;
  tmpvar_63.x = (tmpvar_60.x + 1.0);
  tmpvar_63.y = tmpvar_60.y;
  float tmpvar_64;
  tmpvar_64 = fract((cos(
    dot (tmpvar_63, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_65;
  tmpvar_65.x = tmpvar_60.x;
  tmpvar_65.y = (tmpvar_60.y + 1.0);
  float tmpvar_66;
  tmpvar_66 = fract((cos(
    dot (tmpvar_65, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 xy_67;
  xy_67 = (gl_FragCoord.xy * ((
    (tmpvar_62 + ((tmpvar_64 - tmpvar_62) * uv_59.x))
   + 
    ((tmpvar_66 - tmpvar_62) * uv_59.y)
  ) + (
    ((((tmpvar_62 - tmpvar_64) - tmpvar_66) + fract((
      cos(dot ((tmpvar_60 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
     * 43758.55))) * uv_59.x)
   * uv_59.y)));
  vec2 uv_68;
  vec2 tmpvar_69;
  tmpvar_69 = floor(xy_67);
  vec2 tmpvar_70;
  tmpvar_70 = (xy_67 - tmpvar_69);
  uv_68 = ((tmpvar_70 * tmpvar_70) * (3.0 - (2.0 * tmpvar_70)));
  float tmpvar_71;
  tmpvar_71 = fract((cos(
    dot (tmpvar_69, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_72;
  tmpvar_72.x = (tmpvar_69.x + 1.0);
  tmpvar_72.y = tmpvar_69.y;
  float tmpvar_73;
  tmpvar_73 = fract((cos(
    dot (tmpvar_72, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec2 tmpvar_74;
  tmpvar_74.x = tmpvar_69.x;
  tmpvar_74.y = (tmpvar_69.y + 1.0);
  float tmpvar_75;
  tmpvar_75 = fract((cos(
    dot (tmpvar_74, vec2(21.9898, 78.233))
  ) * 43758.55));
  vec3 tmpvar_76;
  tmpvar_76.x = (tmpvar_19 * ((
    (tmpvar_34 + ((tmpvar_36 - tmpvar_34) * uv_31.x))
   + 
    ((tmpvar_38 - tmpvar_34) * uv_31.y)
  ) + (
    ((((tmpvar_34 - tmpvar_36) - tmpvar_38) + fract((
      cos(dot ((tmpvar_32 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
     * 43758.55))) * uv_31.x)
   * uv_31.y)));
  tmpvar_76.y = (tmpvar_19 * ((
    (tmpvar_52 + ((tmpvar_54 - tmpvar_52) * uv_49.x))
   + 
    ((tmpvar_56 - tmpvar_52) * uv_49.y)
  ) + (
    ((((tmpvar_52 - tmpvar_54) - tmpvar_56) + fract((
      cos(dot ((tmpvar_50 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
     * 43758.55))) * uv_49.x)
   * uv_49.y)));
  tmpvar_76.z = (tmpvar_19 * ((
    (tmpvar_71 + ((tmpvar_73 - tmpvar_71) * uv_68.x))
   + 
    ((tmpvar_75 - tmpvar_71) * uv_68.y)
  ) + (
    ((((tmpvar_71 - tmpvar_73) - tmpvar_75) + fract((
      cos(dot ((tmpvar_69 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
     * 43758.55))) * uv_68.x)
   * uv_68.y)));
  vec4 tmpvar_77;
  tmpvar_77.w = 1.0;
  tmpvar_77.xyz = tmpvar_76;
  buff_10 = tmpvar_77;
  vec4 tmpvar_78;
  vec2 tmpvar_79;
  tmpvar_79 = ((gl_FragCoord.xy - (nebulapos * zoom)) - shippos);
  vec2 x_80;
  x_80 = (tmpvar_79 - (25000.0 * zoom));
  float tmpvar_81;
  tmpvar_81 = float((sqrt(
    dot (x_80, x_80)
  ) >= (100000.0 * zoom)));
  if (((1.0 - tmpvar_81) > 0.0)) {
    vec4 cl_82;
    vec2 st_83;
    vec2 uv_84;
    vec2 tmpvar_85;
    tmpvar_85 = ((tmpvar_79 / vec2((50000.0 * zoom))) - 0.15);
    vec2 tmpvar_86;
    tmpvar_86 = (tmpvar_85 * 1.35);
    st_83 = (tmpvar_86 + vec2(((0.2 * 
      dot (tmpvar_86, tmpvar_86)
    ) - 0.5)));
    float tmpvar_87;
    tmpvar_87 = (time * 0.01);
    uv_84 = (tmpvar_85 - vec2(0.8, 0.5));
    st_83 = (st_83 + sign(dot (uv_84, uv_84)));
    uv_84 = (uv_84 + sign(dot (uv_84, uv_84)));
    uv_84 = (uv_84 - sign(dot (uv_84, uv_84)));
    vec2 tmpvar_88;
    tmpvar_88.x = (0.2 * tmpvar_87);
    tmpvar_88.y = (0.2 * tmpvar_87);
    vec2 tmpvar_89;
    tmpvar_89.x = (0.3 * tmpvar_87);
    tmpvar_89.y = (0.3 * tmpvar_87);
    vec2 tmpvar_90;
    tmpvar_90.x = (0.4 * tmpvar_87);
    tmpvar_90.y = (0.4 * tmpvar_87);
    mat2 tmpvar_91;
    tmpvar_91[0].x = cos((tmpvar_87 * 2.5));
    tmpvar_91[0].y = sin((tmpvar_87 * 2.5));
    tmpvar_91[1].x = -(sin((tmpvar_87 * 2.5)));
    tmpvar_91[1].y = cos((tmpvar_87 * 2.5));
    vec2 p_92;
    p_92 = (tmpvar_91 * ((1.5 * st_83) + tmpvar_88));
    float f_93;
    f_93 = 0.0;
    if (!(best)) {
      p_92 = (p_92 * mat2(0.9012, 0.9012, -0.9012, 1.2016));
    };
    vec2 uv_94;
    vec2 tmpvar_95;
    tmpvar_95 = floor(p_92);
    vec2 tmpvar_96;
    tmpvar_96 = (p_92 - tmpvar_95);
    uv_94 = ((tmpvar_96 * tmpvar_96) * (3.0 - (2.0 * tmpvar_96)));
    float tmpvar_97;
    tmpvar_97 = fract((cos(
      dot (tmpvar_95, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_98;
    tmpvar_98.x = (tmpvar_95.x + 1.0);
    tmpvar_98.y = tmpvar_95.y;
    float tmpvar_99;
    tmpvar_99 = fract((cos(
      dot (tmpvar_98, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_100;
    tmpvar_100.x = tmpvar_95.x;
    tmpvar_100.y = (tmpvar_95.y + 1.0);
    float tmpvar_101;
    tmpvar_101 = fract((cos(
      dot (tmpvar_100, vec2(21.9898, 78.233))
    ) * 43758.55));
    f_93 = (0.5 * ((
      (tmpvar_97 + ((tmpvar_99 - tmpvar_97) * uv_94.x))
     + 
      ((tmpvar_101 - tmpvar_97) * uv_94.y)
    ) + (
      ((((tmpvar_97 - tmpvar_99) - tmpvar_101) + fract((
        cos(dot ((tmpvar_95 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
       * 43758.55))) * uv_94.x)
     * uv_94.y)));
    p_92 = (p_92 * mat2(1.212, 1.212, -1.212, 1.616));
    vec2 uv_102;
    vec2 tmpvar_103;
    tmpvar_103 = floor(p_92);
    vec2 tmpvar_104;
    tmpvar_104 = (p_92 - tmpvar_103);
    uv_102 = ((tmpvar_104 * tmpvar_104) * (3.0 - (2.0 * tmpvar_104)));
    float tmpvar_105;
    tmpvar_105 = fract((cos(
      dot (tmpvar_103, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_106;
    tmpvar_106.x = (tmpvar_103.x + 1.0);
    tmpvar_106.y = tmpvar_103.y;
    float tmpvar_107;
    tmpvar_107 = fract((cos(
      dot (tmpvar_106, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_108;
    tmpvar_108.x = tmpvar_103.x;
    tmpvar_108.y = (tmpvar_103.y + 1.0);
    float tmpvar_109;
    tmpvar_109 = fract((cos(
      dot (tmpvar_108, vec2(21.9898, 78.233))
    ) * 43758.55));
    f_93 = (f_93 + (0.25 * (
      ((tmpvar_105 + ((tmpvar_107 - tmpvar_105) * uv_102.x)) + ((tmpvar_109 - tmpvar_105) * uv_102.y))
     + 
      ((((
        (tmpvar_105 - tmpvar_107)
       - tmpvar_109) + fract(
        (cos(dot ((tmpvar_103 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
      )) * uv_102.x) * uv_102.y)
    )));
    p_92 = (p_92 * mat2(1.218, 1.218, -1.218, 1.624));
    if (best) {
      vec2 uv_110;
      vec2 tmpvar_111;
      tmpvar_111 = floor(p_92);
      vec2 tmpvar_112;
      tmpvar_112 = (p_92 - tmpvar_111);
      uv_110 = ((tmpvar_112 * tmpvar_112) * (3.0 - (2.0 * tmpvar_112)));
      float tmpvar_113;
      tmpvar_113 = fract((cos(
        dot (tmpvar_111, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_114;
      tmpvar_114.x = (tmpvar_111.x + 1.0);
      tmpvar_114.y = tmpvar_111.y;
      float tmpvar_115;
      tmpvar_115 = fract((cos(
        dot (tmpvar_114, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_116;
      tmpvar_116.x = tmpvar_111.x;
      tmpvar_116.y = (tmpvar_111.y + 1.0);
      float tmpvar_117;
      tmpvar_117 = fract((cos(
        dot (tmpvar_116, vec2(21.9898, 78.233))
      ) * 43758.55));
      f_93 = (f_93 + (0.125 * (
        ((tmpvar_113 + ((tmpvar_115 - tmpvar_113) * uv_110.x)) + ((tmpvar_117 - tmpvar_113) * uv_110.y))
       + 
        ((((
          (tmpvar_113 - tmpvar_115)
         - tmpvar_117) + fract(
          (cos(dot ((tmpvar_111 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_110.x) * uv_110.y)
      )));
      p_92 = (p_92 * mat2(1.206, 1.206, -1.206, 1.608));
      vec2 uv_118;
      vec2 tmpvar_119;
      tmpvar_119 = floor(p_92);
      vec2 tmpvar_120;
      tmpvar_120 = (p_92 - tmpvar_119);
      uv_118 = ((tmpvar_120 * tmpvar_120) * (3.0 - (2.0 * tmpvar_120)));
      float tmpvar_121;
      tmpvar_121 = fract((cos(
        dot (tmpvar_119, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_122;
      tmpvar_122.x = (tmpvar_119.x + 1.0);
      tmpvar_122.y = tmpvar_119.y;
      float tmpvar_123;
      tmpvar_123 = fract((cos(
        dot (tmpvar_122, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_124;
      tmpvar_124.x = tmpvar_119.x;
      tmpvar_124.y = (tmpvar_119.y + 1.0);
      float tmpvar_125;
      tmpvar_125 = fract((cos(
        dot (tmpvar_124, vec2(21.9898, 78.233))
      ) * 43758.55));
      f_93 = (f_93 + (0.0625 * (
        ((tmpvar_121 + ((tmpvar_123 - tmpvar_121) * uv_118.x)) + ((tmpvar_125 - tmpvar_121) * uv_118.y))
       + 
        ((((
          (tmpvar_121 - tmpvar_123)
         - tmpvar_125) + fract(
          (cos(dot ((tmpvar_119 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_118.x) * uv_118.y)
      )));
      p_92 = (p_92 * mat2(1.224, 1.224, -1.224, 1.632));
    };
    f_93 = (f_93 / 0.79375);
    float tmpvar_126;
    tmpvar_126 = (0.23 * f_93);
    mat2 tmpvar_127;
    tmpvar_127[0].x = cos((tmpvar_87 * 2.0));
    tmpvar_127[0].y = sin((tmpvar_87 * 2.0));
    tmpvar_127[1].x = -(sin((tmpvar_87 * 2.0)));
    tmpvar_127[1].y = cos((tmpvar_87 * 2.0));
    vec2 p_128;
    p_128 = (tmpvar_127 * ((2.0 * st_83) + tmpvar_89));
    float f_129;
    f_129 = 0.0;
    if (!(best)) {
      p_128 = (p_128 * mat2(0.9012, 0.9012, -0.9012, 1.2016));
    };
    vec2 uv_130;
    vec2 tmpvar_131;
    tmpvar_131 = floor(p_128);
    vec2 tmpvar_132;
    tmpvar_132 = (p_128 - tmpvar_131);
    uv_130 = ((tmpvar_132 * tmpvar_132) * (3.0 - (2.0 * tmpvar_132)));
    float tmpvar_133;
    tmpvar_133 = fract((cos(
      dot (tmpvar_131, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_134;
    tmpvar_134.x = (tmpvar_131.x + 1.0);
    tmpvar_134.y = tmpvar_131.y;
    float tmpvar_135;
    tmpvar_135 = fract((cos(
      dot (tmpvar_134, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_136;
    tmpvar_136.x = tmpvar_131.x;
    tmpvar_136.y = (tmpvar_131.y + 1.0);
    float tmpvar_137;
    tmpvar_137 = fract((cos(
      dot (tmpvar_136, vec2(21.9898, 78.233))
    ) * 43758.55));
    f_129 = (0.5 * ((
      (tmpvar_133 + ((tmpvar_135 - tmpvar_133) * uv_130.x))
     + 
      ((tmpvar_137 - tmpvar_133) * uv_130.y)
    ) + (
      ((((tmpvar_133 - tmpvar_135) - tmpvar_137) + fract((
        cos(dot ((tmpvar_131 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
       * 43758.55))) * uv_130.x)
     * uv_130.y)));
    p_128 = (p_128 * mat2(1.212, 1.212, -1.212, 1.616));
    vec2 uv_138;
    vec2 tmpvar_139;
    tmpvar_139 = floor(p_128);
    vec2 tmpvar_140;
    tmpvar_140 = (p_128 - tmpvar_139);
    uv_138 = ((tmpvar_140 * tmpvar_140) * (3.0 - (2.0 * tmpvar_140)));
    float tmpvar_141;
    tmpvar_141 = fract((cos(
      dot (tmpvar_139, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_142;
    tmpvar_142.x = (tmpvar_139.x + 1.0);
    tmpvar_142.y = tmpvar_139.y;
    float tmpvar_143;
    tmpvar_143 = fract((cos(
      dot (tmpvar_142, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_144;
    tmpvar_144.x = tmpvar_139.x;
    tmpvar_144.y = (tmpvar_139.y + 1.0);
    float tmpvar_145;
    tmpvar_145 = fract((cos(
      dot (tmpvar_144, vec2(21.9898, 78.233))
    ) * 43758.55));
    f_129 = (f_129 + (0.25 * (
      ((tmpvar_141 + ((tmpvar_143 - tmpvar_141) * uv_138.x)) + ((tmpvar_145 - tmpvar_141) * uv_138.y))
     + 
      ((((
        (tmpvar_141 - tmpvar_143)
       - tmpvar_145) + fract(
        (cos(dot ((tmpvar_139 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
      )) * uv_138.x) * uv_138.y)
    )));
    p_128 = (p_128 * mat2(1.218, 1.218, -1.218, 1.624));
    if (best) {
      vec2 uv_146;
      vec2 tmpvar_147;
      tmpvar_147 = floor(p_128);
      vec2 tmpvar_148;
      tmpvar_148 = (p_128 - tmpvar_147);
      uv_146 = ((tmpvar_148 * tmpvar_148) * (3.0 - (2.0 * tmpvar_148)));
      float tmpvar_149;
      tmpvar_149 = fract((cos(
        dot (tmpvar_147, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_150;
      tmpvar_150.x = (tmpvar_147.x + 1.0);
      tmpvar_150.y = tmpvar_147.y;
      float tmpvar_151;
      tmpvar_151 = fract((cos(
        dot (tmpvar_150, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_152;
      tmpvar_152.x = tmpvar_147.x;
      tmpvar_152.y = (tmpvar_147.y + 1.0);
      float tmpvar_153;
      tmpvar_153 = fract((cos(
        dot (tmpvar_152, vec2(21.9898, 78.233))
      ) * 43758.55));
      f_129 = (f_129 + (0.125 * (
        ((tmpvar_149 + ((tmpvar_151 - tmpvar_149) * uv_146.x)) + ((tmpvar_153 - tmpvar_149) * uv_146.y))
       + 
        ((((
          (tmpvar_149 - tmpvar_151)
         - tmpvar_153) + fract(
          (cos(dot ((tmpvar_147 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_146.x) * uv_146.y)
      )));
      p_128 = (p_128 * mat2(1.206, 1.206, -1.206, 1.608));
      vec2 uv_154;
      vec2 tmpvar_155;
      tmpvar_155 = floor(p_128);
      vec2 tmpvar_156;
      tmpvar_156 = (p_128 - tmpvar_155);
      uv_154 = ((tmpvar_156 * tmpvar_156) * (3.0 - (2.0 * tmpvar_156)));
      float tmpvar_157;
      tmpvar_157 = fract((cos(
        dot (tmpvar_155, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_158;
      tmpvar_158.x = (tmpvar_155.x + 1.0);
      tmpvar_158.y = tmpvar_155.y;
      float tmpvar_159;
      tmpvar_159 = fract((cos(
        dot (tmpvar_158, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_160;
      tmpvar_160.x = tmpvar_155.x;
      tmpvar_160.y = (tmpvar_155.y + 1.0);
      float tmpvar_161;
      tmpvar_161 = fract((cos(
        dot (tmpvar_160, vec2(21.9898, 78.233))
      ) * 43758.55));
      f_129 = (f_129 + (0.0625 * (
        ((tmpvar_157 + ((tmpvar_159 - tmpvar_157) * uv_154.x)) + ((tmpvar_161 - tmpvar_157) * uv_154.y))
       + 
        ((((
          (tmpvar_157 - tmpvar_159)
         - tmpvar_161) + fract(
          (cos(dot ((tmpvar_155 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_154.x) * uv_154.y)
      )));
      p_128 = (p_128 * mat2(1.224, 1.224, -1.224, 1.632));
    };
    f_129 = (f_129 / 0.79375);
    float tmpvar_162;
    tmpvar_162 = (0.24 * f_129);
    mat2 tmpvar_163;
    tmpvar_163[0].x = cos((tmpvar_87 * 1.5));
    tmpvar_163[0].y = sin((tmpvar_87 * 1.5));
    tmpvar_163[1].x = -(sin((tmpvar_87 * 1.5)));
    tmpvar_163[1].y = cos((tmpvar_87 * 1.5));
    vec2 p_164;
    p_164 = (tmpvar_163 * (st_83 + tmpvar_90));
    float f_165;
    f_165 = 0.0;
    if (!(best)) {
      p_164 = (p_164 * mat2(0.9012, 0.9012, -0.9012, 1.2016));
    };
    vec2 uv_166;
    vec2 tmpvar_167;
    tmpvar_167 = floor(p_164);
    vec2 tmpvar_168;
    tmpvar_168 = (p_164 - tmpvar_167);
    uv_166 = ((tmpvar_168 * tmpvar_168) * (3.0 - (2.0 * tmpvar_168)));
    float tmpvar_169;
    tmpvar_169 = fract((cos(
      dot (tmpvar_167, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_170;
    tmpvar_170.x = (tmpvar_167.x + 1.0);
    tmpvar_170.y = tmpvar_167.y;
    float tmpvar_171;
    tmpvar_171 = fract((cos(
      dot (tmpvar_170, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_172;
    tmpvar_172.x = tmpvar_167.x;
    tmpvar_172.y = (tmpvar_167.y + 1.0);
    float tmpvar_173;
    tmpvar_173 = fract((cos(
      dot (tmpvar_172, vec2(21.9898, 78.233))
    ) * 43758.55));
    f_165 = (0.5 * ((
      (tmpvar_169 + ((tmpvar_171 - tmpvar_169) * uv_166.x))
     + 
      ((tmpvar_173 - tmpvar_169) * uv_166.y)
    ) + (
      ((((tmpvar_169 - tmpvar_171) - tmpvar_173) + fract((
        cos(dot ((tmpvar_167 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
       * 43758.55))) * uv_166.x)
     * uv_166.y)));
    p_164 = (p_164 * mat2(1.212, 1.212, -1.212, 1.616));
    vec2 uv_174;
    vec2 tmpvar_175;
    tmpvar_175 = floor(p_164);
    vec2 tmpvar_176;
    tmpvar_176 = (p_164 - tmpvar_175);
    uv_174 = ((tmpvar_176 * tmpvar_176) * (3.0 - (2.0 * tmpvar_176)));
    float tmpvar_177;
    tmpvar_177 = fract((cos(
      dot (tmpvar_175, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_178;
    tmpvar_178.x = (tmpvar_175.x + 1.0);
    tmpvar_178.y = tmpvar_175.y;
    float tmpvar_179;
    tmpvar_179 = fract((cos(
      dot (tmpvar_178, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_180;
    tmpvar_180.x = tmpvar_175.x;
    tmpvar_180.y = (tmpvar_175.y + 1.0);
    float tmpvar_181;
    tmpvar_181 = fract((cos(
      dot (tmpvar_180, vec2(21.9898, 78.233))
    ) * 43758.55));
    f_165 = (f_165 + (0.25 * (
      ((tmpvar_177 + ((tmpvar_179 - tmpvar_177) * uv_174.x)) + ((tmpvar_181 - tmpvar_177) * uv_174.y))
     + 
      ((((
        (tmpvar_177 - tmpvar_179)
       - tmpvar_181) + fract(
        (cos(dot ((tmpvar_175 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
      )) * uv_174.x) * uv_174.y)
    )));
    p_164 = (p_164 * mat2(1.218, 1.218, -1.218, 1.624));
    if (best) {
      vec2 uv_182;
      vec2 tmpvar_183;
      tmpvar_183 = floor(p_164);
      vec2 tmpvar_184;
      tmpvar_184 = (p_164 - tmpvar_183);
      uv_182 = ((tmpvar_184 * tmpvar_184) * (3.0 - (2.0 * tmpvar_184)));
      float tmpvar_185;
      tmpvar_185 = fract((cos(
        dot (tmpvar_183, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_186;
      tmpvar_186.x = (tmpvar_183.x + 1.0);
      tmpvar_186.y = tmpvar_183.y;
      float tmpvar_187;
      tmpvar_187 = fract((cos(
        dot (tmpvar_186, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_188;
      tmpvar_188.x = tmpvar_183.x;
      tmpvar_188.y = (tmpvar_183.y + 1.0);
      float tmpvar_189;
      tmpvar_189 = fract((cos(
        dot (tmpvar_188, vec2(21.9898, 78.233))
      ) * 43758.55));
      f_165 = (f_165 + (0.125 * (
        ((tmpvar_185 + ((tmpvar_187 - tmpvar_185) * uv_182.x)) + ((tmpvar_189 - tmpvar_185) * uv_182.y))
       + 
        ((((
          (tmpvar_185 - tmpvar_187)
         - tmpvar_189) + fract(
          (cos(dot ((tmpvar_183 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_182.x) * uv_182.y)
      )));
      p_164 = (p_164 * mat2(1.206, 1.206, -1.206, 1.608));
      vec2 uv_190;
      vec2 tmpvar_191;
      tmpvar_191 = floor(p_164);
      vec2 tmpvar_192;
      tmpvar_192 = (p_164 - tmpvar_191);
      uv_190 = ((tmpvar_192 * tmpvar_192) * (3.0 - (2.0 * tmpvar_192)));
      float tmpvar_193;
      tmpvar_193 = fract((cos(
        dot (tmpvar_191, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_194;
      tmpvar_194.x = (tmpvar_191.x + 1.0);
      tmpvar_194.y = tmpvar_191.y;
      float tmpvar_195;
      tmpvar_195 = fract((cos(
        dot (tmpvar_194, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_196;
      tmpvar_196.x = tmpvar_191.x;
      tmpvar_196.y = (tmpvar_191.y + 1.0);
      float tmpvar_197;
      tmpvar_197 = fract((cos(
        dot (tmpvar_196, vec2(21.9898, 78.233))
      ) * 43758.55));
      f_165 = (f_165 + (0.0625 * (
        ((tmpvar_193 + ((tmpvar_195 - tmpvar_193) * uv_190.x)) + ((tmpvar_197 - tmpvar_193) * uv_190.y))
       + 
        ((((
          (tmpvar_193 - tmpvar_195)
         - tmpvar_197) + fract(
          (cos(dot ((tmpvar_191 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_190.x) * uv_190.y)
      )));
      p_164 = (p_164 * mat2(1.224, 1.224, -1.224, 1.632));
    };
    f_165 = (f_165 / 0.79375);
    vec4 tmpvar_198;
    tmpvar_198.w = 1.0;
    tmpvar_198.x = tmpvar_126;
    tmpvar_198.y = tmpvar_162;
    tmpvar_198.z = (0.26 * f_165);
    vec4 tmpvar_199;
    tmpvar_199 = pow (tmpvar_198, vec4(1.3, 1.3, 1.3, 1.3));
    cl_82 = (tmpvar_199 + tmpvar_199);
    vec4 tmpvar_200;
    tmpvar_200 = pow ((cl_82 + cl_82), vec4(1.5, 1.5, 1.5, 1.5));
    cl_82 = (pow ((
      (tmpvar_200 + tmpvar_200)
     + tmpvar_200), vec4(1.5, 1.5, 1.5, 1.5)) * 0.7);
    vec4 tmpvar_201;
    tmpvar_201 = ((cl_82 + cl_82) * 0.15);
    cl_82 = (tmpvar_201 + (tmpvar_201 * 2.0));
    vec2 x_202;
    x_202 = (uv_84 / 2.0);
    cl_82.xyz = (cl_82.xyz + (0.5 * pow (
      (1.0 - sqrt(dot (x_202, x_202)))
    , 2.5)));
    cl_82 = (0.9 * clamp (cl_82, vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0)));
    vec4 tmpvar_203;
    tmpvar_203 = clamp (vec4(-2.333333, -2.333333, -2.333333, -2.333333), 0.0, 1.0);
    vec4 tmpvar_204;
    tmpvar_204 = clamp ((tmpvar_203 * (tmpvar_203 * 
      (3.0 - (2.0 * tmpvar_203))
    )), 0.0, 1.0);
    cl_82 = (cl_82 + (tmpvar_204 * (tmpvar_204 * 
      (3.0 - (2.0 * tmpvar_204))
    )));
    vec2 p_205;
    p_205 = (st_83 * 0.4);
    float f_206;
    f_206 = 0.0;
    if (!(best)) {
      p_205 = (p_205 * mat2(0.9012, 0.9012, -0.9012, 1.2016));
    };
    vec2 uv_207;
    vec2 tmpvar_208;
    tmpvar_208 = floor(p_205);
    vec2 tmpvar_209;
    tmpvar_209 = (p_205 - tmpvar_208);
    uv_207 = ((tmpvar_209 * tmpvar_209) * (3.0 - (2.0 * tmpvar_209)));
    float tmpvar_210;
    tmpvar_210 = fract((cos(
      dot (tmpvar_208, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_211;
    tmpvar_211.x = (tmpvar_208.x + 1.0);
    tmpvar_211.y = tmpvar_208.y;
    float tmpvar_212;
    tmpvar_212 = fract((cos(
      dot (tmpvar_211, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_213;
    tmpvar_213.x = tmpvar_208.x;
    tmpvar_213.y = (tmpvar_208.y + 1.0);
    float tmpvar_214;
    tmpvar_214 = fract((cos(
      dot (tmpvar_213, vec2(21.9898, 78.233))
    ) * 43758.55));
    f_206 = (0.5 * ((
      (tmpvar_210 + ((tmpvar_212 - tmpvar_210) * uv_207.x))
     + 
      ((tmpvar_214 - tmpvar_210) * uv_207.y)
    ) + (
      ((((tmpvar_210 - tmpvar_212) - tmpvar_214) + fract((
        cos(dot ((tmpvar_208 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
       * 43758.55))) * uv_207.x)
     * uv_207.y)));
    p_205 = (p_205 * mat2(1.212, 1.212, -1.212, 1.616));
    vec2 uv_215;
    vec2 tmpvar_216;
    tmpvar_216 = floor(p_205);
    vec2 tmpvar_217;
    tmpvar_217 = (p_205 - tmpvar_216);
    uv_215 = ((tmpvar_217 * tmpvar_217) * (3.0 - (2.0 * tmpvar_217)));
    float tmpvar_218;
    tmpvar_218 = fract((cos(
      dot (tmpvar_216, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_219;
    tmpvar_219.x = (tmpvar_216.x + 1.0);
    tmpvar_219.y = tmpvar_216.y;
    float tmpvar_220;
    tmpvar_220 = fract((cos(
      dot (tmpvar_219, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_221;
    tmpvar_221.x = tmpvar_216.x;
    tmpvar_221.y = (tmpvar_216.y + 1.0);
    float tmpvar_222;
    tmpvar_222 = fract((cos(
      dot (tmpvar_221, vec2(21.9898, 78.233))
    ) * 43758.55));
    f_206 = (f_206 + (0.25 * (
      ((tmpvar_218 + ((tmpvar_220 - tmpvar_218) * uv_215.x)) + ((tmpvar_222 - tmpvar_218) * uv_215.y))
     + 
      ((((
        (tmpvar_218 - tmpvar_220)
       - tmpvar_222) + fract(
        (cos(dot ((tmpvar_216 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
      )) * uv_215.x) * uv_215.y)
    )));
    p_205 = (p_205 * mat2(1.218, 1.218, -1.218, 1.624));
    if (best) {
      vec2 uv_223;
      vec2 tmpvar_224;
      tmpvar_224 = floor(p_205);
      vec2 tmpvar_225;
      tmpvar_225 = (p_205 - tmpvar_224);
      uv_223 = ((tmpvar_225 * tmpvar_225) * (3.0 - (2.0 * tmpvar_225)));
      float tmpvar_226;
      tmpvar_226 = fract((cos(
        dot (tmpvar_224, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_227;
      tmpvar_227.x = (tmpvar_224.x + 1.0);
      tmpvar_227.y = tmpvar_224.y;
      float tmpvar_228;
      tmpvar_228 = fract((cos(
        dot (tmpvar_227, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_229;
      tmpvar_229.x = tmpvar_224.x;
      tmpvar_229.y = (tmpvar_224.y + 1.0);
      float tmpvar_230;
      tmpvar_230 = fract((cos(
        dot (tmpvar_229, vec2(21.9898, 78.233))
      ) * 43758.55));
      f_206 = (f_206 + (0.125 * (
        ((tmpvar_226 + ((tmpvar_228 - tmpvar_226) * uv_223.x)) + ((tmpvar_230 - tmpvar_226) * uv_223.y))
       + 
        ((((
          (tmpvar_226 - tmpvar_228)
         - tmpvar_230) + fract(
          (cos(dot ((tmpvar_224 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_223.x) * uv_223.y)
      )));
      p_205 = (p_205 * mat2(1.206, 1.206, -1.206, 1.608));
      vec2 uv_231;
      vec2 tmpvar_232;
      tmpvar_232 = floor(p_205);
      vec2 tmpvar_233;
      tmpvar_233 = (p_205 - tmpvar_232);
      uv_231 = ((tmpvar_233 * tmpvar_233) * (3.0 - (2.0 * tmpvar_233)));
      float tmpvar_234;
      tmpvar_234 = fract((cos(
        dot (tmpvar_232, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_235;
      tmpvar_235.x = (tmpvar_232.x + 1.0);
      tmpvar_235.y = tmpvar_232.y;
      float tmpvar_236;
      tmpvar_236 = fract((cos(
        dot (tmpvar_235, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_237;
      tmpvar_237.x = tmpvar_232.x;
      tmpvar_237.y = (tmpvar_232.y + 1.0);
      float tmpvar_238;
      tmpvar_238 = fract((cos(
        dot (tmpvar_237, vec2(21.9898, 78.233))
      ) * 43758.55));
      f_206 = (f_206 + (0.0625 * (
        ((tmpvar_234 + ((tmpvar_236 - tmpvar_234) * uv_231.x)) + ((tmpvar_238 - tmpvar_234) * uv_231.y))
       + 
        ((((
          (tmpvar_234 - tmpvar_236)
         - tmpvar_238) + fract(
          (cos(dot ((tmpvar_232 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_231.x) * uv_231.y)
      )));
      p_205 = (p_205 * mat2(1.224, 1.224, -1.224, 1.632));
    };
    f_206 = (f_206 / 0.79375);
    vec2 p_239;
    p_239 = ((f_206 - vec2(tmpvar_87)) * 15.0);
    float f_240;
    f_240 = 0.0;
    if (!(best)) {
      p_239 = (p_239 * mat2(0.9012, 0.9012, -0.9012, 1.2016));
    };
    vec2 uv_241;
    vec2 tmpvar_242;
    tmpvar_242 = floor(p_239);
    vec2 tmpvar_243;
    tmpvar_243 = (p_239 - tmpvar_242);
    uv_241 = ((tmpvar_243 * tmpvar_243) * (3.0 - (2.0 * tmpvar_243)));
    float tmpvar_244;
    tmpvar_244 = fract((cos(
      dot (tmpvar_242, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_245;
    tmpvar_245.x = (tmpvar_242.x + 1.0);
    tmpvar_245.y = tmpvar_242.y;
    float tmpvar_246;
    tmpvar_246 = fract((cos(
      dot (tmpvar_245, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_247;
    tmpvar_247.x = tmpvar_242.x;
    tmpvar_247.y = (tmpvar_242.y + 1.0);
    float tmpvar_248;
    tmpvar_248 = fract((cos(
      dot (tmpvar_247, vec2(21.9898, 78.233))
    ) * 43758.55));
    f_240 = (0.5 * ((
      (tmpvar_244 + ((tmpvar_246 - tmpvar_244) * uv_241.x))
     + 
      ((tmpvar_248 - tmpvar_244) * uv_241.y)
    ) + (
      ((((tmpvar_244 - tmpvar_246) - tmpvar_248) + fract((
        cos(dot ((tmpvar_242 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
       * 43758.55))) * uv_241.x)
     * uv_241.y)));
    p_239 = (p_239 * mat2(1.212, 1.212, -1.212, 1.616));
    vec2 uv_249;
    vec2 tmpvar_250;
    tmpvar_250 = floor(p_239);
    vec2 tmpvar_251;
    tmpvar_251 = (p_239 - tmpvar_250);
    uv_249 = ((tmpvar_251 * tmpvar_251) * (3.0 - (2.0 * tmpvar_251)));
    float tmpvar_252;
    tmpvar_252 = fract((cos(
      dot (tmpvar_250, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_253;
    tmpvar_253.x = (tmpvar_250.x + 1.0);
    tmpvar_253.y = tmpvar_250.y;
    float tmpvar_254;
    tmpvar_254 = fract((cos(
      dot (tmpvar_253, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_255;
    tmpvar_255.x = tmpvar_250.x;
    tmpvar_255.y = (tmpvar_250.y + 1.0);
    float tmpvar_256;
    tmpvar_256 = fract((cos(
      dot (tmpvar_255, vec2(21.9898, 78.233))
    ) * 43758.55));
    f_240 = (f_240 + (0.25 * (
      ((tmpvar_252 + ((tmpvar_254 - tmpvar_252) * uv_249.x)) + ((tmpvar_256 - tmpvar_252) * uv_249.y))
     + 
      ((((
        (tmpvar_252 - tmpvar_254)
       - tmpvar_256) + fract(
        (cos(dot ((tmpvar_250 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
      )) * uv_249.x) * uv_249.y)
    )));
    p_239 = (p_239 * mat2(1.218, 1.218, -1.218, 1.624));
    if (best) {
      vec2 uv_257;
      vec2 tmpvar_258;
      tmpvar_258 = floor(p_239);
      vec2 tmpvar_259;
      tmpvar_259 = (p_239 - tmpvar_258);
      uv_257 = ((tmpvar_259 * tmpvar_259) * (3.0 - (2.0 * tmpvar_259)));
      float tmpvar_260;
      tmpvar_260 = fract((cos(
        dot (tmpvar_258, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_261;
      tmpvar_261.x = (tmpvar_258.x + 1.0);
      tmpvar_261.y = tmpvar_258.y;
      float tmpvar_262;
      tmpvar_262 = fract((cos(
        dot (tmpvar_261, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_263;
      tmpvar_263.x = tmpvar_258.x;
      tmpvar_263.y = (tmpvar_258.y + 1.0);
      float tmpvar_264;
      tmpvar_264 = fract((cos(
        dot (tmpvar_263, vec2(21.9898, 78.233))
      ) * 43758.55));
      f_240 = (f_240 + (0.125 * (
        ((tmpvar_260 + ((tmpvar_262 - tmpvar_260) * uv_257.x)) + ((tmpvar_264 - tmpvar_260) * uv_257.y))
       + 
        ((((
          (tmpvar_260 - tmpvar_262)
         - tmpvar_264) + fract(
          (cos(dot ((tmpvar_258 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_257.x) * uv_257.y)
      )));
      p_239 = (p_239 * mat2(1.206, 1.206, -1.206, 1.608));
      vec2 uv_265;
      vec2 tmpvar_266;
      tmpvar_266 = floor(p_239);
      vec2 tmpvar_267;
      tmpvar_267 = (p_239 - tmpvar_266);
      uv_265 = ((tmpvar_267 * tmpvar_267) * (3.0 - (2.0 * tmpvar_267)));
      float tmpvar_268;
      tmpvar_268 = fract((cos(
        dot (tmpvar_266, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_269;
      tmpvar_269.x = (tmpvar_266.x + 1.0);
      tmpvar_269.y = tmpvar_266.y;
      float tmpvar_270;
      tmpvar_270 = fract((cos(
        dot (tmpvar_269, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_271;
      tmpvar_271.x = tmpvar_266.x;
      tmpvar_271.y = (tmpvar_266.y + 1.0);
      float tmpvar_272;
      tmpvar_272 = fract((cos(
        dot (tmpvar_271, vec2(21.9898, 78.233))
      ) * 43758.55));
      f_240 = (f_240 + (0.0625 * (
        ((tmpvar_268 + ((tmpvar_270 - tmpvar_268) * uv_265.x)) + ((tmpvar_272 - tmpvar_268) * uv_265.y))
       + 
        ((((
          (tmpvar_268 - tmpvar_270)
         - tmpvar_272) + fract(
          (cos(dot ((tmpvar_266 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_265.x) * uv_265.y)
      )));
      p_239 = (p_239 * mat2(1.224, 1.224, -1.224, 1.632));
    };
    f_240 = (f_240 / 0.79375);
    float tmpvar_273;
    tmpvar_273 = (f_240 * ((0.2 * 
      dot (uv_84, uv_84)
    ) - 0.5));
    vec4 tmpvar_274;
    tmpvar_274 = mix (cl_82, ((cl_82 + tmpvar_273) + (tmpvar_273 + tmpvar_273)), 0.6);
    cl_82 = tmpvar_274;
    vec2 tmpvar_275;
    tmpvar_275.x = (-(time) * 0.3);
    tmpvar_275.y = (time * 0.3);
    vec2 p_276;
    p_276 = (tmpvar_275 + (uv_84 * 20.0));
    float f_277;
    f_277 = 0.0;
    if (!(best)) {
      p_276 = (p_276 * mat2(0.9012, 0.9012, -0.9012, 1.2016));
    };
    vec2 uv_278;
    vec2 tmpvar_279;
    tmpvar_279 = floor(p_276);
    vec2 tmpvar_280;
    tmpvar_280 = (p_276 - tmpvar_279);
    uv_278 = ((tmpvar_280 * tmpvar_280) * (3.0 - (2.0 * tmpvar_280)));
    float tmpvar_281;
    tmpvar_281 = fract((cos(
      dot (tmpvar_279, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_282;
    tmpvar_282.x = (tmpvar_279.x + 1.0);
    tmpvar_282.y = tmpvar_279.y;
    float tmpvar_283;
    tmpvar_283 = fract((cos(
      dot (tmpvar_282, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_284;
    tmpvar_284.x = tmpvar_279.x;
    tmpvar_284.y = (tmpvar_279.y + 1.0);
    float tmpvar_285;
    tmpvar_285 = fract((cos(
      dot (tmpvar_284, vec2(21.9898, 78.233))
    ) * 43758.55));
    f_277 = (0.5 * ((
      (tmpvar_281 + ((tmpvar_283 - tmpvar_281) * uv_278.x))
     + 
      ((tmpvar_285 - tmpvar_281) * uv_278.y)
    ) + (
      ((((tmpvar_281 - tmpvar_283) - tmpvar_285) + fract((
        cos(dot ((tmpvar_279 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
       * 43758.55))) * uv_278.x)
     * uv_278.y)));
    p_276 = (p_276 * mat2(1.212, 1.212, -1.212, 1.616));
    vec2 uv_286;
    vec2 tmpvar_287;
    tmpvar_287 = floor(p_276);
    vec2 tmpvar_288;
    tmpvar_288 = (p_276 - tmpvar_287);
    uv_286 = ((tmpvar_288 * tmpvar_288) * (3.0 - (2.0 * tmpvar_288)));
    float tmpvar_289;
    tmpvar_289 = fract((cos(
      dot (tmpvar_287, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_290;
    tmpvar_290.x = (tmpvar_287.x + 1.0);
    tmpvar_290.y = tmpvar_287.y;
    float tmpvar_291;
    tmpvar_291 = fract((cos(
      dot (tmpvar_290, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_292;
    tmpvar_292.x = tmpvar_287.x;
    tmpvar_292.y = (tmpvar_287.y + 1.0);
    float tmpvar_293;
    tmpvar_293 = fract((cos(
      dot (tmpvar_292, vec2(21.9898, 78.233))
    ) * 43758.55));
    f_277 = (f_277 + (0.25 * (
      ((tmpvar_289 + ((tmpvar_291 - tmpvar_289) * uv_286.x)) + ((tmpvar_293 - tmpvar_289) * uv_286.y))
     + 
      ((((
        (tmpvar_289 - tmpvar_291)
       - tmpvar_293) + fract(
        (cos(dot ((tmpvar_287 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
      )) * uv_286.x) * uv_286.y)
    )));
    p_276 = (p_276 * mat2(1.218, 1.218, -1.218, 1.624));
    if (best) {
      vec2 uv_294;
      vec2 tmpvar_295;
      tmpvar_295 = floor(p_276);
      vec2 tmpvar_296;
      tmpvar_296 = (p_276 - tmpvar_295);
      uv_294 = ((tmpvar_296 * tmpvar_296) * (3.0 - (2.0 * tmpvar_296)));
      float tmpvar_297;
      tmpvar_297 = fract((cos(
        dot (tmpvar_295, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_298;
      tmpvar_298.x = (tmpvar_295.x + 1.0);
      tmpvar_298.y = tmpvar_295.y;
      float tmpvar_299;
      tmpvar_299 = fract((cos(
        dot (tmpvar_298, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_300;
      tmpvar_300.x = tmpvar_295.x;
      tmpvar_300.y = (tmpvar_295.y + 1.0);
      float tmpvar_301;
      tmpvar_301 = fract((cos(
        dot (tmpvar_300, vec2(21.9898, 78.233))
      ) * 43758.55));
      f_277 = (f_277 + (0.125 * (
        ((tmpvar_297 + ((tmpvar_299 - tmpvar_297) * uv_294.x)) + ((tmpvar_301 - tmpvar_297) * uv_294.y))
       + 
        ((((
          (tmpvar_297 - tmpvar_299)
         - tmpvar_301) + fract(
          (cos(dot ((tmpvar_295 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_294.x) * uv_294.y)
      )));
      p_276 = (p_276 * mat2(1.206, 1.206, -1.206, 1.608));
      vec2 uv_302;
      vec2 tmpvar_303;
      tmpvar_303 = floor(p_276);
      vec2 tmpvar_304;
      tmpvar_304 = (p_276 - tmpvar_303);
      uv_302 = ((tmpvar_304 * tmpvar_304) * (3.0 - (2.0 * tmpvar_304)));
      float tmpvar_305;
      tmpvar_305 = fract((cos(
        dot (tmpvar_303, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_306;
      tmpvar_306.x = (tmpvar_303.x + 1.0);
      tmpvar_306.y = tmpvar_303.y;
      float tmpvar_307;
      tmpvar_307 = fract((cos(
        dot (tmpvar_306, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_308;
      tmpvar_308.x = tmpvar_303.x;
      tmpvar_308.y = (tmpvar_303.y + 1.0);
      float tmpvar_309;
      tmpvar_309 = fract((cos(
        dot (tmpvar_308, vec2(21.9898, 78.233))
      ) * 43758.55));
      f_277 = (f_277 + (0.0625 * (
        ((tmpvar_305 + ((tmpvar_307 - tmpvar_305) * uv_302.x)) + ((tmpvar_309 - tmpvar_305) * uv_302.y))
       + 
        ((((
          (tmpvar_305 - tmpvar_307)
         - tmpvar_309) + fract(
          (cos(dot ((tmpvar_303 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_302.x) * uv_302.y)
      )));
      p_276 = (p_276 * mat2(1.224, 1.224, -1.224, 1.632));
    };
    f_277 = (f_277 / 0.79375);
    cl_82 = (tmpvar_274 + (0.2 * f_277));
    cl_82 = (cl_82 - min (cl_82, vec4(-0.3, 0.0, -0.5, 1.0)));
    cl_82 = (cl_82 - (0.8 * dot (uv_84, uv_84)));
    tmpvar_78 = max (vec4(0.0, 0.0, 0.0, 0.0), cl_82);
  } else {
    tmpvar_78 = vec4(0.0, 0.0, 0.0, 0.0);
  };
  buff_10 = (tmpvar_77 + tmpvar_78);
  vec4 tmpvar_310;
  vec2 tmpvar_311;
  tmpvar_311 = ((gl_FragCoord.xy - (planetpos1 * zoom)) - shippos);
  vec2 x_312;
  x_312 = (tmpvar_311 - (2500.0 * zoom));
  float tmpvar_313;
  tmpvar_313 = float((sqrt(
    dot (x_312, x_312)
  ) >= (3000.0 * zoom)));
  if (((1.0 - tmpvar_313) > 0.0)) {
    vec4 cxu_314;
    float bval_315;
    vec4 c_316;
    vec2 p_317;
    vec2 tmpvar_318;
    tmpvar_318 = vec2((5000.0 * zoom));
    vec2 tmpvar_319;
    tmpvar_319 = (((tmpvar_311 * 2.0) - tmpvar_318) / tmpvar_318.y);
    float tmpvar_320;
    tmpvar_320 = sqrt(dot (tmpvar_319, tmpvar_319));
    vec4 tmpvar_321;
    tmpvar_321 = (vec4(0.63, 0.62, 0.86, 1.0) + tmpvar_319.y);
    c_316 = tmpvar_321;
    p_317 = (((tmpvar_319 * 
      (sign(tmpvar_320) * (1.570796 - (sqrt(
        (1.0 - abs(tmpvar_320))
      ) * (1.570796 + 
        (abs(tmpvar_320) * (-0.2146018 + (abs(tmpvar_320) * (0.08656672 + 
          (abs(tmpvar_320) * -0.03102955)
        ))))
      ))))
    ) / tmpvar_320) - 5.0);
    p_317 = (p_317 * p_317.y);
    bval_315 = 0.021;
    if (best) {
      bval_315 = 0.1;
      float r_322;
      vec2 tmpvar_323;
      tmpvar_323 = ((0.7 * p_317) - 0.5);
      float tmpvar_324;
      tmpvar_324 = sqrt(((tmpvar_323.x * tmpvar_323.x) + (tmpvar_323.y * tmpvar_323.y)));
      float tmpvar_325;
      float tmpvar_326;
      tmpvar_326 = (min (abs(
        (tmpvar_323.y / tmpvar_323.x)
      ), 1.0) / max (abs(
        (tmpvar_323.y / tmpvar_323.x)
      ), 1.0));
      float tmpvar_327;
      tmpvar_327 = (tmpvar_326 * tmpvar_326);
      tmpvar_327 = (((
        ((((
          ((((-0.01213232 * tmpvar_327) + 0.05368138) * tmpvar_327) - 0.1173503)
         * tmpvar_327) + 0.1938925) * tmpvar_327) - 0.3326756)
       * tmpvar_327) + 0.9999793) * tmpvar_326);
      tmpvar_327 = (tmpvar_327 + (float(
        (abs((tmpvar_323.y / tmpvar_323.x)) > 1.0)
      ) * (
        (tmpvar_327 * -2.0)
       + 1.570796)));
      tmpvar_325 = (tmpvar_327 * sign((tmpvar_323.y / tmpvar_323.x)));
      if ((abs(tmpvar_323.x) > (1e-08 * abs(tmpvar_323.y)))) {
        if ((tmpvar_323.x < 0.0)) {
          if ((tmpvar_323.y >= 0.0)) {
            tmpvar_325 += 3.141593;
          } else {
            tmpvar_325 = (tmpvar_325 - 3.141593);
          };
        };
      } else {
        tmpvar_325 = (sign(tmpvar_323.y) * 1.570796);
      };
      float tmpvar_328;
      tmpvar_328 = (tmpvar_325 + (time / 100.0));
      vec2 tmpvar_329;
      tmpvar_329.x = (tmpvar_324 * cos(tmpvar_328));
      tmpvar_329.y = (tmpvar_324 * sin(tmpvar_328));
      float tmpvar_330;
      float tmpvar_331;
      tmpvar_331 = (time / 10.0);
      tmpvar_330 = (2.0 + (0.2 * cos(tmpvar_331)));
      float tmpvar_332;
      tmpvar_332 = (2.0 - (0.2 * sin(tmpvar_331)));
      vec2 v_333;
      v_333 = (10.0 * tmpvar_329);
      int bval_335;
      float amplitude_336;
      float value_337;
      value_337 = 0.0;
      amplitude_336 = 0.5;
      bval_335 = 2;
      if (best) {
        bval_335 = 4;
      };
      for (int i_334 = 0; i_334 < bval_335; i_334++) {
        vec2 uv_338;
        vec2 tmpvar_339;
        tmpvar_339 = floor(v_333);
        vec2 tmpvar_340;
        tmpvar_340 = (v_333 - tmpvar_339);
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
        v_333 = (v_333 * 2.0);
        amplitude_336 = (amplitude_336 * 0.5);
        vec2 xy_346;
        xy_346 = (v_333 * 2.0);
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
      r_322 = (sin((
        (((tmpvar_329.x * tmpvar_330) * 6.283) + ((tmpvar_329.y * tmpvar_332) * 6.283))
       + 
        (15.0 * value_337)
      )) + 1.0);
      vec4 tmpvar_355;
      tmpvar_355.w = 1.0;
      tmpvar_355.x = r_322;
      tmpvar_355.y = r_322;
      tmpvar_355.z = r_322;
      c_316 = (tmpvar_321 + ((tmpvar_355 * vec4(0.75, 1.0, 0.75, 1.0)) + (
        (1.0 - tmpvar_355)
       * vec4(0.0, 0.25, 0.0, 1.0))));
      p_317 = (p_317 * 0.4);
      c_316 = (c_316 * 0.6);
      float r_356;
      vec2 tmpvar_357;
      tmpvar_357 = ((0.7 * p_317) - 0.5);
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
      int bval_369;
      float amplitude_370;
      float value_371;
      value_371 = 0.0;
      amplitude_370 = 0.5;
      bval_369 = 2;
      if (best) {
        bval_369 = 4;
      };
      for (int i_368 = 0; i_368 < bval_369; i_368++) {
        vec2 uv_372;
        vec2 tmpvar_373;
        tmpvar_373 = floor(v_367);
        vec2 tmpvar_374;
        tmpvar_374 = (v_367 - tmpvar_373);
        uv_372 = ((tmpvar_374 * tmpvar_374) * (3.0 - (2.0 * tmpvar_374)));
        float tmpvar_375;
        tmpvar_375 = fract((cos(
          dot (tmpvar_373, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 tmpvar_376;
        tmpvar_376.x = (tmpvar_373.x + 1.0);
        tmpvar_376.y = tmpvar_373.y;
        float tmpvar_377;
        tmpvar_377 = fract((cos(
          dot (tmpvar_376, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 tmpvar_378;
        tmpvar_378.x = tmpvar_373.x;
        tmpvar_378.y = (tmpvar_373.y + 1.0);
        float tmpvar_379;
        tmpvar_379 = fract((cos(
          dot (tmpvar_378, vec2(21.9898, 78.233))
        ) * 43758.55));
        value_371 = (value_371 + (amplitude_370 * (
          ((tmpvar_375 + ((tmpvar_377 - tmpvar_375) * uv_372.x)) + ((tmpvar_379 - tmpvar_375) * uv_372.y))
         + 
          ((((
            (tmpvar_375 - tmpvar_377)
           - tmpvar_379) + fract(
            (cos(dot ((tmpvar_373 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
          )) * uv_372.x) * uv_372.y)
        )));
        v_367 = (v_367 * 2.0);
        amplitude_370 = (amplitude_370 * 0.5);
        vec2 xy_380;
        xy_380 = (v_367 * 2.0);
        vec2 uv_381;
        vec2 tmpvar_382;
        tmpvar_382 = floor(xy_380);
        vec2 tmpvar_383;
        tmpvar_383 = (xy_380 - tmpvar_382);
        uv_381 = ((tmpvar_383 * tmpvar_383) * (3.0 - (2.0 * tmpvar_383)));
        float tmpvar_384;
        tmpvar_384 = fract((cos(
          dot (tmpvar_382, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 tmpvar_385;
        tmpvar_385.x = (tmpvar_382.x + 1.0);
        tmpvar_385.y = tmpvar_382.y;
        float tmpvar_386;
        tmpvar_386 = fract((cos(
          dot (tmpvar_385, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 tmpvar_387;
        tmpvar_387.x = tmpvar_382.x;
        tmpvar_387.y = (tmpvar_382.y + 1.0);
        float tmpvar_388;
        tmpvar_388 = fract((cos(
          dot (tmpvar_387, vec2(21.9898, 78.233))
        ) * 43758.55));
        value_371 = (value_371 + ((amplitude_370 * 
          (((tmpvar_384 + (
            (tmpvar_386 - tmpvar_384)
           * uv_381.x)) + ((tmpvar_388 - tmpvar_384) * uv_381.y)) + (((
            ((tmpvar_384 - tmpvar_386) - tmpvar_388)
           + 
            fract((cos(dot (
              (tmpvar_382 + vec2(1.0, 1.0))
            , vec2(21.9898, 78.233))) * 43758.55))
          ) * uv_381.x) * uv_381.y))
        ) * 0.5));
        amplitude_370 = (amplitude_370 * 0.5);
      };
      r_356 = (sin((
        (((tmpvar_363.x * tmpvar_364) * 6.283) + ((tmpvar_363.y * tmpvar_366) * 6.283))
       + 
        (15.0 * value_371)
      )) + 1.0);
      vec4 tmpvar_389;
      tmpvar_389.w = 1.0;
      tmpvar_389.x = r_356;
      tmpvar_389.y = r_356;
      tmpvar_389.z = r_356;
      c_316 = (c_316 + ((tmpvar_389 * vec4(0.75, 1.0, 0.75, 1.0)) + (
        (1.0 - tmpvar_389)
       * vec4(0.0, 0.25, 0.0, 1.0))));
      p_317 = (p_317 * 0.4);
      c_316 = (c_316 * 0.6);
    };
    float r_390;
    vec2 tmpvar_391;
    tmpvar_391 = (((p_317 * bval_315) * 7.0) - 0.5);
    float tmpvar_392;
    tmpvar_392 = sqrt(((tmpvar_391.x * tmpvar_391.x) + (tmpvar_391.y * tmpvar_391.y)));
    float tmpvar_393;
    float tmpvar_394;
    tmpvar_394 = (min (abs(
      (tmpvar_391.y / tmpvar_391.x)
    ), 1.0) / max (abs(
      (tmpvar_391.y / tmpvar_391.x)
    ), 1.0));
    float tmpvar_395;
    tmpvar_395 = (tmpvar_394 * tmpvar_394);
    tmpvar_395 = (((
      ((((
        ((((-0.01213232 * tmpvar_395) + 0.05368138) * tmpvar_395) - 0.1173503)
       * tmpvar_395) + 0.1938925) * tmpvar_395) - 0.3326756)
     * tmpvar_395) + 0.9999793) * tmpvar_394);
    tmpvar_395 = (tmpvar_395 + (float(
      (abs((tmpvar_391.y / tmpvar_391.x)) > 1.0)
    ) * (
      (tmpvar_395 * -2.0)
     + 1.570796)));
    tmpvar_393 = (tmpvar_395 * sign((tmpvar_391.y / tmpvar_391.x)));
    if ((abs(tmpvar_391.x) > (1e-08 * abs(tmpvar_391.y)))) {
      if ((tmpvar_391.x < 0.0)) {
        if ((tmpvar_391.y >= 0.0)) {
          tmpvar_393 += 3.141593;
        } else {
          tmpvar_393 = (tmpvar_393 - 3.141593);
        };
      };
    } else {
      tmpvar_393 = (sign(tmpvar_391.y) * 1.570796);
    };
    float tmpvar_396;
    tmpvar_396 = (tmpvar_393 + (time / 100.0));
    vec2 tmpvar_397;
    tmpvar_397.x = (tmpvar_392 * cos(tmpvar_396));
    tmpvar_397.y = (tmpvar_392 * sin(tmpvar_396));
    float tmpvar_398;
    float tmpvar_399;
    tmpvar_399 = (time / 10.0);
    tmpvar_398 = (2.0 + (0.2 * cos(tmpvar_399)));
    float tmpvar_400;
    tmpvar_400 = (2.0 - (0.2 * sin(tmpvar_399)));
    vec2 v_401;
    v_401 = (10.0 * tmpvar_397);
    int bval_403;
    float amplitude_404;
    float value_405;
    value_405 = 0.0;
    amplitude_404 = 0.5;
    bval_403 = 2;
    if (best) {
      bval_403 = 4;
    };
    for (int i_402 = 0; i_402 < bval_403; i_402++) {
      vec2 uv_406;
      vec2 tmpvar_407;
      tmpvar_407 = floor(v_401);
      vec2 tmpvar_408;
      tmpvar_408 = (v_401 - tmpvar_407);
      uv_406 = ((tmpvar_408 * tmpvar_408) * (3.0 - (2.0 * tmpvar_408)));
      float tmpvar_409;
      tmpvar_409 = fract((cos(
        dot (tmpvar_407, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_410;
      tmpvar_410.x = (tmpvar_407.x + 1.0);
      tmpvar_410.y = tmpvar_407.y;
      float tmpvar_411;
      tmpvar_411 = fract((cos(
        dot (tmpvar_410, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_412;
      tmpvar_412.x = tmpvar_407.x;
      tmpvar_412.y = (tmpvar_407.y + 1.0);
      float tmpvar_413;
      tmpvar_413 = fract((cos(
        dot (tmpvar_412, vec2(21.9898, 78.233))
      ) * 43758.55));
      value_405 = (value_405 + (amplitude_404 * (
        ((tmpvar_409 + ((tmpvar_411 - tmpvar_409) * uv_406.x)) + ((tmpvar_413 - tmpvar_409) * uv_406.y))
       + 
        ((((
          (tmpvar_409 - tmpvar_411)
         - tmpvar_413) + fract(
          (cos(dot ((tmpvar_407 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_406.x) * uv_406.y)
      )));
      v_401 = (v_401 * 2.0);
      amplitude_404 = (amplitude_404 * 0.5);
      vec2 xy_414;
      xy_414 = (v_401 * 2.0);
      vec2 uv_415;
      vec2 tmpvar_416;
      tmpvar_416 = floor(xy_414);
      vec2 tmpvar_417;
      tmpvar_417 = (xy_414 - tmpvar_416);
      uv_415 = ((tmpvar_417 * tmpvar_417) * (3.0 - (2.0 * tmpvar_417)));
      float tmpvar_418;
      tmpvar_418 = fract((cos(
        dot (tmpvar_416, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_419;
      tmpvar_419.x = (tmpvar_416.x + 1.0);
      tmpvar_419.y = tmpvar_416.y;
      float tmpvar_420;
      tmpvar_420 = fract((cos(
        dot (tmpvar_419, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_421;
      tmpvar_421.x = tmpvar_416.x;
      tmpvar_421.y = (tmpvar_416.y + 1.0);
      float tmpvar_422;
      tmpvar_422 = fract((cos(
        dot (tmpvar_421, vec2(21.9898, 78.233))
      ) * 43758.55));
      value_405 = (value_405 + ((amplitude_404 * 
        (((tmpvar_418 + (
          (tmpvar_420 - tmpvar_418)
         * uv_415.x)) + ((tmpvar_422 - tmpvar_418) * uv_415.y)) + (((
          ((tmpvar_418 - tmpvar_420) - tmpvar_422)
         + 
          fract((cos(dot (
            (tmpvar_416 + vec2(1.0, 1.0))
          , vec2(21.9898, 78.233))) * 43758.55))
        ) * uv_415.x) * uv_415.y))
      ) * 0.5));
      amplitude_404 = (amplitude_404 * 0.5);
    };
    r_390 = (sin((
      (((tmpvar_397.x * tmpvar_398) * 6.283) + ((tmpvar_397.y * tmpvar_400) * 6.283))
     + 
      (15.0 * value_405)
    )) + 1.0);
    vec4 tmpvar_423;
    tmpvar_423.w = 1.0;
    tmpvar_423.x = r_390;
    tmpvar_423.y = r_390;
    tmpvar_423.z = r_390;
    c_316 = (c_316 + ((tmpvar_423 * vec4(0.75, 1.0, 0.75, 1.0)) + (
      (1.0 - tmpvar_423)
     * vec4(0.0, 0.25, 0.0, 1.0))));
    p_317 = (p_317 * 0.4);
    c_316 = (c_316 * 0.6);
    float r_424;
    vec2 tmpvar_425;
    tmpvar_425 = (((p_317 * bval_315) * 7.0) - 0.5);
    float tmpvar_426;
    tmpvar_426 = sqrt(((tmpvar_425.x * tmpvar_425.x) + (tmpvar_425.y * tmpvar_425.y)));
    float tmpvar_427;
    float tmpvar_428;
    tmpvar_428 = (min (abs(
      (tmpvar_425.y / tmpvar_425.x)
    ), 1.0) / max (abs(
      (tmpvar_425.y / tmpvar_425.x)
    ), 1.0));
    float tmpvar_429;
    tmpvar_429 = (tmpvar_428 * tmpvar_428);
    tmpvar_429 = (((
      ((((
        ((((-0.01213232 * tmpvar_429) + 0.05368138) * tmpvar_429) - 0.1173503)
       * tmpvar_429) + 0.1938925) * tmpvar_429) - 0.3326756)
     * tmpvar_429) + 0.9999793) * tmpvar_428);
    tmpvar_429 = (tmpvar_429 + (float(
      (abs((tmpvar_425.y / tmpvar_425.x)) > 1.0)
    ) * (
      (tmpvar_429 * -2.0)
     + 1.570796)));
    tmpvar_427 = (tmpvar_429 * sign((tmpvar_425.y / tmpvar_425.x)));
    if ((abs(tmpvar_425.x) > (1e-08 * abs(tmpvar_425.y)))) {
      if ((tmpvar_425.x < 0.0)) {
        if ((tmpvar_425.y >= 0.0)) {
          tmpvar_427 += 3.141593;
        } else {
          tmpvar_427 = (tmpvar_427 - 3.141593);
        };
      };
    } else {
      tmpvar_427 = (sign(tmpvar_425.y) * 1.570796);
    };
    float tmpvar_430;
    tmpvar_430 = (tmpvar_427 + (time / 100.0));
    vec2 tmpvar_431;
    tmpvar_431.x = (tmpvar_426 * cos(tmpvar_430));
    tmpvar_431.y = (tmpvar_426 * sin(tmpvar_430));
    float tmpvar_432;
    float tmpvar_433;
    tmpvar_433 = (time / 10.0);
    tmpvar_432 = (2.0 + (0.2 * cos(tmpvar_433)));
    float tmpvar_434;
    tmpvar_434 = (2.0 - (0.2 * sin(tmpvar_433)));
    vec2 v_435;
    v_435 = (10.0 * tmpvar_431);
    int bval_437;
    float amplitude_438;
    float value_439;
    value_439 = 0.0;
    amplitude_438 = 0.5;
    bval_437 = 2;
    if (best) {
      bval_437 = 4;
    };
    for (int i_436 = 0; i_436 < bval_437; i_436++) {
      vec2 uv_440;
      vec2 tmpvar_441;
      tmpvar_441 = floor(v_435);
      vec2 tmpvar_442;
      tmpvar_442 = (v_435 - tmpvar_441);
      uv_440 = ((tmpvar_442 * tmpvar_442) * (3.0 - (2.0 * tmpvar_442)));
      float tmpvar_443;
      tmpvar_443 = fract((cos(
        dot (tmpvar_441, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_444;
      tmpvar_444.x = (tmpvar_441.x + 1.0);
      tmpvar_444.y = tmpvar_441.y;
      float tmpvar_445;
      tmpvar_445 = fract((cos(
        dot (tmpvar_444, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_446;
      tmpvar_446.x = tmpvar_441.x;
      tmpvar_446.y = (tmpvar_441.y + 1.0);
      float tmpvar_447;
      tmpvar_447 = fract((cos(
        dot (tmpvar_446, vec2(21.9898, 78.233))
      ) * 43758.55));
      value_439 = (value_439 + (amplitude_438 * (
        ((tmpvar_443 + ((tmpvar_445 - tmpvar_443) * uv_440.x)) + ((tmpvar_447 - tmpvar_443) * uv_440.y))
       + 
        ((((
          (tmpvar_443 - tmpvar_445)
         - tmpvar_447) + fract(
          (cos(dot ((tmpvar_441 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_440.x) * uv_440.y)
      )));
      v_435 = (v_435 * 2.0);
      amplitude_438 = (amplitude_438 * 0.5);
      vec2 xy_448;
      xy_448 = (v_435 * 2.0);
      vec2 uv_449;
      vec2 tmpvar_450;
      tmpvar_450 = floor(xy_448);
      vec2 tmpvar_451;
      tmpvar_451 = (xy_448 - tmpvar_450);
      uv_449 = ((tmpvar_451 * tmpvar_451) * (3.0 - (2.0 * tmpvar_451)));
      float tmpvar_452;
      tmpvar_452 = fract((cos(
        dot (tmpvar_450, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_453;
      tmpvar_453.x = (tmpvar_450.x + 1.0);
      tmpvar_453.y = tmpvar_450.y;
      float tmpvar_454;
      tmpvar_454 = fract((cos(
        dot (tmpvar_453, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_455;
      tmpvar_455.x = tmpvar_450.x;
      tmpvar_455.y = (tmpvar_450.y + 1.0);
      float tmpvar_456;
      tmpvar_456 = fract((cos(
        dot (tmpvar_455, vec2(21.9898, 78.233))
      ) * 43758.55));
      value_439 = (value_439 + ((amplitude_438 * 
        (((tmpvar_452 + (
          (tmpvar_454 - tmpvar_452)
         * uv_449.x)) + ((tmpvar_456 - tmpvar_452) * uv_449.y)) + (((
          ((tmpvar_452 - tmpvar_454) - tmpvar_456)
         + 
          fract((cos(dot (
            (tmpvar_450 + vec2(1.0, 1.0))
          , vec2(21.9898, 78.233))) * 43758.55))
        ) * uv_449.x) * uv_449.y))
      ) * 0.5));
      amplitude_438 = (amplitude_438 * 0.5);
    };
    r_424 = (sin((
      (((tmpvar_431.x * tmpvar_432) * 6.283) + ((tmpvar_431.y * tmpvar_434) * 6.283))
     + 
      (15.0 * value_439)
    )) + 1.0);
    vec4 tmpvar_457;
    tmpvar_457.w = 1.0;
    tmpvar_457.x = r_424;
    tmpvar_457.y = r_424;
    tmpvar_457.z = r_424;
    c_316 = (c_316 + ((tmpvar_457 * vec4(0.75, 1.0, 0.75, 1.0)) + (
      (1.0 - tmpvar_457)
     * vec4(0.0, 0.25, 0.0, 1.0))));
    p_317 = (p_317 * 0.4);
    c_316 = (c_316 * 0.6);
    float r_458;
    vec2 tmpvar_459;
    tmpvar_459 = (((p_317 * bval_315) * 7.0) - 0.5);
    float tmpvar_460;
    tmpvar_460 = sqrt(((tmpvar_459.x * tmpvar_459.x) + (tmpvar_459.y * tmpvar_459.y)));
    float tmpvar_461;
    float tmpvar_462;
    tmpvar_462 = (min (abs(
      (tmpvar_459.y / tmpvar_459.x)
    ), 1.0) / max (abs(
      (tmpvar_459.y / tmpvar_459.x)
    ), 1.0));
    float tmpvar_463;
    tmpvar_463 = (tmpvar_462 * tmpvar_462);
    tmpvar_463 = (((
      ((((
        ((((-0.01213232 * tmpvar_463) + 0.05368138) * tmpvar_463) - 0.1173503)
       * tmpvar_463) + 0.1938925) * tmpvar_463) - 0.3326756)
     * tmpvar_463) + 0.9999793) * tmpvar_462);
    tmpvar_463 = (tmpvar_463 + (float(
      (abs((tmpvar_459.y / tmpvar_459.x)) > 1.0)
    ) * (
      (tmpvar_463 * -2.0)
     + 1.570796)));
    tmpvar_461 = (tmpvar_463 * sign((tmpvar_459.y / tmpvar_459.x)));
    if ((abs(tmpvar_459.x) > (1e-08 * abs(tmpvar_459.y)))) {
      if ((tmpvar_459.x < 0.0)) {
        if ((tmpvar_459.y >= 0.0)) {
          tmpvar_461 += 3.141593;
        } else {
          tmpvar_461 = (tmpvar_461 - 3.141593);
        };
      };
    } else {
      tmpvar_461 = (sign(tmpvar_459.y) * 1.570796);
    };
    float tmpvar_464;
    tmpvar_464 = (tmpvar_461 + (time / 100.0));
    vec2 tmpvar_465;
    tmpvar_465.x = (tmpvar_460 * cos(tmpvar_464));
    tmpvar_465.y = (tmpvar_460 * sin(tmpvar_464));
    float tmpvar_466;
    float tmpvar_467;
    tmpvar_467 = (time / 10.0);
    tmpvar_466 = (2.0 + (0.2 * cos(tmpvar_467)));
    float tmpvar_468;
    tmpvar_468 = (2.0 - (0.2 * sin(tmpvar_467)));
    vec2 v_469;
    v_469 = (10.0 * tmpvar_465);
    int bval_471;
    float amplitude_472;
    float value_473;
    value_473 = 0.0;
    amplitude_472 = 0.5;
    bval_471 = 2;
    if (best) {
      bval_471 = 4;
    };
    for (int i_470 = 0; i_470 < bval_471; i_470++) {
      vec2 uv_474;
      vec2 tmpvar_475;
      tmpvar_475 = floor(v_469);
      vec2 tmpvar_476;
      tmpvar_476 = (v_469 - tmpvar_475);
      uv_474 = ((tmpvar_476 * tmpvar_476) * (3.0 - (2.0 * tmpvar_476)));
      float tmpvar_477;
      tmpvar_477 = fract((cos(
        dot (tmpvar_475, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_478;
      tmpvar_478.x = (tmpvar_475.x + 1.0);
      tmpvar_478.y = tmpvar_475.y;
      float tmpvar_479;
      tmpvar_479 = fract((cos(
        dot (tmpvar_478, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_480;
      tmpvar_480.x = tmpvar_475.x;
      tmpvar_480.y = (tmpvar_475.y + 1.0);
      float tmpvar_481;
      tmpvar_481 = fract((cos(
        dot (tmpvar_480, vec2(21.9898, 78.233))
      ) * 43758.55));
      value_473 = (value_473 + (amplitude_472 * (
        ((tmpvar_477 + ((tmpvar_479 - tmpvar_477) * uv_474.x)) + ((tmpvar_481 - tmpvar_477) * uv_474.y))
       + 
        ((((
          (tmpvar_477 - tmpvar_479)
         - tmpvar_481) + fract(
          (cos(dot ((tmpvar_475 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_474.x) * uv_474.y)
      )));
      v_469 = (v_469 * 2.0);
      amplitude_472 = (amplitude_472 * 0.5);
      vec2 xy_482;
      xy_482 = (v_469 * 2.0);
      vec2 uv_483;
      vec2 tmpvar_484;
      tmpvar_484 = floor(xy_482);
      vec2 tmpvar_485;
      tmpvar_485 = (xy_482 - tmpvar_484);
      uv_483 = ((tmpvar_485 * tmpvar_485) * (3.0 - (2.0 * tmpvar_485)));
      float tmpvar_486;
      tmpvar_486 = fract((cos(
        dot (tmpvar_484, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_487;
      tmpvar_487.x = (tmpvar_484.x + 1.0);
      tmpvar_487.y = tmpvar_484.y;
      float tmpvar_488;
      tmpvar_488 = fract((cos(
        dot (tmpvar_487, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_489;
      tmpvar_489.x = tmpvar_484.x;
      tmpvar_489.y = (tmpvar_484.y + 1.0);
      float tmpvar_490;
      tmpvar_490 = fract((cos(
        dot (tmpvar_489, vec2(21.9898, 78.233))
      ) * 43758.55));
      value_473 = (value_473 + ((amplitude_472 * 
        (((tmpvar_486 + (
          (tmpvar_488 - tmpvar_486)
         * uv_483.x)) + ((tmpvar_490 - tmpvar_486) * uv_483.y)) + (((
          ((tmpvar_486 - tmpvar_488) - tmpvar_490)
         + 
          fract((cos(dot (
            (tmpvar_484 + vec2(1.0, 1.0))
          , vec2(21.9898, 78.233))) * 43758.55))
        ) * uv_483.x) * uv_483.y))
      ) * 0.5));
      amplitude_472 = (amplitude_472 * 0.5);
    };
    r_458 = (sin((
      (((tmpvar_465.x * tmpvar_466) * 6.283) + ((tmpvar_465.y * tmpvar_468) * 6.283))
     + 
      (15.0 * value_473)
    )) + 1.0);
    vec4 tmpvar_491;
    tmpvar_491.w = 1.0;
    tmpvar_491.x = r_458;
    tmpvar_491.y = r_458;
    tmpvar_491.z = r_458;
    c_316 = (c_316 + ((tmpvar_491 * vec4(0.75, 1.0, 0.75, 1.0)) + (
      (1.0 - tmpvar_491)
     * vec4(0.0, 0.25, 0.0, 1.0))));
    p_317 = (p_317 * 0.4);
    c_316 = (c_316 * 0.6);
    float tmpvar_492;
    tmpvar_492 = clamp (((tax - 0.23) / 0.16), 0.0, 1.0);
    float tmpvar_493;
    tmpvar_493 = clamp (((tax - 0.65) / -0.26), 0.0, 1.0);
    float tmpvar_494;
    tmpvar_494 = ((1.0 - (tmpvar_492 * 
      (tmpvar_492 * (3.0 - (2.0 * tmpvar_492)))
    )) + (1.0 - (tmpvar_493 * 
      (tmpvar_493 * (3.0 - (2.0 * tmpvar_493)))
    )));
    if (((1.0 - tmpvar_494) > 0.0)) {
      vec2 pos_495;
      vec3 col_496;
      float tmpvar_497;
      tmpvar_497 = clamp (((tax - 0.19) / 0.46), 0.0, 1.0);
      float tmpvar_498;
      tmpvar_498 = (1.0 - (tmpvar_497 * (tmpvar_497 * 
        (3.0 - (2.0 * tmpvar_497))
      )));
      float tmpvar_499;
      tmpvar_499 = (7000.0 * zoom);
      pos_495 = (tmpvar_311 + ((
        -(tmpvar_499)
       / 2.0) + (tmpvar_499 * 0.145)));
      mat2 tmpvar_500;
      float tmpvar_501;
      tmpvar_501 = (tax + 0.9817436);
      tmpvar_500[0].x = cos((tmpvar_501 + (1.57079 * 
        (1.0 - tmpvar_498)
      )));
      tmpvar_500[0].y = -(sin((tmpvar_501 + 
        (1.57079 * (1.0 - tmpvar_498))
      )));
      tmpvar_500[1].x = sin((tmpvar_501 + (1.57079 * 
        (1.0 - tmpvar_498)
      )));
      tmpvar_500[1].y = cos((tmpvar_501 + (1.57079 * 
        (1.0 - tmpvar_498)
      )));
      pos_495 = ((tmpvar_499 * 0.5) - (pos_495 * tmpvar_500));
      vec2 tmpvar_502;
      tmpvar_502 = ((pos_495 / tmpvar_499) - vec2(0.5, 0.5));
      col_496 = vec3(0.0, 0.0, 0.0);
      float tmpvar_503;
      tmpvar_503 = (dot (tmpvar_502, tmpvar_502) * 8.0);
      float tmpvar_504;
      tmpvar_504 = ((1.0 - sqrt(
        abs((1.0 - tmpvar_503))
      )) / tmpvar_503);
      vec2 p_505;
      vec2 tmpvar_506;
      tmpvar_506 = vec2((11050.0 * zoom));
      mat2 tmpvar_507;
      float tmpvar_508;
      tmpvar_508 = (tax * 3.0);
      tmpvar_507[0].x = cos(tmpvar_508);
      tmpvar_507[0].y = -(sin(tmpvar_508));
      tmpvar_507[1].x = sin(tmpvar_508);
      tmpvar_507[1].y = cos(tmpvar_508);
      p_505 = (((pos_495 - 
        (0.5 * tmpvar_506)
      ) / tmpvar_506.y) * tmpvar_507);
      float color1_509;
      vec2 x_510;
      x_510 = (2.5 * p_505);
      float tmpvar_511;
      tmpvar_511 = (4.0 - (3.0 * sqrt(
        dot (x_510, x_510)
      )));
      color1_509 = tmpvar_511;
      float tmpvar_512;
      float tmpvar_513;
      tmpvar_513 = (min (abs(
        (p_505.x / p_505.y)
      ), 1.0) / max (abs(
        (p_505.x / p_505.y)
      ), 1.0));
      float tmpvar_514;
      tmpvar_514 = (tmpvar_513 * tmpvar_513);
      tmpvar_514 = (((
        ((((
          ((((-0.01213232 * tmpvar_514) + 0.05368138) * tmpvar_514) - 0.1173503)
         * tmpvar_514) + 0.1938925) * tmpvar_514) - 0.3326756)
       * tmpvar_514) + 0.9999793) * tmpvar_513);
      tmpvar_514 = (tmpvar_514 + (float(
        (abs((p_505.x / p_505.y)) > 1.0)
      ) * (
        (tmpvar_514 * -2.0)
       + 1.570796)));
      tmpvar_512 = (tmpvar_514 * sign((p_505.x / p_505.y)));
      if ((abs(p_505.y) > (1e-08 * abs(p_505.x)))) {
        if ((p_505.y < 0.0)) {
          if ((p_505.x >= 0.0)) {
            tmpvar_512 += 3.141593;
          } else {
            tmpvar_512 = (tmpvar_512 - 3.141593);
          };
        };
      } else {
        tmpvar_512 = (sign(p_505.x) * 1.570796);
      };
      vec3 tmpvar_515;
      tmpvar_515.z = 0.5;
      tmpvar_515.x = ((tmpvar_512 / 6.2832) + 0.5);
      tmpvar_515.y = (sqrt(dot (p_505, p_505)) * 0.4);
      vec3 tmpvar_516;
      tmpvar_516.x = 0.0;
      float tmpvar_517;
      tmpvar_517 = -(time);
      tmpvar_516.y = (tmpvar_517 * 0.05);
      tmpvar_516.z = (tmpvar_517 * 0.01);
      vec3 uv_518;
      uv_518 = (tmpvar_515 + tmpvar_516);
      vec3 f_519;
      uv_518 = (uv_518 * 32.0);
      vec3 tmpvar_520;
      tmpvar_520 = (floor((vec3(mod (uv_518, 32.0)))) * vec3(1.0, 100.0, 1000.0));
      vec3 tmpvar_521;
      tmpvar_521 = (floor((vec3(mod (
        (uv_518 + 1.0)
      , 32.0)))) * vec3(1.0, 100.0, 1000.0));
      vec3 tmpvar_522;
      tmpvar_522 = fract(uv_518);
      f_519 = ((tmpvar_522 * tmpvar_522) * (3.0 - (2.0 * tmpvar_522)));
      vec4 tmpvar_523;
      tmpvar_523.x = ((tmpvar_520.x + tmpvar_520.y) + tmpvar_520.z);
      tmpvar_523.y = ((tmpvar_521.x + tmpvar_520.y) + tmpvar_520.z);
      tmpvar_523.z = ((tmpvar_520.x + tmpvar_521.y) + tmpvar_520.z);
      tmpvar_523.w = ((tmpvar_521.x + tmpvar_521.y) + tmpvar_520.z);
      vec4 tmpvar_524;
      tmpvar_524 = fract((sin(
        (tmpvar_523 * 0.1)
      ) * 1000.0));
      vec4 tmpvar_525;
      tmpvar_525 = fract((sin(
        (((tmpvar_523 + tmpvar_521.z) - tmpvar_520.z) * 0.1)
      ) * 1000.0));
      color1_509 = (tmpvar_511 + (0.15 * (
        (mix (mix (mix (tmpvar_524.x, tmpvar_524.y, f_519.x), mix (tmpvar_524.z, tmpvar_524.w, f_519.x), f_519.y), mix (mix (tmpvar_525.x, tmpvar_525.y, f_519.x), mix (tmpvar_525.z, tmpvar_525.w, f_519.x), f_519.y), f_519.z) * 2.0)
       - 1.0)));
      if (best) {
        vec3 tmpvar_526;
        tmpvar_526.x = 0.0;
        float tmpvar_527;
        tmpvar_527 = -(time);
        tmpvar_526.y = (tmpvar_527 * 0.05);
        tmpvar_526.z = (tmpvar_527 * 0.01);
        vec3 uv_528;
        uv_528 = (tmpvar_515 + tmpvar_526);
        vec3 f_529;
        uv_528 = (uv_528 * 64.0);
        vec3 tmpvar_530;
        tmpvar_530 = (floor((vec3(mod (uv_528, 64.0)))) * vec3(1.0, 100.0, 1000.0));
        vec3 tmpvar_531;
        tmpvar_531 = (floor((vec3(mod (
          (uv_528 + 1.0)
        , 64.0)))) * vec3(1.0, 100.0, 1000.0));
        vec3 tmpvar_532;
        tmpvar_532 = fract(uv_528);
        f_529 = ((tmpvar_532 * tmpvar_532) * (3.0 - (2.0 * tmpvar_532)));
        vec4 tmpvar_533;
        tmpvar_533.x = ((tmpvar_530.x + tmpvar_530.y) + tmpvar_530.z);
        tmpvar_533.y = ((tmpvar_531.x + tmpvar_530.y) + tmpvar_530.z);
        tmpvar_533.z = ((tmpvar_530.x + tmpvar_531.y) + tmpvar_530.z);
        tmpvar_533.w = ((tmpvar_531.x + tmpvar_531.y) + tmpvar_530.z);
        vec4 tmpvar_534;
        tmpvar_534 = fract((sin(
          (tmpvar_533 * 0.1)
        ) * 1000.0));
        vec4 tmpvar_535;
        tmpvar_535 = fract((sin(
          (((tmpvar_533 + tmpvar_531.z) - tmpvar_530.z) * 0.1)
        ) * 1000.0));
        color1_509 = (color1_509 + (0.0375 * (
          (mix (mix (mix (tmpvar_534.x, tmpvar_534.y, f_529.x), mix (tmpvar_534.z, tmpvar_534.w, f_529.x), f_529.y), mix (mix (tmpvar_535.x, tmpvar_535.y, f_529.x), mix (tmpvar_535.z, tmpvar_535.w, f_529.x), f_529.y), f_529.z) * 2.0)
         - 1.0)));
        vec3 tmpvar_536;
        tmpvar_536.x = 0.0;
        tmpvar_536.y = (tmpvar_527 * 0.05);
        tmpvar_536.z = (tmpvar_527 * 0.01);
        vec3 uv_537;
        uv_537 = (tmpvar_515 + tmpvar_536);
        vec3 f_538;
        uv_537 = (uv_537 * 128.0);
        vec3 tmpvar_539;
        tmpvar_539 = (floor((vec3(mod (uv_537, 128.0)))) * vec3(1.0, 100.0, 1000.0));
        vec3 tmpvar_540;
        tmpvar_540 = (floor((vec3(mod (
          (uv_537 + 1.0)
        , 128.0)))) * vec3(1.0, 100.0, 1000.0));
        vec3 tmpvar_541;
        tmpvar_541 = fract(uv_537);
        f_538 = ((tmpvar_541 * tmpvar_541) * (3.0 - (2.0 * tmpvar_541)));
        vec4 tmpvar_542;
        tmpvar_542.x = ((tmpvar_539.x + tmpvar_539.y) + tmpvar_539.z);
        tmpvar_542.y = ((tmpvar_540.x + tmpvar_539.y) + tmpvar_539.z);
        tmpvar_542.z = ((tmpvar_539.x + tmpvar_540.y) + tmpvar_539.z);
        tmpvar_542.w = ((tmpvar_540.x + tmpvar_540.y) + tmpvar_539.z);
        vec4 tmpvar_543;
        tmpvar_543 = fract((sin(
          (tmpvar_542 * 0.1)
        ) * 1000.0));
        vec4 tmpvar_544;
        tmpvar_544 = fract((sin(
          (((tmpvar_542 + tmpvar_540.z) - tmpvar_539.z) * 0.1)
        ) * 1000.0));
        color1_509 = (color1_509 + (0.01875 * (
          (mix (mix (mix (tmpvar_543.x, tmpvar_543.y, f_538.x), mix (tmpvar_543.z, tmpvar_543.w, f_538.x), f_538.y), mix (mix (tmpvar_544.x, tmpvar_544.y, f_538.x), mix (tmpvar_544.z, tmpvar_544.w, f_538.x), f_538.y), f_538.z) * 2.0)
         - 1.0)));
      };
      color1_509 = (color1_509 * 0.6);
      vec4 tmpvar_545;
      tmpvar_545.w = 1.0;
      tmpvar_545.xyz = (vec3(0.7, 0.3556, 0.364) * vec3(color1_509));
      col_496 = ((tmpvar_545.xyz * 1.4) * tmpvar_504);
      vec4 tmpvar_546;
      tmpvar_546.xyz = col_496;
      tmpvar_546.w = tmpvar_504;
      cxu_314 = tmpvar_546;
    } else {
      cxu_314 = vec4(0.0, 0.0, 0.0, 0.0);
    };
    float tmpvar_547;
    float tmpvar_548;
    tmpvar_548 = (zoom * 5000.0);
    tmpvar_547 = (tmpvar_548 / 2.1251);
    vec2 tmpvar_549;
    tmpvar_549 = (((gl_FragCoord.xy - 
      (planetpos1 * zoom)
    ) - shippos) - (tmpvar_548 / 2.0));
    float tmpvar_550;
    tmpvar_550 = sqrt(((
      (-(tmpvar_547) * tmpvar_547)
     + 
      (tmpvar_549.x * tmpvar_549.x)
    ) + (tmpvar_549.y * tmpvar_549.y)));
    float tmpvar_551;
    tmpvar_551 = max (0.0, ((
      ((tmpvar_547 * 0.12) / tmpvar_550)
     - 0.574) + 0.3));
    vec3 tmpvar_552;
    tmpvar_552.xy = tmpvar_549;
    tmpvar_552.z = tmpvar_550;
    float tmpvar_553;
    tmpvar_553 = max (0.0, normalize(tmpvar_552).z);
    vec4 tmpvar_554;
    tmpvar_554.w = 1.0;
    tmpvar_554.x = (tmpvar_551 * tmpvar_553);
    tmpvar_554.y = (tmpvar_551 * tmpvar_553);
    tmpvar_554.z = ((10.0 * tmpvar_551) * tmpvar_553);
    float tmpvar_555;
    tmpvar_555 = clamp (((tmpvar_320 - 1.2) / -0.2), 0.0, 1.0);
    tmpvar_310 = (((
      (max (vec4(0.0, 0.0, 0.0, 0.0), ((c_316.y + 
        ((tmpvar_321 - c_316.y) * c_316.x)
      ) * clamp (
        (9.0 - ((tmpvar_320 * tmpvar_320) * 9.0))
      , 0.0, 1.0))) * (vec4((1.0 - (1.0 - tmpvar_494))) + (cxu_314 * (1.0 - tmpvar_494))))
     + 
      (tmpvar_554 * (1.0 - clamp ((9.0 - 
        ((tmpvar_320 * tmpvar_320) * 9.0)
      ), 0.0, 1.0)))
    ) + (buff_10 * 
      (1.0 - clamp ((9.0 - (
        (tmpvar_320 * tmpvar_320)
       * 9.0)), 0.0, 1.0))
    )) + ((cxu_314 * 
      (tmpvar_555 * (tmpvar_555 * (3.0 - (2.0 * tmpvar_555))))
    ) * (1.0 - tmpvar_494)));
  } else {
    tmpvar_310 = buff_10;
  };
  buff_10 = tmpvar_310;
  vec4 tmpvar_556;
  vec2 tmpvar_557;
  tmpvar_557 = ((gl_FragCoord.xy - (planetpos2 * zoom)) - shippos);
  vec2 x_558;
  float tmpvar_559;
  tmpvar_559 = (7500.0 * zoom);
  x_558 = (tmpvar_557 - tmpvar_559);
  float tmpvar_560;
  tmpvar_560 = float((sqrt(
    dot (x_558, x_558)
  ) >= tmpvar_559));
  if (((1.0 - tmpvar_560) > 0.0)) {
    vec4 tmpc_561;
    float bval_562;
    vec4 c_563;
    vec2 p_564;
    vec2 tmpvar_565;
    tmpvar_565 = vec2((15000.0 * zoom));
    vec2 tmpvar_566;
    tmpvar_566 = (((tmpvar_557 * 2.0) - tmpvar_565) / tmpvar_565.y);
    float tmpvar_567;
    tmpvar_567 = sqrt(dot (tmpvar_566, tmpvar_566));
    vec4 tmpvar_568;
    tmpvar_568 = (vec4(0.53, 0.952, 1.8, 1.0) + tmpvar_566.y);
    c_563 = tmpvar_568;
    p_564 = (((tmpvar_566 * 
      (sign(tmpvar_567) * (1.570796 - (sqrt(
        (1.0 - abs(tmpvar_567))
      ) * (1.570796 + 
        (abs(tmpvar_567) * (-0.2146018 + (abs(tmpvar_567) * (0.08656672 + 
          (abs(tmpvar_567) * -0.03102955)
        ))))
      ))))
    ) / tmpvar_567) - 5.0);
    p_564 = (p_564 * p_564.y);
    bval_562 = 0.01951;
    if (best) {
      bval_562 = 0.1;
      vec2 p_569;
      p_569 = (p_564 * 0.1);
      vec4 k_570;
      mat4 m_571;
      mat4 tmpvar_572;
      tmpvar_572[0].x = -1.0;
      tmpvar_572[0].y = 2.0;
      tmpvar_572[0].z = -2.0;
      tmpvar_572[0].w = 0.0;
      tmpvar_572[1].x = -2.0;
      tmpvar_572[1].y = 1.0;
      tmpvar_572[1].z = 3.0;
      tmpvar_572[1].w = 0.0;
      tmpvar_572[2].x = 3.0;
      tmpvar_572[2].y = 2.0;
      tmpvar_572[2].z = 1.0;
      tmpvar_572[2].w = 0.0;
      tmpvar_572[3].xy = (800.2 * p_569);
      tmpvar_572[3].zw = (vec2(time) + 10000.0);
      mat4 tmpvar_573;
      tmpvar_573[0].x = 1.0;
      tmpvar_573[0].y = 0.0;
      tmpvar_573[0].z = 0.0;
      tmpvar_573[0].w = 0.0;
      tmpvar_573[1].x = 0.0;
      tmpvar_573[1].y = 1.0;
      tmpvar_573[1].z = 0.0;
      tmpvar_573[1].w = 0.0;
      tmpvar_573[2].x = -1.244444;
      tmpvar_573[2].y = 0.0;
      tmpvar_573[2].z = 0.5555556;
      tmpvar_573[2].w = 0.0;
      tmpvar_573[3].x = 0.0;
      tmpvar_573[3].y = 0.0;
      tmpvar_573[3].z = 0.0;
      tmpvar_573[3].w = 1.0;
      m_571 = (tmpvar_572 * tmpvar_573);
      mat4 tmpvar_574;
      tmpvar_574 = (m_571 * 0.4);
      m_571 = tmpvar_574;
      vec4 tmpvar_575;
      tmpvar_575 = (tmpvar_574[3] * tmpvar_574);
      m_571[3] = tmpvar_575;
      vec4 x_576;
      x_576 = (fract(tmpvar_575) - 0.5);
      mat4 tmpvar_577;
      tmpvar_577 = (m_571 * -0.6);
      m_571 = tmpvar_577;
      vec4 tmpvar_578;
      tmpvar_578 = (tmpvar_577[3] * tmpvar_577);
      m_571[3] = tmpvar_578;
      vec4 x_579;
      x_579 = (fract(tmpvar_578) - 0.5);
      mat4 tmpvar_580;
      tmpvar_580 = (m_571 * -1.6);
      m_571 = tmpvar_580;
      vec4 tmpvar_581;
      tmpvar_581 = (tmpvar_580[3] * tmpvar_580);
      m_571[3] = tmpvar_581;
      vec4 x_582;
      x_582 = (fract(tmpvar_581) - 0.5);
      k_570 = (min (min (
        sqrt(dot (x_576, x_576))
      , 
        sqrt(dot (x_579, x_579))
      ), sqrt(
        dot (x_582, x_582)
      )) / m_571[2]);
      vec2 p_583;
      float r_584;
      p_583.y = (p_569.y - 0.8505124);
      p_583.x = (p_569.x - 2.005062);
      float tmpvar_585;
      float tmpvar_586;
      tmpvar_586 = (min (abs(
        (p_583.y / p_583.x)
      ), 1.0) / max (abs(
        (p_583.y / p_583.x)
      ), 1.0));
      float tmpvar_587;
      tmpvar_587 = (tmpvar_586 * tmpvar_586);
      tmpvar_587 = (((
        ((((
          ((((-0.01213232 * tmpvar_587) + 0.05368138) * tmpvar_587) - 0.1173503)
         * tmpvar_587) + 0.1938925) * tmpvar_587) - 0.3326756)
       * tmpvar_587) + 0.9999793) * tmpvar_586);
      tmpvar_587 = (tmpvar_587 + (float(
        (abs((p_583.y / p_583.x)) > 1.0)
      ) * (
        (tmpvar_587 * -2.0)
       + 1.570796)));
      tmpvar_585 = (tmpvar_587 * sign((p_583.y / p_583.x)));
      if ((abs(p_583.x) > (1e-08 * abs(p_583.y)))) {
        if ((p_583.x < 0.0)) {
          if ((p_583.y >= 0.0)) {
            tmpvar_585 += 3.141593;
          } else {
            tmpvar_585 = (tmpvar_585 - 3.141593);
          };
        };
      } else {
        tmpvar_585 = (sign(p_583.y) * 1.570796);
      };
      float tmpvar_588;
      tmpvar_588 = clamp (((tmpvar_585 - 0.8471932) / 0.2), 0.0, 1.0);
      float tmpvar_589;
      tmpvar_589 = clamp (((tmpvar_585 - 2.094386) / 0.2), 0.0, 1.0);
      r_584 = (sin((3.14158 * 
        ((tmpvar_585 - 1.047193) / 1.047193)
      )) * 0.2);
      r_584 = (r_584 + (abs(
        sin(((r_584 * 10.0) + (time * 0.1)))
      ) * 0.2));
      r_584 += 0.1;
      float tmpvar_590;
      tmpvar_590 = clamp (((
        sqrt(dot (p_583, p_583))
       - 0.4) / 0.2), 0.0, 1.0);
      float tmpvar_591;
      tmpvar_591 = clamp (((
        sqrt(dot (p_583, p_583))
       - 0.8) / (
        ((abs(sin(
          ((r_584 * 10.0) + time)
        )) * 0.2) + 2.0)
       - 0.8)), 0.0, 1.0);
      r_584 = (r_584 * ((tmpvar_590 * 
        (tmpvar_590 * (3.0 - (2.0 * tmpvar_590)))
      ) - (tmpvar_591 * 
        (tmpvar_591 * (3.0 - (2.0 * tmpvar_591)))
      )));
      vec2 xy_592;
      xy_592 = (p_583 + (time * 0.5));
      vec2 uv_593;
      vec2 tmpvar_594;
      tmpvar_594 = floor(xy_592);
      vec2 tmpvar_595;
      tmpvar_595 = (xy_592 - tmpvar_594);
      uv_593 = ((tmpvar_595 * tmpvar_595) * (3.0 - (2.0 * tmpvar_595)));
      float tmpvar_596;
      tmpvar_596 = fract((cos(
        dot (tmpvar_594, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_597;
      tmpvar_597.x = (tmpvar_594.x + 1.0);
      tmpvar_597.y = tmpvar_594.y;
      float tmpvar_598;
      tmpvar_598 = fract((cos(
        dot (tmpvar_597, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_599;
      tmpvar_599.x = tmpvar_594.x;
      tmpvar_599.y = (tmpvar_594.y + 1.0);
      float tmpvar_600;
      tmpvar_600 = fract((cos(
        dot (tmpvar_599, vec2(21.9898, 78.233))
      ) * 43758.55));
      r_584 = (r_584 * abs((
        ((tmpvar_596 + ((tmpvar_598 - tmpvar_596) * uv_593.x)) + ((tmpvar_600 - tmpvar_596) * uv_593.y))
       + 
        ((((
          (tmpvar_596 - tmpvar_598)
         - tmpvar_600) + fract(
          (cos(dot ((tmpvar_594 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_593.x) * uv_593.y)
      )));
      r_584 = (r_584 * 15.0);
      vec4 tmpvar_601;
      tmpvar_601.w = 1.0;
      tmpvar_601.xyz = ((vec3(-1.29, -0.5, -0.1) * r_584) * ((tmpvar_588 * 
        (tmpvar_588 * (3.0 - (2.0 * tmpvar_588)))
      ) - (tmpvar_589 * 
        (tmpvar_589 * (3.0 - (2.0 * tmpvar_589)))
      )));
      float c_602;
      vec2 tmpvar_603;
      tmpvar_603 = (p_569 - vec2(0.5, 0.5));
      c_602 = ((cos(
        ((p_569.x * 80.0) - (time / 2.0))
      ) * 0.5) + 0.5);
      vec4 tmpvar_604;
      tmpvar_604.x = c_602;
      tmpvar_604.y = c_602;
      tmpvar_604.z = c_602;
      tmpvar_604.w = min (clamp ((1.0 - 
        sqrt(dot (tmpvar_603, tmpvar_603))
      ), 0.0, 1.0), c_602);
      c_563 = (tmpvar_568 + ((k_570 + tmpvar_601) + mix (vec4(-0.25, 0.0, 0.0, 1.0), tmpvar_604, tmpvar_604.w)));
      p_564 = (p_564 * 0.4);
      c_563 = (c_563 * 0.6);
      vec2 p_605;
      p_605 = (p_564 * 0.1);
      vec4 k_606;
      mat4 m_607;
      mat4 tmpvar_608;
      tmpvar_608[0].x = -1.0;
      tmpvar_608[0].y = 2.0;
      tmpvar_608[0].z = -2.0;
      tmpvar_608[0].w = 0.0;
      tmpvar_608[1].x = -2.0;
      tmpvar_608[1].y = 1.0;
      tmpvar_608[1].z = 3.0;
      tmpvar_608[1].w = 0.0;
      tmpvar_608[2].x = 3.0;
      tmpvar_608[2].y = 2.0;
      tmpvar_608[2].z = 1.0;
      tmpvar_608[2].w = 0.0;
      tmpvar_608[3].xy = (800.2 * p_605);
      tmpvar_608[3].zw = (vec2(time) + 10000.0);
      mat4 tmpvar_609;
      tmpvar_609[0].x = 1.0;
      tmpvar_609[0].y = 0.0;
      tmpvar_609[0].z = 0.0;
      tmpvar_609[0].w = 0.0;
      tmpvar_609[1].x = 0.0;
      tmpvar_609[1].y = 1.0;
      tmpvar_609[1].z = 0.0;
      tmpvar_609[1].w = 0.0;
      tmpvar_609[2].x = -1.244444;
      tmpvar_609[2].y = 0.0;
      tmpvar_609[2].z = 0.5555556;
      tmpvar_609[2].w = 0.0;
      tmpvar_609[3].x = 0.0;
      tmpvar_609[3].y = 0.0;
      tmpvar_609[3].z = 0.0;
      tmpvar_609[3].w = 1.0;
      m_607 = (tmpvar_608 * tmpvar_609);
      mat4 tmpvar_610;
      tmpvar_610 = (m_607 * 0.4);
      m_607 = tmpvar_610;
      vec4 tmpvar_611;
      tmpvar_611 = (tmpvar_610[3] * tmpvar_610);
      m_607[3] = tmpvar_611;
      vec4 x_612;
      x_612 = (fract(tmpvar_611) - 0.5);
      mat4 tmpvar_613;
      tmpvar_613 = (m_607 * -0.6);
      m_607 = tmpvar_613;
      vec4 tmpvar_614;
      tmpvar_614 = (tmpvar_613[3] * tmpvar_613);
      m_607[3] = tmpvar_614;
      vec4 x_615;
      x_615 = (fract(tmpvar_614) - 0.5);
      mat4 tmpvar_616;
      tmpvar_616 = (m_607 * -1.6);
      m_607 = tmpvar_616;
      vec4 tmpvar_617;
      tmpvar_617 = (tmpvar_616[3] * tmpvar_616);
      m_607[3] = tmpvar_617;
      vec4 x_618;
      x_618 = (fract(tmpvar_617) - 0.5);
      k_606 = (min (min (
        sqrt(dot (x_612, x_612))
      , 
        sqrt(dot (x_615, x_615))
      ), sqrt(
        dot (x_618, x_618)
      )) / m_607[2]);
      vec2 p_619;
      float r_620;
      p_619.y = (p_605.y - 0.8505124);
      p_619.x = (p_605.x - 2.005062);
      float tmpvar_621;
      float tmpvar_622;
      tmpvar_622 = (min (abs(
        (p_619.y / p_619.x)
      ), 1.0) / max (abs(
        (p_619.y / p_619.x)
      ), 1.0));
      float tmpvar_623;
      tmpvar_623 = (tmpvar_622 * tmpvar_622);
      tmpvar_623 = (((
        ((((
          ((((-0.01213232 * tmpvar_623) + 0.05368138) * tmpvar_623) - 0.1173503)
         * tmpvar_623) + 0.1938925) * tmpvar_623) - 0.3326756)
       * tmpvar_623) + 0.9999793) * tmpvar_622);
      tmpvar_623 = (tmpvar_623 + (float(
        (abs((p_619.y / p_619.x)) > 1.0)
      ) * (
        (tmpvar_623 * -2.0)
       + 1.570796)));
      tmpvar_621 = (tmpvar_623 * sign((p_619.y / p_619.x)));
      if ((abs(p_619.x) > (1e-08 * abs(p_619.y)))) {
        if ((p_619.x < 0.0)) {
          if ((p_619.y >= 0.0)) {
            tmpvar_621 += 3.141593;
          } else {
            tmpvar_621 = (tmpvar_621 - 3.141593);
          };
        };
      } else {
        tmpvar_621 = (sign(p_619.y) * 1.570796);
      };
      float tmpvar_624;
      tmpvar_624 = clamp (((tmpvar_621 - 0.8471932) / 0.2), 0.0, 1.0);
      float tmpvar_625;
      tmpvar_625 = clamp (((tmpvar_621 - 2.094386) / 0.2), 0.0, 1.0);
      r_620 = (sin((3.14158 * 
        ((tmpvar_621 - 1.047193) / 1.047193)
      )) * 0.2);
      r_620 = (r_620 + (abs(
        sin(((r_620 * 10.0) + (time * 0.1)))
      ) * 0.2));
      r_620 += 0.1;
      float tmpvar_626;
      tmpvar_626 = clamp (((
        sqrt(dot (p_619, p_619))
       - 0.4) / 0.2), 0.0, 1.0);
      float tmpvar_627;
      tmpvar_627 = clamp (((
        sqrt(dot (p_619, p_619))
       - 0.8) / (
        ((abs(sin(
          ((r_620 * 10.0) + time)
        )) * 0.2) + 2.0)
       - 0.8)), 0.0, 1.0);
      r_620 = (r_620 * ((tmpvar_626 * 
        (tmpvar_626 * (3.0 - (2.0 * tmpvar_626)))
      ) - (tmpvar_627 * 
        (tmpvar_627 * (3.0 - (2.0 * tmpvar_627)))
      )));
      vec2 xy_628;
      xy_628 = (p_619 + (time * 0.5));
      vec2 uv_629;
      vec2 tmpvar_630;
      tmpvar_630 = floor(xy_628);
      vec2 tmpvar_631;
      tmpvar_631 = (xy_628 - tmpvar_630);
      uv_629 = ((tmpvar_631 * tmpvar_631) * (3.0 - (2.0 * tmpvar_631)));
      float tmpvar_632;
      tmpvar_632 = fract((cos(
        dot (tmpvar_630, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_633;
      tmpvar_633.x = (tmpvar_630.x + 1.0);
      tmpvar_633.y = tmpvar_630.y;
      float tmpvar_634;
      tmpvar_634 = fract((cos(
        dot (tmpvar_633, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_635;
      tmpvar_635.x = tmpvar_630.x;
      tmpvar_635.y = (tmpvar_630.y + 1.0);
      float tmpvar_636;
      tmpvar_636 = fract((cos(
        dot (tmpvar_635, vec2(21.9898, 78.233))
      ) * 43758.55));
      r_620 = (r_620 * abs((
        ((tmpvar_632 + ((tmpvar_634 - tmpvar_632) * uv_629.x)) + ((tmpvar_636 - tmpvar_632) * uv_629.y))
       + 
        ((((
          (tmpvar_632 - tmpvar_634)
         - tmpvar_636) + fract(
          (cos(dot ((tmpvar_630 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_629.x) * uv_629.y)
      )));
      r_620 = (r_620 * 15.0);
      vec4 tmpvar_637;
      tmpvar_637.w = 1.0;
      tmpvar_637.xyz = ((vec3(-1.29, -0.5, -0.1) * r_620) * ((tmpvar_624 * 
        (tmpvar_624 * (3.0 - (2.0 * tmpvar_624)))
      ) - (tmpvar_625 * 
        (tmpvar_625 * (3.0 - (2.0 * tmpvar_625)))
      )));
      float c_638;
      vec2 tmpvar_639;
      tmpvar_639 = (p_605 - vec2(0.5, 0.5));
      c_638 = ((cos(
        ((p_605.x * 80.0) - (time / 2.0))
      ) * 0.5) + 0.5);
      vec4 tmpvar_640;
      tmpvar_640.x = c_638;
      tmpvar_640.y = c_638;
      tmpvar_640.z = c_638;
      tmpvar_640.w = min (clamp ((1.0 - 
        sqrt(dot (tmpvar_639, tmpvar_639))
      ), 0.0, 1.0), c_638);
      c_563 = (c_563 + ((k_606 + tmpvar_637) + mix (vec4(-0.25, 0.0, 0.0, 1.0), tmpvar_640, tmpvar_640.w)));
      p_564 = (p_564 * 0.4);
      c_563 = (c_563 * 0.6);
      vec2 p_641;
      p_641 = (p_564 * 0.1);
      vec4 k_642;
      mat4 m_643;
      mat4 tmpvar_644;
      tmpvar_644[0].x = -1.0;
      tmpvar_644[0].y = 2.0;
      tmpvar_644[0].z = -2.0;
      tmpvar_644[0].w = 0.0;
      tmpvar_644[1].x = -2.0;
      tmpvar_644[1].y = 1.0;
      tmpvar_644[1].z = 3.0;
      tmpvar_644[1].w = 0.0;
      tmpvar_644[2].x = 3.0;
      tmpvar_644[2].y = 2.0;
      tmpvar_644[2].z = 1.0;
      tmpvar_644[2].w = 0.0;
      tmpvar_644[3].xy = (800.2 * p_641);
      tmpvar_644[3].zw = (vec2(time) + 10000.0);
      mat4 tmpvar_645;
      tmpvar_645[0].x = 1.0;
      tmpvar_645[0].y = 0.0;
      tmpvar_645[0].z = 0.0;
      tmpvar_645[0].w = 0.0;
      tmpvar_645[1].x = 0.0;
      tmpvar_645[1].y = 1.0;
      tmpvar_645[1].z = 0.0;
      tmpvar_645[1].w = 0.0;
      tmpvar_645[2].x = -1.244444;
      tmpvar_645[2].y = 0.0;
      tmpvar_645[2].z = 0.5555556;
      tmpvar_645[2].w = 0.0;
      tmpvar_645[3].x = 0.0;
      tmpvar_645[3].y = 0.0;
      tmpvar_645[3].z = 0.0;
      tmpvar_645[3].w = 1.0;
      m_643 = (tmpvar_644 * tmpvar_645);
      mat4 tmpvar_646;
      tmpvar_646 = (m_643 * 0.4);
      m_643 = tmpvar_646;
      vec4 tmpvar_647;
      tmpvar_647 = (tmpvar_646[3] * tmpvar_646);
      m_643[3] = tmpvar_647;
      vec4 x_648;
      x_648 = (fract(tmpvar_647) - 0.5);
      mat4 tmpvar_649;
      tmpvar_649 = (m_643 * -0.6);
      m_643 = tmpvar_649;
      vec4 tmpvar_650;
      tmpvar_650 = (tmpvar_649[3] * tmpvar_649);
      m_643[3] = tmpvar_650;
      vec4 x_651;
      x_651 = (fract(tmpvar_650) - 0.5);
      mat4 tmpvar_652;
      tmpvar_652 = (m_643 * -1.6);
      m_643 = tmpvar_652;
      vec4 tmpvar_653;
      tmpvar_653 = (tmpvar_652[3] * tmpvar_652);
      m_643[3] = tmpvar_653;
      vec4 x_654;
      x_654 = (fract(tmpvar_653) - 0.5);
      k_642 = (min (min (
        sqrt(dot (x_648, x_648))
      , 
        sqrt(dot (x_651, x_651))
      ), sqrt(
        dot (x_654, x_654)
      )) / m_643[2]);
      vec2 p_655;
      float r_656;
      p_655.y = (p_641.y - 0.8505124);
      p_655.x = (p_641.x - 2.005062);
      float tmpvar_657;
      float tmpvar_658;
      tmpvar_658 = (min (abs(
        (p_655.y / p_655.x)
      ), 1.0) / max (abs(
        (p_655.y / p_655.x)
      ), 1.0));
      float tmpvar_659;
      tmpvar_659 = (tmpvar_658 * tmpvar_658);
      tmpvar_659 = (((
        ((((
          ((((-0.01213232 * tmpvar_659) + 0.05368138) * tmpvar_659) - 0.1173503)
         * tmpvar_659) + 0.1938925) * tmpvar_659) - 0.3326756)
       * tmpvar_659) + 0.9999793) * tmpvar_658);
      tmpvar_659 = (tmpvar_659 + (float(
        (abs((p_655.y / p_655.x)) > 1.0)
      ) * (
        (tmpvar_659 * -2.0)
       + 1.570796)));
      tmpvar_657 = (tmpvar_659 * sign((p_655.y / p_655.x)));
      if ((abs(p_655.x) > (1e-08 * abs(p_655.y)))) {
        if ((p_655.x < 0.0)) {
          if ((p_655.y >= 0.0)) {
            tmpvar_657 += 3.141593;
          } else {
            tmpvar_657 = (tmpvar_657 - 3.141593);
          };
        };
      } else {
        tmpvar_657 = (sign(p_655.y) * 1.570796);
      };
      float tmpvar_660;
      tmpvar_660 = clamp (((tmpvar_657 - 0.8471932) / 0.2), 0.0, 1.0);
      float tmpvar_661;
      tmpvar_661 = clamp (((tmpvar_657 - 2.094386) / 0.2), 0.0, 1.0);
      r_656 = (sin((3.14158 * 
        ((tmpvar_657 - 1.047193) / 1.047193)
      )) * 0.2);
      r_656 = (r_656 + (abs(
        sin(((r_656 * 10.0) + (time * 0.1)))
      ) * 0.2));
      r_656 += 0.1;
      float tmpvar_662;
      tmpvar_662 = clamp (((
        sqrt(dot (p_655, p_655))
       - 0.4) / 0.2), 0.0, 1.0);
      float tmpvar_663;
      tmpvar_663 = clamp (((
        sqrt(dot (p_655, p_655))
       - 0.8) / (
        ((abs(sin(
          ((r_656 * 10.0) + time)
        )) * 0.2) + 2.0)
       - 0.8)), 0.0, 1.0);
      r_656 = (r_656 * ((tmpvar_662 * 
        (tmpvar_662 * (3.0 - (2.0 * tmpvar_662)))
      ) - (tmpvar_663 * 
        (tmpvar_663 * (3.0 - (2.0 * tmpvar_663)))
      )));
      vec2 xy_664;
      xy_664 = (p_655 + (time * 0.5));
      vec2 uv_665;
      vec2 tmpvar_666;
      tmpvar_666 = floor(xy_664);
      vec2 tmpvar_667;
      tmpvar_667 = (xy_664 - tmpvar_666);
      uv_665 = ((tmpvar_667 * tmpvar_667) * (3.0 - (2.0 * tmpvar_667)));
      float tmpvar_668;
      tmpvar_668 = fract((cos(
        dot (tmpvar_666, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_669;
      tmpvar_669.x = (tmpvar_666.x + 1.0);
      tmpvar_669.y = tmpvar_666.y;
      float tmpvar_670;
      tmpvar_670 = fract((cos(
        dot (tmpvar_669, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_671;
      tmpvar_671.x = tmpvar_666.x;
      tmpvar_671.y = (tmpvar_666.y + 1.0);
      float tmpvar_672;
      tmpvar_672 = fract((cos(
        dot (tmpvar_671, vec2(21.9898, 78.233))
      ) * 43758.55));
      r_656 = (r_656 * abs((
        ((tmpvar_668 + ((tmpvar_670 - tmpvar_668) * uv_665.x)) + ((tmpvar_672 - tmpvar_668) * uv_665.y))
       + 
        ((((
          (tmpvar_668 - tmpvar_670)
         - tmpvar_672) + fract(
          (cos(dot ((tmpvar_666 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_665.x) * uv_665.y)
      )));
      r_656 = (r_656 * 15.0);
      vec4 tmpvar_673;
      tmpvar_673.w = 1.0;
      tmpvar_673.xyz = ((vec3(-1.29, -0.5, -0.1) * r_656) * ((tmpvar_660 * 
        (tmpvar_660 * (3.0 - (2.0 * tmpvar_660)))
      ) - (tmpvar_661 * 
        (tmpvar_661 * (3.0 - (2.0 * tmpvar_661)))
      )));
      float c_674;
      vec2 tmpvar_675;
      tmpvar_675 = (p_641 - vec2(0.5, 0.5));
      c_674 = ((cos(
        ((p_641.x * 80.0) - (time / 2.0))
      ) * 0.5) + 0.5);
      vec4 tmpvar_676;
      tmpvar_676.x = c_674;
      tmpvar_676.y = c_674;
      tmpvar_676.z = c_674;
      tmpvar_676.w = min (clamp ((1.0 - 
        sqrt(dot (tmpvar_675, tmpvar_675))
      ), 0.0, 1.0), c_674);
      c_563 = (c_563 + ((k_642 + tmpvar_673) + mix (vec4(-0.25, 0.0, 0.0, 1.0), tmpvar_676, tmpvar_676.w)));
      p_564 = (p_564 * 0.4);
      c_563 = (c_563 * 0.6);
    };
    vec2 p_677;
    p_677 = (p_564 * bval_562);
    vec4 k_678;
    mat4 m_679;
    mat4 tmpvar_680;
    tmpvar_680[0].x = -1.0;
    tmpvar_680[0].y = 2.0;
    tmpvar_680[0].z = -2.0;
    tmpvar_680[0].w = 0.0;
    tmpvar_680[1].x = -2.0;
    tmpvar_680[1].y = 1.0;
    tmpvar_680[1].z = 3.0;
    tmpvar_680[1].w = 0.0;
    tmpvar_680[2].x = 3.0;
    tmpvar_680[2].y = 2.0;
    tmpvar_680[2].z = 1.0;
    tmpvar_680[2].w = 0.0;
    tmpvar_680[3].xy = (800.2 * p_677);
    tmpvar_680[3].zw = (vec2(time) + 10000.0);
    mat4 tmpvar_681;
    tmpvar_681[0].x = 1.0;
    tmpvar_681[0].y = 0.0;
    tmpvar_681[0].z = 0.0;
    tmpvar_681[0].w = 0.0;
    tmpvar_681[1].x = 0.0;
    tmpvar_681[1].y = 1.0;
    tmpvar_681[1].z = 0.0;
    tmpvar_681[1].w = 0.0;
    tmpvar_681[2].x = -1.244444;
    tmpvar_681[2].y = 0.0;
    tmpvar_681[2].z = 0.5555556;
    tmpvar_681[2].w = 0.0;
    tmpvar_681[3].x = 0.0;
    tmpvar_681[3].y = 0.0;
    tmpvar_681[3].z = 0.0;
    tmpvar_681[3].w = 1.0;
    m_679 = (tmpvar_680 * tmpvar_681);
    mat4 tmpvar_682;
    tmpvar_682 = (m_679 * 0.4);
    m_679 = tmpvar_682;
    vec4 tmpvar_683;
    tmpvar_683 = (tmpvar_682[3] * tmpvar_682);
    m_679[3] = tmpvar_683;
    vec4 x_684;
    x_684 = (fract(tmpvar_683) - 0.5);
    mat4 tmpvar_685;
    tmpvar_685 = (m_679 * -0.6);
    m_679 = tmpvar_685;
    vec4 tmpvar_686;
    tmpvar_686 = (tmpvar_685[3] * tmpvar_685);
    m_679[3] = tmpvar_686;
    vec4 x_687;
    x_687 = (fract(tmpvar_686) - 0.5);
    mat4 tmpvar_688;
    tmpvar_688 = (m_679 * -1.6);
    m_679 = tmpvar_688;
    vec4 tmpvar_689;
    tmpvar_689 = (tmpvar_688[3] * tmpvar_688);
    m_679[3] = tmpvar_689;
    vec4 x_690;
    x_690 = (fract(tmpvar_689) - 0.5);
    k_678 = (min (min (
      sqrt(dot (x_684, x_684))
    , 
      sqrt(dot (x_687, x_687))
    ), sqrt(
      dot (x_690, x_690)
    )) / m_679[2]);
    vec2 p_691;
    float r_692;
    p_691.y = (p_677.y - 0.8505124);
    p_691.x = (p_677.x - 2.005062);
    float tmpvar_693;
    float tmpvar_694;
    tmpvar_694 = (min (abs(
      (p_691.y / p_691.x)
    ), 1.0) / max (abs(
      (p_691.y / p_691.x)
    ), 1.0));
    float tmpvar_695;
    tmpvar_695 = (tmpvar_694 * tmpvar_694);
    tmpvar_695 = (((
      ((((
        ((((-0.01213232 * tmpvar_695) + 0.05368138) * tmpvar_695) - 0.1173503)
       * tmpvar_695) + 0.1938925) * tmpvar_695) - 0.3326756)
     * tmpvar_695) + 0.9999793) * tmpvar_694);
    tmpvar_695 = (tmpvar_695 + (float(
      (abs((p_691.y / p_691.x)) > 1.0)
    ) * (
      (tmpvar_695 * -2.0)
     + 1.570796)));
    tmpvar_693 = (tmpvar_695 * sign((p_691.y / p_691.x)));
    if ((abs(p_691.x) > (1e-08 * abs(p_691.y)))) {
      if ((p_691.x < 0.0)) {
        if ((p_691.y >= 0.0)) {
          tmpvar_693 += 3.141593;
        } else {
          tmpvar_693 = (tmpvar_693 - 3.141593);
        };
      };
    } else {
      tmpvar_693 = (sign(p_691.y) * 1.570796);
    };
    float tmpvar_696;
    tmpvar_696 = clamp (((tmpvar_693 - 0.8471932) / 0.2), 0.0, 1.0);
    float tmpvar_697;
    tmpvar_697 = clamp (((tmpvar_693 - 2.094386) / 0.2), 0.0, 1.0);
    r_692 = (sin((3.14158 * 
      ((tmpvar_693 - 1.047193) / 1.047193)
    )) * 0.2);
    r_692 = (r_692 + (abs(
      sin(((r_692 * 10.0) + (time * 0.1)))
    ) * 0.2));
    r_692 += 0.1;
    float tmpvar_698;
    tmpvar_698 = clamp (((
      sqrt(dot (p_691, p_691))
     - 0.4) / 0.2), 0.0, 1.0);
    float tmpvar_699;
    tmpvar_699 = clamp (((
      sqrt(dot (p_691, p_691))
     - 0.8) / (
      ((abs(sin(
        ((r_692 * 10.0) + time)
      )) * 0.2) + 2.0)
     - 0.8)), 0.0, 1.0);
    r_692 = (r_692 * ((tmpvar_698 * 
      (tmpvar_698 * (3.0 - (2.0 * tmpvar_698)))
    ) - (tmpvar_699 * 
      (tmpvar_699 * (3.0 - (2.0 * tmpvar_699)))
    )));
    vec2 xy_700;
    xy_700 = (p_691 + (time * 0.5));
    vec2 uv_701;
    vec2 tmpvar_702;
    tmpvar_702 = floor(xy_700);
    vec2 tmpvar_703;
    tmpvar_703 = (xy_700 - tmpvar_702);
    uv_701 = ((tmpvar_703 * tmpvar_703) * (3.0 - (2.0 * tmpvar_703)));
    float tmpvar_704;
    tmpvar_704 = fract((cos(
      dot (tmpvar_702, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_705;
    tmpvar_705.x = (tmpvar_702.x + 1.0);
    tmpvar_705.y = tmpvar_702.y;
    float tmpvar_706;
    tmpvar_706 = fract((cos(
      dot (tmpvar_705, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_707;
    tmpvar_707.x = tmpvar_702.x;
    tmpvar_707.y = (tmpvar_702.y + 1.0);
    float tmpvar_708;
    tmpvar_708 = fract((cos(
      dot (tmpvar_707, vec2(21.9898, 78.233))
    ) * 43758.55));
    r_692 = (r_692 * abs((
      ((tmpvar_704 + ((tmpvar_706 - tmpvar_704) * uv_701.x)) + ((tmpvar_708 - tmpvar_704) * uv_701.y))
     + 
      ((((
        (tmpvar_704 - tmpvar_706)
       - tmpvar_708) + fract(
        (cos(dot ((tmpvar_702 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
      )) * uv_701.x) * uv_701.y)
    )));
    r_692 = (r_692 * 15.0);
    vec4 tmpvar_709;
    tmpvar_709.w = 1.0;
    tmpvar_709.xyz = ((vec3(-1.29, -0.5, -0.1) * r_692) * ((tmpvar_696 * 
      (tmpvar_696 * (3.0 - (2.0 * tmpvar_696)))
    ) - (tmpvar_697 * 
      (tmpvar_697 * (3.0 - (2.0 * tmpvar_697)))
    )));
    float c_710;
    vec2 tmpvar_711;
    tmpvar_711 = (p_677 - vec2(0.5, 0.5));
    c_710 = ((cos(
      ((p_677.x * 80.0) - (time / 2.0))
    ) * 0.5) + 0.5);
    vec4 tmpvar_712;
    tmpvar_712.x = c_710;
    tmpvar_712.y = c_710;
    tmpvar_712.z = c_710;
    tmpvar_712.w = min (clamp ((1.0 - 
      sqrt(dot (tmpvar_711, tmpvar_711))
    ), 0.0, 1.0), c_710);
    c_563 = (c_563 + ((k_678 + tmpvar_709) + mix (vec4(-0.25, 0.0, 0.0, 1.0), tmpvar_712, tmpvar_712.w)));
    p_564 = (p_564 * 0.4);
    c_563 = (c_563 * 0.6);
    vec2 p_713;
    p_713 = (p_564 * bval_562);
    vec4 k_714;
    mat4 m_715;
    mat4 tmpvar_716;
    tmpvar_716[0].x = -1.0;
    tmpvar_716[0].y = 2.0;
    tmpvar_716[0].z = -2.0;
    tmpvar_716[0].w = 0.0;
    tmpvar_716[1].x = -2.0;
    tmpvar_716[1].y = 1.0;
    tmpvar_716[1].z = 3.0;
    tmpvar_716[1].w = 0.0;
    tmpvar_716[2].x = 3.0;
    tmpvar_716[2].y = 2.0;
    tmpvar_716[2].z = 1.0;
    tmpvar_716[2].w = 0.0;
    tmpvar_716[3].xy = (800.2 * p_713);
    tmpvar_716[3].zw = (vec2(time) + 10000.0);
    mat4 tmpvar_717;
    tmpvar_717[0].x = 1.0;
    tmpvar_717[0].y = 0.0;
    tmpvar_717[0].z = 0.0;
    tmpvar_717[0].w = 0.0;
    tmpvar_717[1].x = 0.0;
    tmpvar_717[1].y = 1.0;
    tmpvar_717[1].z = 0.0;
    tmpvar_717[1].w = 0.0;
    tmpvar_717[2].x = -1.244444;
    tmpvar_717[2].y = 0.0;
    tmpvar_717[2].z = 0.5555556;
    tmpvar_717[2].w = 0.0;
    tmpvar_717[3].x = 0.0;
    tmpvar_717[3].y = 0.0;
    tmpvar_717[3].z = 0.0;
    tmpvar_717[3].w = 1.0;
    m_715 = (tmpvar_716 * tmpvar_717);
    mat4 tmpvar_718;
    tmpvar_718 = (m_715 * 0.4);
    m_715 = tmpvar_718;
    vec4 tmpvar_719;
    tmpvar_719 = (tmpvar_718[3] * tmpvar_718);
    m_715[3] = tmpvar_719;
    vec4 x_720;
    x_720 = (fract(tmpvar_719) - 0.5);
    mat4 tmpvar_721;
    tmpvar_721 = (m_715 * -0.6);
    m_715 = tmpvar_721;
    vec4 tmpvar_722;
    tmpvar_722 = (tmpvar_721[3] * tmpvar_721);
    m_715[3] = tmpvar_722;
    vec4 x_723;
    x_723 = (fract(tmpvar_722) - 0.5);
    mat4 tmpvar_724;
    tmpvar_724 = (m_715 * -1.6);
    m_715 = tmpvar_724;
    vec4 tmpvar_725;
    tmpvar_725 = (tmpvar_724[3] * tmpvar_724);
    m_715[3] = tmpvar_725;
    vec4 x_726;
    x_726 = (fract(tmpvar_725) - 0.5);
    k_714 = (min (min (
      sqrt(dot (x_720, x_720))
    , 
      sqrt(dot (x_723, x_723))
    ), sqrt(
      dot (x_726, x_726)
    )) / m_715[2]);
    vec2 p_727;
    float r_728;
    p_727.y = (p_713.y - 0.8505124);
    p_727.x = (p_713.x - 2.005062);
    float tmpvar_729;
    float tmpvar_730;
    tmpvar_730 = (min (abs(
      (p_727.y / p_727.x)
    ), 1.0) / max (abs(
      (p_727.y / p_727.x)
    ), 1.0));
    float tmpvar_731;
    tmpvar_731 = (tmpvar_730 * tmpvar_730);
    tmpvar_731 = (((
      ((((
        ((((-0.01213232 * tmpvar_731) + 0.05368138) * tmpvar_731) - 0.1173503)
       * tmpvar_731) + 0.1938925) * tmpvar_731) - 0.3326756)
     * tmpvar_731) + 0.9999793) * tmpvar_730);
    tmpvar_731 = (tmpvar_731 + (float(
      (abs((p_727.y / p_727.x)) > 1.0)
    ) * (
      (tmpvar_731 * -2.0)
     + 1.570796)));
    tmpvar_729 = (tmpvar_731 * sign((p_727.y / p_727.x)));
    if ((abs(p_727.x) > (1e-08 * abs(p_727.y)))) {
      if ((p_727.x < 0.0)) {
        if ((p_727.y >= 0.0)) {
          tmpvar_729 += 3.141593;
        } else {
          tmpvar_729 = (tmpvar_729 - 3.141593);
        };
      };
    } else {
      tmpvar_729 = (sign(p_727.y) * 1.570796);
    };
    float tmpvar_732;
    tmpvar_732 = clamp (((tmpvar_729 - 0.8471932) / 0.2), 0.0, 1.0);
    float tmpvar_733;
    tmpvar_733 = clamp (((tmpvar_729 - 2.094386) / 0.2), 0.0, 1.0);
    r_728 = (sin((3.14158 * 
      ((tmpvar_729 - 1.047193) / 1.047193)
    )) * 0.2);
    r_728 = (r_728 + (abs(
      sin(((r_728 * 10.0) + (time * 0.1)))
    ) * 0.2));
    r_728 += 0.1;
    float tmpvar_734;
    tmpvar_734 = clamp (((
      sqrt(dot (p_727, p_727))
     - 0.4) / 0.2), 0.0, 1.0);
    float tmpvar_735;
    tmpvar_735 = clamp (((
      sqrt(dot (p_727, p_727))
     - 0.8) / (
      ((abs(sin(
        ((r_728 * 10.0) + time)
      )) * 0.2) + 2.0)
     - 0.8)), 0.0, 1.0);
    r_728 = (r_728 * ((tmpvar_734 * 
      (tmpvar_734 * (3.0 - (2.0 * tmpvar_734)))
    ) - (tmpvar_735 * 
      (tmpvar_735 * (3.0 - (2.0 * tmpvar_735)))
    )));
    vec2 xy_736;
    xy_736 = (p_727 + (time * 0.5));
    vec2 uv_737;
    vec2 tmpvar_738;
    tmpvar_738 = floor(xy_736);
    vec2 tmpvar_739;
    tmpvar_739 = (xy_736 - tmpvar_738);
    uv_737 = ((tmpvar_739 * tmpvar_739) * (3.0 - (2.0 * tmpvar_739)));
    float tmpvar_740;
    tmpvar_740 = fract((cos(
      dot (tmpvar_738, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_741;
    tmpvar_741.x = (tmpvar_738.x + 1.0);
    tmpvar_741.y = tmpvar_738.y;
    float tmpvar_742;
    tmpvar_742 = fract((cos(
      dot (tmpvar_741, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_743;
    tmpvar_743.x = tmpvar_738.x;
    tmpvar_743.y = (tmpvar_738.y + 1.0);
    float tmpvar_744;
    tmpvar_744 = fract((cos(
      dot (tmpvar_743, vec2(21.9898, 78.233))
    ) * 43758.55));
    r_728 = (r_728 * abs((
      ((tmpvar_740 + ((tmpvar_742 - tmpvar_740) * uv_737.x)) + ((tmpvar_744 - tmpvar_740) * uv_737.y))
     + 
      ((((
        (tmpvar_740 - tmpvar_742)
       - tmpvar_744) + fract(
        (cos(dot ((tmpvar_738 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
      )) * uv_737.x) * uv_737.y)
    )));
    r_728 = (r_728 * 15.0);
    vec4 tmpvar_745;
    tmpvar_745.w = 1.0;
    tmpvar_745.xyz = ((vec3(-1.29, -0.5, -0.1) * r_728) * ((tmpvar_732 * 
      (tmpvar_732 * (3.0 - (2.0 * tmpvar_732)))
    ) - (tmpvar_733 * 
      (tmpvar_733 * (3.0 - (2.0 * tmpvar_733)))
    )));
    float c_746;
    vec2 tmpvar_747;
    tmpvar_747 = (p_713 - vec2(0.5, 0.5));
    c_746 = ((cos(
      ((p_713.x * 80.0) - (time / 2.0))
    ) * 0.5) + 0.5);
    vec4 tmpvar_748;
    tmpvar_748.x = c_746;
    tmpvar_748.y = c_746;
    tmpvar_748.z = c_746;
    tmpvar_748.w = min (clamp ((1.0 - 
      sqrt(dot (tmpvar_747, tmpvar_747))
    ), 0.0, 1.0), c_746);
    c_563 = (c_563 + ((k_714 + tmpvar_745) + mix (vec4(-0.25, 0.0, 0.0, 1.0), tmpvar_748, tmpvar_748.w)));
    p_564 = (p_564 * 0.4);
    c_563 = (c_563 * 0.6);
    vec4 tmpvar_749;
    tmpvar_749 = max (vec4(0.0, 0.0, 0.0, 0.0), ((
      (c_563.y + ((tmpvar_568 - c_563.y) * c_563.x))
     * 
      clamp ((9.0 - ((tmpvar_567 * tmpvar_567) * 9.0)), 0.0, 1.0)
    ) + (tmpvar_310 * 
      (1.0 - clamp ((9.0 - (
        (tmpvar_567 * tmpvar_567)
       * 9.0)), 0.0, 1.0))
    )));
    tmpc_561.zw = tmpvar_749.zw;
    tmpc_561.x = (tmpvar_749.x * 0.55);
    tmpc_561.y = (tmpvar_749.y * 0.725);
    tmpvar_556 = tmpc_561;
  } else {
    tmpvar_556 = tmpvar_310;
  };
  buff_10 = tmpvar_556;
  vec4 tmpvar_750;
  vec2 tmpvar_751;
  tmpvar_751 = ((gl_FragCoord.xy - (planetpos3 * zoom)) - shippos);
  vec2 x_752;
  float tmpvar_753;
  tmpvar_753 = (10000.0 * zoom);
  x_752 = (tmpvar_751 - tmpvar_753);
  float tmpvar_754;
  tmpvar_754 = float((sqrt(
    dot (x_752, x_752)
  ) >= tmpvar_753));
  if (((1.0 - tmpvar_754) > 0.0)) {
    vec4 c_755;
    vec2 p_756;
    vec2 tmpvar_757;
    tmpvar_757 = vec2((20000.0 * zoom));
    vec2 tmpvar_758;
    tmpvar_758 = (((tmpvar_751 * 2.0) - tmpvar_757) / tmpvar_757.y);
    float tmpvar_759;
    tmpvar_759 = sqrt(dot (tmpvar_758, tmpvar_758));
    vec4 tmpvar_760;
    tmpvar_760 = (vec4(0.43, 0.442, 0.4, 1.0) + tmpvar_758.y);
    c_755 = tmpvar_760;
    p_756 = (((tmpvar_758 * 
      (sign(tmpvar_759) * (1.570796 - (sqrt(
        (1.0 - abs(tmpvar_759))
      ) * (1.570796 + 
        (abs(tmpvar_759) * (-0.2146018 + (abs(tmpvar_759) * (0.08656672 + 
          (abs(tmpvar_759) * -0.03102955)
        ))))
      ))))
    ) / tmpvar_759) - 5.0);
    p_756 = (p_756 * p_756.y);
    if (best) {
      vec2 fragCoord_761;
      fragCoord_761 = (p_756 * 0.0390151);
      vec3 color_762;
      vec2 tmpvar_763;
      tmpvar_763 = (fragCoord_761 * 0.51);
      vec2 tmpvar_764;
      tmpvar_764.y = 0.5;
      tmpvar_764.x = (0.5 - (0.015 * sin(
        (time / 3.0)
      )));
      vec2 tmpvar_765;
      tmpvar_765.x = tmpvar_764.x;
      tmpvar_765.y = 0.5;
      vec2 tmpvar_766;
      tmpvar_766 = (mat2(0.866, 0.5, -0.5, 0.866) * (tmpvar_763 - tmpvar_765));
      vec2 x_767;
      x_767 = (tmpvar_763 - tmpvar_765);
      vec3 tmpvar_768;
      tmpvar_768 = mix (mix (mix (vec3(1.5, 1.294, 1.908235), vec3(1.0, 0.0504019, -0.806), 
        (0.5 * (1.0 + sin((60.0 * tmpvar_766.y))))
      ), vec3(1.0, 1.0, 0.5), (0.5 * 
        (1.0 + sin(((80.0 * tmpvar_766.y) * tmpvar_766.y)))
      )), color_762, pow (sqrt(
        dot (x_767, x_767)
      ), 80.0));
      color_762 = tmpvar_768;
      vec4 tmpvar_769;
      tmpvar_769.w = 1.0;
      tmpvar_769.xyz = tmpvar_768;
      vec4 d_770;
      vec2 tmpvar_771;
      tmpvar_771 = ((fragCoord_761 * 0.525) + 2.9);
      d_770.zw = vec2((time * 0.081));
      d_770.y = (tmpvar_771.y * 0.015);
      d_770.x = (tmpvar_771.x * 0.725);
      d_770.xyw = (d_770.xyw * mat3(-1.0, -0.5, 1.0, 1.5, -1.0, 0.5, 0.5, 1.0, 1.0));
      vec3 x_772;
      x_772 = (0.5 - fract(d_770.xyw));
      d_770.xyw = (d_770.xyw * mat3(-0.8, -0.4, 0.8, 1.2, -0.8, 0.4, 0.4, 0.8, 0.8));
      vec3 x_773;
      x_773 = (0.5 - fract(d_770.xyw));
      d_770.xyw = (d_770.xyw * mat3(-0.6, -0.3, 0.6, 0.9, -0.6, 0.3, 0.3, 0.6, 0.6));
      vec3 x_774;
      x_774 = (0.5 - fract(d_770.xyw));
      c_755 = (tmpvar_760 + (tmpvar_769 * mix (vec4(0.208, 0.108, 0.0, 1.0), vec4(0.462, 0.44, 0.81, 1.0), 
        ((pow (min (
          min (sqrt(dot (x_772, x_772)), sqrt(dot (x_773, x_773)))
        , 
          sqrt(dot (x_774, x_774))
        ), 4.0) * 13.37) + (tmpvar_771.y * 1.55))
      )));
      p_756 = (p_756 * 0.4);
      c_755 = (c_755 * 0.3856);
    };
    vec2 fragCoord_775;
    fragCoord_775 = (p_756 * 0.0390151);
    vec3 color_776;
    vec2 tmpvar_777;
    tmpvar_777 = (fragCoord_775 * 0.51);
    vec2 tmpvar_778;
    tmpvar_778.y = 0.5;
    tmpvar_778.x = (0.5 - (0.015 * sin(
      (time / 3.0)
    )));
    vec2 tmpvar_779;
    tmpvar_779.x = tmpvar_778.x;
    tmpvar_779.y = 0.5;
    vec2 tmpvar_780;
    tmpvar_780 = (mat2(0.866, 0.5, -0.5, 0.866) * (tmpvar_777 - tmpvar_779));
    vec2 x_781;
    x_781 = (tmpvar_777 - tmpvar_779);
    vec3 tmpvar_782;
    tmpvar_782 = mix (mix (mix (vec3(1.5, 1.294, 1.908235), vec3(1.0, 0.0504019, -0.806), 
      (0.5 * (1.0 + sin((60.0 * tmpvar_780.y))))
    ), vec3(1.0, 1.0, 0.5), (0.5 * 
      (1.0 + sin(((80.0 * tmpvar_780.y) * tmpvar_780.y)))
    )), color_776, pow (sqrt(
      dot (x_781, x_781)
    ), 80.0));
    color_776 = tmpvar_782;
    vec4 tmpvar_783;
    tmpvar_783.w = 1.0;
    tmpvar_783.xyz = tmpvar_782;
    vec4 d_784;
    vec2 tmpvar_785;
    tmpvar_785 = ((fragCoord_775 * 0.525) + 2.9);
    d_784.zw = vec2((time * 0.081));
    d_784.y = (tmpvar_785.y * 0.015);
    d_784.x = (tmpvar_785.x * 0.725);
    d_784.xyw = (d_784.xyw * mat3(-1.0, -0.5, 1.0, 1.5, -1.0, 0.5, 0.5, 1.0, 1.0));
    vec3 x_786;
    x_786 = (0.5 - fract(d_784.xyw));
    d_784.xyw = (d_784.xyw * mat3(-0.8, -0.4, 0.8, 1.2, -0.8, 0.4, 0.4, 0.8, 0.8));
    vec3 x_787;
    x_787 = (0.5 - fract(d_784.xyw));
    d_784.xyw = (d_784.xyw * mat3(-0.6, -0.3, 0.6, 0.9, -0.6, 0.3, 0.3, 0.6, 0.6));
    vec3 x_788;
    x_788 = (0.5 - fract(d_784.xyw));
    c_755 = (c_755 + (tmpvar_783 * mix (vec4(0.208, 0.108, 0.0, 1.0), vec4(0.462, 0.44, 0.81, 1.0), 
      ((pow (min (
        min (sqrt(dot (x_786, x_786)), sqrt(dot (x_787, x_787)))
      , 
        sqrt(dot (x_788, x_788))
      ), 4.0) * 13.37) + (tmpvar_785.y * 1.55))
    )));
    p_756 = (p_756 * 0.4);
    c_755 = (c_755 * 0.3856);
    tmpvar_750 = (max (vec4(0.0, 0.0, 0.0, 0.0), (
      (c_755 * clamp ((9.0 - (
        (tmpvar_759 * tmpvar_759)
       * 9.0)), 0.0, 1.0))
     + 
      (tmpvar_556 * (1.0 - clamp ((9.0 - 
        ((tmpvar_759 * tmpvar_759) * 9.0)
      ), 0.0, 1.0)))
    )) * 0.755);
  } else {
    tmpvar_750 = tmpvar_556;
  };
  buff_10 = tmpvar_750;
  vec4 tmpvar_789;
  vec2 tmpvar_790;
  tmpvar_790 = ((gl_FragCoord.xy - (planetpos4 * zoom)) - shippos);
  vec2 x_791;
  float tmpvar_792;
  tmpvar_792 = (12500.0 * zoom);
  x_791 = (tmpvar_790 - tmpvar_792);
  float tmpvar_793;
  tmpvar_793 = float((sqrt(
    dot (x_791, x_791)
  ) >= tmpvar_792));
  if (((1.0 - tmpvar_793) > 0.0)) {
    vec4 tmpc_794;
    vec4 c_795;
    vec2 p_796;
    vec2 tmpvar_797;
    tmpvar_797 = vec2((25000.0 * zoom));
    vec2 tmpvar_798;
    tmpvar_798 = (((tmpvar_790 * 2.0) - tmpvar_797) / tmpvar_797.y);
    float tmpvar_799;
    tmpvar_799 = sqrt(dot (tmpvar_798, tmpvar_798));
    vec4 tmpvar_800;
    tmpvar_800 = (vec4(0.43, 0.42, 0.678, 1.0) - min (0.59, abs(tmpvar_798.y)));
    c_795 = tmpvar_800;
    p_796 = (((tmpvar_798 * 
      (sign(tmpvar_799) * (1.570796 - (sqrt(
        (1.0 - abs(tmpvar_799))
      ) * (1.570796 + 
        (abs(tmpvar_799) * (-0.2146018 + (abs(tmpvar_799) * (0.08656672 + 
          (abs(tmpvar_799) * -0.03102955)
        ))))
      ))))
    ) / tmpvar_799) - 5.0);
    p_796 = (p_796 * p_796.y);
    vec4 col_801;
    float tbest_803;
    float gg_804;
    float b_805;
    vec2 p_806;
    vec2 uv_807;
    vec2 tmpvar_808;
    tmpvar_808 = ((0.1851 * p_796) - 4.5);
    uv_807 = tmpvar_808;
    p_806 = tmpvar_808;
    float tmpvar_809;
    tmpvar_809 = (1.0 + sqrt(dot (tmpvar_808, tmpvar_808)));
    b_805 = tmpvar_809;
    vec2 g_810;
    g_810 = (tmpvar_808 * 1.4);
    vec4 f_811;
    f_811 = vec4(1.0, 1.0, 1.0, 1.0);
    vec2 U_812;
    vec4 O_813;
    U_812 = (g_810 * 200.0);
    O_813 = vec4(1.0, 1.0, 1.0, 1.0);
    vec2 tmpvar_814;
    tmpvar_814 = (U_812 / 8.0);
    U_812 = tmpvar_814;
    vec2 tmpvar_815;
    tmpvar_815 = ceil(tmpvar_814);
    float tmpvar_816;
    tmpvar_816 = sin((100000.0 * sqrt(
      dot (tmpvar_815, tmpvar_815)
    )));
    float tmpvar_817;
    if ((tmpvar_816 < 0.0)) {
      tmpvar_817 = tmpvar_814.x;
    } else {
      tmpvar_817 = tmpvar_814.y;
    };
    O_813 = (vec4(1.0, 1.0, 1.0, 1.0) + ((0.1 / 
      fract(tmpvar_817)
    ) - vec4(1.0, 1.0, 1.0, 1.0)));
    g_810 = (g_810 * 8.0);
    g_810.x = (g_810.x * 5.25);
    float tmpvar_818;
    float tmpvar_819;
    tmpvar_819 = (min (abs(
      (g_810.x / g_810.y)
    ), 1.0) / max (abs(
      (g_810.x / g_810.y)
    ), 1.0));
    float tmpvar_820;
    tmpvar_820 = (tmpvar_819 * tmpvar_819);
    tmpvar_820 = (((
      ((((
        ((((-0.01213232 * tmpvar_820) + 0.05368138) * tmpvar_820) - 0.1173503)
       * tmpvar_820) + 0.1938925) * tmpvar_820) - 0.3326756)
     * tmpvar_820) + 0.9999793) * tmpvar_819);
    tmpvar_820 = (tmpvar_820 + (float(
      (abs((g_810.x / g_810.y)) > 1.0)
    ) * (
      (tmpvar_820 * -2.0)
     + 1.570796)));
    tmpvar_818 = (tmpvar_820 * sign((g_810.x / g_810.y)));
    if ((abs(g_810.y) > (1e-08 * abs(g_810.x)))) {
      if ((g_810.y < 0.0)) {
        if ((g_810.x >= 0.0)) {
          tmpvar_818 += 3.141593;
        } else {
          tmpvar_818 = (tmpvar_818 - 3.141593);
        };
      };
    } else {
      tmpvar_818 = (sign(g_810.x) * 1.570796);
    };
    float tmpvar_821;
    tmpvar_821 = sqrt(dot (g_810, g_810));
    g_810.y = tmpvar_821;
    g_810.x = ((tmpvar_818 * 1.7) * floor(tmpvar_821));
    vec2 tmpvar_822;
    tmpvar_822 = floor(g_810);
    float tmpvar_823;
    tmpvar_823 = cos((60000.0 * sqrt(
      dot (tmpvar_822, tmpvar_822)
    )));
    float tmpvar_824;
    if ((tmpvar_823 < -0.8)) {
      tmpvar_824 = g_810.x;
    } else {
      tmpvar_824 = g_810.y;
    };
    f_811 = (vec4(1.0, 1.0, 1.0, 1.0) + (float(
      (0.6 >= (0.1 / fract(tmpvar_824)))
    ) - vec4(1.0, 1.0, 1.0, 1.0)));
    b_805 = (tmpvar_809 + ((f_811 * 
      max (0.0, (0.6 - O_813.x))
    ).x * 0.1));
    b_805 = (b_805 + (sin(time) * 0.01));
    p_806 = (tmpvar_808 * b_805);
    float tmpvar_825;
    tmpvar_825 = (time * 0.2);
    p_806.x = (p_806.x + (sin(tmpvar_825) * 2.0));
    p_806.y = (p_806.y + (cos(tmpvar_825) * 2.0));
    vec2 p_826;
    p_826 = ((p_806 * 0.1) + tmpvar_808);
    float q_828;
    q_828 = 0.0;
    for (float i_827 = 0.0; i_827 < 5.0; i_827 += 1.0) {
      q_828 = (q_828 + (0.028 + (i_827 * 0.01)));
      p_826.x = (p_826.x + ((
        (p_826.y * sin((iTime * 0.021)))
       * 0.1) + (
        sin((iTime * 0.05))
       * 1.2)));
      p_826.y = (p_826.y - ((
        (p_826.x * cos((iTime * 0.031)))
       * 0.1) + (
        cos((iTime * 0.05))
       * 1.2)));
      vec4 tmpvar_829;
      vec2 g_830;
      g_830 = ((vec2(mod (p_826, 4.0))) * 0.25);
      vec4 f_831;
      f_831 = vec4(1.0, 1.0, 1.0, 1.0);
      vec2 U_832;
      vec4 O_833;
      U_832 = (g_830 * 200.0);
      O_833 = vec4(1.0, 1.0, 1.0, 1.0);
      vec2 tmpvar_834;
      tmpvar_834 = (U_832 / 8.0);
      U_832 = tmpvar_834;
      vec2 tmpvar_835;
      tmpvar_835 = ceil(tmpvar_834);
      float tmpvar_836;
      tmpvar_836 = sin((100000.0 * sqrt(
        dot (tmpvar_835, tmpvar_835)
      )));
      float tmpvar_837;
      if ((tmpvar_836 < 0.0)) {
        tmpvar_837 = tmpvar_834.x;
      } else {
        tmpvar_837 = tmpvar_834.y;
      };
      O_833 = (vec4(1.0, 1.0, 1.0, 1.0) + ((0.1 / 
        fract(tmpvar_837)
      ) - vec4(1.0, 1.0, 1.0, 1.0)));
      g_830 = (g_830 * 8.0);
      g_830.x = (g_830.x * 5.25);
      float tmpvar_838;
      float tmpvar_839;
      tmpvar_839 = (min (abs(
        (g_830.x / g_830.y)
      ), 1.0) / max (abs(
        (g_830.x / g_830.y)
      ), 1.0));
      float tmpvar_840;
      tmpvar_840 = (tmpvar_839 * tmpvar_839);
      tmpvar_840 = (((
        ((((
          ((((-0.01213232 * tmpvar_840) + 0.05368138) * tmpvar_840) - 0.1173503)
         * tmpvar_840) + 0.1938925) * tmpvar_840) - 0.3326756)
       * tmpvar_840) + 0.9999793) * tmpvar_839);
      tmpvar_840 = (tmpvar_840 + (float(
        (abs((g_830.x / g_830.y)) > 1.0)
      ) * (
        (tmpvar_840 * -2.0)
       + 1.570796)));
      tmpvar_838 = (tmpvar_840 * sign((g_830.x / g_830.y)));
      if ((abs(g_830.y) > (1e-08 * abs(g_830.x)))) {
        if ((g_830.y < 0.0)) {
          if ((g_830.x >= 0.0)) {
            tmpvar_838 += 3.141593;
          } else {
            tmpvar_838 = (tmpvar_838 - 3.141593);
          };
        };
      } else {
        tmpvar_838 = (sign(g_830.x) * 1.570796);
      };
      float tmpvar_841;
      tmpvar_841 = sqrt(dot (g_830, g_830));
      g_830.y = tmpvar_841;
      g_830.x = ((tmpvar_838 * 1.7) * floor(tmpvar_841));
      vec2 tmpvar_842;
      tmpvar_842 = floor(g_830);
      float tmpvar_843;
      tmpvar_843 = cos((60000.0 * sqrt(
        dot (tmpvar_842, tmpvar_842)
      )));
      float tmpvar_844;
      if ((tmpvar_843 < -0.8)) {
        tmpvar_844 = g_830.x;
      } else {
        tmpvar_844 = g_830.y;
      };
      f_831 = (vec4(1.0, 1.0, 1.0, 1.0) + (float(
        (0.6 >= (0.1 / fract(tmpvar_844)))
      ) - vec4(1.0, 1.0, 1.0, 1.0)));
      tmpvar_829 = (f_831 * max (0.0, (0.6 - O_833.x)));
      if ((tmpvar_829.x < 0.1360704)) {
        break;
      };
      p_826 = (p_826 * 1.2);
    };
    gg_804 = 0.0;
    tbest_803 = 4.0;
    if (best) {
      tbest_803 = 6.0;
    };
    for (float g_802 = 0.0; g_802 < tbest_803; g_802 += 1.0) {
      float tmpvar_845;
      tmpvar_845 = pow ((g_802 / 20.0), 0.5);
      vec2 p_846;
      p_846 = ((p_806 * 0.1) + (uv_807 * (tmpvar_845 + 
        (fract((cos(
          (dot ((uv_807 + p_806), vec2(2.31, 53.21)) * 124.123)
        ) * 412.0)) * (tmpvar_845 - pow ((
          (g_802 - 1.0)
         / 20.0), 0.5)))
      )));
      float q_848;
      q_848 = 0.0;
      for (float i_847 = 0.0; i_847 < 5.0; i_847 += 1.0) {
        q_848 = (q_848 + (0.028 + (i_847 * 0.01)));
        p_846.x = (p_846.x + ((
          (p_846.y * sin((iTime * 0.021)))
         * 0.1) + (
          sin((iTime * 0.05))
         * 1.2)));
        p_846.y = (p_846.y - ((
          (p_846.x * cos((iTime * 0.031)))
         * 0.1) + (
          cos((iTime * 0.05))
         * 1.2)));
        vec4 tmpvar_849;
        vec2 g_850;
        g_850 = ((vec2(mod (p_846, 4.0))) * 0.25);
        vec4 f_851;
        f_851 = vec4(1.0, 1.0, 1.0, 1.0);
        vec2 U_852;
        vec4 O_853;
        U_852 = (g_850 * 200.0);
        O_853 = vec4(1.0, 1.0, 1.0, 1.0);
        vec2 tmpvar_854;
        tmpvar_854 = (U_852 / 8.0);
        U_852 = tmpvar_854;
        vec2 tmpvar_855;
        tmpvar_855 = ceil(tmpvar_854);
        float tmpvar_856;
        tmpvar_856 = sin((100000.0 * sqrt(
          dot (tmpvar_855, tmpvar_855)
        )));
        float tmpvar_857;
        if ((tmpvar_856 < 0.0)) {
          tmpvar_857 = tmpvar_854.x;
        } else {
          tmpvar_857 = tmpvar_854.y;
        };
        O_853 = (vec4(1.0, 1.0, 1.0, 1.0) + ((0.1 / 
          fract(tmpvar_857)
        ) - vec4(1.0, 1.0, 1.0, 1.0)));
        g_850 = (g_850 * 8.0);
        g_850.x = (g_850.x * 5.25);
        float tmpvar_858;
        float tmpvar_859;
        tmpvar_859 = (min (abs(
          (g_850.x / g_850.y)
        ), 1.0) / max (abs(
          (g_850.x / g_850.y)
        ), 1.0));
        float tmpvar_860;
        tmpvar_860 = (tmpvar_859 * tmpvar_859);
        tmpvar_860 = (((
          ((((
            ((((-0.01213232 * tmpvar_860) + 0.05368138) * tmpvar_860) - 0.1173503)
           * tmpvar_860) + 0.1938925) * tmpvar_860) - 0.3326756)
         * tmpvar_860) + 0.9999793) * tmpvar_859);
        tmpvar_860 = (tmpvar_860 + (float(
          (abs((g_850.x / g_850.y)) > 1.0)
        ) * (
          (tmpvar_860 * -2.0)
         + 1.570796)));
        tmpvar_858 = (tmpvar_860 * sign((g_850.x / g_850.y)));
        if ((abs(g_850.y) > (1e-08 * abs(g_850.x)))) {
          if ((g_850.y < 0.0)) {
            if ((g_850.x >= 0.0)) {
              tmpvar_858 += 3.141593;
            } else {
              tmpvar_858 = (tmpvar_858 - 3.141593);
            };
          };
        } else {
          tmpvar_858 = (sign(g_850.x) * 1.570796);
        };
        float tmpvar_861;
        tmpvar_861 = sqrt(dot (g_850, g_850));
        g_850.y = tmpvar_861;
        g_850.x = ((tmpvar_858 * 1.7) * floor(tmpvar_861));
        vec2 tmpvar_862;
        tmpvar_862 = floor(g_850);
        float tmpvar_863;
        tmpvar_863 = cos((60000.0 * sqrt(
          dot (tmpvar_862, tmpvar_862)
        )));
        float tmpvar_864;
        if ((tmpvar_863 < -0.8)) {
          tmpvar_864 = g_850.x;
        } else {
          tmpvar_864 = g_850.y;
        };
        f_851 = (vec4(1.0, 1.0, 1.0, 1.0) + (float(
          (0.6 >= (0.1 / fract(tmpvar_864)))
        ) - vec4(1.0, 1.0, 1.0, 1.0)));
        tmpvar_849 = (f_851 * max (0.0, (0.6 - O_853.x)));
        if ((tmpvar_849.x < 0.1360704)) {
          break;
        };
        p_846 = (p_846 * 1.2);
      };
      gg_804 = (gg_804 + q_848);
    };
    float tmpvar_865;
    tmpvar_865 = mix ((gg_804 * 0.125), q_828, 0.25);
    vec4 tmpvar_866;
    tmpvar_866.w = 1.0;
    tmpvar_866.x = (tmpvar_865 * 4.0);
    tmpvar_866.y = (tmpvar_865 * 3.0);
    tmpvar_866.z = tmpvar_865;
    col_801 = (tmpvar_866 / (b_805 - 0.61));
    float tmpvar_867;
    tmpvar_867 = fract((cos(
      (dot ((tmpvar_808 + col_801.xy), vec2(2.31, 53.21)) * 124.123)
    ) * 412.0));
    vec4 tmpvar_868;
    tmpvar_868.w = 0.0;
    tmpvar_868.x = tmpvar_867;
    tmpvar_868.y = tmpvar_867;
    tmpvar_868.z = tmpvar_867;
    col_801 = (col_801 - (tmpvar_868 * 0.025));
    float tmpvar_869;
    tmpvar_869 = ((col_801.x + col_801.y) + col_801.z);
    vec4 tmpvar_870;
    tmpvar_870.w = 1.0;
    tmpvar_870.x = tmpvar_869;
    tmpvar_870.y = tmpvar_869;
    tmpvar_870.z = tmpvar_869;
    c_795 = (tmpvar_800 + mix (col_801, (tmpvar_870 * 0.85), tmpvar_869));
    p_796 = (p_796 * 0.4);
    c_795 = (c_795 * 0.76);
    vec4 tmpvar_871;
    tmpvar_871 = max (vec4(0.0, 0.0, 0.0, 0.0), ((c_795 * 
      clamp ((9.0 - ((tmpvar_799 * tmpvar_799) * 9.0)), 0.0, 1.0)
    ) + (tmpvar_750 * 
      (1.0 - clamp ((9.0 - (
        (tmpvar_799 * tmpvar_799)
       * 9.0)), 0.0, 1.0))
    )));
    tmpc_794.xyw = tmpvar_871.xyw;
    tmpc_794.z = (tmpvar_871.z * 0.51);
    tmpvar_789 = tmpc_794;
  } else {
    tmpvar_789 = tmpvar_750;
  };
  buff_10 = tmpvar_789;
  vec4 tmpvar_872;
  vec2 tmpvar_873;
  tmpvar_873 = ((gl_FragCoord.xy - (planetpos5 * zoom)) - shippos);
  vec2 x_874;
  float tmpvar_875;
  tmpvar_875 = (4000.0 * zoom);
  x_874 = (tmpvar_873 - tmpvar_875);
  float tmpvar_876;
  tmpvar_876 = float((sqrt(
    dot (x_874, x_874)
  ) >= tmpvar_875));
  if (((1.0 - tmpvar_876) > 0.0)) {
    vec4 tmpc_877;
    vec4 c_878;
    vec2 p_879;
    vec2 tmpvar_880;
    tmpvar_880 = vec2((8000.0 * zoom));
    vec2 tmpvar_881;
    tmpvar_881 = (((tmpvar_873 * 2.0) - tmpvar_880) / tmpvar_880.y);
    float tmpvar_882;
    tmpvar_882 = sqrt(dot (tmpvar_881, tmpvar_881));
    vec4 tmpvar_883;
    tmpvar_883 = (vec4(0.4643, 0.22, 0.28, 1.0) + (tmpvar_881.y / 1.5));
    c_878 = tmpvar_883;
    p_879 = (((tmpvar_881 * 
      (sign(tmpvar_882) * (1.570796 - (sqrt(
        (1.0 - abs(tmpvar_882))
      ) * (1.570796 + 
        (abs(tmpvar_882) * (-0.2146018 + (abs(tmpvar_882) * (0.08656672 + 
          (abs(tmpvar_882) * -0.03102955)
        ))))
      ))))
    ) / tmpvar_882) - 5.0);
    p_879 = (p_879 * p_879.y);
    if (best) {
      vec4 fcx_884;
      vec2 uv_885;
      vec2 tmpvar_886;
      tmpvar_886 = (0.45 * p_879);
      uv_885.y = tmpvar_886.y;
      uv_885.x = (tmpvar_886.x + (time * 0.11));
      vec2 uv_887;
      vec2 frac_889;
      vec2 cell_890;
      float minDistance_891;
      vec3 tmpvar_892;
      tmpvar_892.yz = vec2(0.02, 0.02);
      tmpvar_892.x = (0.09 + (abs(
        sin((time * 0.75))
      ) * 0.03));
      minDistance_891 = 1.0;
      uv_887 = (uv_885 * 3.0);
      cell_890 = floor(uv_887);
      frac_889 = fract(uv_887);
      for (int i_888 = -1; i_888 <= 1; i_888++) {
        for (int j_893 = -1; j_893 <= 1; j_893++) {
          vec2 tmpvar_894;
          tmpvar_894.x = float(i_888);
          tmpvar_894.y = float(j_893);
          vec2 tmpvar_895;
          tmpvar_895.x = dot ((cell_890 + tmpvar_894), vec2(127.1, 311.7));
          tmpvar_895.y = dot ((cell_890 + tmpvar_894), vec2(269.5, 183.3));
          vec2 uv_896;
          vec2 tmpvar_897;
          tmpvar_897 = floor(uv_887);
          vec2 tmpvar_898;
          tmpvar_898 = (uv_887 - tmpvar_897);
          uv_896 = ((tmpvar_898 * tmpvar_898) * (3.0 - (2.0 * tmpvar_898)));
          float tmpvar_899;
          tmpvar_899 = fract((cos(
            dot (tmpvar_897, vec2(21.9898, 78.233))
          ) * 43758.55));
          vec2 tmpvar_900;
          tmpvar_900.x = (tmpvar_897.x + 1.0);
          tmpvar_900.y = tmpvar_897.y;
          float tmpvar_901;
          tmpvar_901 = fract((cos(
            dot (tmpvar_900, vec2(21.9898, 78.233))
          ) * 43758.55));
          vec2 tmpvar_902;
          tmpvar_902.x = tmpvar_897.x;
          tmpvar_902.y = (tmpvar_897.y + 1.0);
          float tmpvar_903;
          tmpvar_903 = fract((cos(
            dot (tmpvar_902, vec2(21.9898, 78.233))
          ) * 43758.55));
          vec2 x_904;
          x_904 = ((tmpvar_894 + (
            fract((sin(tmpvar_895) * 43758.55))
           + 
            ((((
              (tmpvar_899 + ((tmpvar_901 - tmpvar_899) * uv_896.x))
             + 
              ((tmpvar_903 - tmpvar_899) * uv_896.y)
            ) + (
              ((((tmpvar_899 - tmpvar_901) - tmpvar_903) + fract((
                cos(dot ((tmpvar_897 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
               * 43758.55))) * uv_896.x)
             * uv_896.y)) / 5.0) * 1.5)
          )) - frac_889);
          minDistance_891 = min (minDistance_891, sqrt(dot (x_904, x_904)));
        };
      };
      float tmpvar_905;
      tmpvar_905 = (time * 1.5);
      fcx_884.xyz = (fcx_884.xyz + mix (tmpvar_892, (vec3(1.725, 0.5175, 0.0) * 
        pow (minDistance_891, (2.5 + ((
          sin(((uv_887.x * 2.0) + tmpvar_905))
         + 
          sin(((uv_887.y * 2.0) + tmpvar_905))
        ) * 0.95)))
      ), minDistance_891));
      vec2 uv_906;
      vec2 frac_907;
      vec2 cell_908;
      float minDistance_909;
      vec3 tmpvar_910;
      tmpvar_910.yz = vec2(0.02, 0.02);
      float tmpvar_911;
      tmpvar_911 = (time * 0.75);
      tmpvar_910.x = (0.09 + (abs(
        sin(tmpvar_911)
      ) * 0.03));
      uv_906 = (uv_885 * 6.0);
      cell_908 = floor(uv_906);
      frac_907 = fract(uv_906);
      vec2 tmpvar_912;
      tmpvar_912.x = dot ((cell_908 + vec2(-1.0, -1.0)), vec2(127.1, 311.7));
      tmpvar_912.y = dot ((cell_908 + vec2(-1.0, -1.0)), vec2(269.5, 183.3));
      vec2 x_913;
      x_913 = ((vec2(-1.0, -1.0) + fract(
        (sin(tmpvar_912) * 43758.55)
      )) - frac_907);
      minDistance_909 = min (1.0, sqrt(dot (x_913, x_913)));
      vec2 tmpvar_914;
      tmpvar_914.x = dot ((cell_908 + vec2(-1.0, 0.0)), vec2(127.1, 311.7));
      tmpvar_914.y = dot ((cell_908 + vec2(-1.0, 0.0)), vec2(269.5, 183.3));
      vec2 x_915;
      x_915 = ((vec2(-1.0, 0.0) + fract(
        (sin(tmpvar_914) * 43758.55)
      )) - frac_907);
      minDistance_909 = min (minDistance_909, sqrt(dot (x_915, x_915)));
      vec2 tmpvar_916;
      tmpvar_916.x = dot ((cell_908 + vec2(-1.0, 1.0)), vec2(127.1, 311.7));
      tmpvar_916.y = dot ((cell_908 + vec2(-1.0, 1.0)), vec2(269.5, 183.3));
      vec2 x_917;
      x_917 = ((vec2(-1.0, 1.0) + fract(
        (sin(tmpvar_916) * 43758.55)
      )) - frac_907);
      minDistance_909 = min (minDistance_909, sqrt(dot (x_917, x_917)));
      vec2 tmpvar_918;
      tmpvar_918.x = dot ((cell_908 + vec2(0.0, -1.0)), vec2(127.1, 311.7));
      tmpvar_918.y = dot ((cell_908 + vec2(0.0, -1.0)), vec2(269.5, 183.3));
      vec2 x_919;
      x_919 = ((vec2(0.0, -1.0) + fract(
        (sin(tmpvar_918) * 43758.55)
      )) - frac_907);
      minDistance_909 = min (minDistance_909, sqrt(dot (x_919, x_919)));
      vec2 tmpvar_920;
      tmpvar_920.x = dot (cell_908, vec2(127.1, 311.7));
      tmpvar_920.y = dot (cell_908, vec2(269.5, 183.3));
      vec2 x_921;
      x_921 = (fract((
        sin(tmpvar_920)
       * 43758.55)) - frac_907);
      minDistance_909 = min (minDistance_909, sqrt(dot (x_921, x_921)));
      vec2 tmpvar_922;
      tmpvar_922.x = dot ((cell_908 + vec2(0.0, 1.0)), vec2(127.1, 311.7));
      tmpvar_922.y = dot ((cell_908 + vec2(0.0, 1.0)), vec2(269.5, 183.3));
      vec2 x_923;
      x_923 = ((vec2(0.0, 1.0) + fract(
        (sin(tmpvar_922) * 43758.55)
      )) - frac_907);
      minDistance_909 = min (minDistance_909, sqrt(dot (x_923, x_923)));
      vec2 tmpvar_924;
      tmpvar_924.x = dot ((cell_908 + vec2(1.0, -1.0)), vec2(127.1, 311.7));
      tmpvar_924.y = dot ((cell_908 + vec2(1.0, -1.0)), vec2(269.5, 183.3));
      vec2 x_925;
      x_925 = ((vec2(1.0, -1.0) + fract(
        (sin(tmpvar_924) * 43758.55)
      )) - frac_907);
      minDistance_909 = min (minDistance_909, sqrt(dot (x_925, x_925)));
      vec2 tmpvar_926;
      tmpvar_926.x = dot ((cell_908 + vec2(1.0, 0.0)), vec2(127.1, 311.7));
      tmpvar_926.y = dot ((cell_908 + vec2(1.0, 0.0)), vec2(269.5, 183.3));
      vec2 x_927;
      x_927 = ((vec2(1.0, 0.0) + fract(
        (sin(tmpvar_926) * 43758.55)
      )) - frac_907);
      minDistance_909 = min (minDistance_909, sqrt(dot (x_927, x_927)));
      vec2 tmpvar_928;
      tmpvar_928.x = dot ((cell_908 + vec2(1.0, 1.0)), vec2(127.1, 311.7));
      tmpvar_928.y = dot ((cell_908 + vec2(1.0, 1.0)), vec2(269.5, 183.3));
      vec2 x_929;
      x_929 = ((vec2(1.0, 1.0) + fract(
        (sin(tmpvar_928) * 43758.55)
      )) - frac_907);
      minDistance_909 = min (minDistance_909, sqrt(dot (x_929, x_929)));
      fcx_884.xyz = (fcx_884.xyz + mix (tmpvar_910, (vec3(0.6, 0.0, 0.0) * 
        pow (minDistance_909, (3.0 + ((
          sin(((uv_906.x * 2.0) + time))
         + 
          sin(((uv_906.y * 2.0) + time))
        ) * 0.95)))
      ), minDistance_909));
      vec2 uv_930;
      vec2 frac_932;
      vec2 cell_933;
      float minDistance_934;
      vec3 tmpvar_935;
      tmpvar_935.yz = vec2(0.02, 0.02);
      tmpvar_935.x = (0.09 + (abs(
        sin(tmpvar_911)
      ) * 0.03));
      minDistance_934 = 1.0;
      uv_930 = (uv_885 * 8.0);
      cell_933 = floor(uv_930);
      frac_932 = fract(uv_930);
      for (int i_931 = -1; i_931 <= 1; i_931++) {
        for (int j_936 = -1; j_936 <= 1; j_936++) {
          vec2 randPoint_937;
          vec2 tmpvar_938;
          tmpvar_938.x = float(i_931);
          tmpvar_938.y = float(j_936);
          vec2 tmpvar_939;
          tmpvar_939.x = dot ((cell_933 + tmpvar_938), vec2(127.1, 311.7));
          tmpvar_939.y = dot ((cell_933 + tmpvar_938), vec2(269.5, 183.3));
          vec2 uv_940;
          vec2 tmpvar_941;
          tmpvar_941 = floor(uv_930);
          vec2 tmpvar_942;
          tmpvar_942 = (uv_930 - tmpvar_941);
          uv_940 = ((tmpvar_942 * tmpvar_942) * (3.0 - (2.0 * tmpvar_942)));
          float tmpvar_943;
          tmpvar_943 = fract((cos(
            dot (tmpvar_941, vec2(21.9898, 78.233))
          ) * 43758.55));
          vec2 tmpvar_944;
          tmpvar_944.x = (tmpvar_941.x + 1.0);
          tmpvar_944.y = tmpvar_941.y;
          float tmpvar_945;
          tmpvar_945 = fract((cos(
            dot (tmpvar_944, vec2(21.9898, 78.233))
          ) * 43758.55));
          vec2 tmpvar_946;
          tmpvar_946.x = tmpvar_941.x;
          tmpvar_946.y = (tmpvar_941.y + 1.0);
          float tmpvar_947;
          tmpvar_947 = fract((cos(
            dot (tmpvar_946, vec2(21.9898, 78.233))
          ) * 43758.55));
          randPoint_937 = (fract((
            sin(tmpvar_939)
           * 43758.55)) + ((
            (((tmpvar_943 + (
              (tmpvar_945 - tmpvar_943)
             * uv_940.x)) + ((tmpvar_947 - tmpvar_943) * uv_940.y)) + (((
              ((tmpvar_943 - tmpvar_945) - tmpvar_947)
             + 
              fract((cos(dot (
                (tmpvar_941 + vec2(1.0, 1.0))
              , vec2(21.9898, 78.233))) * 43758.55))
            ) * uv_940.x) * uv_940.y))
           / 5.0) * 0.5));
          vec2 tmpvar_948;
          tmpvar_948 = (0.5 + (0.5 * sin(
            ((iTime * 0.35) + (6.2831 * randPoint_937))
          )));
          randPoint_937 = tmpvar_948;
          vec2 x_949;
          x_949 = ((tmpvar_938 + tmpvar_948) - frac_932);
          minDistance_934 = min (minDistance_934, sqrt(dot (x_949, x_949)));
        };
      };
      float tmpvar_950;
      tmpvar_950 = (time * 1.9);
      fcx_884.xyz = (fcx_884.xyz + mix (tmpvar_935, (vec3(0.24, 0.08000001, 0.0) * 
        pow (minDistance_934, (4.0 + ((
          sin(((uv_930.x * 2.0) + tmpvar_950))
         + 
          sin(((uv_930.y * 2.0) + tmpvar_950))
        ) * 0.95)))
      ), minDistance_934));
      c_878 = (tmpvar_883 + fcx_884);
      p_879 = (p_879 * 0.4);
      c_878 = (c_878 * 0.6);
    };
    vec4 fcx_951;
    vec2 uv_952;
    vec2 tmpvar_953;
    tmpvar_953 = (0.45 * p_879);
    uv_952.y = tmpvar_953.y;
    uv_952.x = (tmpvar_953.x + (time * 0.11));
    vec2 uv_954;
    vec2 frac_956;
    vec2 cell_957;
    float minDistance_958;
    vec3 tmpvar_959;
    tmpvar_959.yz = vec2(0.02, 0.02);
    tmpvar_959.x = (0.09 + (abs(
      sin((time * 0.75))
    ) * 0.03));
    minDistance_958 = 1.0;
    uv_954 = (uv_952 * 3.0);
    cell_957 = floor(uv_954);
    frac_956 = fract(uv_954);
    for (int i_955 = -1; i_955 <= 1; i_955++) {
      for (int j_960 = -1; j_960 <= 1; j_960++) {
        vec2 tmpvar_961;
        tmpvar_961.x = float(i_955);
        tmpvar_961.y = float(j_960);
        vec2 tmpvar_962;
        tmpvar_962.x = dot ((cell_957 + tmpvar_961), vec2(127.1, 311.7));
        tmpvar_962.y = dot ((cell_957 + tmpvar_961), vec2(269.5, 183.3));
        vec2 uv_963;
        vec2 tmpvar_964;
        tmpvar_964 = floor(uv_954);
        vec2 tmpvar_965;
        tmpvar_965 = (uv_954 - tmpvar_964);
        uv_963 = ((tmpvar_965 * tmpvar_965) * (3.0 - (2.0 * tmpvar_965)));
        float tmpvar_966;
        tmpvar_966 = fract((cos(
          dot (tmpvar_964, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 tmpvar_967;
        tmpvar_967.x = (tmpvar_964.x + 1.0);
        tmpvar_967.y = tmpvar_964.y;
        float tmpvar_968;
        tmpvar_968 = fract((cos(
          dot (tmpvar_967, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 tmpvar_969;
        tmpvar_969.x = tmpvar_964.x;
        tmpvar_969.y = (tmpvar_964.y + 1.0);
        float tmpvar_970;
        tmpvar_970 = fract((cos(
          dot (tmpvar_969, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 x_971;
        x_971 = ((tmpvar_961 + (
          fract((sin(tmpvar_962) * 43758.55))
         + 
          ((((
            (tmpvar_966 + ((tmpvar_968 - tmpvar_966) * uv_963.x))
           + 
            ((tmpvar_970 - tmpvar_966) * uv_963.y)
          ) + (
            ((((tmpvar_966 - tmpvar_968) - tmpvar_970) + fract((
              cos(dot ((tmpvar_964 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
             * 43758.55))) * uv_963.x)
           * uv_963.y)) / 5.0) * 1.5)
        )) - frac_956);
        minDistance_958 = min (minDistance_958, sqrt(dot (x_971, x_971)));
      };
    };
    float tmpvar_972;
    tmpvar_972 = (time * 1.5);
    fcx_951.xyz = (fcx_951.xyz + mix (tmpvar_959, (vec3(1.725, 0.5175, 0.0) * 
      pow (minDistance_958, (2.5 + ((
        sin(((uv_954.x * 2.0) + tmpvar_972))
       + 
        sin(((uv_954.y * 2.0) + tmpvar_972))
      ) * 0.95)))
    ), minDistance_958));
    vec2 uv_973;
    vec2 frac_974;
    vec2 cell_975;
    float minDistance_976;
    vec3 tmpvar_977;
    tmpvar_977.yz = vec2(0.02, 0.02);
    float tmpvar_978;
    tmpvar_978 = (time * 0.75);
    tmpvar_977.x = (0.09 + (abs(
      sin(tmpvar_978)
    ) * 0.03));
    uv_973 = (uv_952 * 6.0);
    cell_975 = floor(uv_973);
    frac_974 = fract(uv_973);
    vec2 tmpvar_979;
    tmpvar_979.x = dot ((cell_975 + vec2(-1.0, -1.0)), vec2(127.1, 311.7));
    tmpvar_979.y = dot ((cell_975 + vec2(-1.0, -1.0)), vec2(269.5, 183.3));
    vec2 x_980;
    x_980 = ((vec2(-1.0, -1.0) + fract(
      (sin(tmpvar_979) * 43758.55)
    )) - frac_974);
    minDistance_976 = min (1.0, sqrt(dot (x_980, x_980)));
    vec2 tmpvar_981;
    tmpvar_981.x = dot ((cell_975 + vec2(-1.0, 0.0)), vec2(127.1, 311.7));
    tmpvar_981.y = dot ((cell_975 + vec2(-1.0, 0.0)), vec2(269.5, 183.3));
    vec2 x_982;
    x_982 = ((vec2(-1.0, 0.0) + fract(
      (sin(tmpvar_981) * 43758.55)
    )) - frac_974);
    minDistance_976 = min (minDistance_976, sqrt(dot (x_982, x_982)));
    vec2 tmpvar_983;
    tmpvar_983.x = dot ((cell_975 + vec2(-1.0, 1.0)), vec2(127.1, 311.7));
    tmpvar_983.y = dot ((cell_975 + vec2(-1.0, 1.0)), vec2(269.5, 183.3));
    vec2 x_984;
    x_984 = ((vec2(-1.0, 1.0) + fract(
      (sin(tmpvar_983) * 43758.55)
    )) - frac_974);
    minDistance_976 = min (minDistance_976, sqrt(dot (x_984, x_984)));
    vec2 tmpvar_985;
    tmpvar_985.x = dot ((cell_975 + vec2(0.0, -1.0)), vec2(127.1, 311.7));
    tmpvar_985.y = dot ((cell_975 + vec2(0.0, -1.0)), vec2(269.5, 183.3));
    vec2 x_986;
    x_986 = ((vec2(0.0, -1.0) + fract(
      (sin(tmpvar_985) * 43758.55)
    )) - frac_974);
    minDistance_976 = min (minDistance_976, sqrt(dot (x_986, x_986)));
    vec2 tmpvar_987;
    tmpvar_987.x = dot (cell_975, vec2(127.1, 311.7));
    tmpvar_987.y = dot (cell_975, vec2(269.5, 183.3));
    vec2 x_988;
    x_988 = (fract((
      sin(tmpvar_987)
     * 43758.55)) - frac_974);
    minDistance_976 = min (minDistance_976, sqrt(dot (x_988, x_988)));
    vec2 tmpvar_989;
    tmpvar_989.x = dot ((cell_975 + vec2(0.0, 1.0)), vec2(127.1, 311.7));
    tmpvar_989.y = dot ((cell_975 + vec2(0.0, 1.0)), vec2(269.5, 183.3));
    vec2 x_990;
    x_990 = ((vec2(0.0, 1.0) + fract(
      (sin(tmpvar_989) * 43758.55)
    )) - frac_974);
    minDistance_976 = min (minDistance_976, sqrt(dot (x_990, x_990)));
    vec2 tmpvar_991;
    tmpvar_991.x = dot ((cell_975 + vec2(1.0, -1.0)), vec2(127.1, 311.7));
    tmpvar_991.y = dot ((cell_975 + vec2(1.0, -1.0)), vec2(269.5, 183.3));
    vec2 x_992;
    x_992 = ((vec2(1.0, -1.0) + fract(
      (sin(tmpvar_991) * 43758.55)
    )) - frac_974);
    minDistance_976 = min (minDistance_976, sqrt(dot (x_992, x_992)));
    vec2 tmpvar_993;
    tmpvar_993.x = dot ((cell_975 + vec2(1.0, 0.0)), vec2(127.1, 311.7));
    tmpvar_993.y = dot ((cell_975 + vec2(1.0, 0.0)), vec2(269.5, 183.3));
    vec2 x_994;
    x_994 = ((vec2(1.0, 0.0) + fract(
      (sin(tmpvar_993) * 43758.55)
    )) - frac_974);
    minDistance_976 = min (minDistance_976, sqrt(dot (x_994, x_994)));
    vec2 tmpvar_995;
    tmpvar_995.x = dot ((cell_975 + vec2(1.0, 1.0)), vec2(127.1, 311.7));
    tmpvar_995.y = dot ((cell_975 + vec2(1.0, 1.0)), vec2(269.5, 183.3));
    vec2 x_996;
    x_996 = ((vec2(1.0, 1.0) + fract(
      (sin(tmpvar_995) * 43758.55)
    )) - frac_974);
    minDistance_976 = min (minDistance_976, sqrt(dot (x_996, x_996)));
    fcx_951.xyz = (fcx_951.xyz + mix (tmpvar_977, (vec3(0.6, 0.0, 0.0) * 
      pow (minDistance_976, (3.0 + ((
        sin(((uv_973.x * 2.0) + time))
       + 
        sin(((uv_973.y * 2.0) + time))
      ) * 0.95)))
    ), minDistance_976));
    vec2 uv_997;
    vec2 frac_999;
    vec2 cell_1000;
    float minDistance_1001;
    vec3 tmpvar_1002;
    tmpvar_1002.yz = vec2(0.02, 0.02);
    tmpvar_1002.x = (0.09 + (abs(
      sin(tmpvar_978)
    ) * 0.03));
    minDistance_1001 = 1.0;
    uv_997 = (uv_952 * 8.0);
    cell_1000 = floor(uv_997);
    frac_999 = fract(uv_997);
    for (int i_998 = -1; i_998 <= 1; i_998++) {
      for (int j_1003 = -1; j_1003 <= 1; j_1003++) {
        vec2 randPoint_1004;
        vec2 tmpvar_1005;
        tmpvar_1005.x = float(i_998);
        tmpvar_1005.y = float(j_1003);
        vec2 tmpvar_1006;
        tmpvar_1006.x = dot ((cell_1000 + tmpvar_1005), vec2(127.1, 311.7));
        tmpvar_1006.y = dot ((cell_1000 + tmpvar_1005), vec2(269.5, 183.3));
        vec2 uv_1007;
        vec2 tmpvar_1008;
        tmpvar_1008 = floor(uv_997);
        vec2 tmpvar_1009;
        tmpvar_1009 = (uv_997 - tmpvar_1008);
        uv_1007 = ((tmpvar_1009 * tmpvar_1009) * (3.0 - (2.0 * tmpvar_1009)));
        float tmpvar_1010;
        tmpvar_1010 = fract((cos(
          dot (tmpvar_1008, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 tmpvar_1011;
        tmpvar_1011.x = (tmpvar_1008.x + 1.0);
        tmpvar_1011.y = tmpvar_1008.y;
        float tmpvar_1012;
        tmpvar_1012 = fract((cos(
          dot (tmpvar_1011, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 tmpvar_1013;
        tmpvar_1013.x = tmpvar_1008.x;
        tmpvar_1013.y = (tmpvar_1008.y + 1.0);
        float tmpvar_1014;
        tmpvar_1014 = fract((cos(
          dot (tmpvar_1013, vec2(21.9898, 78.233))
        ) * 43758.55));
        randPoint_1004 = (fract((
          sin(tmpvar_1006)
         * 43758.55)) + ((
          (((tmpvar_1010 + (
            (tmpvar_1012 - tmpvar_1010)
           * uv_1007.x)) + ((tmpvar_1014 - tmpvar_1010) * uv_1007.y)) + (((
            ((tmpvar_1010 - tmpvar_1012) - tmpvar_1014)
           + 
            fract((cos(dot (
              (tmpvar_1008 + vec2(1.0, 1.0))
            , vec2(21.9898, 78.233))) * 43758.55))
          ) * uv_1007.x) * uv_1007.y))
         / 5.0) * 0.5));
        vec2 tmpvar_1015;
        tmpvar_1015 = (0.5 + (0.5 * sin(
          ((iTime * 0.35) + (6.2831 * randPoint_1004))
        )));
        randPoint_1004 = tmpvar_1015;
        vec2 x_1016;
        x_1016 = ((tmpvar_1005 + tmpvar_1015) - frac_999);
        minDistance_1001 = min (minDistance_1001, sqrt(dot (x_1016, x_1016)));
      };
    };
    float tmpvar_1017;
    tmpvar_1017 = (time * 1.9);
    fcx_951.xyz = (fcx_951.xyz + mix (tmpvar_1002, (vec3(0.24, 0.08000001, 0.0) * 
      pow (minDistance_1001, (4.0 + ((
        sin(((uv_997.x * 2.0) + tmpvar_1017))
       + 
        sin(((uv_997.y * 2.0) + tmpvar_1017))
      ) * 0.95)))
    ), minDistance_1001));
    c_878 = (c_878 + fcx_951);
    p_879 = (p_879 * 0.4);
    c_878 = (c_878 * 0.6);
    vec4 tmpvar_1018;
    tmpvar_1018 = max (vec4(0.0, 0.0, 0.0, 0.0), ((c_878 * 
      clamp ((9.0 - ((tmpvar_882 * tmpvar_882) * 9.0)), 0.0, 1.0)
    ) + (tmpvar_789 * 
      (1.0 - clamp ((9.0 - (
        (tmpvar_882 * tmpvar_882)
       * 9.0)), 0.0, 1.0))
    )));
    tmpc_877.xyw = tmpvar_1018.xyw;
    tmpc_877.z = (tmpvar_1018.z * -2.51);
    tmpvar_872 = tmpc_877;
  } else {
    tmpvar_872 = tmpvar_789;
  };
  buff_10 = tmpvar_872;
  vec4 tmpvar_1019;
  vec2 tmpvar_1020;
  tmpvar_1020 = ((gl_FragCoord.xy - (planetpos6 * zoom)) - shippos);
  vec2 x_1021;
  float tmpvar_1022;
  tmpvar_1022 = (5250.0 * zoom);
  x_1021 = (tmpvar_1020 - tmpvar_1022);
  float tmpvar_1023;
  tmpvar_1023 = float((sqrt(
    dot (x_1021, x_1021)
  ) >= tmpvar_1022));
  if (((1.0 - tmpvar_1023) > 0.0)) {
    vec3 p_1024;
    vec4 s_1025;
    vec2 v_1026;
    vec2 tmpvar_1027;
    tmpvar_1027 = (vec2(10500.0, 10500.0) * zoom);
    float tmpvar_1028;
    vec2 fragCoord_1029;
    fragCoord_1029 = ((tmpvar_1020 - (tmpvar_1027 / vec2(2.0, 2.0))) / tmpvar_1027.y);
    vec2 p_1030;
    p_1030 = ((fragCoord_1029 + vec2(0.25, 0.25)) * 2.0);
    vec2 tmpvar_1031;
    tmpvar_1031 = (p_1030 - 0.5);
    p_1030 = tmpvar_1031;
    float tmpvar_1032;
    tmpvar_1032 = (0.1 + (0.5 * (1.0 - 
      dot (tmpvar_1031, tmpvar_1031)
    )));
    vec2 tmpvar_1033;
    tmpvar_1033 = (fract((
      ((fragCoord_1029 / tmpvar_1032) * 25.0)
     + 
      (time / 2.0)
    )) - 0.5);
    float tmpvar_1034;
    tmpvar_1034 = (3.0 * (1.0 - dot (tmpvar_1033, tmpvar_1033)));
    float tmpvar_1035;
    tmpvar_1035 = (((
      (tmpvar_1034 * tmpvar_1032)
     / 6.0) * tmpvar_1034) * tmpvar_1032);
    tmpvar_1028 = (abs((
      pow ((tmpvar_1035 * 9.9), 7.6)
     * 
      cos((tmpvar_1035 * 9.0))
    )) + sin((tmpvar_1035 * 10.5)));
    float tmpvar_1036;
    tmpvar_1036 = clamp (((tax - 0.19) / 0.3), 0.0, 1.0);
    float tmpvar_1037;
    tmpvar_1037 = clamp (((tax - 0.7) / -0.21), 0.0, 1.0);
    float tmpvar_1038;
    tmpvar_1038 = ((1.0 - (tmpvar_1036 * 
      (tmpvar_1036 * (3.0 - (2.0 * tmpvar_1036)))
    )) + (1.0 - (tmpvar_1037 * 
      (tmpvar_1037 * (3.0 - (2.0 * tmpvar_1037)))
    )));
    float tmpvar_1039;
    tmpvar_1039 = -(tmpvar_1038);
    vec3 tmpvar_1040;
    tmpvar_1040.x = 1.0;
    tmpvar_1040.y = (tmpvar_1039 / 5.0);
    tmpvar_1040.z = tmpvar_1039;
    vec3 tmpvar_1041;
    tmpvar_1041 = normalize(tmpvar_1040);
    float tmpvar_1042;
    tmpvar_1042 = min (tmpvar_1027.x, tmpvar_1027.y);
    mat2 tmpvar_1043;
    float tmpvar_1044;
    tmpvar_1044 = (tax + 0.7305999);
    tmpvar_1043[0].x = cos((tmpvar_1044 - (0.2617983 * tmpvar_1038)));
    tmpvar_1043[0].y = -(sin((tmpvar_1044 - 
      (0.2617983 * tmpvar_1038)
    )));
    tmpvar_1043[1].x = sin((tmpvar_1044 - (0.2617983 * tmpvar_1038)));
    tmpvar_1043[1].y = cos((tmpvar_1044 - (0.2617983 * tmpvar_1038)));
    v_1026 = (((tmpvar_1020 - 
      (tmpvar_1027 / 2.0)
    ) / tmpvar_1042) * tmpvar_1043);
    float tmpvar_1045;
    tmpvar_1045 = (sqrt(dot (v_1026, v_1026)) - 0.4);
    float edge0_1046;
    edge0_1046 = -((5.0 / tmpvar_1042));
    float tmpvar_1047;
    tmpvar_1047 = clamp (((tmpvar_1045 - edge0_1046) / -(edge0_1046)), 0.0, 1.0);
    float tmpvar_1048;
    tmpvar_1048 = (1.0 - (tmpvar_1047 * (tmpvar_1047 * 
      (3.0 - (2.0 * tmpvar_1047))
    )));
    vec3 tmpvar_1049;
    tmpvar_1049.z = 0.0;
    tmpvar_1049.xy = (v_1026 / 0.4);
    float tmpvar_1050;
    tmpvar_1050 = sqrt(dot (tmpvar_1049, tmpvar_1049));
    if ((tmpvar_1050 < 1.0)) {
      vec3 tmpvar_1051;
      tmpvar_1051.xy = tmpvar_1049.xy;
      tmpvar_1051.z = sqrt(((1.0 - 
        (tmpvar_1049.x * tmpvar_1049.x)
      ) - (tmpvar_1049.y * tmpvar_1049.y)));
      float tmpvar_1052;
      tmpvar_1052 = clamp (((
        (pow ((dot (tmpvar_1051, tmpvar_1041) * (1.0 - tmpvar_1038)), 0.75) - 0.5)
       - -0.05) / 0.1), 0.0, 1.0);
      s_1025 = (tmpvar_1048 * mix ((0.1 * vec4(tmpvar_1028)), vec4(tmpvar_1028), (tmpvar_1052 * 
        (tmpvar_1052 * (3.0 - (2.0 * tmpvar_1052)))
      )));
    } else {
      s_1025 = vec4(0.0, 0.0, 0.0, 0.0);
    };
    vec3 tmpvar_1053;
    tmpvar_1053.z = 0.0;
    tmpvar_1053.xy = (v_1026 / 0.4);
    p_1024 = tmpvar_1053;
    float tmpvar_1054;
    tmpvar_1054 = sqrt(dot (tmpvar_1053, tmpvar_1053));
    if ((tmpvar_1054 < 1.0)) {
      vec3 tmpvar_1055;
      tmpvar_1055.xy = tmpvar_1053.xy;
      tmpvar_1055.z = sqrt(((1.0 - 
        (tmpvar_1053.x * tmpvar_1053.x)
      ) - (tmpvar_1053.y * tmpvar_1053.y)));
      p_1024 = tmpvar_1055;
    } else {
      p_1024 = normalize(p_1024);
    };
    p_1024 = (p_1024 - vec3(0.0, 0.0, 0.406));
    float tmpvar_1056;
    tmpvar_1056 = clamp ((tmpvar_1045 / 0.006), 0.0, 1.0);
    vec2 x_1057;
    x_1057 = (tmpvar_1020 - (5250.0 * zoom));
    tmpvar_1019 = ((s_1025 + (
      clamp ((dot (p_1024, tmpvar_1041) * (1.0 - tmpvar_1038)), 0.0, 1.0)
     * 
      (vec4(5.0, 1.225, 0.7, 0.25) * (1.0 - (tmpvar_1056 * (tmpvar_1056 * 
        (3.0 - (2.0 * tmpvar_1056))
      ))))
    )) + (tmpvar_872 * float(
      (sqrt(dot (x_1057, x_1057)) >= (4195.0 * zoom))
    )));
  } else {
    tmpvar_1019 = tmpvar_872;
  };
  buff_10 = tmpvar_1019;
  vec4 tmpvar_1058;
  if (paused) {
    tmpvar_1058 = vec4(0.0, 0.0, 0.0, 1.0);
  } else {
    vec2 tmpvar_1059;
    float tmpvar_1060;
    tmpvar_1060 = (radius / 2.0);
    tmpvar_1059 = (((shippos + tmpvar_1060) / iResolution.xy) - 0.5);
    vec2 tmpvar_1061;
    tmpvar_1061 = (((
      (gl_FragCoord.xy - (-(shippos) + iResolution.xy))
     + tmpvar_1060) + (
      (radius * 3.0)
     * tmpvar_1059)) / iResolution.xy);
    float tmpvar_1062;
    float tmpvar_1063;
    tmpvar_1063 = (min (abs(
      (tmpvar_1061.x / tmpvar_1061.y)
    ), 1.0) / max (abs(
      (tmpvar_1061.x / tmpvar_1061.y)
    ), 1.0));
    float tmpvar_1064;
    tmpvar_1064 = (tmpvar_1063 * tmpvar_1063);
    tmpvar_1064 = (((
      ((((
        ((((-0.01213232 * tmpvar_1064) + 0.05368138) * tmpvar_1064) - 0.1173503)
       * tmpvar_1064) + 0.1938925) * tmpvar_1064) - 0.3326756)
     * tmpvar_1064) + 0.9999793) * tmpvar_1063);
    tmpvar_1064 = (tmpvar_1064 + (float(
      (abs((tmpvar_1061.x / tmpvar_1061.y)) > 1.0)
    ) * (
      (tmpvar_1064 * -2.0)
     + 1.570796)));
    tmpvar_1062 = (tmpvar_1064 * sign((tmpvar_1061.x / tmpvar_1061.y)));
    if ((abs(tmpvar_1061.y) > (1e-08 * abs(tmpvar_1061.x)))) {
      if ((tmpvar_1061.y < 0.0)) {
        if ((tmpvar_1061.x >= 0.0)) {
          tmpvar_1062 += 3.141593;
        } else {
          tmpvar_1062 = (tmpvar_1062 - 3.141593);
        };
      };
    } else {
      tmpvar_1062 = (sign(tmpvar_1061.x) * 1.570796);
    };
    float tmpvar_1065;
    tmpvar_1065 = ceil((tmpvar_1062 * 600.0));
    float tmpvar_1066;
    tmpvar_1066 = cos(tmpvar_1065);
    float tmpvar_1067;
    tmpvar_1067 = (tmpvar_1066 / dot (tmpvar_1061, tmpvar_1061));
    vec2 x_1068;
    x_1068 = (tmpvar_1059 * zoom);
    tmpvar_1058 = vec4(max (0.0, (min (1.0, 
      (exp((fract(
        ((tmpvar_1067 + (tmpvar_1066 * tmpvar_1065)) + time)
      ) * -100.0)) / tmpvar_1067)
    ) * abs(
      sqrt(dot (x_1068, x_1068))
    ))));
  };
  buff_10 = (tmpvar_1019 + tmpvar_1058);
  mcol_9 = buff_10;
  vec2 pos_1069;
  pos_1069 = ((gl_FragCoord.xy - (en3pos * zoom)) - shippos);
  mat2 tmpvar_1070;
  float tmpvar_1071;
  tmpvar_1071 = (tax + 1.57079);
  tmpvar_1070[0].x = cos((tmpvar_1071 + 0.7305999));
  tmpvar_1070[0].y = -(sin((tmpvar_1071 + 0.7305999)));
  tmpvar_1070[1].x = sin((tmpvar_1071 + 0.7305999));
  tmpvar_1070[1].y = cos((tmpvar_1071 + 0.7305999));
  pos_1069 = (pos_1069 * tmpvar_1070);
  vec4 tmpvar_1072;
  float tmpvar_1073;
  tmpvar_1073 = (900.0 * zoom);
  if ((((
    (pos_1069.x > -((300.0 * zoom)))
   && 
    (pos_1069.x < (tmpvar_1073 + (300.0 * zoom)))
  ) && (pos_1069.y > 
    -((300.0 * zoom))
  )) && (pos_1069.y < (tmpvar_1073 + 
    (300.0 * zoom)
  )))) {
    float boxx_1074;
    vec3 color_1075;
    vec2 tmpvar_1076;
    tmpvar_1076 = (pos_1069 / tmpvar_1073);
    vec2 tmpvar_1077;
    tmpvar_1077 = (-(tmpvar_1076) + 0.5);
    float tmpvar_1078;
    tmpvar_1078 = (0.9 + cos((time + 
      (sqrt(dot (tmpvar_1077, tmpvar_1077)) * 10.0)
    )));
    color_1075 = vec3(0.0, 0.0, 0.0);
    float tmpvar_1079;
    float tmpvar_1080;
    tmpvar_1080 = (tax / 0.29);
    tmpvar_1079 = clamp (tmpvar_1080, 0.0, 1.0);
    float tmpvar_1081;
    float tmpvar_1082;
    tmpvar_1082 = (tax - 0.7);
    tmpvar_1081 = clamp ((tmpvar_1082 / -0.41), 0.0, 1.0);
    float tmpvar_1083;
    tmpvar_1083 = ((1.0 - (tmpvar_1079 * 
      (tmpvar_1079 * (3.0 - (2.0 * tmpvar_1079)))
    )) + (1.0 - (tmpvar_1081 * 
      (tmpvar_1081 * (3.0 - (2.0 * tmpvar_1081)))
    )));
    vec2 tmpvar_1084;
    tmpvar_1084.x = 0.08;
    tmpvar_1084.y = (0.3 - (0.07 * tmpvar_1083));
    float tmpvar_1085;
    tmpvar_1085 = clamp (tmpvar_1080, 0.0, 1.0);
    float tmpvar_1086;
    tmpvar_1086 = clamp ((tmpvar_1082 / -0.41), 0.0, 1.0);
    vec2 tmpvar_1087;
    tmpvar_1087.x = 9.0;
    tmpvar_1087.y = (((
      (1.0 - (tmpvar_1085 * (tmpvar_1085 * (3.0 - 
        (2.0 * tmpvar_1085)
      ))))
     + 
      (1.0 - (tmpvar_1086 * (tmpvar_1086 * (3.0 - 
        (2.0 * tmpvar_1086)
      ))))
    ) * 2.0) + 7.0);
    int tb_1089;
    vec2 shift_1090;
    vec2 pos_1091;
    pos_1091 = (((pos_1069 / 
      (900.0 * zoom)
    ) - 0.5) * 50.0);
    shift_1090 = tmpvar_1087;
    tb_1089 = 5;
    if (best) {
      tb_1089 = 6;
    };
    for (int i_1088 = 0; i_1088 < tb_1089; i_1088++) {
      pos_1091 = (abs(pos_1091) - (shift_1090 * exp2(
        -(float(i_1088))
      )));
      if ((pos_1091.x < pos_1091.y)) {
        pos_1091 = pos_1091.yx;
      };
    };
    float tmpvar_1092;
    tmpvar_1092 = abs(pos_1091.x);
    bool tmpvar_1093;
    if ((tmpvar_1092 < 0.683)) {
      tmpvar_1093 = (abs(pos_1091.y) < 0.83);
    } else {
      tmpvar_1093 = bool(0);
    };
    vec2 tmpvar_1094;
    if (tmpvar_1093) {
      float tmpvar_1095;
      tmpvar_1095 = clamp (((
        sqrt(dot (pos_1091, pos_1091))
       - 0.1) / 2.9), 0.0, 1.0);
      vec2 tmpvar_1096;
      tmpvar_1096.x = 1.0;
      tmpvar_1096.y = (tmpvar_1095 * (tmpvar_1095 * (3.0 - 
        (2.0 * tmpvar_1095)
      )));
      tmpvar_1094 = tmpvar_1096;
    } else {
      float tmpvar_1097;
      tmpvar_1097 = clamp (((
        sqrt(dot (pos_1091, pos_1091))
       - 1.5) / -1.5), 0.0, 1.0);
      vec2 tmpvar_1098;
      tmpvar_1098.x = 0.0;
      tmpvar_1098.y = (tmpvar_1097 * (tmpvar_1097 * (3.0 - 
        (2.0 * tmpvar_1097)
      )));
      tmpvar_1094 = tmpvar_1098;
    };
    vec2 tmpvar_1099;
    tmpvar_1099 = max ((abs(
      (tmpvar_1076 - vec2(0.5, 0.5))
    ) - tmpvar_1084), 0.0);
    float tmpvar_1100;
    tmpvar_1100 = clamp (((tax - 0.19) / 0.2), 0.0, 1.0);
    float tmpvar_1101;
    tmpvar_1101 = clamp (((tax - 0.65) / -0.26), 0.0, 1.0);
    boxx_1074 = ((1.0 - float(
      (sqrt(dot (tmpvar_1099, tmpvar_1099)) >= 0.001)
    )) * (float(
      (abs((pos_1069.x - (
        (sin(((pos_1069.y / -0.22) + time)) * 222.0)
       + 
        ((900.0 * zoom) / 2.0)
      ))) < (15.0 / zoom))
    ) * (1.0 - 
      (0.9 * ((1.0 - (tmpvar_1100 * 
        (tmpvar_1100 * (3.0 - (2.0 * tmpvar_1100)))
      )) + (1.0 - (tmpvar_1101 * 
        (tmpvar_1101 * (3.0 - (2.0 * tmpvar_1101)))
      ))))
    )));
    float tmpvar_1102;
    tmpvar_1102 = clamp (((tmpvar_1094.y - 0.05) / -0.05), 0.0, 1.0);
    float tmpvar_1103;
    tmpvar_1103 = clamp (((tmpvar_1094.y - 0.001) / -0.001), 0.0, 1.0);
    float tmpvar_1104;
    tmpvar_1104 = clamp ((0.039 / (tmpvar_1094.y - -0.002)), 0.0, 1.0);
    vec3 tmpvar_1105;
    tmpvar_1105.xz = vec2(0.0, 1.0);
    tmpvar_1105.y = (0.4 + (0.9 * (1.0 - tmpvar_1083)));
    color_1075 = (((
      (0.85 * (tmpvar_1102 * (tmpvar_1102 * (3.0 - 
        (2.0 * tmpvar_1102)
      ))))
     * tmpvar_1094.x) + (
      (0.1 * (tmpvar_1103 * (tmpvar_1103 * (3.0 - 
        (2.0 * tmpvar_1103)
      ))))
     * tmpvar_1094.x)) + ((tmpvar_1078 * 
      (tmpvar_1104 * (tmpvar_1104 * (3.0 - (2.0 * tmpvar_1104))))
    ) * (tmpvar_1105 * tmpvar_1094.x)));
    vec4 tmpvar_1106;
    tmpvar_1106.w = 1.0;
    tmpvar_1106.xyz = color_1075;
    vec3 finalColor_1107;
    float tmpvar_1108;
    if (en3hit) {
      float tmpvar_1109;
      tmpvar_1109 = clamp (((lpower - 20.0) / -20.0), 0.0, 1.0);
      tmpvar_1108 = (2.0 * (tmpvar_1109 * (tmpvar_1109 * 
        (3.0 - (2.0 * tmpvar_1109))
      )));
    } else {
      tmpvar_1108 = 0.0;
    };
    float tmpvar_1110;
    float tmpvar_1111;
    tmpvar_1111 = sin(time);
    tmpvar_1110 = (0.015 + ((tmpvar_1108 / 50.0) * cos(tmpvar_1111)));
    vec2 tmpvar_1112;
    tmpvar_1112 = (((pos_1069 / 
      (900.0 * zoom)
    ) * 2.0) - 1.0);
    finalColor_1107 = vec3(0.0, 0.0, 0.0);
    vec3 tmpvar_1113;
    tmpvar_1113.y = 0.5;
    tmpvar_1113.x = (0.3 + tmpvar_1108);
    tmpvar_1113.z = (2.5 - abs((tmpvar_1108 * 
      cos(tmpvar_1111)
    )));
    vec2 x_1114;
    x_1114 = ((tmpvar_1112 / 1.6) * 0.5);
    vec2 tmpvar_1115;
    tmpvar_1115 = max (((
      -(tmpvar_1112)
     / 1.6) - vec2(0.572, 0.0915)), sqrt(dot (x_1114, x_1114)));
    float tmpvar_1116;
    tmpvar_1116 = sqrt(dot (tmpvar_1115, tmpvar_1115));
    float y_over_x_1117;
    y_over_x_1117 = (tmpvar_1112.y / tmpvar_1112.x);
    float tmpvar_1118;
    tmpvar_1118 = (min (abs(y_over_x_1117), 1.0) / max (abs(y_over_x_1117), 1.0));
    float tmpvar_1119;
    tmpvar_1119 = (tmpvar_1118 * tmpvar_1118);
    tmpvar_1119 = (((
      ((((
        ((((-0.01213232 * tmpvar_1119) + 0.05368138) * tmpvar_1119) - 0.1173503)
       * tmpvar_1119) + 0.1938925) * tmpvar_1119) - 0.3326756)
     * tmpvar_1119) + 0.9999793) * tmpvar_1118);
    tmpvar_1119 = (tmpvar_1119 + (float(
      (abs(y_over_x_1117) > 1.0)
    ) * (
      (tmpvar_1119 * -2.0)
     + 1.570796)));
    float tmpvar_1120;
    tmpvar_1120 = sin(((
      (tmpvar_1119 * sign(y_over_x_1117))
     * 30.0) + (time * -10.0)));
    float v_1121;
    vec2 xy_1122;
    xy_1122 = (tmpvar_1112 * 200.0);
    vec2 uv_1123;
    vec2 tmpvar_1124;
    tmpvar_1124 = floor(xy_1122);
    vec2 tmpvar_1125;
    tmpvar_1125 = (xy_1122 - tmpvar_1124);
    uv_1123 = ((tmpvar_1125 * tmpvar_1125) * (3.0 - (2.0 * tmpvar_1125)));
    float tmpvar_1126;
    tmpvar_1126 = fract((cos(
      dot (tmpvar_1124, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_1127;
    tmpvar_1127.x = (tmpvar_1124.x + 1.0);
    tmpvar_1127.y = tmpvar_1124.y;
    float tmpvar_1128;
    tmpvar_1128 = fract((cos(
      dot (tmpvar_1127, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_1129;
    tmpvar_1129.x = tmpvar_1124.x;
    tmpvar_1129.y = (tmpvar_1124.y + 1.0);
    float tmpvar_1130;
    tmpvar_1130 = fract((cos(
      dot (tmpvar_1129, vec2(21.9898, 78.233))
    ) * 43758.55));
    v_1121 = (((
      (tmpvar_1126 + ((tmpvar_1128 - tmpvar_1126) * uv_1123.x))
     + 
      ((tmpvar_1130 - tmpvar_1126) * uv_1123.y)
    ) + (
      ((((tmpvar_1126 - tmpvar_1128) - tmpvar_1130) + fract((
        cos(dot ((tmpvar_1124 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
       * 43758.55))) * uv_1123.x)
     * uv_1123.y)) * 0.5);
    if (best) {
      vec2 xy_1131;
      xy_1131 = (tmpvar_1112 * 100.0);
      vec2 uv_1132;
      vec2 tmpvar_1133;
      tmpvar_1133 = floor(xy_1131);
      vec2 tmpvar_1134;
      tmpvar_1134 = (xy_1131 - tmpvar_1133);
      uv_1132 = ((tmpvar_1134 * tmpvar_1134) * (3.0 - (2.0 * tmpvar_1134)));
      float tmpvar_1135;
      tmpvar_1135 = fract((cos(
        dot (tmpvar_1133, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_1136;
      tmpvar_1136.x = (tmpvar_1133.x + 1.0);
      tmpvar_1136.y = tmpvar_1133.y;
      float tmpvar_1137;
      tmpvar_1137 = fract((cos(
        dot (tmpvar_1136, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_1138;
      tmpvar_1138.x = tmpvar_1133.x;
      tmpvar_1138.y = (tmpvar_1133.y + 1.0);
      float tmpvar_1139;
      tmpvar_1139 = fract((cos(
        dot (tmpvar_1138, vec2(21.9898, 78.233))
      ) * 43758.55));
      v_1121 = (v_1121 + ((
        ((tmpvar_1135 + ((tmpvar_1137 - tmpvar_1135) * uv_1132.x)) + ((tmpvar_1139 - tmpvar_1135) * uv_1132.y))
       + 
        ((((
          (tmpvar_1135 - tmpvar_1137)
         - tmpvar_1139) + fract(
          (cos(dot ((tmpvar_1133 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_1132.x) * uv_1132.y)
      ) * 0.25));
      vec2 xy_1140;
      xy_1140 = (tmpvar_1112 * 50.0);
      vec2 uv_1141;
      vec2 tmpvar_1142;
      tmpvar_1142 = floor(xy_1140);
      vec2 tmpvar_1143;
      tmpvar_1143 = (xy_1140 - tmpvar_1142);
      uv_1141 = ((tmpvar_1143 * tmpvar_1143) * (3.0 - (2.0 * tmpvar_1143)));
      float tmpvar_1144;
      tmpvar_1144 = fract((cos(
        dot (tmpvar_1142, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_1145;
      tmpvar_1145.x = (tmpvar_1142.x + 1.0);
      tmpvar_1145.y = tmpvar_1142.y;
      float tmpvar_1146;
      tmpvar_1146 = fract((cos(
        dot (tmpvar_1145, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_1147;
      tmpvar_1147.x = tmpvar_1142.x;
      tmpvar_1147.y = (tmpvar_1142.y + 1.0);
      float tmpvar_1148;
      tmpvar_1148 = fract((cos(
        dot (tmpvar_1147, vec2(21.9898, 78.233))
      ) * 43758.55));
      v_1121 = (v_1121 + ((
        ((tmpvar_1144 + ((tmpvar_1146 - tmpvar_1144) * uv_1141.x)) + ((tmpvar_1148 - tmpvar_1144) * uv_1141.y))
       + 
        ((((
          (tmpvar_1144 - tmpvar_1146)
         - tmpvar_1148) + fract(
          (cos(dot ((tmpvar_1142 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_1141.x) * uv_1141.y)
      ) * 0.125));
    };
    finalColor_1107 = (tmpvar_1113 * abs((0.003 / 
      (tmpvar_1116 - (0.206 + (0.5 * (
        (((tmpvar_1110 * tmpvar_1120) * 0.5) + 0.5)
       + 
        (v_1121 * 0.15)
      ))))
    )));
    vec3 tmpvar_1149;
    tmpvar_1149.z = 0.5;
    tmpvar_1149.x = (1.3 + tmpvar_1108);
    tmpvar_1149.y = (0.5 + abs((tmpvar_1108 * 
      sin(cos(time))
    )));
    vec2 x_1150;
    x_1150 = ((tmpvar_1112 / 1.6) * 0.5);
    vec2 tmpvar_1151;
    tmpvar_1151 = max (((
      -(tmpvar_1112)
     / 1.6) - vec2(0.572, 0.0915)), sqrt(dot (x_1150, x_1150)));
    float tmpvar_1152;
    tmpvar_1152 = sqrt(dot (tmpvar_1151, tmpvar_1151));
    float y_over_x_1153;
    y_over_x_1153 = (tmpvar_1112.y / tmpvar_1112.x);
    float tmpvar_1154;
    tmpvar_1154 = (min (abs(y_over_x_1153), 1.0) / max (abs(y_over_x_1153), 1.0));
    float tmpvar_1155;
    tmpvar_1155 = (tmpvar_1154 * tmpvar_1154);
    tmpvar_1155 = (((
      ((((
        ((((-0.01213232 * tmpvar_1155) + 0.05368138) * tmpvar_1155) - 0.1173503)
       * tmpvar_1155) + 0.1938925) * tmpvar_1155) - 0.3326756)
     * tmpvar_1155) + 0.9999793) * tmpvar_1154);
    tmpvar_1155 = (tmpvar_1155 + (float(
      (abs(y_over_x_1153) > 1.0)
    ) * (
      (tmpvar_1155 * -2.0)
     + 1.570796)));
    float tmpvar_1156;
    tmpvar_1156 = sin(((
      (tmpvar_1155 * sign(y_over_x_1153))
     * 30.0) + (time * 5.0)));
    float v_1157;
    vec2 xy_1158;
    xy_1158 = (tmpvar_1112 * 30.0);
    vec2 uv_1159;
    vec2 tmpvar_1160;
    tmpvar_1160 = floor(xy_1158);
    vec2 tmpvar_1161;
    tmpvar_1161 = (xy_1158 - tmpvar_1160);
    uv_1159 = ((tmpvar_1161 * tmpvar_1161) * (3.0 - (2.0 * tmpvar_1161)));
    float tmpvar_1162;
    tmpvar_1162 = fract((cos(
      dot (tmpvar_1160, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_1163;
    tmpvar_1163.x = (tmpvar_1160.x + 1.0);
    tmpvar_1163.y = tmpvar_1160.y;
    float tmpvar_1164;
    tmpvar_1164 = fract((cos(
      dot (tmpvar_1163, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_1165;
    tmpvar_1165.x = tmpvar_1160.x;
    tmpvar_1165.y = (tmpvar_1160.y + 1.0);
    float tmpvar_1166;
    tmpvar_1166 = fract((cos(
      dot (tmpvar_1165, vec2(21.9898, 78.233))
    ) * 43758.55));
    v_1157 = (((
      (tmpvar_1162 + ((tmpvar_1164 - tmpvar_1162) * uv_1159.x))
     + 
      ((tmpvar_1166 - tmpvar_1162) * uv_1159.y)
    ) + (
      ((((tmpvar_1162 - tmpvar_1164) - tmpvar_1166) + fract((
        cos(dot ((tmpvar_1160 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
       * 43758.55))) * uv_1159.x)
     * uv_1159.y)) * 0.5);
    if (best) {
      vec2 xy_1167;
      xy_1167 = (tmpvar_1112 * 6.0);
      vec2 uv_1168;
      vec2 tmpvar_1169;
      tmpvar_1169 = floor(xy_1167);
      vec2 tmpvar_1170;
      tmpvar_1170 = (xy_1167 - tmpvar_1169);
      uv_1168 = ((tmpvar_1170 * tmpvar_1170) * (3.0 - (2.0 * tmpvar_1170)));
      float tmpvar_1171;
      tmpvar_1171 = fract((cos(
        dot (tmpvar_1169, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_1172;
      tmpvar_1172.x = (tmpvar_1169.x + 1.0);
      tmpvar_1172.y = tmpvar_1169.y;
      float tmpvar_1173;
      tmpvar_1173 = fract((cos(
        dot (tmpvar_1172, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_1174;
      tmpvar_1174.x = tmpvar_1169.x;
      tmpvar_1174.y = (tmpvar_1169.y + 1.0);
      float tmpvar_1175;
      tmpvar_1175 = fract((cos(
        dot (tmpvar_1174, vec2(21.9898, 78.233))
      ) * 43758.55));
      v_1157 = (v_1157 + ((
        ((tmpvar_1171 + ((tmpvar_1173 - tmpvar_1171) * uv_1168.x)) + ((tmpvar_1175 - tmpvar_1171) * uv_1168.y))
       + 
        ((((
          (tmpvar_1171 - tmpvar_1173)
         - tmpvar_1175) + fract(
          (cos(dot ((tmpvar_1169 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_1168.x) * uv_1168.y)
      ) * 0.25));
      vec2 xy_1176;
      xy_1176 = (tmpvar_1112 * 5.0);
      vec2 uv_1177;
      vec2 tmpvar_1178;
      tmpvar_1178 = floor(xy_1176);
      vec2 tmpvar_1179;
      tmpvar_1179 = (xy_1176 - tmpvar_1178);
      uv_1177 = ((tmpvar_1179 * tmpvar_1179) * (3.0 - (2.0 * tmpvar_1179)));
      float tmpvar_1180;
      tmpvar_1180 = fract((cos(
        dot (tmpvar_1178, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_1181;
      tmpvar_1181.x = (tmpvar_1178.x + 1.0);
      tmpvar_1181.y = tmpvar_1178.y;
      float tmpvar_1182;
      tmpvar_1182 = fract((cos(
        dot (tmpvar_1181, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_1183;
      tmpvar_1183.x = tmpvar_1178.x;
      tmpvar_1183.y = (tmpvar_1178.y + 1.0);
      float tmpvar_1184;
      tmpvar_1184 = fract((cos(
        dot (tmpvar_1183, vec2(21.9898, 78.233))
      ) * 43758.55));
      v_1157 = (v_1157 + ((
        ((tmpvar_1180 + ((tmpvar_1182 - tmpvar_1180) * uv_1177.x)) + ((tmpvar_1184 - tmpvar_1180) * uv_1177.y))
       + 
        ((((
          (tmpvar_1180 - tmpvar_1182)
         - tmpvar_1184) + fract(
          (cos(dot ((tmpvar_1178 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
        )) * uv_1177.x) * uv_1177.y)
      ) * 0.125));
    };
    finalColor_1107 = (finalColor_1107 + (tmpvar_1149 * abs(
      (0.003 / (tmpvar_1152 - (0.2 + (0.5 * 
        ((((tmpvar_1110 * tmpvar_1156) * 0.5) + 0.5) + (v_1157 * 0.15))
      ))))
    )));
    if (best) {
      vec3 tmpvar_1185;
      tmpvar_1185.z = 0.652;
      tmpvar_1185.x = (0.1 + tmpvar_1108);
      tmpvar_1185.y = (0.951 + abs((tmpvar_1108 * 
        sin(cos(time))
      )));
      vec2 x_1186;
      x_1186 = ((tmpvar_1112 / 1.6) * 0.5);
      vec2 tmpvar_1187;
      tmpvar_1187 = max (((
        -(tmpvar_1112)
       / 1.6) - vec2(0.572, 0.0915)), sqrt(dot (x_1186, x_1186)));
      float tmpvar_1188;
      tmpvar_1188 = sqrt(dot (tmpvar_1187, tmpvar_1187));
      float y_over_x_1189;
      y_over_x_1189 = (tmpvar_1112.y / tmpvar_1112.x);
      float tmpvar_1190;
      tmpvar_1190 = (min (abs(y_over_x_1189), 1.0) / max (abs(y_over_x_1189), 1.0));
      float tmpvar_1191;
      tmpvar_1191 = (tmpvar_1190 * tmpvar_1190);
      tmpvar_1191 = (((
        ((((
          ((((-0.01213232 * tmpvar_1191) + 0.05368138) * tmpvar_1191) - 0.1173503)
         * tmpvar_1191) + 0.1938925) * tmpvar_1191) - 0.3326756)
       * tmpvar_1191) + 0.9999793) * tmpvar_1190);
      tmpvar_1191 = (tmpvar_1191 + (float(
        (abs(y_over_x_1189) > 1.0)
      ) * (
        (tmpvar_1191 * -2.0)
       + 1.570796)));
      float tmpvar_1192;
      tmpvar_1192 = sin(((
        (tmpvar_1191 * sign(y_over_x_1189))
       * 30.0) + (time * 4.0)));
      float v_1193;
      vec2 xy_1194;
      xy_1194 = (tmpvar_1112 * 20.0);
      vec2 uv_1195;
      vec2 tmpvar_1196;
      tmpvar_1196 = floor(xy_1194);
      vec2 tmpvar_1197;
      tmpvar_1197 = (xy_1194 - tmpvar_1196);
      uv_1195 = ((tmpvar_1197 * tmpvar_1197) * (3.0 - (2.0 * tmpvar_1197)));
      float tmpvar_1198;
      tmpvar_1198 = fract((cos(
        dot (tmpvar_1196, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_1199;
      tmpvar_1199.x = (tmpvar_1196.x + 1.0);
      tmpvar_1199.y = tmpvar_1196.y;
      float tmpvar_1200;
      tmpvar_1200 = fract((cos(
        dot (tmpvar_1199, vec2(21.9898, 78.233))
      ) * 43758.55));
      vec2 tmpvar_1201;
      tmpvar_1201.x = tmpvar_1196.x;
      tmpvar_1201.y = (tmpvar_1196.y + 1.0);
      float tmpvar_1202;
      tmpvar_1202 = fract((cos(
        dot (tmpvar_1201, vec2(21.9898, 78.233))
      ) * 43758.55));
      v_1193 = (((
        (tmpvar_1198 + ((tmpvar_1200 - tmpvar_1198) * uv_1195.x))
       + 
        ((tmpvar_1202 - tmpvar_1198) * uv_1195.y)
      ) + (
        ((((tmpvar_1198 - tmpvar_1200) - tmpvar_1202) + fract((
          cos(dot ((tmpvar_1196 + vec2(1.0, 1.0)), vec2(21.9898, 78.233)))
         * 43758.55))) * uv_1195.x)
       * uv_1195.y)) * 0.5);
      if (best) {
        vec2 xy_1203;
        xy_1203 = (tmpvar_1112 * 30.0);
        vec2 uv_1204;
        vec2 tmpvar_1205;
        tmpvar_1205 = floor(xy_1203);
        vec2 tmpvar_1206;
        tmpvar_1206 = (xy_1203 - tmpvar_1205);
        uv_1204 = ((tmpvar_1206 * tmpvar_1206) * (3.0 - (2.0 * tmpvar_1206)));
        float tmpvar_1207;
        tmpvar_1207 = fract((cos(
          dot (tmpvar_1205, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 tmpvar_1208;
        tmpvar_1208.x = (tmpvar_1205.x + 1.0);
        tmpvar_1208.y = tmpvar_1205.y;
        float tmpvar_1209;
        tmpvar_1209 = fract((cos(
          dot (tmpvar_1208, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 tmpvar_1210;
        tmpvar_1210.x = tmpvar_1205.x;
        tmpvar_1210.y = (tmpvar_1205.y + 1.0);
        float tmpvar_1211;
        tmpvar_1211 = fract((cos(
          dot (tmpvar_1210, vec2(21.9898, 78.233))
        ) * 43758.55));
        v_1193 = (v_1193 + ((
          ((tmpvar_1207 + ((tmpvar_1209 - tmpvar_1207) * uv_1204.x)) + ((tmpvar_1211 - tmpvar_1207) * uv_1204.y))
         + 
          ((((
            (tmpvar_1207 - tmpvar_1209)
           - tmpvar_1211) + fract(
            (cos(dot ((tmpvar_1205 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
          )) * uv_1204.x) * uv_1204.y)
        ) * 0.25));
        vec2 xy_1212;
        xy_1212 = (tmpvar_1112 * 70.0);
        vec2 uv_1213;
        vec2 tmpvar_1214;
        tmpvar_1214 = floor(xy_1212);
        vec2 tmpvar_1215;
        tmpvar_1215 = (xy_1212 - tmpvar_1214);
        uv_1213 = ((tmpvar_1215 * tmpvar_1215) * (3.0 - (2.0 * tmpvar_1215)));
        float tmpvar_1216;
        tmpvar_1216 = fract((cos(
          dot (tmpvar_1214, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 tmpvar_1217;
        tmpvar_1217.x = (tmpvar_1214.x + 1.0);
        tmpvar_1217.y = tmpvar_1214.y;
        float tmpvar_1218;
        tmpvar_1218 = fract((cos(
          dot (tmpvar_1217, vec2(21.9898, 78.233))
        ) * 43758.55));
        vec2 tmpvar_1219;
        tmpvar_1219.x = tmpvar_1214.x;
        tmpvar_1219.y = (tmpvar_1214.y + 1.0);
        float tmpvar_1220;
        tmpvar_1220 = fract((cos(
          dot (tmpvar_1219, vec2(21.9898, 78.233))
        ) * 43758.55));
        v_1193 = (v_1193 + ((
          ((tmpvar_1216 + ((tmpvar_1218 - tmpvar_1216) * uv_1213.x)) + ((tmpvar_1220 - tmpvar_1216) * uv_1213.y))
         + 
          ((((
            (tmpvar_1216 - tmpvar_1218)
           - tmpvar_1220) + fract(
            (cos(dot ((tmpvar_1214 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
          )) * uv_1213.x) * uv_1213.y)
        ) * 0.125));
      };
      finalColor_1107 = (finalColor_1107 + (tmpvar_1185 * (0.51 * 
        abs((0.003 / (tmpvar_1188 - (0.186 + 
          (0.5 * (((
            (tmpvar_1110 * tmpvar_1192)
           * 0.5) + 0.5) + (v_1193 * 0.15)))
        ))))
      )));
    };
    vec4 tmpvar_1221;
    tmpvar_1221.w = 1.0;
    tmpvar_1221.xyz = finalColor_1107;
    float tmpvar_1222;
    float tmpvar_1223;
    tmpvar_1223 = clamp (((tmpvar_1076.y - 1.3) / -0.4), 0.0, 1.0);
    tmpvar_1222 = (tmpvar_1223 * (tmpvar_1223 * (3.0 - 
      (2.0 * tmpvar_1223)
    )));
    float tmpvar_1224;
    float tmpvar_1225;
    tmpvar_1225 = clamp ((tmpvar_1076.y / 0.1), 0.0, 1.0);
    tmpvar_1224 = (tmpvar_1225 * (tmpvar_1225 * (3.0 - 
      (2.0 * tmpvar_1225)
    )));
    float tmpvar_1226;
    float tmpvar_1227;
    tmpvar_1227 = clamp (((tmpvar_1076.x - -0.3) / 0.4), 0.0, 1.0);
    tmpvar_1226 = (tmpvar_1227 * (tmpvar_1227 * (3.0 - 
      (2.0 * tmpvar_1227)
    )));
    float tmpvar_1228;
    float tmpvar_1229;
    tmpvar_1229 = clamp (((tmpvar_1076.x - 1.3) / -0.4), 0.0, 1.0);
    tmpvar_1228 = (tmpvar_1229 * (tmpvar_1229 * (3.0 - 
      (2.0 * tmpvar_1229)
    )));
    vec2 pos_1230;
    pos_1230.x = pos_1069.x;
    float mblur_1232;
    float ssamount_1233;
    float R_1234;
    vec3 color_1235;
    color_1235 = vec3(0.0, 0.0, 0.0);
    pos_1230.y = (pos_1069.y - (pos_1069.x / 4.0));
    R_1234 = (900.0 * zoom);
    ssamount_1233 = 1.0;
    if (best) {
      ssamount_1233 = 2.0;
    };
    mblur_1232 = 1.0;
    if (best) {
      mblur_1232 = 2.0;
    };
    for (float blur_1231 = 0.0; blur_1231 < mblur_1232; blur_1231 += 1.0) {
      float timed_1237;
      timed_1237 = (((blur_1231 / mblur_1232) / 4.0) + (iTime * 6.0));
      for (float x_1236 = 0.0; x_1236 < ssamount_1233; x_1236 += 1.0) {
        for (float y_1238 = 0.0; y_1238 < ssamount_1233; y_1238 += 1.0) {
          vec2 position_1239;
          vec2 tmpvar_1240;
          tmpvar_1240.x = (x_1236 / ssamount_1233);
          tmpvar_1240.y = (y_1238 / ssamount_1233);
          position_1239 = ((pos_1230 + tmpvar_1240) / R_1234);
          position_1239 = (position_1239 * 2.0);
          position_1239 = (position_1239 - 1.25);
          position_1239.x = (position_1239.x + 0.8632537);
          position_1239.x = (position_1239.x * 8.5);
          position_1239.y = (position_1239.y * 1.4);
          position_1239.y = (position_1239.y + 0.4);
          position_1239 = -(position_1239);
          vec2 tmpvar_1241;
          tmpvar_1241.x = 0.04;
          tmpvar_1241.y = (((2.0 * position_1239.y) * (position_1239.x * position_1239.x)) - pow (sin(
            ((pow (position_1239.x, 3.0) * 2.5) - timed_1237)
          ), 0.5));
          color_1235 = (color_1235 + ((0.1 / 
            sqrt(dot (tmpvar_1241, tmpvar_1241))
          ) * vec3(0.0, 0.4, 1.0)));
          vec2 tmpvar_1242;
          tmpvar_1242.x = 0.04;
          tmpvar_1242.y = (((2.0 * position_1239.y) * (position_1239.x * position_1239.x)) + pow (sin(
            ((pow (position_1239.x, 3.0) * 2.5) - timed_1237)
          ), 0.5));
          color_1235 = (color_1235 + ((0.1 / 
            sqrt(dot (tmpvar_1242, tmpvar_1242))
          ) * vec3(0.0, 0.4, 1.0)));
          vec2 tmpvar_1243;
          tmpvar_1243.x = 0.01;
          tmpvar_1243.y = (((3.0 * position_1239.y) * (position_1239.x * position_1239.x)) + (sin(
            (((pow (position_1239.x, 3.0) * 8.0) + ((position_1239.x * position_1239.x) * 32.0)) + timed_1237)
          ) * sin(
            (((position_1239.y * position_1239.x) * (position_1239.x * 16.0)) + sin((timed_1237 / 8.0)))
          )));
          color_1235 = (color_1235 + ((0.1 / 
            sqrt(dot (tmpvar_1243, tmpvar_1243))
          ) * vec3(2.0, 0.3525, 1.8)));
          color_1235 = (color_1235 * float((
            (position_1239.x - 0.9)
           >= 0.0)));
        };
      };
    };
    vec4 tmpvar_1244;
    tmpvar_1244.w = 1.0;
    tmpvar_1244.xyz = (((color_1235 / ssamount_1233) * ssamount_1233) / mblur_1232);
    vec4 tmpvar_1245;
    tmpvar_1245 = max (vec4(0.0, 0.0, 0.0, 0.0), tmpvar_1244);
    float tmpvar_1246;
    float tmpvar_1247;
    float tmpvar_1248;
    tmpvar_1248 = sin(time);
    tmpvar_1247 = clamp (((
      (tmpvar_1076.y - (0.1 * tmpvar_1248))
     - 0.8) / -0.1), 0.0, 1.0);
    tmpvar_1246 = (tmpvar_1247 * (tmpvar_1247 * (3.0 - 
      (2.0 * tmpvar_1247)
    )));
    float tmpvar_1249;
    float tmpvar_1250;
    tmpvar_1250 = clamp (((
      (tmpvar_1076.y + (0.1 * tmpvar_1248))
     - 0.2) / 0.1), 0.0, 1.0);
    tmpvar_1249 = (tmpvar_1250 * (tmpvar_1250 * (3.0 - 
      (2.0 * tmpvar_1250)
    )));
    float tmpvar_1251;
    float tmpvar_1252;
    tmpvar_1252 = clamp (((tmpvar_1076.x - -0.3) / 0.4), 0.0, 1.0);
    tmpvar_1251 = (tmpvar_1252 * (tmpvar_1252 * (3.0 - 
      (2.0 * tmpvar_1252)
    )));
    vec2 pos_1253;
    pos_1253.x = pos_1069.x;
    float mblur_1255;
    float ssamount_1256;
    float R_1257;
    vec3 color_1258;
    color_1258 = vec3(0.0, 0.0, 0.0);
    pos_1253.y = (pos_1069.y + (pos_1069.x / 4.0));
    R_1257 = (900.0 * zoom);
    ssamount_1256 = 1.0;
    if (best) {
      ssamount_1256 = 2.0;
    };
    mblur_1255 = 1.0;
    if (best) {
      mblur_1255 = 2.0;
    };
    for (float blur_1254 = 0.0; blur_1254 < mblur_1255; blur_1254 += 1.0) {
      float timed_1260;
      timed_1260 = (((blur_1254 / mblur_1255) / 4.0) + (-(iTime) * 6.0));
      for (float x_1259 = 0.0; x_1259 < ssamount_1256; x_1259 += 1.0) {
        for (float y_1261 = 0.0; y_1261 < ssamount_1256; y_1261 += 1.0) {
          vec2 position_1262;
          vec2 tmpvar_1263;
          tmpvar_1263.x = (x_1259 / ssamount_1256);
          tmpvar_1263.y = (y_1261 / ssamount_1256);
          position_1262 = ((pos_1253 + tmpvar_1263) / R_1257);
          position_1262 = (position_1262 * 2.0);
          position_1262 = (position_1262 - 1.25);
          position_1262.x = (position_1262.x + -0.3674636);
          position_1262.y = (position_1262.y + -0.5);
          position_1262.x = (position_1262.x * 8.5);
          position_1262.y = (position_1262.y * 1.4);
          position_1262.y = (position_1262.y + 0.4);
          vec2 tmpvar_1264;
          tmpvar_1264.x = 0.04;
          tmpvar_1264.y = (((2.0 * position_1262.y) * (position_1262.x * position_1262.x)) - pow (sin(
            ((pow (position_1262.x, 3.0) * 2.5) - timed_1260)
          ), 0.5));
          color_1258 = (color_1258 + ((0.1 / 
            sqrt(dot (tmpvar_1264, tmpvar_1264))
          ) * vec3(0.0, 0.4, 1.0)));
          vec2 tmpvar_1265;
          tmpvar_1265.x = 0.04;
          tmpvar_1265.y = (((2.0 * position_1262.y) * (position_1262.x * position_1262.x)) + pow (sin(
            ((pow (position_1262.x, 3.0) * 2.5) - timed_1260)
          ), 0.5));
          color_1258 = (color_1258 + ((0.1 / 
            sqrt(dot (tmpvar_1265, tmpvar_1265))
          ) * vec3(0.0, 0.4, 1.0)));
          vec2 tmpvar_1266;
          tmpvar_1266.x = 0.01;
          tmpvar_1266.y = (((3.0 * position_1262.y) * (position_1262.x * position_1262.x)) + (sin(
            (((pow (position_1262.x, 3.0) * 8.0) + ((position_1262.x * position_1262.x) * 32.0)) + timed_1260)
          ) * sin(
            (((position_1262.y * position_1262.x) * (position_1262.x * 16.0)) + sin((timed_1260 / 8.0)))
          )));
          color_1258 = (color_1258 + ((0.1 / 
            sqrt(dot (tmpvar_1266, tmpvar_1266))
          ) * vec3(2.0, 0.3525, 1.8)));
          color_1258 = (color_1258 * float((
            (position_1262.x - 0.9)
           >= 0.0)));
        };
      };
    };
    vec4 tmpvar_1267;
    tmpvar_1267.w = 1.0;
    tmpvar_1267.xyz = (((color_1258 / ssamount_1256) * ssamount_1256) / mblur_1255);
    vec4 tmpvar_1268;
    tmpvar_1268 = max (vec4(0.0, 0.0, 0.0, 0.0), tmpvar_1267);
    float tmpvar_1269;
    float tmpvar_1270;
    float tmpvar_1271;
    tmpvar_1271 = sin(time);
    tmpvar_1270 = clamp (((
      (tmpvar_1076.y - (0.1 * tmpvar_1271))
     - 0.8) / -0.1), 0.0, 1.0);
    tmpvar_1269 = (tmpvar_1270 * (tmpvar_1270 * (3.0 - 
      (2.0 * tmpvar_1270)
    )));
    float tmpvar_1272;
    float tmpvar_1273;
    tmpvar_1273 = clamp (((
      (tmpvar_1076.y + (0.1 * tmpvar_1271))
     - 0.2) / 0.1), 0.0, 1.0);
    tmpvar_1272 = (tmpvar_1273 * (tmpvar_1273 * (3.0 - 
      (2.0 * tmpvar_1273)
    )));
    float tmpvar_1274;
    float tmpvar_1275;
    tmpvar_1275 = clamp (((tmpvar_1076.x - 1.3) / -0.4), 0.0, 1.0);
    tmpvar_1274 = (tmpvar_1275 * (tmpvar_1275 * (3.0 - 
      (2.0 * tmpvar_1275)
    )));
    vec3 final_1276;
    vec3 color_1277;
    vec2 st_1278;
    vec2 tmpvar_1279;
    tmpvar_1279 = (pos_1069 / (900.0 * zoom));
    st_1278.x = tmpvar_1279.x;
    st_1278.y = (tmpvar_1279.y + 0.4);
    st_1278 = (st_1278 - vec2(0.5, 0.5));
    float tmpvar_1280;
    tmpvar_1280 = clamp (((tax - 0.19) / 0.2), 0.0, 1.0);
    float tmpvar_1281;
    tmpvar_1281 = clamp (((tax - 0.65) / -0.26), 0.0, 1.0);
    float tmpvar_1282;
    tmpvar_1282 = ((1.0 - (tmpvar_1280 * 
      (tmpvar_1280 * (3.0 - (2.0 * tmpvar_1280)))
    )) + (1.0 - (tmpvar_1281 * 
      (tmpvar_1281 * (3.0 - (2.0 * tmpvar_1281)))
    )));
    float tmpvar_1283;
    tmpvar_1283 = (0.8 * (1.0 - tmpvar_1282));
    vec3 tmpvar_1284;
    tmpvar_1284 = (vec3(pow (abs(st_1278.y), (
      (0.5 - (tmpvar_1283 * 0.4))
     * 5.0))) * vec3(0.849, 0.08369, 0.08));
    color_1277 = tmpvar_1284;
    final_1276 = ((vec3(0.08, 0.003, 0.02) + tmpvar_1284) + vec3(((0.75 + 
      (tmpvar_1283 * 0.2)
    ) - pow (
      abs(st_1278.x)
    , 0.324))));
    float tmpvar_1285;
    tmpvar_1285 = (0.5 + (tmpvar_1283 * 0.5));
    float tmpvar_1286;
    tmpvar_1286 = (sqrt(dot (st_1278, st_1278)) * 2.0);
    float tmpvar_1287;
    float tmpvar_1288;
    tmpvar_1288 = (min (abs(
      (st_1278.y / st_1278.x)
    ), 1.0) / max (abs(
      (st_1278.y / st_1278.x)
    ), 1.0));
    float tmpvar_1289;
    tmpvar_1289 = (tmpvar_1288 * tmpvar_1288);
    tmpvar_1289 = (((
      ((((
        ((((-0.01213232 * tmpvar_1289) + 0.05368138) * tmpvar_1289) - 0.1173503)
       * tmpvar_1289) + 0.1938925) * tmpvar_1289) - 0.3326756)
     * tmpvar_1289) + 0.9999793) * tmpvar_1288);
    tmpvar_1289 = (tmpvar_1289 + (float(
      (abs((st_1278.y / st_1278.x)) > 1.0)
    ) * (
      (tmpvar_1289 * -2.0)
     + 1.570796)));
    tmpvar_1287 = (tmpvar_1289 * sign((st_1278.y / st_1278.x)));
    if ((abs(st_1278.x) > (1e-08 * abs(st_1278.y)))) {
      if ((st_1278.x < 0.0)) {
        if ((st_1278.y >= 0.0)) {
          tmpvar_1287 += 3.141593;
        } else {
          tmpvar_1287 = (tmpvar_1287 - 3.141593);
        };
      };
    } else {
      tmpvar_1287 = (sign(st_1278.y) * 1.570796);
    };
    float tmpvar_1290;
    tmpvar_1290 = (abs(cos(tmpvar_1287)) * 0.01);
    float tmpvar_1291;
    tmpvar_1291 = clamp (((tmpvar_1286 - tmpvar_1290) / (
      ((tmpvar_1290 + 0.02) + (tmpvar_1285 * 0.1))
     - tmpvar_1290)), 0.0, 1.0);
    color_1277 = (vec3((1.0 - (tmpvar_1291 * 
      (tmpvar_1291 * (3.0 - (2.0 * tmpvar_1291)))
    ))) * vec3(0.86, 0.759, 0.41));
    final_1276 = (final_1276 + color_1277);
    float tmpvar_1292;
    tmpvar_1292 = clamp (((tax - 0.19) / 0.46), 0.0, 1.0);
    vec4 tmpvar_1293;
    tmpvar_1293.w = 1.0;
    tmpvar_1293.xyz = final_1276;
    float edge0_1294;
    edge0_1294 = (0.05 + (0.05 * st_1278.y));
    float tmpvar_1295;
    tmpvar_1295 = clamp (((
      abs(st_1278.x)
     - edge0_1294) / (0.04 - edge0_1294)), 0.0, 1.0);
    float edge0_1296;
    edge0_1296 = (2.5 + (3.0 * (1.0 - 
      (1.0 - (tmpvar_1292 * (tmpvar_1292 * (3.0 - 
        (2.0 * tmpvar_1292)
      ))))
    )));
    float tmpvar_1297;
    tmpvar_1297 = clamp (((
      sqrt(dot (st_1278, st_1278))
     - edge0_1296) / -(edge0_1296)), 0.0, 1.0);
    tmpvar_1072 = (((
      (((tmpvar_1106 + (boxx_1074 * 
        ((1.0 - (tmpvar_1094.y * 2.0)) - tmpvar_1094.x)
      )) + ((tmpvar_1221 * tmpvar_1222) * (
        (tmpvar_1224 * tmpvar_1226)
       * tmpvar_1228))) + (((
        (tmpvar_1245 * tmpvar_1246)
       * tmpvar_1249) * (1.0 - tmpvar_1094.x)) * tmpvar_1251))
     + 
      ((((tmpvar_1268 * tmpvar_1269) * tmpvar_1272) * (1.0 - tmpvar_1094.x)) * tmpvar_1274)
    ) + (
      (((tmpvar_1293 * (tmpvar_1295 * 
        (tmpvar_1295 * (3.0 - (2.0 * tmpvar_1295)))
      )) * float((st_1278.y >= 0.0))) * (1.0 - tmpvar_1282))
     * 
      (tmpvar_1297 * (tmpvar_1297 * (3.0 - (2.0 * tmpvar_1297))))
    )) + (buff_10 * (1.0 - tmpvar_1094.x)));
  } else {
    vec3 final_1298;
    vec3 color_1299;
    vec2 st_1300;
    vec2 tmpvar_1301;
    tmpvar_1301 = (pos_1069 / (900.0 * zoom));
    st_1300.x = tmpvar_1301.x;
    st_1300.y = (tmpvar_1301.y + 0.4);
    st_1300 = (st_1300 - vec2(0.5, 0.5));
    float tmpvar_1302;
    tmpvar_1302 = clamp (((tax - 0.19) / 0.2), 0.0, 1.0);
    float tmpvar_1303;
    tmpvar_1303 = clamp (((tax - 0.65) / -0.26), 0.0, 1.0);
    float tmpvar_1304;
    tmpvar_1304 = ((1.0 - (tmpvar_1302 * 
      (tmpvar_1302 * (3.0 - (2.0 * tmpvar_1302)))
    )) + (1.0 - (tmpvar_1303 * 
      (tmpvar_1303 * (3.0 - (2.0 * tmpvar_1303)))
    )));
    float tmpvar_1305;
    tmpvar_1305 = (0.8 * (1.0 - tmpvar_1304));
    vec3 tmpvar_1306;
    tmpvar_1306 = (vec3(pow (abs(st_1300.y), (
      (0.5 - (tmpvar_1305 * 0.4))
     * 5.0))) * vec3(0.849, 0.08369, 0.08));
    color_1299 = tmpvar_1306;
    final_1298 = ((vec3(0.08, 0.003, 0.02) + tmpvar_1306) + vec3(((0.75 + 
      (tmpvar_1305 * 0.2)
    ) - pow (
      abs(st_1300.x)
    , 0.324))));
    float tmpvar_1307;
    tmpvar_1307 = (0.5 + (tmpvar_1305 * 0.5));
    float tmpvar_1308;
    tmpvar_1308 = (sqrt(dot (st_1300, st_1300)) * 2.0);
    float tmpvar_1309;
    float tmpvar_1310;
    tmpvar_1310 = (min (abs(
      (st_1300.y / st_1300.x)
    ), 1.0) / max (abs(
      (st_1300.y / st_1300.x)
    ), 1.0));
    float tmpvar_1311;
    tmpvar_1311 = (tmpvar_1310 * tmpvar_1310);
    tmpvar_1311 = (((
      ((((
        ((((-0.01213232 * tmpvar_1311) + 0.05368138) * tmpvar_1311) - 0.1173503)
       * tmpvar_1311) + 0.1938925) * tmpvar_1311) - 0.3326756)
     * tmpvar_1311) + 0.9999793) * tmpvar_1310);
    tmpvar_1311 = (tmpvar_1311 + (float(
      (abs((st_1300.y / st_1300.x)) > 1.0)
    ) * (
      (tmpvar_1311 * -2.0)
     + 1.570796)));
    tmpvar_1309 = (tmpvar_1311 * sign((st_1300.y / st_1300.x)));
    if ((abs(st_1300.x) > (1e-08 * abs(st_1300.y)))) {
      if ((st_1300.x < 0.0)) {
        if ((st_1300.y >= 0.0)) {
          tmpvar_1309 += 3.141593;
        } else {
          tmpvar_1309 = (tmpvar_1309 - 3.141593);
        };
      };
    } else {
      tmpvar_1309 = (sign(st_1300.y) * 1.570796);
    };
    float tmpvar_1312;
    tmpvar_1312 = (abs(cos(tmpvar_1309)) * 0.01);
    float tmpvar_1313;
    tmpvar_1313 = clamp (((tmpvar_1308 - tmpvar_1312) / (
      ((tmpvar_1312 + 0.02) + (tmpvar_1307 * 0.1))
     - tmpvar_1312)), 0.0, 1.0);
    color_1299 = (vec3((1.0 - (tmpvar_1313 * 
      (tmpvar_1313 * (3.0 - (2.0 * tmpvar_1313)))
    ))) * vec3(0.86, 0.759, 0.41));
    final_1298 = (final_1298 + color_1299);
    float tmpvar_1314;
    tmpvar_1314 = clamp (((tax - 0.19) / 0.46), 0.0, 1.0);
    vec4 tmpvar_1315;
    tmpvar_1315.w = 1.0;
    tmpvar_1315.xyz = final_1298;
    float edge0_1316;
    edge0_1316 = (0.05 + (0.05 * st_1300.y));
    float tmpvar_1317;
    tmpvar_1317 = clamp (((
      abs(st_1300.x)
     - edge0_1316) / (0.04 - edge0_1316)), 0.0, 1.0);
    float edge0_1318;
    edge0_1318 = (2.5 + (3.0 * (1.0 - 
      (1.0 - (tmpvar_1314 * (tmpvar_1314 * (3.0 - 
        (2.0 * tmpvar_1314)
      ))))
    )));
    float tmpvar_1319;
    tmpvar_1319 = clamp (((
      sqrt(dot (st_1300, st_1300))
     - edge0_1318) / -(edge0_1318)), 0.0, 1.0);
    tmpvar_1072 = (buff_10 + ((
      ((tmpvar_1315 * (tmpvar_1317 * (tmpvar_1317 * 
        (3.0 - (2.0 * tmpvar_1317))
      ))) * float((st_1300.y >= 0.0)))
     * 
      (1.0 - tmpvar_1304)
    ) * (tmpvar_1319 * 
      (tmpvar_1319 * (3.0 - (2.0 * tmpvar_1319)))
    )));
  };
  buff_10 = tmpvar_1072;
  tb_8 = mcol_9;
  exbff_7 = vec4(0.0, 0.0, 0.0, 0.0);
  for (int i_6 = 0; i_6 < en1counter; i_6++) {
    vec2 tmpvar_1320;
    tmpvar_1320.x = en1posx[i_6];
    tmpvar_1320.y = en1posy[i_6];
    float tshift_1321;
    tshift_1321 = en1timer[i_6];
    vec2 pos_1322;
    pos_1322 = fragCoord_2;
    float cpower_1323;
    cpower_1323 = en1exval[i_6];
    float chpower_1324;
    chpower_1324 = en1lval[i_6];
    vec4 tcc_1325;
    bool xxex_1326;
    xxex_1326 = en1llisex[i_6];
    vec4 tmpvar_1327;
    float R_1328;
    float tmpvar_1329;
    float tmpvar_1330;
    tmpvar_1330 = (125.0 * zoom);
    tmpvar_1329 = ((tmpvar_1320.y * zoom) - tmpvar_1330);
    float tmpvar_1331;
    tmpvar_1331 = ((tmpvar_1320.x * zoom) - tmpvar_1330);
    float tmpvar_1332;
    float tmpvar_1333;
    tmpvar_1333 = (min (abs(
      (tmpvar_1329 / tmpvar_1331)
    ), 1.0) / max (abs(
      (tmpvar_1329 / tmpvar_1331)
    ), 1.0));
    float tmpvar_1334;
    tmpvar_1334 = (tmpvar_1333 * tmpvar_1333);
    tmpvar_1334 = (((
      ((((
        ((((-0.01213232 * tmpvar_1334) + 0.05368138) * tmpvar_1334) - 0.1173503)
       * tmpvar_1334) + 0.1938925) * tmpvar_1334) - 0.3326756)
     * tmpvar_1334) + 0.9999793) * tmpvar_1333);
    tmpvar_1334 = (tmpvar_1334 + (float(
      (abs((tmpvar_1329 / tmpvar_1331)) > 1.0)
    ) * (
      (tmpvar_1334 * -2.0)
     + 1.570796)));
    tmpvar_1332 = (tmpvar_1334 * sign((tmpvar_1329 / tmpvar_1331)));
    if ((abs(tmpvar_1331) > (1e-08 * abs(tmpvar_1329)))) {
      if ((tmpvar_1331 < 0.0)) {
        if ((tmpvar_1329 >= 0.0)) {
          tmpvar_1332 += 3.141593;
        } else {
          tmpvar_1332 = (tmpvar_1332 - 3.141593);
        };
      };
    } else {
      tmpvar_1332 = (sign(tmpvar_1329) * 1.570796);
    };
    float tmpvar_1335;
    tmpvar_1335 = -(tmpvar_1332);
    pos_1322 = ((fragCoord_2 - (tmpvar_1320 * zoom)) - shippos);
    R_1328 = 250.0;
    vec2 x_1336;
    x_1336 = (pos_1322 - (125.0 * zoom));
    float tmpvar_1337;
    tmpvar_1337 = float((sqrt(
      dot (x_1336, x_1336)
    ) >= (
      ((300.0 + (500.0 * cpower_1323)) / 2.0)
     * zoom)));
    if (((1.0 - tmpvar_1337) > 0.0)) {
      vec4 tr2_1338;
      float b_1339;
      vec2 uv_1340;
      R_1328 = (250.0 * zoom);
      uv_1340 = (((pos_1322 / R_1328) - 0.5) * 2.0);
      mat2 tmpvar_1341;
      tmpvar_1341[0].x = cos(tmpvar_1335);
      tmpvar_1341[0].y = -(sin(tmpvar_1335));
      tmpvar_1341[1].x = sin(tmpvar_1335);
      tmpvar_1341[1].y = cos(tmpvar_1335);
      uv_1340 = (uv_1340 * tmpvar_1341);
      float tmpvar_1342;
      float tmpvar_1343;
      tmpvar_1343 = (min (abs(
        (uv_1340.y / uv_1340.x)
      ), 1.0) / max (abs(
        (uv_1340.y / uv_1340.x)
      ), 1.0));
      float tmpvar_1344;
      tmpvar_1344 = (tmpvar_1343 * tmpvar_1343);
      tmpvar_1344 = (((
        ((((
          ((((-0.01213232 * tmpvar_1344) + 0.05368138) * tmpvar_1344) - 0.1173503)
         * tmpvar_1344) + 0.1938925) * tmpvar_1344) - 0.3326756)
       * tmpvar_1344) + 0.9999793) * tmpvar_1343);
      tmpvar_1344 = (tmpvar_1344 + (float(
        (abs((uv_1340.y / uv_1340.x)) > 1.0)
      ) * (
        (tmpvar_1344 * -2.0)
       + 1.570796)));
      tmpvar_1342 = (tmpvar_1344 * sign((uv_1340.y / uv_1340.x)));
      if ((abs(uv_1340.x) > (1e-08 * abs(uv_1340.y)))) {
        if ((uv_1340.x < 0.0)) {
          if ((uv_1340.y >= 0.0)) {
            tmpvar_1342 += 3.141593;
          } else {
            tmpvar_1342 = (tmpvar_1342 - 3.141593);
          };
        };
      } else {
        tmpvar_1342 = (sign(uv_1340.y) * 1.570796);
      };
      float radius_1345;
      radius_1345 = (0.6 + ((
        ((chpower_1324 - 1.0) * max (0.0, (exp(
          (-(((
            -(cos(tmpvar_1342))
           * 0.5) + 0.5)) * 14.0)
        ) - 0.05)))
       * 
        (0.5 + (0.5 * sin((
          (tmpvar_1342 - tshift_1321)
         * 15.0))))
      ) / 10.0));
      float tmpvar_1346;
      tmpvar_1346 = (0.1 * ((
        -(cos(tmpvar_1342))
       * 0.5) + 0.5));
      float tmpvar_1347;
      tmpvar_1347 = sqrt(dot (uv_1340, uv_1340));
      float edge0_1348;
      edge0_1348 = ((radius_1345 - tmpvar_1346) - 0.01);
      float tmpvar_1349;
      tmpvar_1349 = clamp (((tmpvar_1347 - edge0_1348) / (
        (radius_1345 - tmpvar_1346)
       - edge0_1348)), 0.0, 1.0);
      float edge0_1350;
      edge0_1350 = (radius_1345 + tmpvar_1346);
      float tmpvar_1351;
      tmpvar_1351 = clamp (((tmpvar_1347 - edge0_1350) / (
        ((radius_1345 + tmpvar_1346) + 0.01)
       - edge0_1350)), 0.0, 1.0);
      float edge0_1352;
      edge0_1352 = (radius_1345 + tmpvar_1346);
      float tmpvar_1353;
      tmpvar_1353 = clamp (((tmpvar_1347 - edge0_1352) / (
        ((radius_1345 + tmpvar_1346) + 0.01)
       - edge0_1352)), 0.0, 1.0);
      float tmpvar_1354;
      float edge0_1355;
      edge0_1355 = ((radius_1345 - tmpvar_1346) - 0.01);
      float tmpvar_1356;
      tmpvar_1356 = clamp (((tmpvar_1347 - edge0_1355) / (
        (radius_1345 - tmpvar_1346)
       - edge0_1355)), 0.0, 1.0);
      tmpvar_1354 = (tmpvar_1356 * (tmpvar_1356 * (3.0 - 
        (2.0 * tmpvar_1356)
      )));
      vec3 tmpvar_1357;
      tmpvar_1357.x = ((tmpvar_1349 * (tmpvar_1349 * 
        (3.0 - (2.0 * tmpvar_1349))
      )) - (tmpvar_1351 * (tmpvar_1351 * 
        (3.0 - (2.0 * tmpvar_1351))
      )));
      tmpvar_1357.y = (1.0 - (tmpvar_1353 * (tmpvar_1353 * 
        (3.0 - (2.0 * tmpvar_1353))
      )));
      tmpvar_1357.z = tmpvar_1354;
      float tmpvar_1358;
      tmpvar_1358 = tmpvar_1357.x;
      b_1339 = 0.0;
      if ((tshift_1321 < 1.2)) {
        float timex_1359;
        vec2 tmpvar_1360;
        tmpvar_1360 = (((pos_1322 / 
          (250.0 * zoom)
        ) * 2.0) - 1.0);
        timex_1359 = (tshift_1321 + 5.7);
        float tmpvar_1361;
        tmpvar_1361 = ((sin(
          (timex_1359 * 2.0)
        ) + 1.0) * 5.0);
        float tmpvar_1362;
        tmpvar_1362 = ((sin(
          (timex_1359 * 3.0)
        ) / 2.0) + 0.5);
        float tmpvar_1363;
        tmpvar_1363 = (((
          sin((timex_1359 * 5.0))
         / 2.0) + 1.0) * 40.0);
        float tmpvar_1364;
        tmpvar_1364 = sqrt((pow (
          abs(tmpvar_1360.x)
        , tmpvar_1361) + pow (
          abs(tmpvar_1360.y)
        , tmpvar_1361)));
        float tmpvar_1365;
        tmpvar_1365 = clamp (((tmpvar_1362 - tmpvar_1364) * 250.0), 0.0, 1.0);
        b_1339 = max (0.0, (tmpvar_1365 + (
          (1.0 - tmpvar_1365)
         * 
          (1.0 + (((
            (tmpvar_1362 - tmpvar_1364)
           * 250.0) + tmpvar_1363) / tmpvar_1363))
        )));
      } else {
        b_1339 = 1.0;
      };
      vec2 uv_1366;
      uv_1366.y = uv_1340.y;
      float dir_1367;
      vec2 relative_1368;
      vec2 branch_1369;
      uv_1366.x = (uv_1340.x - 0.05);
      uv_1366 = (uv_1366 * 0.08);
      branch_1369 = vec2(0.0, 0.0);
      relative_1368 = (uv_1366 * (uv_1366 * uv_1366));
      float tmpvar_1370;
      float tmpvar_1371;
      tmpvar_1371 = (min (abs(
        (relative_1368.y / relative_1368.x)
      ), 1.0) / max (abs(
        (relative_1368.y / relative_1368.x)
      ), 1.0));
      float tmpvar_1372;
      tmpvar_1372 = (tmpvar_1371 * tmpvar_1371);
      tmpvar_1372 = (((
        ((((
          ((((-0.01213232 * tmpvar_1372) + 0.05368138) * tmpvar_1372) - 0.1173503)
         * tmpvar_1372) + 0.1938925) * tmpvar_1372) - 0.3326756)
       * tmpvar_1372) + 0.9999793) * tmpvar_1371);
      tmpvar_1372 = (tmpvar_1372 + (float(
        (abs((relative_1368.y / relative_1368.x)) > 1.0)
      ) * (
        (tmpvar_1372 * -2.0)
       + 1.570796)));
      tmpvar_1370 = (tmpvar_1372 * sign((relative_1368.y / relative_1368.x)));
      if ((abs(relative_1368.x) > (1e-08 * abs(relative_1368.y)))) {
        if ((relative_1368.x < 0.0)) {
          if ((relative_1368.y >= 0.0)) {
            tmpvar_1370 += 3.141593;
          } else {
            tmpvar_1370 = (tmpvar_1370 - 3.141593);
          };
        };
      } else {
        tmpvar_1370 = (sign(relative_1368.y) * 1.570796);
      };
      dir_1367 = (tmpvar_1370 * 3.0);
      dir_1367 = (dir_1367 - (tshift_1321 * 1.5));
      vec2 tmpvar_1373;
      tmpvar_1373.x = cos(dir_1367);
      tmpvar_1373.y = sin(dir_1367);
      relative_1368 = ((tmpvar_1373 / 3.0) - 0.7831919);
      branch_1369 = ((relative_1368 / 100.0) / sqrt(dot (uv_1366, uv_1366)));
      vec2 tmpvar_1374;
      tmpvar_1374 = (uv_1366 - branch_1369);
      float tmpvar_1375;
      tmpvar_1375 = ((2.0 + (0.5 * 
        sin(tshift_1321)
      )) + (10.0 * chpower_1324));
      float tmpvar_1376;
      tmpvar_1376 = clamp (((
        (sqrt(dot (uv_1366, uv_1366)) * 2.0)
       - 0.1) / -0.1), 0.0, 1.0);
      float tmpvar_1377;
      tmpvar_1377 = clamp (((
        (sqrt(dot (uv_1366, uv_1366)) * 2.0)
       - 0.1) / -0.1), 0.0, 1.0);
      float tmpvar_1378;
      tmpvar_1378 = clamp (((
        (sqrt(dot (uv_1366, uv_1366)) * 2.0)
       - 0.1) / -0.1), 0.0, 1.0);
      vec4 tmpvar_1379;
      tmpvar_1379.w = 1.0;
      tmpvar_1379.x = abs(((
        sin(tmpvar_1375)
       - 1.0) - (
        (1.0 - sin(tshift_1321))
       * 
        (tmpvar_1376 * (tmpvar_1376 * (3.0 - (2.0 * tmpvar_1376))))
      )));
      tmpvar_1379.y = abs(((0.5 + 
        sin(tmpvar_1375)
      ) - (
        (0.5 - sin(tshift_1321))
       * 
        (tmpvar_1377 * (tmpvar_1377 * (3.0 - (2.0 * tmpvar_1377))))
      )));
      tmpvar_1379.z = abs(((0.5 - 
        sin(tmpvar_1375)
      ) - (
        (0.5 - sin(tshift_1321))
       * 
        (tmpvar_1378 * (tmpvar_1378 * (3.0 - (2.0 * tmpvar_1378))))
      )));
      float tmpvar_1380;
      tmpvar_1380 = clamp (((
        (sqrt(dot (uv_1366, uv_1366)) / 2.0)
       - 0.1) / 0.8), 0.0, 1.0);
      vec4 tmpvar_1381;
      tmpvar_1381 = (min (vec4(1.0, 1.0, 1.0, 1.0), (tmpvar_1379 * 
        (sqrt(dot (tmpvar_1374, tmpvar_1374)) / chpower_1324)
      )) - (tmpvar_1380 * (tmpvar_1380 * 
        (3.0 - (2.0 * tmpvar_1380))
      )));
      tr2_1338 = ((tmpvar_1381 * b_1339) + ((
        (5.0 * tmpvar_1381)
       * 
        (1.0 - b_1339)
      ) * b_1339));
      vec2 p_1382;
      vec2 tmpvar_1383;
      float tmpvar_1384;
      tmpvar_1384 = (250.0 * zoom);
      tmpvar_1383 = (((pos_1322 / tmpvar_1384) * 2.0) - 1.0);
      p_1382.y = tmpvar_1383.y;
      p_1382.x = (tmpvar_1383.x - 0.051);
      vec4 tmpvar_1385;
      tmpvar_1385.w = 1.0;
      tmpvar_1385.xyz = (vec3(0.1, 0.1, 0.2) * abs((0.32076 / 
        (((p_1382.x * p_1382.x) + (tmpvar_1383.y * tmpvar_1383.y)) - (0.2880836 * abs(sin(
          ((((
            (p_1382.x * tmpvar_1383.y)
           * 50.0) + iTime) + (tmpvar_1384 * p_1382.x)) + (tmpvar_1384 * tmpvar_1383.y))
        ))))
      )));
      vec4 tmpvar_1386;
      tmpvar_1386 = (-(tmpvar_1385) * b_1339);
      float intensity_1387;
      vec2 tmpvar_1388;
      tmpvar_1388 = vec2((tmpvar_1384 / 2.0));
      vec2 x_1389;
      x_1389 = (tmpvar_1388 - pos_1322);
      float tmpvar_1390;
      tmpvar_1390 = exp((-(
        abs((pos_1322.x - tmpvar_1388.x))
      ) * (0.02 / 
        (tmpvar_1384 / 500.0)
      )));
      intensity_1387 = (pow ((
        (cpower_1323 * (tmpvar_1384 / 2.0))
       / 
        sqrt(dot (x_1389, x_1389))
      ), 4.0) + pow ((
        (32.0 * (tmpvar_1390 * tmpvar_1390))
       / 
        abs(((tmpvar_1384 / 2.0) - pos_1322.y))
      ), 0.5));
      intensity_1387 = (intensity_1387 + (intensity_1387 * intensity_1387));
      vec3 tmpvar_1391;
      tmpvar_1391.yz = vec2(0.25, 0.97);
      tmpvar_1391.x = (0.91 + ((0.05 * 
        sin((-(tshift_1321) * 50.0))
      ) * float(
        (cpower_1323 >= 0.5)
      )));
      vec4 tmpvar_1392;
      tmpvar_1392.w = 1.0;
      tmpvar_1392.xyz = ((tmpvar_1391 * intensity_1387) * 0.8);
      vec4 tmpvar_1393;
      tmpvar_1393 = ((min (vec4(1.0, 1.0, 1.0, 1.0), tmpvar_1392) * cpower_1323) * b_1339);
      uv_1340.x = (uv_1340.x + 0.1);
      if ((xxex_1326 || (cpower_1323 > 0.0))) {
        float edge0_1394;
        edge0_1394 = (0.7 + (2.0 * cpower_1323));
        float tmpvar_1395;
        tmpvar_1395 = clamp (((
          sqrt(dot (uv_1340, uv_1340))
         - edge0_1394) / (0.5 - edge0_1394)), 0.0, 1.0);
        tcc_1325 = (tmpvar_1393 * (tmpvar_1395 * (tmpvar_1395 * 
          (3.0 - (2.0 * tmpvar_1395))
        )));
        tmpvar_1327 = tcc_1325;
      } else {
        vec3 tmpvar_1396;
        tmpvar_1396.x = -(tmpvar_1357.x);
        tmpvar_1396.y = tmpvar_1358;
        tmpvar_1396.z = tmpvar_1358;
        vec4 tmpvar_1397;
        tmpvar_1397.w = 1.0;
        tmpvar_1397.xyz = -(tmpvar_1396);
        float tmpvar_1398;
        tmpvar_1398 = clamp (((
          sqrt(dot (uv_1340, uv_1340))
         - 0.7) / -0.2), 0.0, 1.0);
        float edge0_1399;
        edge0_1399 = (0.7 + (2.0 * cpower_1323));
        float tmpvar_1400;
        tmpvar_1400 = clamp (((
          sqrt(dot (uv_1340, uv_1340))
         - edge0_1399) / (0.5 - edge0_1399)), 0.0, 1.0);
        tcc_1325 = ((max (vec4(0.0, 0.0, 0.0, 0.0), 
          ((((
            (tmpvar_1397 * tr2_1338)
           * 
            (tmpvar_1357.y * 0.57)
          ) + (tr2_1338 * tmpvar_1357.y)) + (tmpvar_1386 * tmpvar_1357.y)) + ((tr2_1338 * (1.0 - tmpvar_1357.y)) * (tmpvar_1398 * (tmpvar_1398 * 
            (3.0 - (2.0 * tmpvar_1398))
          ))))
        ) + (tmpvar_1393 * 
          (tmpvar_1400 * (tmpvar_1400 * (3.0 - (2.0 * tmpvar_1400))))
        )) + (tb_8 * (1.0 - tmpvar_1357.x)));
        vec3 tmpvar_1401;
        tmpvar_1401.x = -(tmpvar_1357.x);
        tmpvar_1401.y = tmpvar_1358;
        tmpvar_1401.z = tmpvar_1358;
        vec4 tmpvar_1402;
        tmpvar_1402.w = 1.0;
        tmpvar_1402.xyz = -(tmpvar_1401);
        float tmpvar_1403;
        tmpvar_1403 = clamp (((
          sqrt(dot (uv_1340, uv_1340))
         - 0.7) / -0.2), 0.0, 1.0);
        float edge0_1404;
        edge0_1404 = (0.7 + (2.0 * cpower_1323));
        float tmpvar_1405;
        tmpvar_1405 = clamp (((
          sqrt(dot (uv_1340, uv_1340))
         - edge0_1404) / (0.5 - edge0_1404)), 0.0, 1.0);
        tmpvar_1327 = (((
          max (vec4(0.0, 0.0, 0.0, 0.0), (((
            ((tmpvar_1402 * tr2_1338) * (tmpvar_1357.y * 0.57))
           + 
            (tr2_1338 * tmpvar_1357.y)
          ) + (tmpvar_1386 * tmpvar_1357.y)) + ((tr2_1338 * 
            (1.0 - tmpvar_1357.y)
          ) * (tmpvar_1403 * 
            (tmpvar_1403 * (3.0 - (2.0 * tmpvar_1403)))
          ))))
         + 
          (tmpvar_1393 * (tmpvar_1405 * (tmpvar_1405 * (3.0 - 
            (2.0 * tmpvar_1405)
          ))))
        ) + (buff_10 * 
          (1.0 - (tmpvar_1357.y * b_1339))
        )) + (tb_8 * (1.0 - 
          (tmpvar_1354 * b_1339)
        )));
      };
    } else {
      if ((xxex_1326 || (cpower_1323 > 0.0))) {
        tcc_1325 = vec4(0.0, 0.0, 0.0, 0.0);
        tmpvar_1327 = vec4(0.0, 0.0, 0.0, 0.0);
      } else {
        tcc_1325 = tb_8;
        tmpvar_1327 = buff_10;
      };
    };
    if ((en1llisex[i_6] || (en1exval[i_6] > 0.0))) {
      exbff_7 = (exbff_7 + min (vec4(1.0, 1.0, 1.0, 1.0), tmpvar_1327));
    } else {
      buff_10 = tmpvar_1327;
      tb_8 = tcc_1325;
    };
  };
  mcol_9 = buff_10;
  txeb_5 = vec4(0.0, 0.0, 0.0, 0.0);
  for (int i_4 = 0; i_4 < en2counter; i_4++) {
    vec2 tmpvar_1406;
    tmpvar_1406.x = en2posx[i_4];
    tmpvar_1406.y = en2posy[i_4];
    vec4 col_1407;
    col_1407 = mcol_9;
    vec2 pos_1408;
    float tshift_1409;
    tshift_1409 = en2timer[i_4];
    vec4 lux_1410;
    bool naa_1411;
    naa_1411 = en2llishit[i_4];
    float botmr_1412;
    botmr_1412 = en2extimer[i_4];
    vec4 tmpvar_1413;
    vec2 tmpvar_1414;
    float tmpvar_1415;
    tmpvar_1415 = (125.0 * zoom);
    tmpvar_1414 = ((tmpvar_1406 * zoom) - tmpvar_1415);
    pos_1408 = ((fragCoord_2 - (tmpvar_1406 * zoom)) - shippos);
    bool tmpvar_1416;
    tmpvar_1416 = ((float(
      ((1500.0 * zoom) >= sqrt(dot (tmpvar_1414, tmpvar_1414)))
    ) > 0.0) && (botmr_1412 < 0.001));
    float tmpvar_1417;
    tmpvar_1417 = ((tmpvar_1406.y * zoom) - tmpvar_1415);
    float tmpvar_1418;
    tmpvar_1418 = ((tmpvar_1406.x * zoom) - tmpvar_1415);
    float tmpvar_1419;
    float tmpvar_1420;
    tmpvar_1420 = (min (abs(
      (tmpvar_1417 / tmpvar_1418)
    ), 1.0) / max (abs(
      (tmpvar_1417 / tmpvar_1418)
    ), 1.0));
    float tmpvar_1421;
    tmpvar_1421 = (tmpvar_1420 * tmpvar_1420);
    tmpvar_1421 = (((
      ((((
        ((((-0.01213232 * tmpvar_1421) + 0.05368138) * tmpvar_1421) - 0.1173503)
       * tmpvar_1421) + 0.1938925) * tmpvar_1421) - 0.3326756)
     * tmpvar_1421) + 0.9999793) * tmpvar_1420);
    tmpvar_1421 = (tmpvar_1421 + (float(
      (abs((tmpvar_1417 / tmpvar_1418)) > 1.0)
    ) * (
      (tmpvar_1421 * -2.0)
     + 1.570796)));
    tmpvar_1419 = (tmpvar_1421 * sign((tmpvar_1417 / tmpvar_1418)));
    if ((abs(tmpvar_1418) > (1e-08 * abs(tmpvar_1417)))) {
      if ((tmpvar_1418 < 0.0)) {
        if ((tmpvar_1417 >= 0.0)) {
          tmpvar_1419 += 3.141593;
        } else {
          tmpvar_1419 = (tmpvar_1419 - 3.141593);
        };
      };
    } else {
      tmpvar_1419 = (sign(tmpvar_1417) * 1.570796);
    };
    float tmpvar_1422;
    tmpvar_1422 = (-(tmpvar_1419) - 1.57079);
    vec2 x_1423;
    x_1423 = (pos_1408 - (125.0 * zoom));
    float tmpvar_1424;
    tmpvar_1424 = float((sqrt(
      dot (x_1423, x_1423)
    ) >= (150.0 * zoom)));
    if ((((1.0 - tmpvar_1424) > 0.0) || tmpvar_1416)) {
      vec4 lc_1425;
      vec4 tret_1426;
      float b_1427;
      vec2 tuvv_1428;
      float tuv_1429;
      vec4 cl1_1430;
      vec2 z_1431;
      vec2 sp_1432;
      vec2 uv_1433;
      vec2 tmpvar_1434;
      tmpvar_1434 = vec2((250.0 * zoom));
      mat2 tmpvar_1435;
      tmpvar_1435[0].x = cos(tmpvar_1422);
      tmpvar_1435[0].y = -(sin(tmpvar_1422));
      tmpvar_1435[1].x = sin(tmpvar_1422);
      tmpvar_1435[1].y = cos(tmpvar_1422);
      uv_1433 = (abs((
        ((pos_1408 - (tmpvar_1434 / 2.0)) / tmpvar_1434.y)
       * 8.0)) * tmpvar_1435);
      vec3 tmpvar_1436;
      tmpvar_1436.x = dot (uv_1433, vec2(1.5, 0.5));
      tmpvar_1436.y = dot (uv_1433, vec2(-1.0, 0.5));
      tmpvar_1436.z = uv_1433.y;
      vec3 tmpvar_1437;
      tmpvar_1437 = fract(tmpvar_1436);
      vec3 tmpvar_1438;
      tmpvar_1438 = fract(-(tmpvar_1436));
      float tmpvar_1439;
      tmpvar_1439 = (uv_1433.x - (uv_1433.y / 2.0));
      vec2 tmpvar_1440;
      tmpvar_1440.x = ((floor(tmpvar_1439) * 2.0) + float((
        fract(tmpvar_1439)
       >= 
        fract((1.0 - uv_1433.y))
      )));
      tmpvar_1440.y = floor(uv_1433.y);
      float tmpvar_1441;
      tmpvar_1441 = float((min (
        (0.2 + min (min (tmpvar_1437.x, tmpvar_1437.y), tmpvar_1437.z))
      , 
        min (min (tmpvar_1438.x, tmpvar_1438.y), tmpvar_1438.z)
      ) >= (0.12 + 
        (sin(((
          (fract((cos(
            dot (tmpvar_1440, vec2(21.9898, 78.233))
          ) * 43758.55)) * 2.0)
         + 
          (tmpvar_1440.x / 16.0)
        ) + (
          -(tshift_1409)
         * 2.0))) * 0.2)
      )));
      uv_1433 = ((pos_1408 / tmpvar_1434) - 0.5);
      mat2 tmpvar_1442;
      tmpvar_1442[0].x = cos(tmpvar_1422);
      tmpvar_1442[0].y = -(sin(tmpvar_1422));
      tmpvar_1442[1].x = sin(tmpvar_1422);
      tmpvar_1442[1].y = cos(tmpvar_1422);
      uv_1433 = (uv_1433 * tmpvar_1442);
      sp_1432.x = uv_1433.x;
      sp_1432.y = (uv_1433.y + -0.291);
      z_1431 = pow (vec2(0.0, 0.0), abs(sp_1432));
      z_1431 = (z_1431 + pow (vec2(0.0, 1.0), abs(sp_1432)));
      z_1431 = (z_1431 + pow (vec2(1.0, 0.0), abs(sp_1432)));
      vec2 tmpvar_1443;
      tmpvar_1443 = pow ((abs(sp_1432) * 1000000.0), vec2(0.1, 0.1));
      float tmpvar_1444;
      tmpvar_1444 = sqrt(dot (tmpvar_1443, tmpvar_1443));
      float tmpvar_1445;
      float tmpvar_1446;
      tmpvar_1446 = (min (abs(
        (tmpvar_1443.x / tmpvar_1443.y)
      ), 1.0) / max (abs(
        (tmpvar_1443.x / tmpvar_1443.y)
      ), 1.0));
      float tmpvar_1447;
      tmpvar_1447 = (tmpvar_1446 * tmpvar_1446);
      tmpvar_1447 = (((
        ((((
          ((((-0.01213232 * tmpvar_1447) + 0.05368138) * tmpvar_1447) - 0.1173503)
         * tmpvar_1447) + 0.1938925) * tmpvar_1447) - 0.3326756)
       * tmpvar_1447) + 0.9999793) * tmpvar_1446);
      tmpvar_1447 = (tmpvar_1447 + (float(
        (abs((tmpvar_1443.x / tmpvar_1443.y)) > 1.0)
      ) * (
        (tmpvar_1447 * -2.0)
       + 1.570796)));
      tmpvar_1445 = (tmpvar_1447 * sign((tmpvar_1443.x / tmpvar_1443.y)));
      if ((abs(tmpvar_1443.y) > (1e-08 * abs(tmpvar_1443.x)))) {
        if ((tmpvar_1443.y < 0.0)) {
          if ((tmpvar_1443.x >= 0.0)) {
            tmpvar_1445 += 3.141593;
          } else {
            tmpvar_1445 = (tmpvar_1445 - 3.141593);
          };
        };
      } else {
        tmpvar_1445 = (sign(tmpvar_1443.x) * 1.570796);
      };
      float tmpvar_1448;
      tmpvar_1448 = (((tmpvar_1443.y * 
        (log(tmpvar_1444) - 1.0)
      ) + (tmpvar_1445 * 
        ((tmpvar_1443.x * 0.15) + 1.5)
      )) - tshift_1409);
      vec2 tmpvar_1449;
      tmpvar_1449.x = sin(tmpvar_1448);
      tmpvar_1449.y = cos(tmpvar_1448);
      z_1431 = (z_1431 + ((3.963319 * 
        exp((((
          log(tmpvar_1444)
         * 
          (tmpvar_1443.x + 0.5)
        ) - (tmpvar_1443.y * tmpvar_1445)) - tmpvar_1443.x))
      ) * tmpvar_1449));
      float tmpvar_1450;
      tmpvar_1450 = sin(z_1431.x);
      float tmpvar_1451;
      tmpvar_1451 = sin(z_1431.y);
      vec4 tmpvar_1452;
      tmpvar_1452.w = 1.0;
      tmpvar_1452.x = tmpvar_1450;
      tmpvar_1452.y = (cos(z_1431.x) + cos(z_1431.y));
      tmpvar_1452.z = tmpvar_1451;
      cl1_1430 = tmpvar_1452;
      if (tmpvar_1416) {
        cl1_1430 = (vec4(((tmpvar_1450 * tmpvar_1452.y) * tmpvar_1451)) + (tmpvar_1452 * 0.21));
      } else {
        cl1_1430 = vec4(((cl1_1430.x * cl1_1430.y) * cl1_1430.z));
      };
      float tmpvar_1453;
      tmpvar_1453 = clamp (((
        sqrt(dot (uv_1433, uv_1433))
       - 0.3) / -0.01000002), 0.0, 1.0);
      float tmpvar_1454;
      tmpvar_1454 = ((tmpvar_1453 * (tmpvar_1453 * 
        (3.0 - (2.0 * tmpvar_1453))
      )) * 2.0);
      tuv_1429 = tmpvar_1454;
      float tmpvar_1455;
      float tmpvar_1456;
      tmpvar_1456 = clamp (((
        sqrt(dot (uv_1433, uv_1433))
       - 0.3) / -0.01000002), 0.0, 1.0);
      tmpvar_1455 = (tmpvar_1456 * (tmpvar_1456 * (3.0 - 
        (2.0 * tmpvar_1456)
      )));
      tuvv_1428 = uv_1433;
      b_1427 = 0.0;
      if ((tshift_1409 < 1.2)) {
        float timex_1457;
        vec2 tmpvar_1458;
        tmpvar_1458 = (((pos_1408 / 
          (250.0 * zoom)
        ) * 2.0) - 1.0);
        timex_1457 = (tshift_1409 + 5.7);
        float tmpvar_1459;
        tmpvar_1459 = ((sin(
          (timex_1457 * 2.0)
        ) + 1.0) * 5.0);
        float tmpvar_1460;
        tmpvar_1460 = ((sin(
          (timex_1457 * 3.0)
        ) / 2.0) + 0.5);
        float tmpvar_1461;
        tmpvar_1461 = (((
          sin((timex_1457 * 5.0))
         / 2.0) + 1.0) * 40.0);
        float tmpvar_1462;
        tmpvar_1462 = sqrt((pow (
          abs(tmpvar_1458.x)
        , tmpvar_1459) + pow (
          abs(tmpvar_1458.y)
        , tmpvar_1459)));
        float tmpvar_1463;
        tmpvar_1463 = clamp (((tmpvar_1460 - tmpvar_1462) * 250.0), 0.0, 1.0);
        b_1427 = max (0.0, (tmpvar_1463 + (
          (1.0 - tmpvar_1463)
         * 
          (1.0 + (((
            (tmpvar_1460 - tmpvar_1462)
           * 250.0) + tmpvar_1461) / tmpvar_1461))
        )));
      } else {
        if ((botmr_1412 > 0.0)) {
          float timex_1464;
          vec2 tmpvar_1465;
          tmpvar_1465 = (((pos_1408 / 
            (250.0 * zoom)
          ) * 2.0) - 1.0);
          timex_1464 = (botmr_1412 + 1.0);
          float tmpvar_1466;
          tmpvar_1466 = ((sin(
            (timex_1464 * 2.0)
          ) + 1.0) * 5.0);
          float tmpvar_1467;
          tmpvar_1467 = ((sin(
            (timex_1464 * 3.0)
          ) / 2.0) + 0.5);
          float tmpvar_1468;
          tmpvar_1468 = (((
            sin((timex_1464 * 5.0))
           / 2.0) + 1.0) * 40.0);
          float tmpvar_1469;
          tmpvar_1469 = sqrt((pow (
            abs(tmpvar_1465.x)
          , tmpvar_1466) + pow (
            abs(tmpvar_1465.y)
          , tmpvar_1466)));
          float tmpvar_1470;
          tmpvar_1470 = clamp (((tmpvar_1467 - tmpvar_1469) * 250.0), 0.0, 1.0);
          b_1427 = max (0.0, (tmpvar_1470 + (
            (1.0 - tmpvar_1470)
           * 
            (1.0 + (((
              (tmpvar_1467 - tmpvar_1469)
             * 250.0) + tmpvar_1468) / tmpvar_1468))
          )));
        } else {
          b_1427 = 1.0;
        };
      };
      col_1407 = (((buff_10 * 
        (1.0 - (tmpvar_1441 * b_1427))
      ) * tmpvar_1455) + (buff_10 * (1.0 - tmpvar_1455)));
      float tmpvar_1471;
      tmpvar_1471 = clamp (((
        sqrt(dot (uv_1433, uv_1433))
       - 0.3) / -0.1), 0.0, 1.0);
      tret_1426 = (((tmpvar_1441 * cl1_1430) * (tmpvar_1454 * b_1427)) + ((
        ((3.0 * cl1_1430) * (1.0 - b_1427))
       * b_1427) * (tmpvar_1471 * 
        (tmpvar_1471 * (3.0 - (2.0 * tmpvar_1471)))
      )));
      tuv_1429 = (2.0 - tmpvar_1454);
      uv_1433 = ((pos_1408.yx / tmpvar_1434) - 0.5);
      mat2 tmpvar_1472;
      tmpvar_1472[0].x = cos(-(tmpvar_1422));
      tmpvar_1472[0].y = -(sin(-(tmpvar_1422)));
      tmpvar_1472[1].x = sin(-(tmpvar_1422));
      tmpvar_1472[1].y = cos(-(tmpvar_1422));
      uv_1433 = (uv_1433 * tmpvar_1472);
      lc_1425 = vec4(0.0, 0.0, 0.0, 0.0);
      if (tmpvar_1416) {
        float dy_1473;
        vec2 tmpvar_1474;
        tmpvar_1474.y = 0.0;
        tmpvar_1474.x = uv_1433.x;
        vec2 x_1475;
        x_1475 = (uv_1433 - tmpvar_1474);
        vec2 tmpvar_1476;
        tmpvar_1476.y = 0.0;
        tmpvar_1476.x = uv_1433.x;
        vec2 x_1477;
        x_1477 = (uv_1433 - tmpvar_1476);
        float tmpvar_1478;
        tmpvar_1478 = clamp (((
          sqrt(dot (x_1477, x_1477))
         - 0.1) / -0.05), 0.0, 1.0);
        vec2 tmpvar_1479;
        tmpvar_1479.y = 0.0;
        tmpvar_1479.x = tuvv_1428.x;
        vec2 tmpvar_1480;
        tmpvar_1480 = max (vec2(0.0, 0.0), (tuvv_1428 - tmpvar_1479));
        dy_1473 = (((
          (1.0/((25.0 * sqrt(dot (x_1475, x_1475)))))
         * 
          (tmpvar_1478 * (tmpvar_1478 * (3.0 - (2.0 * tmpvar_1478))))
        ) * tuv_1429) * float((
          sqrt(dot (tmpvar_1480, tmpvar_1480))
         >= 0.1)));
        vec4 tmpvar_1481;
        tmpvar_1481.w = 1.0;
        tmpvar_1481.x = ((uv_1433.x + cl1_1430.x) * dy_1473);
        tmpvar_1481.yz = (cl1_1430.yz * vec2(dy_1473));
        lc_1425 = tmpvar_1481;
      };
      vec2 x_1482;
      x_1482 = (pos_1408 - (125.0 * zoom));
      lux_1410 = (lc_1425 * float((
        sqrt(dot (tmpvar_1414, tmpvar_1414))
       >= 
        sqrt(dot (x_1482, x_1482))
      )));
      vec2 uv_1483;
      float an_1484;
      float light_1485;
      an_1484 = (tmpvar_1422 + -0.7853949);
      vec2 tmpvar_1486;
      tmpvar_1486 = vec2((250.0 * zoom));
      uv_1483 = ((pos_1408 - (tmpvar_1486 / 2.0)) / tmpvar_1486.y);
      mat2 tmpvar_1487;
      tmpvar_1487[0].x = cos(an_1484);
      tmpvar_1487[0].y = -(sin(an_1484));
      tmpvar_1487[1].x = sin(an_1484);
      tmpvar_1487[1].y = cos(an_1484);
      uv_1483 = (uv_1483 * tmpvar_1487);
      uv_1483 = (uv_1483 * 3.0);
      vec2 tmpvar_1488;
      tmpvar_1488 = ((uv_1483 / 1.75) + 0.9975);
      float tmpvar_1489;
      tmpvar_1489 = (float(mod (((iTime * 6.283159) / 6.666667), 6.283159)));
      vec2 tmpvar_1490;
      tmpvar_1490 = ((tmpvar_1488 + vec2(0.1, 0.1)) - ((vec2(0.1, 0.1) * tmpvar_1488) * cos(vec2(tmpvar_1489))));
      vec2 tmpvar_1491;
      tmpvar_1491 = ((tmpvar_1488 - vec2(0.1, 0.1)) + abs((
        (vec2(0.1, 0.1) * tmpvar_1488)
       * 
        cos(vec2(tmpvar_1489))
      )));
      float tmpvar_1492;
      if (naa_1411) {
        tmpvar_1492 = 1.0;
      } else {
        tmpvar_1492 = 0.0;
      };
      vec3 tmpvar_1493;
      tmpvar_1493.yz = vec2(0.365, 0.25);
      tmpvar_1493.x = (0.49 + (2.0 * tmpvar_1492));
      vec2 tmpvar_1494;
      tmpvar_1494 = (normalize(uv_1483) - uv_1483);
      light_1485 = (0.015 / sqrt(dot (tmpvar_1494, tmpvar_1494)));
      float tmpvar_1495;
      tmpvar_1495 = sqrt(dot (uv_1483, uv_1483));
      if ((tmpvar_1495 < 1.0)) {
        float tmpvar_1496;
        if (naa_1411) {
          tmpvar_1496 = 1.0;
        } else {
          tmpvar_1496 = 0.0;
        };
        vec2 tmpvar_1497;
        tmpvar_1497 = (normalize((uv_1483 - tmpvar_1491)) - (uv_1483 - tmpvar_1491));
        light_1485 = (light_1485 + ((tmpvar_1496 * 0.51) / sqrt(
          dot (tmpvar_1497, tmpvar_1497)
        )));
        float tmpvar_1498;
        if (naa_1411) {
          tmpvar_1498 = 1.0;
        } else {
          tmpvar_1498 = 0.0;
        };
        vec2 tmpvar_1499;
        tmpvar_1499 = (normalize((uv_1483 - tmpvar_1490)) - (uv_1483 - tmpvar_1490));
        light_1485 = (light_1485 + ((tmpvar_1498 * 0.51) / sqrt(
          dot (tmpvar_1499, tmpvar_1499)
        )));
        vec2 tmpvar_1500;
        tmpvar_1500 = (normalize((uv_1483 - tmpvar_1488)) - (uv_1483 - tmpvar_1488));
        light_1485 = (light_1485 * (0.0511 / sqrt(
          dot (tmpvar_1500, tmpvar_1500)
        )));
        vec2 tmpvar_1501;
        tmpvar_1501 = (normalize(uv_1483) - uv_1483);
        light_1485 = (light_1485 * (0.18521 / sqrt(
          dot (tmpvar_1501, tmpvar_1501)
        )));
      };
      float tmpvar_1502;
      tmpvar_1502 = clamp (((
        sqrt(dot (uv_1483, uv_1483))
       - 1.5) / -1.5), 0.0, 1.0);
      vec4 tmpvar_1503;
      tmpvar_1503.w = 1.0;
      tmpvar_1503.xyz = ((light_1485 * tmpvar_1493) * (tmpvar_1502 * (tmpvar_1502 * 
        (3.0 - (2.0 * tmpvar_1502))
      )));
      tmpvar_1413 = ((tret_1426 + col_1407) + (tmpvar_1503 * b_1427));
    } else {
      lux_1410 = vec4(0.0, 0.0, 0.0, 0.0);
      tmpvar_1413 = buff_10;
    };
    buff_10 = tmpvar_1413;
    txeb_5 = (txeb_5 + lux_1410);
  };
  mcol_9 = buff_10;
  buff_10 = (buff_10 + exbff_7);
  vec4 tmpvar_1504;
  vec2 tmpvar_1505;
  tmpvar_1505 = ((gl_FragCoord.xy - (starpos1 * zoom)) - shippos);
  vec2 x_1506;
  x_1506 = (tmpvar_1505 - (125000.0 * zoom));
  float tmpvar_1507;
  tmpvar_1507 = float((sqrt(
    dot (x_1506, x_1506)
  ) >= (125175.0 * zoom)));
  if (((1.0 - tmpvar_1507) > 0.0)) {
    float c_1508;
    vec2 tmpvar_1509;
    tmpvar_1509 = vec2((250000.0 * zoom));
    vec2 tmpvar_1510;
    tmpvar_1510 = (((tmpvar_1505 * 200.0) - (100.0 * tmpvar_1509)) / tmpvar_1509.y);
    vec2 tmpvar_1511;
    tmpvar_1511 = ((tmpvar_1505 / tmpvar_1509) - 0.5);
    vec4 tmpvar_1512;
    tmpvar_1512.w = 1.0;
    tmpvar_1512.xyz = ((vec3(0.2463, 0.254, 0.9729) / dot (tmpvar_1511, tmpvar_1511)) / 3.59);
    vec4 tmpvar_1513;
    tmpvar_1513 = min (vec4(1.0, 1.0, 1.0, 1.0), tmpvar_1512);
    c_1508 = 0.0;
    float tmpvar_1514;
    tmpvar_1514 = pow ((clamp (
      (((250.0 - sqrt(
        dot (tmpvar_1510, tmpvar_1510)
      )) + 100.0) - 40.0)
    , 0.0, 250.0) / 250.0), 6.0);
    float n_1515;
    float tmpvar_1516;
    float tmpvar_1517;
    tmpvar_1517 = (min (abs(
      (tmpvar_1510.y / tmpvar_1510.x)
    ), 1.0) / max (abs(
      (tmpvar_1510.y / tmpvar_1510.x)
    ), 1.0));
    float tmpvar_1518;
    tmpvar_1518 = (tmpvar_1517 * tmpvar_1517);
    tmpvar_1518 = (((
      ((((
        ((((-0.01213232 * tmpvar_1518) + 0.05368138) * tmpvar_1518) - 0.1173503)
       * tmpvar_1518) + 0.1938925) * tmpvar_1518) - 0.3326756)
     * tmpvar_1518) + 0.9999793) * tmpvar_1517);
    tmpvar_1518 = (tmpvar_1518 + (float(
      (abs((tmpvar_1510.y / tmpvar_1510.x)) > 1.0)
    ) * (
      (tmpvar_1518 * -2.0)
     + 1.570796)));
    tmpvar_1516 = (tmpvar_1518 * sign((tmpvar_1510.y / tmpvar_1510.x)));
    if ((abs(tmpvar_1510.x) > (1e-08 * abs(tmpvar_1510.y)))) {
      if ((tmpvar_1510.x < 0.0)) {
        if ((tmpvar_1510.y >= 0.0)) {
          tmpvar_1516 += 3.141593;
        } else {
          tmpvar_1516 = (tmpvar_1516 - 3.141593);
        };
      };
    } else {
      tmpvar_1516 = (sign(tmpvar_1510.y) * 1.570796);
    };
    float tmpvar_1519;
    tmpvar_1519 = (time * 0.4);
    vec2 tmpvar_1520;
    tmpvar_1520.x = (((1.326885 + 
      (tmpvar_1519 * 0.1)
    ) + (
      cos(((tmpvar_1514 * 13.8) + (fract(
        abs(sin(((tmpvar_1519 + tmpvar_1516) + 1.2637)))
      ) * 3.0)))
     * 0.2)) + (tmpvar_1516 * 8.225723));
    tmpvar_1520.y = ((1.2637 + tmpvar_1519) + tmpvar_1516);
    float tmpvar_1521;
    vec2 uv_1522;
    vec2 tmpvar_1523;
    tmpvar_1523 = floor(tmpvar_1520);
    vec2 tmpvar_1524;
    tmpvar_1524 = (tmpvar_1520 - tmpvar_1523);
    uv_1522 = ((tmpvar_1524 * tmpvar_1524) * (3.0 - (2.0 * tmpvar_1524)));
    float tmpvar_1525;
    tmpvar_1525 = fract((cos(
      dot (tmpvar_1523, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_1526;
    tmpvar_1526.x = (tmpvar_1523.x + 1.0);
    tmpvar_1526.y = tmpvar_1523.y;
    float tmpvar_1527;
    tmpvar_1527 = fract((cos(
      dot (tmpvar_1526, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_1528;
    tmpvar_1528.x = tmpvar_1523.x;
    tmpvar_1528.y = (tmpvar_1523.y + 1.0);
    float tmpvar_1529;
    tmpvar_1529 = fract((cos(
      dot (tmpvar_1528, vec2(21.9898, 78.233))
    ) * 43758.55));
    tmpvar_1521 = (((tmpvar_1525 + 
      ((tmpvar_1527 - tmpvar_1525) * uv_1522.x)
    ) + (
      (tmpvar_1529 - tmpvar_1525)
     * uv_1522.y)) + ((
      (((tmpvar_1525 - tmpvar_1527) - tmpvar_1529) + fract((cos(
        dot ((tmpvar_1523 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))
      ) * 43758.55)))
     * uv_1522.x) * uv_1522.y));
    vec2 tmpvar_1530;
    tmpvar_1530.x = (((245.1578 + 
      (tmpvar_1516 * 8.225723)
    ) + tmpvar_1519) + (cos(
      ((((tmpvar_1514 * 2.0) * tmpvar_1521) + (tmpvar_1519 * 1.1)) + tmpvar_1516)
    ) * 2.8));
    tmpvar_1530.y = ((1.2637 + tmpvar_1519) + tmpvar_1516);
    vec2 xy_1531;
    xy_1531 = (tmpvar_1530 + tmpvar_1514);
    vec2 uv_1532;
    vec2 tmpvar_1533;
    tmpvar_1533 = floor(xy_1531);
    vec2 tmpvar_1534;
    tmpvar_1534 = (xy_1531 - tmpvar_1533);
    uv_1532 = ((tmpvar_1534 * tmpvar_1534) * (3.0 - (2.0 * tmpvar_1534)));
    float tmpvar_1535;
    tmpvar_1535 = fract((cos(
      dot (tmpvar_1533, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_1536;
    tmpvar_1536.x = (tmpvar_1533.x + 1.0);
    tmpvar_1536.y = tmpvar_1533.y;
    float tmpvar_1537;
    tmpvar_1537 = fract((cos(
      dot (tmpvar_1536, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_1538;
    tmpvar_1538.x = tmpvar_1533.x;
    tmpvar_1538.y = (tmpvar_1533.y + 1.0);
    float tmpvar_1539;
    tmpvar_1539 = fract((cos(
      dot (tmpvar_1538, vec2(21.9898, 78.233))
    ) * 43758.55));
    float tmpvar_1540;
    tmpvar_1540 = (((tmpvar_1535 + 
      ((tmpvar_1537 - tmpvar_1535) * uv_1532.x)
    ) + (
      (tmpvar_1539 - tmpvar_1535)
     * uv_1532.y)) + ((
      (((tmpvar_1535 - tmpvar_1537) - tmpvar_1539) + fract((cos(
        dot ((tmpvar_1533 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))
      ) * 43758.55)))
     * uv_1532.x) * uv_1532.y));
    n_1515 = (tmpvar_1521 * (tmpvar_1540 * tmpvar_1540));
    vec2 tmpvar_1541;
    tmpvar_1541.x = (((169.3358 + 
      (tmpvar_1516 * 8.225723)
    ) + tmpvar_1519) + (cos(
      ((((tmpvar_1514 * 2.2) * n_1515) + (tmpvar_1519 * 1.1)) + tmpvar_1516)
    ) * 1.1));
    tmpvar_1541.y = ((1.2637 + tmpvar_1519) + tmpvar_1516);
    vec2 xy_1542;
    xy_1542 = (tmpvar_1541 + tmpvar_1514);
    vec2 uv_1543;
    vec2 tmpvar_1544;
    tmpvar_1544 = floor(xy_1542);
    vec2 tmpvar_1545;
    tmpvar_1545 = (xy_1542 - tmpvar_1544);
    uv_1543 = ((tmpvar_1545 * tmpvar_1545) * (3.0 - (2.0 * tmpvar_1545)));
    float tmpvar_1546;
    tmpvar_1546 = fract((cos(
      dot (tmpvar_1544, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_1547;
    tmpvar_1547.x = (tmpvar_1544.x + 1.0);
    tmpvar_1547.y = tmpvar_1544.y;
    float tmpvar_1548;
    tmpvar_1548 = fract((cos(
      dot (tmpvar_1547, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_1549;
    tmpvar_1549.x = tmpvar_1544.x;
    tmpvar_1549.y = (tmpvar_1544.y + 1.0);
    float tmpvar_1550;
    tmpvar_1550 = fract((cos(
      dot (tmpvar_1549, vec2(21.9898, 78.233))
    ) * 43758.55));
    n_1515 = (n_1515 * pow ((
      ((tmpvar_1546 + ((tmpvar_1548 - tmpvar_1546) * uv_1543.x)) + ((tmpvar_1550 - tmpvar_1546) * uv_1543.y))
     + 
      ((((
        (tmpvar_1546 - tmpvar_1548)
       - tmpvar_1550) + fract(
        (cos(dot ((tmpvar_1544 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
      )) * uv_1543.x) * uv_1543.y)
    ), 3.0));
    vec2 tmpvar_1551;
    tmpvar_1551.x = (((155.4351 + 
      (tmpvar_1516 * 8.225723)
    ) + tmpvar_1519) + (cos(
      ((((tmpvar_1514 * 2.3) * n_1515) + (tmpvar_1519 * 1.1)) + tmpvar_1516)
    ) * 0.8));
    tmpvar_1551.y = ((1.2637 + tmpvar_1519) + tmpvar_1516);
    vec2 xy_1552;
    xy_1552 = (tmpvar_1551 + tmpvar_1514);
    vec2 uv_1553;
    vec2 tmpvar_1554;
    tmpvar_1554 = floor(xy_1552);
    vec2 tmpvar_1555;
    tmpvar_1555 = (xy_1552 - tmpvar_1554);
    uv_1553 = ((tmpvar_1555 * tmpvar_1555) * (3.0 - (2.0 * tmpvar_1555)));
    float tmpvar_1556;
    tmpvar_1556 = fract((cos(
      dot (tmpvar_1554, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_1557;
    tmpvar_1557.x = (tmpvar_1554.x + 1.0);
    tmpvar_1557.y = tmpvar_1554.y;
    float tmpvar_1558;
    tmpvar_1558 = fract((cos(
      dot (tmpvar_1557, vec2(21.9898, 78.233))
    ) * 43758.55));
    vec2 tmpvar_1559;
    tmpvar_1559.x = tmpvar_1554.x;
    tmpvar_1559.y = (tmpvar_1554.y + 1.0);
    float tmpvar_1560;
    tmpvar_1560 = fract((cos(
      dot (tmpvar_1559, vec2(21.9898, 78.233))
    ) * 43758.55));
    n_1515 = (n_1515 * pow ((
      ((tmpvar_1556 + ((tmpvar_1558 - tmpvar_1556) * uv_1553.x)) + ((tmpvar_1560 - tmpvar_1556) * uv_1553.y))
     + 
      ((((
        (tmpvar_1556 - tmpvar_1558)
       - tmpvar_1560) + fract(
        (cos(dot ((tmpvar_1554 + vec2(1.0, 1.0)), vec2(21.9898, 78.233))) * 43758.55)
      )) * uv_1553.x) * uv_1553.y)
    ), 4.0));
    n_1515 = (n_1515 * pow (tmpvar_1514, 2.96));
    n_1515 = (n_1515 * ((
      (tmpvar_1516 + 3.14158)
     / 3.0) * (
      (6.283159 - tmpvar_1516)
     - 3.14158)));
    n_1515 = (n_1515 + (sqrt(
      (tmpvar_1514 * tmpvar_1514)
    ) * 0.26));
    float tmpvar_1561;
    tmpvar_1561 = (n_1515 * 2.1);
    c_1508 = ((tmpvar_1561 * tmpvar_1561) * 3.5);
    float tmpvar_1562;
    tmpvar_1562 = clamp (c_1508, 0.0, 1.0);
    c_1508 = tmpvar_1562;
    float tmpvar_1563;
    tmpvar_1563 = clamp (((
      sqrt(dot (tmpvar_1511, tmpvar_1511))
     - 0.5) / -0.16), 0.0, 1.0);
    tmpvar_1504 = ((min (
      max (tmpvar_1562, 0.0)
    , 1.0) * tmpvar_1513) * (tmpvar_1563 * (tmpvar_1563 * 
      (3.0 - (2.0 * tmpvar_1563))
    )));
  } else {
    tmpvar_1504 = vec4(0.0, 0.0, 0.0, 0.0);
  };
  buff_10 = (buff_10 + tmpvar_1504);
  vec4 tmpvar_1564;
  vec2 tmpvar_1565;
  tmpvar_1565 = ((gl_FragCoord.xy - (starpos2 * zoom)) - shippos);
  vec2 x_1566;
  x_1566 = (tmpvar_1565 - (50000.0 * zoom));
  float tmpvar_1567;
  tmpvar_1567 = float((sqrt(
    dot (x_1566, x_1566)
  ) >= (100000.0 * zoom)));
  if (((1.0 - tmpvar_1567) > 0.0)) {
    vec4 fragColor_1568;
    float b_1569;
    float r_1570;
    vec2 p_1571;
    vec2 tmpvar_1572;
    tmpvar_1572 = vec2((100000.0 * zoom));
    vec2 tmpvar_1573;
    tmpvar_1573 = ((tmpvar_1565 / tmpvar_1572) - 0.5);
    p_1571 = ((tmpvar_1565 / tmpvar_1572.y) - 0.35);
    float tmpvar_1574;
    float tmpvar_1575;
    tmpvar_1575 = (min (abs(
      (p_1571.y / p_1571.x)
    ), 1.0) / max (abs(
      (p_1571.y / p_1571.x)
    ), 1.0));
    float tmpvar_1576;
    tmpvar_1576 = (tmpvar_1575 * tmpvar_1575);
    tmpvar_1576 = (((
      ((((
        ((((-0.01213232 * tmpvar_1576) + 0.05368138) * tmpvar_1576) - 0.1173503)
       * tmpvar_1576) + 0.1938925) * tmpvar_1576) - 0.3326756)
     * tmpvar_1576) + 0.9999793) * tmpvar_1575);
    tmpvar_1576 = (tmpvar_1576 + (float(
      (abs((p_1571.y / p_1571.x)) > 1.0)
    ) * (
      (tmpvar_1576 * -2.0)
     + 1.570796)));
    tmpvar_1574 = (tmpvar_1576 * sign((p_1571.y / p_1571.x)));
    if ((abs(p_1571.x) > (1e-08 * abs(p_1571.y)))) {
      if ((p_1571.x < 0.0)) {
        if ((p_1571.y >= 0.0)) {
          tmpvar_1574 += 3.141593;
        } else {
          tmpvar_1574 = (tmpvar_1574 - 3.141593);
        };
      };
    } else {
      tmpvar_1574 = (sign(p_1571.y) * 1.570796);
    };
    vec2 x_1577;
    x_1577 = (p_1571 / 2.0);
    float tmpvar_1578;
    tmpvar_1578 = (sqrt(dot (x_1577, x_1577)) + 0.0001);
    r_1570 = tmpvar_1578;
    float tmpvar_1579;
    tmpvar_1579 = (1.9 * sin((
      ((8.0 * tmpvar_1578) - time)
     - 
      (2.0 * tmpvar_1574)
    )));
    b_1569 = ((0.3125 / tmpvar_1578) + (cos(
      ((7.0 * tmpvar_1574) + (tmpvar_1579 * tmpvar_1579))
    ) / (100.0 * tmpvar_1578)));
    float tmpvar_1580;
    tmpvar_1580 = clamp ((b_1569 / 0.4), 0.0, 1.0);
    b_1569 = (b_1569 * (tmpvar_1580 * (tmpvar_1580 * 
      (3.0 - (2.0 * tmpvar_1580))
    )));
    vec4 tmpvar_1581;
    tmpvar_1581.w = 1.0;
    tmpvar_1581.x = (b_1569 * 0.3);
    tmpvar_1581.y = ((0.3 * b_1569) + (0.2 * sin(
      (tmpvar_1574 + time)
    )));
    tmpvar_1581.z = (b_1569 * 0.5);
    fragColor_1568 = tmpvar_1581;
    p_1571 = ((tmpvar_1565 / (100000.0 * zoom)) - 0.628);
    float tmpvar_1582;
    float tmpvar_1583;
    tmpvar_1583 = (min (abs(
      (p_1571.y / p_1571.x)
    ), 1.0) / max (abs(
      (p_1571.y / p_1571.x)
    ), 1.0));
    float tmpvar_1584;
    tmpvar_1584 = (tmpvar_1583 * tmpvar_1583);
    tmpvar_1584 = (((
      ((((
        ((((-0.01213232 * tmpvar_1584) + 0.05368138) * tmpvar_1584) - 0.1173503)
       * tmpvar_1584) + 0.1938925) * tmpvar_1584) - 0.3326756)
     * tmpvar_1584) + 0.9999793) * tmpvar_1583);
    tmpvar_1584 = (tmpvar_1584 + (float(
      (abs((p_1571.y / p_1571.x)) > 1.0)
    ) * (
      (tmpvar_1584 * -2.0)
     + 1.570796)));
    tmpvar_1582 = (tmpvar_1584 * sign((p_1571.y / p_1571.x)));
    if ((abs(p_1571.x) > (1e-08 * abs(p_1571.y)))) {
      if ((p_1571.x < 0.0)) {
        if ((p_1571.y >= 0.0)) {
          tmpvar_1582 += 3.141593;
        } else {
          tmpvar_1582 = (tmpvar_1582 - 3.141593);
        };
      };
    } else {
      tmpvar_1582 = (sign(p_1571.y) * 1.570796);
    };
    vec2 x_1585;
    x_1585 = (p_1571 / 2.0);
    r_1570 = (sqrt(dot (x_1585, x_1585)) + 0.0001);
    b_1569 = (1.9 * sin((
      ((8.0 * r_1570) + time)
     - 
      (2.0 * tmpvar_1582)
    )));
    b_1569 = ((0.3125 / r_1570) + (cos(
      ((7.0 * tmpvar_1582) + (b_1569 * b_1569))
    ) / (100.0 * r_1570)));
    float tmpvar_1586;
    tmpvar_1586 = clamp ((b_1569 / 0.4), 0.0, 1.0);
    b_1569 = (b_1569 * (tmpvar_1586 * (tmpvar_1586 * 
      (3.0 - (2.0 * tmpvar_1586))
    )));
    vec4 tmpvar_1587;
    tmpvar_1587.w = 1.0;
    tmpvar_1587.x = (b_1569 * 0.3);
    tmpvar_1587.y = ((0.3 * b_1569) + (0.2 * sin(
      (tmpvar_1582 + time)
    )));
    tmpvar_1587.z = (b_1569 * 0.5);
    fragColor_1568 = (tmpvar_1581 * tmpvar_1587);
    float tmpvar_1588;
    tmpvar_1588 = clamp (((
      sqrt(dot (tmpvar_1573, tmpvar_1573))
     - 0.8) / -0.3), 0.0, 1.0);
    fragColor_1568 = (fragColor_1568 * (tmpvar_1588 * (tmpvar_1588 * 
      (3.0 - (2.0 * tmpvar_1588))
    )));
    tmpvar_1564 = fragColor_1568;
  } else {
    tmpvar_1564 = vec4(0.0, 0.0, 0.0, 0.0);
  };
  buff_10 = (buff_10 + tmpvar_1564);
  vec4 tmpvar_1589;
  tmpvar_1589 = min (max (buff_10, 0.0), 1.0);
  buff_10 = tmpvar_1589;
  vec2 poss_1590;
  vec4 tmpvar_1591;
  vec2 pos_1592;
  poss_1590 = (gl_FragCoord.xy - shippos);
  pos_1592 = poss_1590;
  if ((((
    (poss_1590.x > 0.0)
   && 
    (poss_1590.x < radius)
  ) && (poss_1590.y > 0.0)) && (poss_1590.y < radius))) {
    vec4 ancl_1593;
    vec2 ttpos_1594;
    vec4 cl_1595;
    vec3 result_1596;
    float b_1597;
    vec2 position_1598;
    vec3 color_1599;
    vec2 p_1600;
    vec4 tmpc_1601;
    float d_1602;
    vec4 cc_1603;
    vec2 uv_1604;
    float val_1605;
    float t_1606;
    float n_1607;
    pos_1592 = (((poss_1590 * 2.0) - vec2(radius)) / radius);
    mat2 tmpvar_1608;
    float tmpvar_1609;
    tmpvar_1609 = cos(angle);
    tmpvar_1608[0].x = tmpvar_1609;
    float tmpvar_1610;
    tmpvar_1610 = sin(angle);
    tmpvar_1608[0].y = -(tmpvar_1610);
    tmpvar_1608[1].x = tmpvar_1610;
    tmpvar_1608[1].y = tmpvar_1609;
    pos_1592 = (pos_1592 * tmpvar_1608);
    pos_1592.x = abs(pos_1592.x);
    mat2 tmpvar_1611;
    tmpvar_1611[0].x = 0.4084875;
    tmpvar_1611[0].y = -0.912764;
    tmpvar_1611[1].x = 0.912764;
    tmpvar_1611[1].y = 0.4084875;
    pos_1592 = (pos_1592 * tmpvar_1611);
    vec2 tmpvar_1612;
    tmpvar_1612.x = (0.7 * pos_1592.x);
    tmpvar_1612.y = (pos_1592.y - 0.5);
    float tmpvar_1613;
    float tmpvar_1614;
    tmpvar_1614 = (4.0 / radius);
    tmpvar_1613 = clamp (((0.5 - 
      sqrt(dot (tmpvar_1612, tmpvar_1612))
    ) / tmpvar_1614), 0.0, 1.0);
    vec2 x_1615;
    x_1615 = (pos_1592 - vec2(0.0, -0.8));
    float tmpvar_1616;
    tmpvar_1616 = clamp (((1.9 - 
      sqrt(dot (x_1615, x_1615))
    ) / tmpvar_1614), 0.0, 1.0);
    vec2 x_1617;
    x_1617 = (pos_1592 - vec2(0.0, -0.8));
    float tmpvar_1618;
    tmpvar_1618 = clamp (((1.28 - 
      sqrt(dot (x_1617, x_1617))
    ) / tmpvar_1614), 0.0, 1.0);
    vec2 x_1619;
    x_1619 = (pos_1592 - vec2(0.0, -0.8));
    float tmpvar_1620;
    tmpvar_1620 = clamp (((1.18 - 
      sqrt(dot (x_1619, x_1619))
    ) / tmpvar_1614), 0.0, 1.0);
    vec2 x_1621;
    x_1621 = (pos_1592 - vec2(0.0, -0.8));
    float tmpvar_1622;
    tmpvar_1622 = clamp (((1.14 - 
      sqrt(dot (x_1621, x_1621))
    ) / tmpvar_1614), 0.0, 1.0);
    float tmpvar_1623;
    tmpvar_1623 = clamp (((
      ((-(pos_1592.x) * 1.2) + pos_1592.y)
     - 0.2) / tmpvar_1614), 0.0, 1.0);
    float edge0_1624;
    edge0_1624 = ((pos_1592.y - 0.2) - 0.01);
    float tmpvar_1625;
    tmpvar_1625 = clamp (((0.15 - edge0_1624) / (
      ((pos_1592.y - 0.2) + 0.01)
     - edge0_1624)), 0.0, 1.0);
    float tmpvar_1626;
    tmpvar_1626 = clamp (((
      -(pos_1592.x)
     + 
      ((pos_1592.y + 0.97) / 4.5)
    ) / tmpvar_1614), 0.0, 1.0);
    float tmpvar_1627;
    tmpvar_1627 = clamp (((0.2 - pos_1592.y) / 0.01), 0.0, 1.0);
    n_1607 = (max ((
      ((((
        (tmpvar_1613 * (tmpvar_1613 * (3.0 - (2.0 * tmpvar_1613))))
       - 
        (tmpvar_1616 * (tmpvar_1616 * (3.0 - (2.0 * tmpvar_1616))))
      ) + (tmpvar_1618 * 
        (tmpvar_1618 * (3.0 - (2.0 * tmpvar_1618)))
      )) - (tmpvar_1620 * (tmpvar_1620 * 
        (3.0 - (2.0 * tmpvar_1620))
      ))) + (tmpvar_1622 * (tmpvar_1622 * (3.0 - 
        (2.0 * tmpvar_1622)
      ))))
     - 
      ((tmpvar_1623 * (tmpvar_1623 * (3.0 - 
        (2.0 * tmpvar_1623)
      ))) * (tmpvar_1625 * (tmpvar_1625 * (3.0 - 
        (2.0 * tmpvar_1625)
      ))))
    ), 0.0) + ((tmpvar_1626 * 
      (tmpvar_1626 * (3.0 - (2.0 * tmpvar_1626)))
    ) * (tmpvar_1627 * 
      (tmpvar_1627 * (3.0 - (2.0 * tmpvar_1627)))
    )));
    float tmpvar_1628;
    tmpvar_1628 = sign(min (n_1607, 1.0));
    n_1607 = tmpvar_1628;
    mat2 tmpvar_1629;
    tmpvar_1629[0].x = tmpvar_1609;
    tmpvar_1629[0].y = -(tmpvar_1610);
    tmpvar_1629[1].x = tmpvar_1610;
    tmpvar_1629[1].y = tmpvar_1609;
    vec2 x_1630;
    x_1630 = (10.0 * ((
      ((poss_1590 * 2.0) - vec2(radius))
     / radius) * tmpvar_1629));
    float md_1633;
    vec2 mr_1634;
    vec2 mg_1635;
    vec2 f_1636;
    vec2 n_1637;
    n_1637 = floor(x_1630);
    f_1636 = fract(x_1630);
    md_1633 = 8.0;
    for (int j_1632 = -1; j_1632 <= 1; j_1632++) {
      vec2 tmpvar_1638;
      tmpvar_1638.x = -1.0;
      tmpvar_1638.y = float(j_1632);
      vec2 tmpvar_1639;
      tmpvar_1639.x = dot ((n_1637 + tmpvar_1638), vec2(127.1, 311.7));
      tmpvar_1639.y = dot ((n_1637 + tmpvar_1638), vec2(269.5, 183.3));
      vec2 tmpvar_1640;
      tmpvar_1640 = ((tmpvar_1638 + (0.5 + 
        (0.5 * sin((iTime + (6.2831 * 
          fract((sin(tmpvar_1639) * 43758.55))
        ))))
      )) - f_1636);
      float tmpvar_1641;
      tmpvar_1641 = dot (tmpvar_1640, tmpvar_1640);
      if ((tmpvar_1641 < md_1633)) {
        md_1633 = tmpvar_1641;
        mr_1634 = tmpvar_1640;
        mg_1635 = tmpvar_1638;
      };
      vec2 tmpvar_1642;
      tmpvar_1642.x = 0.0;
      tmpvar_1642.y = float(j_1632);
      vec2 tmpvar_1643;
      tmpvar_1643.x = dot ((n_1637 + tmpvar_1642), vec2(127.1, 311.7));
      tmpvar_1643.y = dot ((n_1637 + tmpvar_1642), vec2(269.5, 183.3));
      vec2 tmpvar_1644;
      tmpvar_1644 = ((tmpvar_1642 + (0.5 + 
        (0.5 * sin((iTime + (6.2831 * 
          fract((sin(tmpvar_1643) * 43758.55))
        ))))
      )) - f_1636);
      float tmpvar_1645;
      tmpvar_1645 = dot (tmpvar_1644, tmpvar_1644);
      if ((tmpvar_1645 < md_1633)) {
        md_1633 = tmpvar_1645;
        mr_1634 = tmpvar_1644;
        mg_1635 = tmpvar_1642;
      };
      vec2 tmpvar_1646;
      tmpvar_1646.x = 1.0;
      tmpvar_1646.y = float(j_1632);
      vec2 tmpvar_1647;
      tmpvar_1647.x = dot ((n_1637 + tmpvar_1646), vec2(127.1, 311.7));
      tmpvar_1647.y = dot ((n_1637 + tmpvar_1646), vec2(269.5, 183.3));
      vec2 tmpvar_1648;
      tmpvar_1648 = ((tmpvar_1646 + (0.5 + 
        (0.5 * sin((iTime + (6.2831 * 
          fract((sin(tmpvar_1647) * 43758.55))
        ))))
      )) - f_1636);
      float tmpvar_1649;
      tmpvar_1649 = dot (tmpvar_1648, tmpvar_1648);
      if ((tmpvar_1649 < md_1633)) {
        md_1633 = tmpvar_1649;
        mr_1634 = tmpvar_1648;
        mg_1635 = tmpvar_1646;
      };
    };
    md_1633 = 8.0;
    for (int j_1631 = -2; j_1631 <= 2; j_1631++) {
      vec2 tmpvar_1650;
      tmpvar_1650.x = -2.0;
      tmpvar_1650.y = float(j_1631);
      vec2 tmpvar_1651;
      tmpvar_1651 = (mg_1635 + tmpvar_1650);
      vec2 tmpvar_1652;
      tmpvar_1652.x = dot ((n_1637 + tmpvar_1651), vec2(127.1, 311.7));
      tmpvar_1652.y = dot ((n_1637 + tmpvar_1651), vec2(269.5, 183.3));
      vec2 tmpvar_1653;
      tmpvar_1653 = ((tmpvar_1651 + (0.5 + 
        (0.5 * sin((iTime + (6.2831 * 
          fract((sin(tmpvar_1652) * 43758.55))
        ))))
      )) - f_1636);
      float tmpvar_1654;
      tmpvar_1654 = dot ((mr_1634 - tmpvar_1653), (mr_1634 - tmpvar_1653));
      if ((tmpvar_1654 > 1e-05)) {
        md_1633 = min (md_1633, dot ((0.5 * 
          (mr_1634 + tmpvar_1653)
        ), normalize(
          (tmpvar_1653 - mr_1634)
        )));
      };
      vec2 tmpvar_1655;
      tmpvar_1655.x = -1.0;
      tmpvar_1655.y = float(j_1631);
      vec2 tmpvar_1656;
      tmpvar_1656 = (mg_1635 + tmpvar_1655);
      vec2 tmpvar_1657;
      tmpvar_1657.x = dot ((n_1637 + tmpvar_1656), vec2(127.1, 311.7));
      tmpvar_1657.y = dot ((n_1637 + tmpvar_1656), vec2(269.5, 183.3));
      vec2 tmpvar_1658;
      tmpvar_1658 = ((tmpvar_1656 + (0.5 + 
        (0.5 * sin((iTime + (6.2831 * 
          fract((sin(tmpvar_1657) * 43758.55))
        ))))
      )) - f_1636);
      float tmpvar_1659;
      tmpvar_1659 = dot ((mr_1634 - tmpvar_1658), (mr_1634 - tmpvar_1658));
      if ((tmpvar_1659 > 1e-05)) {
        md_1633 = min (md_1633, dot ((0.5 * 
          (mr_1634 + tmpvar_1658)
        ), normalize(
          (tmpvar_1658 - mr_1634)
        )));
      };
      vec2 tmpvar_1660;
      tmpvar_1660.x = 0.0;
      tmpvar_1660.y = float(j_1631);
      vec2 tmpvar_1661;
      tmpvar_1661 = (mg_1635 + tmpvar_1660);
      vec2 tmpvar_1662;
      tmpvar_1662.x = dot ((n_1637 + tmpvar_1661), vec2(127.1, 311.7));
      tmpvar_1662.y = dot ((n_1637 + tmpvar_1661), vec2(269.5, 183.3));
      vec2 tmpvar_1663;
      tmpvar_1663 = ((tmpvar_1661 + (0.5 + 
        (0.5 * sin((iTime + (6.2831 * 
          fract((sin(tmpvar_1662) * 43758.55))
        ))))
      )) - f_1636);
      float tmpvar_1664;
      tmpvar_1664 = dot ((mr_1634 - tmpvar_1663), (mr_1634 - tmpvar_1663));
      if ((tmpvar_1664 > 1e-05)) {
        md_1633 = min (md_1633, dot ((0.5 * 
          (mr_1634 + tmpvar_1663)
        ), normalize(
          (tmpvar_1663 - mr_1634)
        )));
      };
      vec2 tmpvar_1665;
      tmpvar_1665.x = 1.0;
      tmpvar_1665.y = float(j_1631);
      vec2 tmpvar_1666;
      tmpvar_1666 = (mg_1635 + tmpvar_1665);
      vec2 tmpvar_1667;
      tmpvar_1667.x = dot ((n_1637 + tmpvar_1666), vec2(127.1, 311.7));
      tmpvar_1667.y = dot ((n_1637 + tmpvar_1666), vec2(269.5, 183.3));
      vec2 tmpvar_1668;
      tmpvar_1668 = ((tmpvar_1666 + (0.5 + 
        (0.5 * sin((iTime + (6.2831 * 
          fract((sin(tmpvar_1667) * 43758.55))
        ))))
      )) - f_1636);
      float tmpvar_1669;
      tmpvar_1669 = dot ((mr_1634 - tmpvar_1668), (mr_1634 - tmpvar_1668));
      if ((tmpvar_1669 > 1e-05)) {
        md_1633 = min (md_1633, dot ((0.5 * 
          (mr_1634 + tmpvar_1668)
        ), normalize(
          (tmpvar_1668 - mr_1634)
        )));
      };
      vec2 tmpvar_1670;
      tmpvar_1670.x = 2.0;
      tmpvar_1670.y = float(j_1631);
      vec2 tmpvar_1671;
      tmpvar_1671 = (mg_1635 + tmpvar_1670);
      vec2 tmpvar_1672;
      tmpvar_1672.x = dot ((n_1637 + tmpvar_1671), vec2(127.1, 311.7));
      tmpvar_1672.y = dot ((n_1637 + tmpvar_1671), vec2(269.5, 183.3));
      vec2 tmpvar_1673;
      tmpvar_1673 = ((tmpvar_1671 + (0.5 + 
        (0.5 * sin((iTime + (6.2831 * 
          fract((sin(tmpvar_1672) * 43758.55))
        ))))
      )) - f_1636);
      float tmpvar_1674;
      tmpvar_1674 = dot ((mr_1634 - tmpvar_1673), (mr_1634 - tmpvar_1673));
      if ((tmpvar_1674 > 1e-05)) {
        md_1633 = min (md_1633, dot ((0.5 * 
          (mr_1634 + tmpvar_1673)
        ), normalize(
          (tmpvar_1673 - mr_1634)
        )));
      };
    };
    t_1606 = time;
    vec2 tmpvar_1675;
    tmpvar_1675.x = (0.67 * pos_1592.x);
    tmpvar_1675.y = (pos_1592.y - 0.05);
    float tmpvar_1676;
    tmpvar_1676 = (sqrt(dot (tmpvar_1675, tmpvar_1675)) * 1.9);
    val_1605 = (tmpvar_1628 + ((2.0 * md_1633) * (0.5 + 
      (0.5 * sin((64.0 * md_1633)))
    )));
    float tmpvar_1677;
    tmpvar_1677 = (0.02 / (0.015 + abs(
      (tmpvar_1676 - 1.0)
    )));
    float tmpvar_1678;
    if (shua) {
      tmpvar_1678 = 1.0;
    } else {
      tmpvar_1678 = 0.0;
    };
    float tmpvar_1679;
    if (shua) {
      tmpvar_1679 = 1.0;
    } else {
      tmpvar_1679 = 0.0;
    };
    float tmpvar_1680;
    if (shua) {
      tmpvar_1680 = 1.0;
    } else {
      tmpvar_1680 = 0.0;
    };
    vec4 tmpvar_1681;
    tmpvar_1681.w = 1.0;
    tmpvar_1681.x = ((0.3 + (2.0 * tmpvar_1678)) + (3.35 * exbff_7.x));
    tmpvar_1681.y = ((0.7 - (0.5 * exbff_7.y)) - (0.3 * tmpvar_1679));
    tmpvar_1681.z = ((1.0 - (0.8 * tmpvar_1680)) - (0.9 * exbff_7.z));
    float tmpvar_1682;
    tmpvar_1682 = clamp (((tmpvar_1676 - 1.0) / -0.15), 0.0, 1.0);
    float tmpvar_1683;
    tmpvar_1683 = clamp (((tmpvar_1676 - 1.0) / -0.15), 0.0, 1.0);
    vec4 tmpvar_1684;
    tmpvar_1684.xyw = vec3(0.0, 0.0, 1.0);
    tmpvar_1684.z = (((0.8 * txeb_5.x) * (1.0 - 
      (min (1.0, float((1.0 >= tmpvar_1676))) * val_1605)
    )) * (1.0 - min (1.0, 
      (tmpvar_1683 * (tmpvar_1683 * (3.0 - (2.0 * tmpvar_1683))))
    )));
    vec4 tmpvar_1685;
    tmpvar_1685 = ((tmpvar_1681 - (
      ((0.8 * txeb_5) * (1.0 - (min (1.0, 
        float((1.0 >= tmpvar_1676))
      ) * val_1605)))
     * 
      (1.0 - min (1.0, (tmpvar_1682 * (tmpvar_1682 * 
        (3.0 - (2.0 * tmpvar_1682))
      ))))
    )) + tmpvar_1684);
    float tmpvar_1686;
    if (shua) {
      tmpvar_1686 = 1.0;
    } else {
      tmpvar_1686 = 0.0;
    };
    float tmpvar_1687;
    if (shua) {
      tmpvar_1687 = 1.0;
    } else {
      tmpvar_1687 = 0.0;
    };
    float tmpvar_1688;
    if (shua) {
      tmpvar_1688 = 1.0;
    } else {
      tmpvar_1688 = 0.0;
    };
    vec4 tmpvar_1689;
    tmpvar_1689.w = 1.0;
    tmpvar_1689.x = ((0.3 - (0.535 * exbff_7.x)) + (0.5 * tmpvar_1686));
    tmpvar_1689.y = ((0.7 - (1.875 * exbff_7.y)) - (0.3 * tmpvar_1687));
    tmpvar_1689.z = ((1.0 - (2.25 * exbff_7.z)) - (0.8 * tmpvar_1688));
    float tmpvar_1690;
    tmpvar_1690 = clamp (((tmpvar_1676 - 1.1) / -0.1), 0.0, 1.0);
    vec4 tmpvar_1691;
    tmpvar_1691 = (tmpvar_1689 + ((txeb_5 * 
      (1.0 - (min (1.0, float(
        (1.0 >= tmpvar_1676)
      )) * val_1605))
    ) * (1.0 - 
      min (1.0, (tmpvar_1690 * (tmpvar_1690 * (3.0 - 
        (2.0 * tmpvar_1690)
      ))))
    )));
    mat2 tmpvar_1692;
    float tmpvar_1693;
    tmpvar_1693 = cos(angle);
    tmpvar_1692[0].x = tmpvar_1693;
    float tmpvar_1694;
    tmpvar_1694 = sin(angle);
    tmpvar_1692[0].y = -(tmpvar_1694);
    tmpvar_1692[1].x = tmpvar_1694;
    tmpvar_1692[1].y = tmpvar_1693;
    float tmpvar_1695;
    tmpvar_1695 = (radius / 2.0);
    uv_1604 = (((poss_1590 / tmpvar_1695) - 1.0) * tmpvar_1692);
    uv_1604.x = abs(uv_1604.x);
    cc_1603.w = 1.0;
    d_1602 = (sqrt(dot (uv_1604, uv_1604)) - time);
    cc_1603.x = (abs((float(mod (
      (uv_1604.y - ((uv_1604.x * 2.0) * d_1602))
    , 
      (uv_1604.x * 1.1)
    )))) / 2.5);
    cc_1603.y = (abs((float(mod (
      (uv_1604.y - ((uv_1604.x * 2.0) * d_1602))
    , 
      (uv_1604.x * 1.1)
    )))) / 2.5);
    cc_1603.z = (abs((float(mod (
      (uv_1604.y - ((uv_1604.x * 2.0) * d_1602))
    , 
      (uv_1604.x * 1.1)
    )))) * 2.0);
    uv_1604 = ((poss_1590 / tmpvar_1695) - 1.0);
    mat2 tmpvar_1696;
    tmpvar_1696[0].x = tmpvar_1693;
    tmpvar_1696[0].y = -(tmpvar_1694);
    tmpvar_1696[1].x = tmpvar_1694;
    tmpvar_1696[1].y = tmpvar_1693;
    mat2 tmpvar_1697;
    tmpvar_1697[0].x = 6.5128e-06;
    tmpvar_1697[0].y = 1.0;
    tmpvar_1697[1].x = -1.0;
    tmpvar_1697[1].y = 6.5128e-06;
    uv_1604 = (uv_1604 * (tmpvar_1696 * tmpvar_1697));
    vec2 tmpvar_1698;
    tmpvar_1698 = (15.0 * uv_1604);
    p_1600 = tmpvar_1698;
    t_1606 = (time * 10.0);
    color_1599.xy = vec2(0.0, 0.0);
    float tmpvar_1699;
    tmpvar_1699 = sqrt(dot (tmpvar_1698, tmpvar_1698));
    vec2 tmpvar_1700;
    tmpvar_1700 = (tmpvar_1698 * 10.0);
    vec2 tmpvar_1701;
    tmpvar_1701 = (0.2 * tmpvar_1700);
    float tmpvar_1702;
    tmpvar_1702 = (1.0/(cos(tmpvar_1698.y)));
    color_1599.z = clamp (1.0, 0.0, ((5.0 * 
      sin(((tmpvar_1700.x * tmpvar_1702) + t_1606))
    ) - 2.0));
    color_1599.z = (color_1599.z + clamp (1.0, 0.0, (
      (3.0 * sin(((
        (0.9 * tmpvar_1700.x)
       * tmpvar_1702) + (t_1606 * 0.6))))
     - 2.5)));
    vec2 x_1703;
    x_1703 = ((tmpvar_1698 * sin(tmpvar_1701.x)) * sin((
      (0.4 * t_1606)
     - tmpvar_1701.y)));
    color_1599 = (color_1599 * ((6.0 * 
      (clamp (1.0, 0.0, (ceil(
        (1.0 - clamp (1.0, 0.0, tmpvar_1699))
      ) * sqrt(
        dot (x_1703, x_1703)
      ))) + (-1.4 + (sin(
        (tmpvar_1698.y + (t_1606 * 0.2))
      ) * 2.0)))
    ) * (1.0 - tmpvar_1699)));
    vec3 tmpvar_1704;
    tmpvar_1704.x = (color_1599.z * 0.6);
    tmpvar_1704.y = (color_1599.z * 0.7);
    tmpvar_1704.z = (color_1599.z * 3.0);
    color_1599 = (tmpvar_1704 * (1.0 - clamp (1.0, 0.0, 
      sqrt(dot (tmpvar_1698, tmpvar_1698))
    )));
    color_1599 = ((color_1599 + sqrt(
      dot (tmpvar_1698, tmpvar_1698)
    )) * color_1599.x);
    vec3 tmpvar_1705;
    tmpvar_1705 = clamp (vec3(1.0, 1.0, 1.0), vec3(0.0, 0.0, 0.0), color_1599);
    color_1599 = tmpvar_1705;
    vec4 tmpvar_1706;
    tmpvar_1706.w = 1.0;
    tmpvar_1706.xyz = tmpvar_1705;
    tmpc_1601 = (cc_1603 + tmpvar_1706);
    mat2 tmpvar_1707;
    tmpvar_1707[0].x = tmpvar_1693;
    tmpvar_1707[0].y = -(tmpvar_1694);
    tmpvar_1707[1].x = tmpvar_1694;
    tmpvar_1707[1].y = tmpvar_1693;
    position_1598 = (((poss_1590 / tmpvar_1695) - 1.0) * tmpvar_1707);
    position_1598.y = (position_1598.y - 0.55);
    position_1598 = (position_1598 - (position_1598 * 0.5));
    vec3 tmpvar_1708;
    tmpvar_1708.y = 0.05;
    float tmpvar_1709;
    tmpvar_1709 = (animlamp - 1.5);
    tmpvar_1708.x = (tmpvar_1709 / 4.5);
    tmpvar_1708.z = (0.05 + (0.35 * (1.0 - 
      (tmpvar_1709 / 4.5)
    )));
    float tmpvar_1710;
    tmpvar_1710 = (animlamp / 2.0);
    b_1597 = (cos((
      ((12.56632 * animlamp) * position_1598.x)
     - 
      (tmpvar_1710 * animlcounter)
    )) / 8.0);
    b_1597 = (b_1597 + (cos(
      (((50.26527 * animlamp) * position_1598.x) - (tmpvar_1710 * animlcounter))
    ) / 32.0));
    b_1597 = ((0.15 + (0.2 * b_1597)) * (0.1 / abs(
      (position_1598.y - (0.045 * b_1597))
    )));
    result_1596 = (max ((b_1597 * tmpvar_1708), 0.4) - 0.4);
    cl_1595 = vec4(0.0, 0.0, 0.0, 1.0);
    ttpos_1594 = vec2(0.0, 0.0);
    if ((lpower < 20.0)) {
      vec2 q_1711;
      float tmpvar_1712;
      tmpvar_1712 = (radius / 2.0);
      vec2 tmpvar_1713;
      tmpvar_1713 = (poss_1590 - vec2(tmpvar_1712));
      ttpos_1594.x = tmpvar_1713.x;
      vec2 tmpvar_1714;
      tmpvar_1714 = ((poss_1590 - (250.0 * zoom)) / radius);
      vec2 tmpvar_1715;
      tmpvar_1715 = ((lhitpos * zoom) / radius);
      float tmpvar_1716;
      tmpvar_1716 = (radius / 500.0);
      ttpos_1594.y = (tmpvar_1713.y - (20.0 * (tmpvar_1716 / zoom)));
      mat2 tmpvar_1717;
      float tmpvar_1718;
      tmpvar_1718 = cos(angle);
      tmpvar_1717[0].x = tmpvar_1718;
      float tmpvar_1719;
      tmpvar_1719 = sin(angle);
      tmpvar_1717[0].y = -(tmpvar_1719);
      tmpvar_1717[1].x = tmpvar_1719;
      tmpvar_1717[1].y = tmpvar_1718;
      ttpos_1594 = (ttpos_1594 * (tmpvar_1717 * 2.0));
      mat2 tmpvar_1720;
      tmpvar_1720[0].x = tmpvar_1718;
      tmpvar_1720[0].y = -(tmpvar_1719);
      tmpvar_1720[1].x = tmpvar_1719;
      tmpvar_1720[1].y = tmpvar_1718;
      q_1711 = (((poss_1590 - vec2(tmpvar_1712)) / (50.0 * tmpvar_1716)) * tmpvar_1720);
      q_1711.y = (q_1711.y - 2.75);
      q_1711.y = (q_1711.y / (tmpvar_1716 / zoom));
      q_1711.x = abs(q_1711.x);
      p_1600 = (15.0 * q_1711);
      vec3 tmpvar_1721;
      tmpvar_1721.x = (0.1 * max (0.0, p_1600.y));
      tmpvar_1721.y = ((float(
        (ttpos_1594.y >= 0.0)
      ) * 0.05) * max (0.0, p_1600.x));
      tmpvar_1721.z = ((float(
        (ttpos_1594.y >= 0.0)
      ) * 0.5) * max (0.0, p_1600.x));
      vec2 x_1722;
      x_1722 = (q_1711 * (q_1711.x * 15.1));
      vec4 tmpvar_1723;
      tmpvar_1723.w = 1.0;
      tmpvar_1723.xyz = (tmpvar_1721 / abs((
        (((8.0 * p_1600.x) * sqrt(dot (q_1711, q_1711))) + cos(((
          -(time)
         * 15.0) + p_1600.y)))
       * 
        sqrt(dot (x_1722, x_1722))
      )));
      float tmpvar_1724;
      tmpvar_1724 = sqrt(dot (tmpvar_1715, tmpvar_1715));
      float tmpvar_1725;
      if (wwh) {
        tmpvar_1725 = 0.0;
      } else {
        tmpvar_1725 = 1.0;
      };
      float tmpvar_1726;
      tmpvar_1726 = sqrt(dot (tmpvar_1715, tmpvar_1715));
      float tmpvar_1727;
      if (wwh) {
        tmpvar_1727 = 0.0;
      } else {
        tmpvar_1727 = 1.0;
      };
      float tmpvar_1728;
      float tmpvar_1729;
      tmpvar_1729 = clamp ((sqrt(
        dot (tmpvar_1715, tmpvar_1715)
      ) / 5.0), 0.0, 1.0);
      tmpvar_1728 = (tmpvar_1729 * (tmpvar_1729 * (3.0 - 
        (2.0 * tmpvar_1729)
      )));
      float tmpvar_1730;
      if (wwh) {
        tmpvar_1730 = 0.0;
      } else {
        tmpvar_1730 = 1.0;
      };
      float edge0_1731;
      edge0_1731 = ((tmpvar_1724 + 0.05) + (0.2 * tmpvar_1725));
      float tmpvar_1732;
      tmpvar_1732 = clamp (((
        sqrt(dot (tmpvar_1714, tmpvar_1714))
       - edge0_1731) / (
        ((tmpvar_1726 + (0.15 * tmpvar_1727)) - ((2.55 * tmpvar_1728) * tmpvar_1730))
       - edge0_1731)), 0.0, 1.0);
      cl_1595 = ((tmpvar_1723 * (1.0 - tmpvar_1705.x)) * (tmpvar_1732 * (tmpvar_1732 * 
        (3.0 - (2.0 * tmpvar_1732))
      )));
    };
    ancl_1593 = vec4(0.0, 0.0, 0.0, 0.0);
    if ((bulletanimtimer > 0.0)) {
      vec3 V_1733;
      uv_1604 = ((poss_1590 / (radius / 2.0)) - 1.0);
      mat2 tmpvar_1734;
      float tmpvar_1735;
      tmpvar_1735 = cos(angle);
      tmpvar_1734[0].x = tmpvar_1735;
      float tmpvar_1736;
      tmpvar_1736 = sin(angle);
      tmpvar_1734[0].y = -(tmpvar_1736);
      tmpvar_1734[1].x = tmpvar_1736;
      tmpvar_1734[1].y = tmpvar_1735;
      uv_1604 = (uv_1604 * tmpvar_1734);
      uv_1604 = (uv_1604 - vec2(0.0, 0.55));
      uv_1604 = (uv_1604 - (uv_1604 * 0.5));
      uv_1604.y = (uv_1604.y * 20.5);
      uv_1604.x = (uv_1604.x * 5.5);
      uv_1604 = (uv_1604 + (sin(
        (((uv_1604.x * 10.0) * (uv_1604.y * 1.11)) + (time * 2.0))
      ) * 0.15));
      vec3 tmpvar_1737;
      tmpvar_1737.yz = vec2(1.0, 2.0);
      tmpvar_1737.x = ((uv_1604.x * 0.1) + (bulletanimtimer * 0.725));
      V_1733.z = (2.0 * clamp ((
        abs(((vec3(mod ((
          (tmpvar_1737.x * 6.0)
         + vec3(0.0, 0.0, 2.0)), 6.0))) - 2.0))
       - 1.0), 0.0, 0.5)).z;
      V_1733 = (V_1733 * clamp ((
        (0.7 - abs(uv_1604.y))
       * 3.0), 0.0, 1.0));
      V_1733 = (V_1733 * (1.0 - (
        sin(((uv_1604.y * uv_1604.y) * 30.0))
       * 0.26)));
      vec4 tmpvar_1738;
      tmpvar_1738.w = 1.0;
      tmpvar_1738.xyz = V_1733;
      ancl_1593 = tmpvar_1738;
    };
    vec2 tmpvar_1739;
    tmpvar_1739.x = (0.67 * pos_1592.x);
    tmpvar_1739.y = (pos_1592.y + 0.05);
    float tmpvar_1740;
    tmpvar_1740 = (sqrt(dot (tmpvar_1739, tmpvar_1739)) * 1.9);
    vec4 tmpvar_1741;
    tmpvar_1741.w = 1.0;
    tmpvar_1741.xyz = result_1596;
    vec4 tmpvar_1742;
    tmpvar_1742.w = 1.0;
    tmpvar_1742.xyz = result_1596;
    float tmpvar_1743;
    tmpvar_1743 = clamp (((tmpvar_1676 - 1.4) / -0.3), 0.0, 1.0);
    tmpvar_1591 = (((
      ((mix ((
        ((min (1.0, (
          float((1.0 >= tmpvar_1676))
         * val_1605)) * tmpvar_1685) + (tmpvar_1742 * float((1.0 >= tmpvar_1740))))
       + 
        (ancl_1593 * float((1.0 >= tmpvar_1740)))
      ), (
        (tmpc_1601 + (tmpvar_1741 * 0.3))
       * tmpvar_1628), val_1605) + (tmpvar_1677 * tmpvar_1691)) + (((
        (cl_1595 * ttpos_1594.y)
       / lpower) * (20.0 - lpower)) / lpower))
     + 
      (((1.0 - (
        min (1.0, float((1.0 >= tmpvar_1676)))
       * val_1605)) * min (1.0, float(
        (1.0 >= tmpvar_1676)
      ))) * mcol_9)
    ) + (
      (1.0 - min (1.0, float((1.0 >= tmpvar_1676))))
     * tmpvar_1589)) + ((
      (0.3 * txeb_5)
     * 
      (1.0 - (min (1.0, float(
        (1.0 >= tmpvar_1676)
      )) * val_1605))
    ) * (1.0 - 
      min (1.0, (tmpvar_1743 * (tmpvar_1743 * (3.0 - 
        (2.0 * tmpvar_1743)
      ))))
    )));
  } else {
    pos_1592 = (((pos_1592 * 2.0) - vec2(radius)) / radius);
    mat2 tmpvar_1744;
    float tmpvar_1745;
    tmpvar_1745 = cos(angle);
    tmpvar_1744[0].x = tmpvar_1745;
    float tmpvar_1746;
    tmpvar_1746 = sin(angle);
    tmpvar_1744[0].y = -(tmpvar_1746);
    tmpvar_1744[1].x = tmpvar_1746;
    tmpvar_1744[1].y = tmpvar_1745;
    pos_1592 = (pos_1592 * tmpvar_1744);
    pos_1592.x = abs(pos_1592.x);
    mat2 tmpvar_1747;
    tmpvar_1747[0].x = 0.4084875;
    tmpvar_1747[0].y = -0.912764;
    tmpvar_1747[1].x = 0.912764;
    tmpvar_1747[1].y = 0.4084875;
    pos_1592 = (pos_1592 * tmpvar_1747);
    vec2 tmpvar_1748;
    tmpvar_1748.x = (0.67 * pos_1592.x);
    tmpvar_1748.y = (pos_1592.y - 0.05);
    float tmpvar_1749;
    tmpvar_1749 = (0.02 / (0.015 + abs(
      ((sqrt(dot (tmpvar_1748, tmpvar_1748)) * 1.9) - 1.0)
    )));
    float tmpvar_1750;
    if (shua) {
      tmpvar_1750 = 1.0;
    } else {
      tmpvar_1750 = 0.0;
    };
    float tmpvar_1751;
    if (shua) {
      tmpvar_1751 = 1.0;
    } else {
      tmpvar_1751 = 0.0;
    };
    float tmpvar_1752;
    if (shua) {
      tmpvar_1752 = 1.0;
    } else {
      tmpvar_1752 = 0.0;
    };
    vec4 tmpvar_1753;
    tmpvar_1753.w = 1.0;
    tmpvar_1753.x = ((0.3 - (0.535 * exbff_7.x)) + (0.5 * tmpvar_1750));
    tmpvar_1753.y = ((0.7 - (1.875 * exbff_7.y)) - (0.3 * tmpvar_1751));
    tmpvar_1753.z = ((1.0 - (2.25 * exbff_7.z)) - (0.8 * tmpvar_1752));
    vec4 tmpvar_1754;
    tmpvar_1754 = (tmpvar_1753 + txeb_5);
    if ((lpower < 20.0)) {
      vec2 ttpos_1755;
      vec2 q_1756;
      float tmpvar_1757;
      tmpvar_1757 = (radius / 2.0);
      vec2 tmpvar_1758;
      tmpvar_1758 = (poss_1590 - vec2(tmpvar_1757));
      ttpos_1755.x = tmpvar_1758.x;
      vec2 tmpvar_1759;
      tmpvar_1759 = ((poss_1590 - (250.0 * zoom)) / radius);
      vec2 tmpvar_1760;
      tmpvar_1760 = ((lhitpos * zoom) / radius);
      float tmpvar_1761;
      tmpvar_1761 = (radius / 500.0);
      ttpos_1755.y = (tmpvar_1758.y - (20.0 * (tmpvar_1761 / zoom)));
      mat2 tmpvar_1762;
      float tmpvar_1763;
      tmpvar_1763 = cos(angle);
      tmpvar_1762[0].x = tmpvar_1763;
      float tmpvar_1764;
      tmpvar_1764 = sin(angle);
      tmpvar_1762[0].y = -(tmpvar_1764);
      tmpvar_1762[1].x = tmpvar_1764;
      tmpvar_1762[1].y = tmpvar_1763;
      ttpos_1755 = (ttpos_1755 * (tmpvar_1762 * 2.0));
      mat2 tmpvar_1765;
      tmpvar_1765[0].x = tmpvar_1763;
      tmpvar_1765[0].y = -(tmpvar_1764);
      tmpvar_1765[1].x = tmpvar_1764;
      tmpvar_1765[1].y = tmpvar_1763;
      q_1756 = (((poss_1590 - vec2(tmpvar_1757)) / (50.0 * tmpvar_1761)) * tmpvar_1765);
      q_1756.y = (q_1756.y - 2.75);
      q_1756.y = (q_1756.y / (tmpvar_1761 / zoom));
      q_1756.x = abs(q_1756.x);
      vec2 tmpvar_1766;
      tmpvar_1766 = (15.0 * q_1756);
      vec3 tmpvar_1767;
      tmpvar_1767.x = (0.1 * max (0.0, tmpvar_1766.y));
      tmpvar_1767.y = ((float(
        (ttpos_1755.y >= 0.0)
      ) * 0.05) * max (0.0, tmpvar_1766.x));
      tmpvar_1767.z = ((float(
        (ttpos_1755.y >= 0.0)
      ) * 0.5) * max (0.0, tmpvar_1766.x));
      vec2 x_1768;
      x_1768 = (q_1756 * (q_1756.x * 15.1));
      vec4 tmpvar_1769;
      tmpvar_1769.w = 1.0;
      tmpvar_1769.xyz = (tmpvar_1767 / abs((
        (((8.0 * tmpvar_1766.x) * sqrt(dot (q_1756, q_1756))) + cos(((
          -(time)
         * 15.0) + tmpvar_1766.y)))
       * 
        sqrt(dot (x_1768, x_1768))
      )));
      float tmpvar_1770;
      tmpvar_1770 = sqrt(dot (tmpvar_1760, tmpvar_1760));
      float tmpvar_1771;
      if (wwh) {
        tmpvar_1771 = 0.0;
      } else {
        tmpvar_1771 = 1.0;
      };
      float tmpvar_1772;
      tmpvar_1772 = sqrt(dot (tmpvar_1760, tmpvar_1760));
      float tmpvar_1773;
      if (wwh) {
        tmpvar_1773 = 0.0;
      } else {
        tmpvar_1773 = 1.0;
      };
      float tmpvar_1774;
      float tmpvar_1775;
      tmpvar_1775 = clamp ((sqrt(
        dot (tmpvar_1760, tmpvar_1760)
      ) / 5.0), 0.0, 1.0);
      tmpvar_1774 = (tmpvar_1775 * (tmpvar_1775 * (3.0 - 
        (2.0 * tmpvar_1775)
      )));
      float tmpvar_1776;
      if (wwh) {
        tmpvar_1776 = 0.0;
      } else {
        tmpvar_1776 = 1.0;
      };
      float edge0_1777;
      edge0_1777 = ((tmpvar_1770 + 0.05) + (0.2 * tmpvar_1771));
      float tmpvar_1778;
      tmpvar_1778 = clamp (((
        sqrt(dot (tmpvar_1759, tmpvar_1759))
       - edge0_1777) / (
        ((tmpvar_1772 + (0.15 * tmpvar_1773)) - ((2.55 * tmpvar_1774) * tmpvar_1776))
       - edge0_1777)), 0.0, 1.0);
      tmpvar_1591 = (((
        (tmpvar_1749 * tmpvar_1754)
       + tmpvar_1589) + (
        ((((tmpvar_1769 * 
          (tmpvar_1778 * (tmpvar_1778 * (3.0 - (2.0 * tmpvar_1778))))
        ) * ttpos_1755.y) / lpower) * (20.0 - lpower))
       / lpower)) + (0.3 * txeb_5));
    } else {
      tmpvar_1591 = (((tmpvar_1749 * tmpvar_1754) + tmpvar_1589) + (0.3 * txeb_5));
    };
  };
  buff_10 = tmpvar_1591;
  for (int i_3 = 0; i_3 < bulletcounter; i_3++) {
    if (bulletexpl[i_3]) {
      vec2 tmpvar_1779;
      tmpvar_1779.x = bulletposx[i_3];
      tmpvar_1779.y = bulletposy[i_3];
      vec2 pos_1780;
      float tshift_1781;
      tshift_1781 = bullettimer[i_3];
      float period_1782;
      period_1782 = bulletexplctrl[i_3];
      vec4 tmpvar_1783;
      pos_1780 = ((fragCoord_2 - (tmpvar_1779 * zoom)) - shippos);
      if ((((
        (pos_1780.x > 0.0)
       && 
        (pos_1780.x < (35.0 * zoom))
      ) && (pos_1780.y > 0.0)) && (pos_1780.y < (35.0 * zoom)))) {
        vec2 uv_1784;
        uv_1784 = ((pos_1780 / 17.5) / zoom);
        float tmpvar_1785;
        tmpvar_1785 = (tshift_1781 * 3.5);
        float tmpvar_1786;
        tmpvar_1786 = (tmpvar_1785 + 2.8);
        float tmpvar_1787;
        tmpvar_1787 = (4.6 + (tshift_1781 / 0.5));
        float tmpvar_1788;
        tmpvar_1788 = clamp (((period_1782 - 10.0) / 28.0), 0.0, 1.0);
        float tmpvar_1789;
        tmpvar_1789 = clamp (((period_1782 - 10.0) / 28.0), 0.0, 1.0);
        vec3 tmpvar_1790;
        tmpvar_1790.y = 1.0;
        tmpvar_1790.x = (4.0 - (4.0 * (tmpvar_1788 * 
          (tmpvar_1788 * (3.0 - (2.0 * tmpvar_1788)))
        )));
        tmpvar_1790.z = (1.0 + (4.0 * (tmpvar_1789 * 
          (tmpvar_1789 * (3.0 - (2.0 * tmpvar_1789)))
        )));
        vec2 tmpvar_1791;
        tmpvar_1791 = (uv_1784 - 1.0);
        float tmpvar_1792;
        tmpvar_1792 = sqrt(dot (tmpvar_1791, tmpvar_1791));
        float vec_y_1793;
        vec_y_1793 = (tmpvar_1791.x + cos(tmpvar_1787));
        float vec_x_1794;
        vec_x_1794 = (tmpvar_1791.y + sin(tmpvar_1787));
        float tmpvar_1795;
        float tmpvar_1796;
        tmpvar_1796 = (min (abs(
          (vec_y_1793 / vec_x_1794)
        ), 1.0) / max (abs(
          (vec_y_1793 / vec_x_1794)
        ), 1.0));
        float tmpvar_1797;
        tmpvar_1797 = (tmpvar_1796 * tmpvar_1796);
        tmpvar_1797 = (((
          ((((
            ((((-0.01213232 * tmpvar_1797) + 0.05368138) * tmpvar_1797) - 0.1173503)
           * tmpvar_1797) + 0.1938925) * tmpvar_1797) - 0.3326756)
         * tmpvar_1797) + 0.9999793) * tmpvar_1796);
        tmpvar_1797 = (tmpvar_1797 + (float(
          (abs((vec_y_1793 / vec_x_1794)) > 1.0)
        ) * (
          (tmpvar_1797 * -2.0)
         + 1.570796)));
        tmpvar_1795 = (tmpvar_1797 * sign((vec_y_1793 / vec_x_1794)));
        if ((abs(vec_x_1794) > (1e-08 * abs(vec_y_1793)))) {
          if ((vec_x_1794 < 0.0)) {
            if ((vec_y_1793 >= 0.0)) {
              tmpvar_1795 += 3.141593;
            } else {
              tmpvar_1795 = (tmpvar_1795 - 3.141593);
            };
          };
        } else {
          tmpvar_1795 = (sign(vec_y_1793) * 1.570796);
        };
        float edge0_1798;
        edge0_1798 = (0.5 + (0.4 * cos(tmpvar_1787)));
        float tmpvar_1799;
        tmpvar_1799 = clamp (((tmpvar_1792 - edge0_1798) / (1.0 - edge0_1798)), 0.0, 1.0);
        float edge0_1800;
        edge0_1800 = (0.5 + (0.4 * sin(tmpvar_1787)));
        float tmpvar_1801;
        tmpvar_1801 = clamp (((tmpvar_1792 - edge0_1800) / (1.0 - edge0_1800)), 0.0, 1.0);
        vec3 tmpvar_1802;
        tmpvar_1802 = (((tmpvar_1790 * 
          (1.0 - (tmpvar_1799 * (tmpvar_1799 * (3.0 - 
            (2.0 * tmpvar_1799)
          ))))
        ) * sin(
          ((tmpvar_1785 + tmpvar_1792) + (tmpvar_1795 * period_1782))
        )) / sqrt(dot (uv_1784, uv_1784)));
        uv_1784 = (-(zoom) + (pos_1780 / 17.5));
        float tmpvar_1803;
        tmpvar_1803 = clamp (((period_1782 - 36.9) / 0.5999985), 0.0, 1.0);
        uv_1784 = (uv_1784 / (zoom - (zoom * 
          (tmpvar_1803 * (tmpvar_1803 * (3.0 - (2.0 * tmpvar_1803))))
        )));
        vec4 tmpvar_1804;
        tmpvar_1804.w = 1.0;
        tmpvar_1804.xyz = (max (vec3(0.0, 0.0, 0.0), (
          mix (tmpvar_1802, (vec3(1.0, 1.0, 4.0) * (1.0 - (tmpvar_1801 * 
            (tmpvar_1801 * (3.0 - (2.0 * tmpvar_1801)))
          ))), sin(((tmpvar_1786 + tmpvar_1792) + (tmpvar_1795 * period_1782))))
         / 
          sqrt(dot (uv_1784, uv_1784))
        )) * abs((
          float((sqrt(dot (uv_1784, uv_1784)) >= 1.0))
         - 1.0)));
        float tmpvar_1805;
        tmpvar_1805 = clamp (((period_1782 - 38.0) / -2.0), 0.0, 1.0);
        tmpvar_1783 = (tmpvar_1804 * (tmpvar_1805 * (tmpvar_1805 * 
          (3.0 - (2.0 * tmpvar_1805))
        )));
      } else {
        vec4 tmpvar_1806;
        tmpvar_1806.w = 1.0;
        tmpvar_1806.xyz = vec3(0.0, 0.0, 0.0);
        tmpvar_1783 = tmpvar_1806;
      };
      buff_10 = (buff_10 + (tmpvar_1783 * (1.0 - 
        float((6.283159 >= bullettimer[i_3]))
      )));
      vec2 tmpvar_1807;
      tmpvar_1807.x = bulletposx[i_3];
      tmpvar_1807.y = bulletposy[i_3];
      float tshift_1808;
      tshift_1808 = bullettimer[i_3];
      vec4 tmpvar_1809;
      vec2 uv_1810;
      vec2 pos_1811;
      vec2 tmpvar_1812;
      tmpvar_1812 = ((fragCoord_2 - (tmpvar_1807 * zoom)) - shippos);
      pos_1811 = tmpvar_1812;
      uv_1810 = (((tmpvar_1812 / 
        (125.0 * zoom)
      ) * 2.0) - 0.3);
      uv_1810 = (uv_1810 * 0.5);
      float tmpvar_1813;
      tmpvar_1813 = float((sqrt(
        dot (uv_1810, uv_1810)
      ) >= 1.0));
      if (((tmpvar_1813 - 1.0) <= -1.0)) {
        vec4 ret_1814;
        vec2 uxx_1815;
        mat2 tmpvar_1816;
        tmpvar_1816[0].x = cos((iTime - tshift_1808));
        tmpvar_1816[0].y = -(sin((iTime - tshift_1808)));
        tmpvar_1816[1].x = sin((iTime - tshift_1808));
        tmpvar_1816[1].y = cos((iTime - tshift_1808));
        pos_1811 = (tmpvar_1816 * uv_1810);
        uxx_1815.y = (pos_1811.y * 2.0);
        uxx_1815.x = (pos_1811.x * 1.5);
        int i_1817;
        int bval_1818;
        bval_1818 = 3;
        if (best) {
          bval_1818 = 5;
        };
        i_1817 = 0;
        while (true) {
          if ((i_1817 >= bval_1818)) {
            break;
          };
          i_1817++;
        };
        int i_1819;
        int bval_1820;
        bval_1820 = 3;
        if (best) {
          bval_1820 = 5;
        };
        i_1819 = 0;
        while (true) {
          if ((i_1819 >= bval_1820)) {
            break;
          };
          i_1819++;
        };
        int i_1821;
        int bval_1822;
        bval_1822 = 3;
        if (best) {
          bval_1822 = 5;
        };
        i_1821 = 0;
        while (true) {
          if ((i_1821 >= bval_1822)) {
            break;
          };
          i_1821++;
        };
        int i_1823;
        int bval_1824;
        bval_1824 = 3;
        if (best) {
          bval_1824 = 5;
        };
        i_1823 = 0;
        while (true) {
          if ((i_1823 >= bval_1824)) {
            break;
          };
          i_1823++;
        };
        float tmpvar_1825;
        tmpvar_1825 = abs(pos_1811.y);
        vec2 p_1826;
        p_1826 = ((pos_1811 * 50.0) + 220.0);
        float tshift_1827;
        tshift_1827 = tshift_1808;
        int i_1828;
        int bval_1829;
        float wc_1830;
        float w_1831;
        float a_1832;
        p_1826 = (p_1826 * 1.2);
        a_1832 = 0.0;
        w_1831 = 1.0;
        wc_1830 = 0.0;
        bval_1829 = 3;
        if (best) {
          bval_1829 = 5;
        };
        i_1828 = 0;
        while (true) {
          if ((i_1828 >= bval_1829)) {
            break;
          };
          vec3 tmpvar_1833;
          tmpvar_1833.z = 1.0;
          tmpvar_1833.xy = p_1826;
          vec3 f_1834;
          vec3 tmpvar_1835;
          tmpvar_1835 = floor(tmpvar_1833);
          vec3 tmpvar_1836;
          tmpvar_1836 = fract(tmpvar_1833);
          f_1834 = ((tmpvar_1836 * tmpvar_1836) * (3.0 - (2.0 * tmpvar_1836)));
          float tmpvar_1837;
          tmpvar_1837 = ((tmpvar_1835.x + (tmpvar_1835.y * 971.0)) + (883.0 * tmpvar_1835.z));
          vec3 x_1838;
          x_1838 = (tmpvar_1833 + 0.5);
          vec3 f_1839;
          vec3 tmpvar_1840;
          tmpvar_1840 = floor(x_1838);
          vec3 tmpvar_1841;
          tmpvar_1841 = fract(x_1838);
          f_1839 = ((tmpvar_1841 * tmpvar_1841) * (3.0 - (2.0 * tmpvar_1841)));
          float tmpvar_1842;
          tmpvar_1842 = ((tmpvar_1840.x + (tmpvar_1840.y * 157.0)) + (113.0 * tmpvar_1840.z));
          a_1832 = (a_1832 + clamp ((
            (2.0 * abs((0.5 - (
              mix (mix (mix (fract(
                (sin(tmpvar_1837) * 758.5453)
              ), fract(
                (sin((tmpvar_1837 + 1.0)) * 758.5453)
              ), f_1834.x), mix (fract(
                (sin((tmpvar_1837 + 971.0)) * 758.5453)
              ), fract(
                (sin((972.0 + tmpvar_1837)) * 758.5453)
              ), f_1834.x), f_1834.y), mix (mix (fract(
                (sin((tmpvar_1837 + 883.0)) * 758.5453)
              ), fract(
                (sin((884.0 + tmpvar_1837)) * 758.5453)
              ), f_1834.x), mix (fract(
                (sin((tmpvar_1837 + 1854.0)) * 758.5453)
              ), fract(
                (sin((1855.0 + tmpvar_1837)) * 758.5453)
              ), f_1834.x), f_1834.y), f_1834.z)
             * 
              mix (mix (mix (fract(
                (sin(tmpvar_1842) * 758.5453)
              ), fract(
                (sin((tmpvar_1842 + 1.0)) * 758.5453)
              ), f_1839.x), mix (fract(
                (sin((tmpvar_1842 + 157.0)) * 758.5453)
              ), fract(
                (sin((158.0 + tmpvar_1842)) * 758.5453)
              ), f_1839.x), f_1839.y), mix (mix (fract(
                (sin((tmpvar_1842 + 113.0)) * 758.5453)
              ), fract(
                (sin((114.0 + tmpvar_1842)) * 758.5453)
              ), f_1839.x), mix (fract(
                (sin((tmpvar_1842 + 270.0)) * 758.5453)
              ), fract(
                (sin((271.0 + tmpvar_1842)) * 758.5453)
              ), f_1839.x), f_1839.y), f_1839.z)
            ))))
           * w_1831), 0.0, 1.0));
          wc_1830 = (wc_1830 + ((w_1831 * 
            (1.0 - sin((min (iTime, 3.110164) / 1.4)))
          ) + 0.00271));
          w_1831 = (w_1831 * 0.5);
          p_1826 = ((p_1826 * 3.0) / sin(min (tshift_1827, 3.110164)));
          i_1828++;
        };
        float tmpvar_1843;
        tmpvar_1843 = clamp (((
          (((1.0/((1.0 + 
            (20.0 * tmpvar_1825)
          ))) * (a_1832 / wc_1830)) * (1.0 - abs(pos_1811.x)))
         - 0.1) / 0.4), 0.0, 1.0);
        vec2 tmpvar_1844;
        tmpvar_1844.x = iTime;
        tmpvar_1844.y = -(tshift_1808);
        vec2 tmpvar_1845;
        tmpvar_1845.x = -(iTime);
        tmpvar_1845.y = tshift_1808;
        vec3 tmpvar_1846;
        tmpvar_1846.y = 0.8;
        tmpvar_1846.x = (0.9 + (1.5 * fract(
          (cos(dot (tmpvar_1844, vec2(21.9898, 78.233))) * 43758.55)
        )));
        tmpvar_1846.z = (0.8 + (2.0 * fract(
          (cos(dot (tmpvar_1845, vec2(21.9898, 78.233))) * 43758.55)
        )));
        vec3 tmpvar_1847;
        tmpvar_1847 = (vec3(-0.32, -0.21, -0.0) * (1.0 + (
          (tmpvar_1843 * (tmpvar_1843 * (3.0 - (2.0 * tmpvar_1843))))
         - 1.0)));
        float tmpvar_1848;
        tmpvar_1848 = abs(pos_1811.y);
        vec2 p_1849;
        p_1849 = (pos_1811 * 3.0);
        float tshift_1850;
        tshift_1850 = tshift_1808;
        int i_1851;
        int bval_1852;
        float wc_1853;
        float w_1854;
        float a_1855;
        p_1849 = (p_1849 * 1.2);
        a_1855 = 0.0;
        w_1854 = 1.0;
        wc_1853 = 0.0;
        bval_1852 = 3;
        if (best) {
          bval_1852 = 5;
        };
        i_1851 = 0;
        while (true) {
          if ((i_1851 >= bval_1852)) {
            break;
          };
          vec3 tmpvar_1856;
          tmpvar_1856.z = 1.0;
          tmpvar_1856.xy = p_1849;
          vec3 f_1857;
          vec3 tmpvar_1858;
          tmpvar_1858 = floor(tmpvar_1856);
          vec3 tmpvar_1859;
          tmpvar_1859 = fract(tmpvar_1856);
          f_1857 = ((tmpvar_1859 * tmpvar_1859) * (3.0 - (2.0 * tmpvar_1859)));
          float tmpvar_1860;
          tmpvar_1860 = ((tmpvar_1858.x + (tmpvar_1858.y * 971.0)) + (883.0 * tmpvar_1858.z));
          vec3 x_1861;
          x_1861 = (tmpvar_1856 + 0.5);
          vec3 f_1862;
          vec3 tmpvar_1863;
          tmpvar_1863 = floor(x_1861);
          vec3 tmpvar_1864;
          tmpvar_1864 = fract(x_1861);
          f_1862 = ((tmpvar_1864 * tmpvar_1864) * (3.0 - (2.0 * tmpvar_1864)));
          float tmpvar_1865;
          tmpvar_1865 = ((tmpvar_1863.x + (tmpvar_1863.y * 157.0)) + (113.0 * tmpvar_1863.z));
          a_1855 = (a_1855 + clamp ((
            (2.0 * abs((0.5 - (
              mix (mix (mix (fract(
                (sin(tmpvar_1860) * 758.5453)
              ), fract(
                (sin((tmpvar_1860 + 1.0)) * 758.5453)
              ), f_1857.x), mix (fract(
                (sin((tmpvar_1860 + 971.0)) * 758.5453)
              ), fract(
                (sin((972.0 + tmpvar_1860)) * 758.5453)
              ), f_1857.x), f_1857.y), mix (mix (fract(
                (sin((tmpvar_1860 + 883.0)) * 758.5453)
              ), fract(
                (sin((884.0 + tmpvar_1860)) * 758.5453)
              ), f_1857.x), mix (fract(
                (sin((tmpvar_1860 + 1854.0)) * 758.5453)
              ), fract(
                (sin((1855.0 + tmpvar_1860)) * 758.5453)
              ), f_1857.x), f_1857.y), f_1857.z)
             * 
              mix (mix (mix (fract(
                (sin(tmpvar_1865) * 758.5453)
              ), fract(
                (sin((tmpvar_1865 + 1.0)) * 758.5453)
              ), f_1862.x), mix (fract(
                (sin((tmpvar_1865 + 157.0)) * 758.5453)
              ), fract(
                (sin((158.0 + tmpvar_1865)) * 758.5453)
              ), f_1862.x), f_1862.y), mix (mix (fract(
                (sin((tmpvar_1865 + 113.0)) * 758.5453)
              ), fract(
                (sin((114.0 + tmpvar_1865)) * 758.5453)
              ), f_1862.x), mix (fract(
                (sin((tmpvar_1865 + 270.0)) * 758.5453)
              ), fract(
                (sin((271.0 + tmpvar_1865)) * 758.5453)
              ), f_1862.x), f_1862.y), f_1862.z)
            ))))
           * w_1854), 0.0, 1.0));
          wc_1853 = (wc_1853 + ((w_1854 * 
            (1.0 - sin((min (iTime, 3.110164) / 1.4)))
          ) + 0.00271));
          w_1854 = (w_1854 * 0.5);
          p_1849 = ((p_1849 * 3.0) / sin(min (tshift_1850, 3.110164)));
          i_1851++;
        };
        float tmpvar_1866;
        tmpvar_1866 = clamp (((
          sqrt(dot (uxx_1815, uxx_1815))
         - 1.6) / -0.95), 0.0, 1.0);
        vec4 tmpvar_1867;
        tmpvar_1867.w = 1.0;
        tmpvar_1867.xyz = (min (vec3(1.0, 1.0, 1.0), (
          ((tmpvar_1847 * abs(sin(
            (tshift_1808 / 2.0)
          ))) + (((
            (1.6 * tmpvar_1846)
           * 
            (1.0/((1.0 + (30.0 * tmpvar_1848))))
          ) * (a_1855 / wc_1853)) * (1.0 - abs(pos_1811.x))))
         * 
          abs(sin(min (tshift_1808, 3.110164)))
        )) * (tmpvar_1866 * (tmpvar_1866 * 
          (3.0 - (2.0 * tmpvar_1866))
        )));
        ret_1814.w = tmpvar_1867.w;
        float tmpvar_1868;
        tmpvar_1868 = clamp (((tshift_1808 - 3.267243) / -0.439821), 0.0, 1.0);
        ret_1814.y = (tmpvar_1867.y * (tmpvar_1868 * (tmpvar_1868 * 
          (3.0 - (2.0 * tmpvar_1868))
        )));
        float tmpvar_1869;
        tmpvar_1869 = clamp (((tshift_1808 - 3.14158) / -0.314158), 0.0, 1.0);
        ret_1814.x = (tmpvar_1867.x * (tmpvar_1869 * (tmpvar_1869 * 
          (3.0 - (2.0 * tmpvar_1869))
        )));
        float tmpvar_1870;
        tmpvar_1870 = clamp (((tshift_1808 - 3.330074) / -0.5026526), 0.0, 1.0);
        ret_1814.z = (tmpvar_1867.z * (3.0 * (tmpvar_1870 * 
          (tmpvar_1870 * (3.0 - (2.0 * tmpvar_1870)))
        )));
        tmpvar_1809 = ret_1814;
      } else {
        tmpvar_1809 = vec4(0.0, 0.0, 0.0, 0.0);
      };
      buff_10 = (buff_10 + (tmpvar_1809 * float(
        (6.283159 >= bullettimer[i_3])
      )));
    } else {
      vec2 tmpvar_1871;
      tmpvar_1871.x = bulletposx[i_3];
      tmpvar_1871.y = bulletposy[i_3];
      vec2 pos_1872;
      float tshift_1873;
      tshift_1873 = bullettimer[i_3];
      vec4 tmpvar_1874;
      pos_1872 = ((fragCoord_2 - (tmpvar_1871 * zoom)) - shippos);
      if ((((
        (pos_1872.x > 0.0)
       && 
        (pos_1872.x < (35.0 * zoom))
      ) && (pos_1872.y > 0.0)) && (pos_1872.y < (35.0 * zoom)))) {
        vec2 uv_1875;
        uv_1875 = ((pos_1872 / 17.5) / zoom);
        float tmpvar_1876;
        tmpvar_1876 = (tshift_1873 * 3.5);
        float tmpvar_1877;
        tmpvar_1877 = (tmpvar_1876 + 2.8);
        float tmpvar_1878;
        tmpvar_1878 = (4.6 + (tshift_1873 / 0.5));
        float tmpvar_1879;
        tmpvar_1879 = clamp (-0.3214286, 0.0, 1.0);
        vec3 tmpvar_1880;
        tmpvar_1880.y = 1.0;
        tmpvar_1880.x = (4.0 - (4.0 * (tmpvar_1879 * 
          (tmpvar_1879 * (3.0 - (2.0 * tmpvar_1879)))
        )));
        tmpvar_1880.z = (1.0 + (4.0 * (tmpvar_1879 * 
          (tmpvar_1879 * (3.0 - (2.0 * tmpvar_1879)))
        )));
        vec2 tmpvar_1881;
        tmpvar_1881 = (uv_1875 - 1.0);
        float tmpvar_1882;
        tmpvar_1882 = sqrt(dot (tmpvar_1881, tmpvar_1881));
        float vec_y_1883;
        vec_y_1883 = (tmpvar_1881.x + cos(tmpvar_1878));
        float vec_x_1884;
        vec_x_1884 = (tmpvar_1881.y + sin(tmpvar_1878));
        float tmpvar_1885;
        float tmpvar_1886;
        tmpvar_1886 = (min (abs(
          (vec_y_1883 / vec_x_1884)
        ), 1.0) / max (abs(
          (vec_y_1883 / vec_x_1884)
        ), 1.0));
        float tmpvar_1887;
        tmpvar_1887 = (tmpvar_1886 * tmpvar_1886);
        tmpvar_1887 = (((
          ((((
            ((((-0.01213232 * tmpvar_1887) + 0.05368138) * tmpvar_1887) - 0.1173503)
           * tmpvar_1887) + 0.1938925) * tmpvar_1887) - 0.3326756)
         * tmpvar_1887) + 0.9999793) * tmpvar_1886);
        tmpvar_1887 = (tmpvar_1887 + (float(
          (abs((vec_y_1883 / vec_x_1884)) > 1.0)
        ) * (
          (tmpvar_1887 * -2.0)
         + 1.570796)));
        tmpvar_1885 = (tmpvar_1887 * sign((vec_y_1883 / vec_x_1884)));
        if ((abs(vec_x_1884) > (1e-08 * abs(vec_y_1883)))) {
          if ((vec_x_1884 < 0.0)) {
            if ((vec_y_1883 >= 0.0)) {
              tmpvar_1885 += 3.141593;
            } else {
              tmpvar_1885 = (tmpvar_1885 - 3.141593);
            };
          };
        } else {
          tmpvar_1885 = (sign(vec_y_1883) * 1.570796);
        };
        float edge0_1888;
        edge0_1888 = (0.5 + (0.4 * cos(tmpvar_1878)));
        float tmpvar_1889;
        tmpvar_1889 = clamp (((tmpvar_1882 - edge0_1888) / (1.0 - edge0_1888)), 0.0, 1.0);
        float edge0_1890;
        edge0_1890 = (0.5 + (0.4 * sin(tmpvar_1878)));
        float tmpvar_1891;
        tmpvar_1891 = clamp (((tmpvar_1882 - edge0_1890) / (1.0 - edge0_1890)), 0.0, 1.0);
        vec3 tmpvar_1892;
        tmpvar_1892 = (((tmpvar_1880 * 
          (1.0 - (tmpvar_1889 * (tmpvar_1889 * (3.0 - 
            (2.0 * tmpvar_1889)
          ))))
        ) * sin(
          ((tmpvar_1876 + tmpvar_1882) + tmpvar_1885)
        )) / sqrt(dot (uv_1875, uv_1875)));
        uv_1875 = (-(zoom) + (pos_1872 / 17.5));
        float tmpvar_1893;
        tmpvar_1893 = clamp (-59.83349, 0.0, 1.0);
        uv_1875 = (uv_1875 / (zoom - (zoom * 
          (tmpvar_1893 * (tmpvar_1893 * (3.0 - (2.0 * tmpvar_1893))))
        )));
        vec4 tmpvar_1894;
        tmpvar_1894.w = 1.0;
        tmpvar_1894.xyz = (max (vec3(0.0, 0.0, 0.0), (
          mix (tmpvar_1892, (vec3(1.0, 1.0, 4.0) * (1.0 - (tmpvar_1891 * 
            (tmpvar_1891 * (3.0 - (2.0 * tmpvar_1891)))
          ))), sin(((tmpvar_1877 + tmpvar_1882) + tmpvar_1885)))
         / 
          sqrt(dot (uv_1875, uv_1875))
        )) * abs((
          float((sqrt(dot (uv_1875, uv_1875)) >= 1.0))
         - 1.0)));
        float tmpvar_1895;
        tmpvar_1895 = clamp (18.5, 0.0, 1.0);
        tmpvar_1874 = (tmpvar_1894 * (tmpvar_1895 * (tmpvar_1895 * 
          (3.0 - (2.0 * tmpvar_1895))
        )));
      } else {
        vec4 tmpvar_1896;
        tmpvar_1896.w = 1.0;
        tmpvar_1896.xyz = vec3(0.0, 0.0, 0.0);
        tmpvar_1874 = tmpvar_1896;
      };
      buff_10 = (buff_10 + tmpvar_1874);
    };
  };
  color_1.xyz = buff_10.xyz;
  color_1.w = 1.0;
  gl_FragColor = color_1;
}

