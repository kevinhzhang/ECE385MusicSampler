/*
 *    _____ ______          SGen v.0.2 - A Generator of Streaming Hardware
 *   / ___// ____/__  ____  Department of Computer Science, ETH Zurich, Switzerland
 *   \__ \/ / __/ _ \/ __ \
 *  ___/ / /_/ /  __/ / / / Copyright (C) 2020-2021 François Serre (serref@inf.ethz.ch)
 * /____/\____/\___/_/ /_/  https://github.com/fserre/sgen
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 * 
 */

module product(input clk,
  input reset,
  input next,
  input [63:0] i0,
  input [63:0] i1,
  output next_out,
  output [63:0] o0,
  output [63:0] o1);

  wire [31:0] s1;
  wire [31:0] s2;
  reg [63:0] s3;
  reg [31:0] s4;
  reg [31:0] s6 [5:0];
  wire [31:0] s5;
  reg [31:0] s8 [5:0];
  wire [31:0] s7;
  reg [31:0] s10 [5:0];
  wire [31:0] s9;
  reg [31:0] s12 [5:0];
  wire [31:0] s11;
  reg [3:0] s14 [6:0];
  wire [3:0] s13;
  reg [63:0] s15;
  reg [31:0] s16;
  wire [31:0] s17;
  wire [31:0] s18;
  reg [31:0] s19;
  reg [31:0] s20;
  reg s22 [16:0];
  wire s21;
  wire [31:0] s23;
  reg [3:0] s24;
  reg [31:0] s26 [2:0];
  wire [31:0] s25;
  reg [31:0] s28 [2:0];
  wire [31:0] s27;
  reg [31:0] s29;
  reg [31:0] s30;
  reg [31:0] s31;
  reg [31:0] s32;
  wire [31:0] s33;
  wire [31:0] s34;
  reg s36 [3:0];
  wire s35;
  wire [31:0] s37;
  wire [1:0] s38;
  reg [31:0] s39;
  reg [31:0] s40;
  wire [63:0] s41;
  reg [31:0] s42;
  reg s43;
  reg [3:0] s44;
  reg s46;
  reg s45;
  wire [31:0] s47;
  wire [31:0] s48;
  wire [31:0] s49;
  wire [31:0] s50;
  wire [31:0] s51;
  wire [31:0] s52;
  reg s53;
  reg s54;
  reg [63:0] s55;
  reg [31:0] s56;
  wire [31:0] s57;
  wire [31:0] s58;
  reg [31:0] s59;
  wire [1:0] s60;
  reg [3:0] s62 [26:0];
  wire [3:0] s61;
  reg [31:0] s63;
  reg [63:0] s64;
  reg [2:0] s66 [2:0];
  wire [2:0] s65;
  wire [31:0] s67;
  wire [31:0] s68;
  reg [31:0] s69;
  reg [31:0] s71 [2:0];
  wire [31:0] s70;
  reg [31:0] s73 [2:0];
  wire [31:0] s72;
  reg [31:0] s74;
  reg [31:0] s75;
  wire [31:0] s76;
  wire [31:0] s77;
  reg [31:0] s79;
  reg [31:0] s78;
  reg [31:0] s81;
  reg [31:0] s80;
  reg s83;
  reg s82;
  reg [63:0] s85 [3:0]; // synthesis attribute ram_style of s85 is block
  reg [63:0] s84;
  reg s87 [9:0];
  wire s86;
  wire [31:0] s88;
  wire [31:0] s89;
  reg s91 [7:0];
  wire s90;
  wire [3:0] s92;
  reg [31:0] s93;
  reg [31:0] s94;
  wire [31:0] s95;
  wire [31:0] s96;
  wire [31:0] s97;
  reg [63:0] s99 [15:0]; // synthesis attribute ram_style of s99 is block
  reg [63:0] s98;
  reg [31:0] s100;
  reg [31:0] s101;
  reg [31:0] s102;
  reg [31:0] s103;
  wire [31:0] s104;
  wire [31:0] s105;
  reg [63:0] s107 [15:0]; // synthesis attribute ram_style of s107 is block
  reg [63:0] s106;
  reg s109 [5:0];
  wire s108;
  wire [31:0] s110;
  reg [31:0] s111;
  reg [31:0] s112;
  reg [1:0] s113;
  wire [31:0] s114;
  wire [31:0] s115;
  reg [63:0] s116;
  reg [31:0] s117;
  wire [31:0] s118;
  wire [31:0] s119;
  reg [31:0] s120;
  reg s122 [21:0];
  wire s121;
  reg [31:0] s124 [2:0];
  wire [31:0] s123;
  reg [31:0] s126 [2:0];
  wire [31:0] s125;
  reg s128 [39:0];
  wire s127;
  wire [2:0] s129;
  wire [31:0] s130;
  wire [63:0] s131;
  wire [3:0] s132;
  reg [31:0] s133;
  reg s135 [3:0];
  wire s134;
  wire [31:0] s136;
  reg s138 [66:0];
  wire s137;
  wire [63:0] s139;
  wire [31:0] s140;
  wire [31:0] s141;
  wire [3:0] s142;
  reg [63:0] s144;
  reg [63:0] s143;
  wire [31:0] s145;
  wire [31:0] s146;
  reg [63:0] s148 [15:0]; // synthesis attribute ram_style of s148 is block
  reg [63:0] s147;
  reg [31:0] s150 [2:0];
  wire [31:0] s149;
  reg [31:0] s152 [2:0];
  wire [31:0] s151;
  reg [63:0] s154 [3:0]; // synthesis attribute ram_style of s154 is block
  reg [63:0] s153;
  reg [3:0] s155;
  reg [31:0] s156;
  reg [31:0] s157;
  wire [31:0] s158;
  wire [31:0] s159;
  reg [31:0] s161 [2:0];
  wire [31:0] s160;
  reg [31:0] s163 [2:0];
  wire [31:0] s162;
  reg s165 [5:0];
  wire s164;
  reg [31:0] s166;
  wire [3:0] s167;
  reg [31:0] s168;
  wire s169;
  wire s170;
  reg [63:0] s171;
  wire [3:0] s172;
  wire [31:0] s173;
  reg [31:0] s174;
  reg [31:0] s175;
  reg [3:0] s176;
  reg s178 [5:0];
  wire s177;
  wire [31:0] s179;
  reg [31:0] s180;
  reg [3:0] s182 [6:0];
  wire [3:0] s181;
  wire [63:0] s183;
  wire [31:0] s184;
  reg [1:0] s185;
  wire [63:0] s186;
  wire [63:0] s187;
  wire [63:0] s188;
  reg [31:0] s189;
  reg [31:0] s190;
  reg [31:0] s191;
  reg [63:0] s192;
  wire [31:0] s193;
  wire [31:0] s194;
  reg [31:0] s195;
  reg [31:0] s196;
  reg [31:0] s197;
  reg [31:0] s198;
  reg s200 [19:0];
  wire s199;
  reg [3:0] s201;
  wire [2:0] s202;
  reg [31:0] s203;
  wire [31:0] s204;
  wire [3:0] s205;
  wire [31:0] s206;
  wire [2:0] s207;
  wire s208;
  wire s209;
  wire [31:0] s210;
  reg [31:0] s212;
  reg [31:0] s211;
  reg [31:0] s214;
  reg [31:0] s213;
  wire [31:0] s215;
  wire [31:0] s216;
  wire [63:0] s217;
  wire [31:0] s218;
  wire [31:0] s219;
  wire [31:0] s220;
  reg [3:0] s222 [8:0];
  wire [3:0] s221;
  reg [3:0] s223;
  wire [31:0] s224;
  wire [63:0] s225;
  reg [31:0] s226;
  reg [31:0] s227;
  reg [31:0] s228;
  reg s230 [13:0];
  wire s229;
  reg [31:0] s231;
  reg s232;
  wire s233;
  wire [31:0] s234;
  wire [31:0] s235;
  wire [31:0] s236;
  reg [31:0] s237;
  reg [31:0] s238;
  reg [31:0] s239;
  wire [31:0] s240;
  wire [31:0] s241;
  wire [31:0] s242;
  reg [31:0] s243;
  reg s245 [27:0];
  wire s244;
  reg [31:0] s247 [2:0];
  wire [31:0] s246;
  reg [31:0] s249 [2:0];
  wire [31:0] s248;
  wire [31:0] s250;
  wire [31:0] s251;
  wire [31:0] s252;
  reg [63:0] s254 [7:0]; // synthesis attribute ram_style of s254 is block
  reg [63:0] s253;
  reg [31:0] s255;
  wire [3:0] s256;
  wire [31:0] s257;
  wire [3:0] s258;
  reg [63:0] s259;
  wire [63:0] s260;
  wire [63:0] s261;
  reg [3:0] s263 [9:0];
  wire [3:0] s262;
  reg [31:0] s264;
  reg [31:0] s265;
  wire [63:0] s266;
  reg s268 [14:0];
  wire s267;
  wire [31:0] s269;
  wire [31:0] s270;
  reg [2:0] s271;
  wire [31:0] s272;
  wire [31:0] s273;
  wire [31:0] s274;
  wire [31:0] s275;
  reg [31:0] s276;
  reg [31:0] s277;
  wire [31:0] s278;
  wire [31:0] s279;
  wire [31:0] s280;
  wire [31:0] s281;
  reg [3:0] s282;
  reg [1:0] s284 [26:0];
  wire [1:0] s283;
  wire [31:0] s285;
  reg [1:0] s286;
  reg [3:0] s288 [6:0];
  wire [3:0] s287;
  reg [63:0] s290 [15:0]; // synthesis attribute ram_style of s290 is block
  reg [63:0] s289;
  reg s292 [27:0];
  wire s291;
  reg [3:0] s293;
  wire [31:0] s294;
  wire [31:0] s295;
  wire [31:0] s296;
  wire [31:0] s297;
  wire [2:0] s298;
  reg [31:0] s299;
  reg [31:0] s300;
  reg [31:0] s301;
  reg [31:0] s302;
  reg [3:0] s304 [6:0];
  wire [3:0] s303;
  reg [31:0] s305;
  reg [31:0] s306;
  wire [31:0] s307;
  reg [31:0] s308;
  reg [31:0] s309;
  reg [3:0] s310;
  reg [31:0] s311;
  wire [31:0] s312;
  wire [31:0] s313;
  reg [3:0] s315 [48:0];
  wire [3:0] s314;
  reg [31:0] s316;
  reg [31:0] s317;
  reg [31:0] s318;
  reg [31:0] s319;
  reg [2:0] s320;
  reg s321;
  wire [31:0] s322;
  reg [31:0] s323;
  wire [31:0] s324;
  reg [31:0] s325;
  reg [31:0] s326;
  reg [31:0] s327;
  wire [1:0] s328;
  wire [31:0] s329;
  reg [31:0] s330;
  wire s331;
  wire s332;
  wire [63:0] s333;
  wire [63:0] s334;
  reg [31:0] s335;
  reg [31:0] s336;
  reg [31:0] s337;
  reg [31:0] s338;
  wire [31:0] s339;
  wire [31:0] s340;
  wire [1:0] s341;
  reg [31:0] s342;
  reg [31:0] s343;
  wire [3:0] s344;
  wire [31:0] s345;
  wire [31:0] s346;
  wire [31:0] s347;
  wire [31:0] s348;
  wire [31:0] s349;
  wire [31:0] s350;
  wire [63:0] s351;
  wire [63:0] s352;
  wire [31:0] s353;
  wire [31:0] s354;
  wire [31:0] s355;
  wire [31:0] s356;
  wire [31:0] s357;
  wire s358;
  reg [31:0] s359;
  reg [31:0] s360;
  reg [1:0] s361;
  reg [2:0] s363 [6:0];
  wire [2:0] s362;
  reg [31:0] s364;
  reg [31:0] s365;
  wire [3:0] s366;
  wire [31:0] s367;
  reg [31:0] s368;
  reg [31:0] s369;
  reg [31:0] s371 [3:0];
  wire [31:0] s370;
  reg [31:0] s373 [3:0];
  wire [31:0] s372;
  reg s375 [3:0];
  wire s374;
  reg [63:0] s376;
  reg [63:0] s378 [15:0]; // synthesis attribute ram_style of s378 is block
  reg [63:0] s377;
  reg [3:0] s380 [11:0];
  wire [3:0] s379;
  wire [63:0] s381;
  wire [31:0] s382;
  wire [31:0] s383;
  reg [31:0] s384;
  wire [31:0] s385;
  wire [31:0] s386;
  reg s387;
  reg [3:0] s389 [3:0];
  wire [3:0] s388;
  reg [2:0] s390;
  wire [2:0] s391;
  wire [63:0] s392;
  reg [31:0] s394 [2:0];
  wire [31:0] s393;
  reg [31:0] s396 [2:0];
  wire [31:0] s395;
  reg [3:0] s398;
  reg [3:0] s397;
  wire [1:0] s399;
  wire [2:0] s400;
  wire [31:0] s401;
  wire [31:0] s402;
  reg [31:0] s403;
  reg [63:0] s405 [7:0]; // synthesis attribute ram_style of s405 is block
  reg [63:0] s404;
  wire [31:0] s406;
  reg [31:0] s407;
  reg [1:0] s409 [9:0];
  wire [1:0] s408;
  reg [31:0] s411 [3:0];
  wire [31:0] s410;
  reg [31:0] s413 [3:0];
  wire [31:0] s412;
  reg [31:0] s414;
  reg [31:0] s415;
  reg [31:0] s416;
  reg [31:0] s417;
  reg [31:0] s418;
  wire [2:0] s419;
  reg [63:0] s420;
  reg [3:0] s421;
  reg [31:0] s423 [3:0];
  wire [31:0] s422;
  reg [31:0] s425 [3:0];
  wire [31:0] s424;
  reg s427 [14:0];
  wire s426;
  reg [31:0] s429;
  reg [31:0] s428;
  reg [31:0] s431;
  reg [31:0] s430;
  wire [63:0] s432;
  reg [31:0] s433;
  reg [31:0] s434;
  reg [2:0] s436 [2:0];
  wire [2:0] s435;
  wire [31:0] s437;
  reg [31:0] s439 [3:0];
  wire [31:0] s438;
  reg [31:0] s441 [3:0];
  wire [31:0] s440;
  wire [31:0] s442;
  reg [3:0] s443;
  wire [63:0] s444;
  reg s446 [7:0];
  wire s445;
  reg [3:0] s448 [3:0];
  wire [3:0] s447;
  wire [31:0] s449;
  wire [31:0] s450;
  reg [63:0] s451;
  wire [1:0] s452;
  wire [63:0] s453;
  wire [31:0] s454;
  wire [31:0] s455;
  wire [1:0] s456;
  reg [31:0] s457;
  reg [31:0] s459;
  reg [31:0] s458;
  reg [31:0] s461;
  reg [31:0] s460;
  wire [63:0] s462;
  reg s463;
  wire [63:0] s464;
  wire [63:0] s465;
  wire [31:0] s466;
  wire [31:0] s467;
  reg s469 [15:0];
  wire s468;
  reg [31:0] s470;
  reg [31:0] s471;
  wire [31:0] s472;
  reg [1:0] s473;
  wire [31:0] s474;
  reg [63:0] s476 [15:0]; // synthesis attribute ram_style of s476 is block
  reg [63:0] s475;
  wire [31:0] s477;
  wire [31:0] s478;
  reg [3:0] s479;
  wire [31:0] s480;
  wire [31:0] s481;
  wire [63:0] s482;
  wire [63:0] s483;
  reg [2:0] s485 [15:0];
  wire [2:0] s484;
  reg [31:0] s486;
  wire s487;
  integer i;
  assign s1 = s55[63:32];
  assign s2 = s55[31:0];
  assign s5 = s6 [5];
  assign s7 = s8 [5];
  assign s9 = s10 [5];
  assign s11 = s12 [5];
  assign s13 = s14 [6];
  assign s17 = s64[63:32];
  assign s18 = s64[31:0];
  assign s21 = s22 [16];
  assign s23 = s471 - s120;
  assign s25 = s26 [2];
  assign s27 = s28 [2];
  assign s33 = s420[63:32];
  assign s34 = s420[31:0];
  assign s35 = s36 [3];
  assign s37 = s100 + s323;
  assign s38 = s61[1:0];
  assign s41 = {s74, s75};
  assign s47 = s374 ? s118 : s339;
  assign s48 = s374 ? s119 : s340;
  assign s49 = s374 ? s339 : s118;
  assign s50 = s374 ? s340 : s119;
  assign s51 = s192[63:32];
  assign s52 = s192[31:0];
  assign s57 = s121 ? s174 : s305;
  assign s58 = s121 ? s175 : s306;
  assign s60 = s137 ? s456 : s286;
  assign s61 = s62 [26];
  assign s65 = s66 [2];
  assign s67 = s333[61:30];
  assign s68 = s334[61:30];
  assign s70 = s71 [2];
  assign s72 = s73 [2];
  assign s76 = s43 ? 32'd0 : s337;
  assign s77 = s43 ? 32'd0 : s338;
  assign s86 = s87 [9];
  assign s88 = s259[63:32];
  assign s89 = s259[31:0];
  assign s90 = s91 [7];
  assign s92 = {s127, s400};
  assign s95 = s123 - s246;
  assign s96 = s43 ? s338 : 32'd0;
  assign s97 = s43 ? s337 : 32'd0;
  assign s104 = s93 - s368;
  assign s105 = s94 - s369;
  assign s108 = s109 [5];
  assign s110 = s21 ? s111 : s311;
  assign s114 = s93 + s368;
  assign s115 = s94 + s369;
  assign s118 = i0[63:32];
  assign s119 = i0[31:0];
  assign s121 = s122 [21];
  assign s123 = s124 [2];
  assign s125 = s126 [2];
  assign s127 = s128 [39];
  assign s129 = s207 ^ s298;
  assign s130 = s125 + s248;
  assign s131 = {s308, s309};
  assign s132 = s314 ^ s262;
  assign s134 = s135 [3];
  assign s136 = s101 + s403;
  assign s137 = s138 [66];
  assign s139 = s45 ? s143 : s453;
  assign s140 = s244 ? s63 : s433;
  assign s141 = s326 + s69;
  assign s142 = next ? 4'd0 : s172;
  assign s145 = s82 ? s51 : s274;
  assign s146 = s82 ? s52 : s275;
  assign s149 = s150 [2];
  assign s151 = s152 [2];
  assign s158 = s134 ? s422 : s410;
  assign s159 = s134 ? s424 : s412;
  assign s160 = s161 [2];
  assign s162 = s163 [2];
  assign s164 = s165 [5];
  assign s167 = {s331, s53, s332, s54};
  assign s169 = s321 ? s208 : s209;
  assign s170 = s321 ? s209 : s208;
  assign s172 = s310 + 4'd1;
  assign s173 = s445 ? s117 : s39;
  assign s177 = s178 [5];
  assign s179 = s470 + s384;
  assign s181 = s182 [6];
  assign s183 = {s316, s317};
  assign s184 = s191 + s112;
  assign s186 = $signed(s197) * $signed(s255);
  assign s187 = $signed(s198) * $signed(s255);
  assign s188 = {s226, s156};
  assign s193 = 32'd0 - s25;
  assign s194 = 32'd0 - s27;
  assign s199 = s200 [19];
  assign s202 = reset ? 3'd0 : s419;
  assign s204 = s162 + s151;
  assign s205 = {s283, s399};
  assign s206 = s470 - s384;
  assign s207 = {s199, 2'd0};
  assign s208 = s310[0];
  assign s209 = s310[2];
  assign s210 = s190 - s407;
  assign s215 = s260[61:30];
  assign s216 = s261[61:30];
  assign s217 = {s56, s327};
  assign s218 = s325 + s166;
  assign s219 = s171[63:32];
  assign s220 = s171[31:0];
  assign s221 = s222 [8];
  assign s224 = s445 ? s360 : s30;
  assign s225 = {s264, s265};
  assign s229 = s230 [13];
  assign s233 = s468 ? s358 : s321;
  assign s234 = s229 ? s219 : s356;
  assign s235 = s229 ? s220 : s357;
  assign s236 = s325 - s166;
  assign s240 = s229 ? s356 : s219;
  assign s241 = s229 ? s357 : s220;
  assign s242 = s31 - s414;
  assign s244 = s245 [27];
  assign s246 = s247 [2];
  assign s248 = s249 [2];
  assign s250 = s244 ? s133 : s4;
  assign s251 = s463 ? s78 : s458;
  assign s252 = s463 ? s80 : s460;
  assign s256 = {s484, s86};
  assign s257 = s190 + s407;
  assign s258 = s443 ^ s223;
  assign s260 = $signed(s102) * $signed(s365);
  assign s261 = $signed(s103) * $signed(s365);
  assign s262 = s263 [9];
  assign s266 = {s180, s343};
  assign s267 = s268 [14];
  assign s269 = s267 ? s88 : s454;
  assign s270 = s267 ? s89 : s455;
  assign s272 = s232 ? s276 : s345;
  assign s273 = s232 ? s277 : s346;
  assign s274 = s3[63:32];
  assign s275 = s3[31:0];
  assign s278 = s426 ? s40 : s434;
  assign s279 = s299 - s237;
  assign s280 = s186[61:30];
  assign s281 = s187[61:30];
  assign s283 = s284 [26];
  assign s285 = s426 ? s231 : s486;
  assign s287 = s288 [6];
  assign s291 = s292 [27];
  assign s294 = s90 ? s480 : s1;
  assign s295 = s90 ? s481 : s2;
  assign s296 = s482[61:30];
  assign s297 = s483[61:30];
  assign o0 = s41;
  assign s298 = s379[2:0];
  assign s303 = s304 [6];
  assign s307 = s471 + s120;
  assign s312 = s177 ? s33 : s17;
  assign s313 = s177 ? s34 : s18;
  assign s314 = s315 [48];
  assign o1 = s131;
  assign s322 = s445 ? s30 : s360;
  assign s324 = s426 ? s486 : s231;
  assign s328 = {s291, 1'd0};
  assign s329 = s300 + s238;
  assign s331 = s24[3];
  assign s332 = s24[1];
  assign s333 = $signed(s417) * $signed(32'd759250124);
  assign s334 = $signed(s418) * $signed(32'd759250124);
  assign s339 = i1[63:32];
  assign s340 = i1[31:0];
  assign s341 = s328 ^ s38;
  assign s344 = s366 ^ s167;
  assign s345 = s451[63:32];
  assign s346 = s451[31:0];
  assign s347 = s445 ? s39 : s117;
  assign s348 = s351[61:30];
  assign s349 = s352[61:30];
  assign s350 = s101 - s403;
  assign s351 = $signed(s198) * $signed(s364);
  assign s352 = $signed(s197) * $signed(s364);
  assign s353 = s191 - s112;
  assign s354 = s464[61:30];
  assign s355 = s465[61:30];
  assign s356 = s116[63:32];
  assign s357 = s116[31:0];
  assign s358 = s321 + 1'd1;
  assign s362 = s363 [6];
  assign s366 = {s387, 3'd0};
  assign s367 = s100 - s323;
  assign s370 = s371 [3];
  assign s372 = s373 [3];
  assign s374 = s375 [3];
  assign s379 = s380 [11];
  assign s381 = {s342, s59};
  assign s382 = s267 ? s454 : s88;
  assign s383 = s267 ? s455 : s89;
  assign s385 = s45 ? s428 : s211;
  assign s386 = s45 ? s430 : s213;
  assign s388 = s389 [3];
  assign s391 = s390 + 3'd1;
  assign s392 = {s157, s243};
  assign s393 = s394 [2];
  assign s395 = s396 [2];
  assign s399 = s221[3:2];
  assign s400 = s221[3:1];
  assign s401 = s160 - s149;
  assign s402 = s21 ? s168 : s457;
  assign s406 = s426 ? s434 : s40;
  assign s408 = s409 [9];
  assign s410 = s411 [3];
  assign s412 = s413 [3];
  assign next_out = s108;
  assign s419 = s137 ? s391 : s390;
  assign s422 = s423 [3];
  assign s424 = s425 [3];
  assign s426 = s427 [14];
  assign s432 = {s29, s42};
  assign s435 = s436 [2];
  assign s437 = s326 - s69;
  assign s438 = s439 [3];
  assign s440 = s441 [3];
  assign s442 = s21 ? s457 : s168;
  assign s444 = {s203, s416};
  assign s445 = s446 [7];
  assign s447 = s448 [3];
  assign s449 = s35 ? s438 : s370;
  assign s450 = s35 ? s440 : s372;
  assign s452 = reset ? 2'd0 : s60;
  assign s453 = {s318, s319};
  assign s454 = s15[63:32];
  assign s455 = s15[31:0];
  assign s456 = s286 + 2'd1;
  assign s462 = {s330, s239};
  assign s464 = $signed(s335) * $signed(32'd759250124);
  assign s465 = $signed(s336) * $signed(32'd759250124);
  assign s466 = s244 ? s4 : s133;
  assign s467 = s32 + s415;
  assign s468 = s469 [15];
  assign s472 = s244 ? s433 : s63;
  assign s474 = s21 ? s311 : s111;
  assign s477 = s164 ? s5 : s9;
  assign s478 = s164 ? s7 : s11;
  assign s480 = s376[63:32];
  assign s481 = s376[31:0];
  assign s482 = $signed(s103) * $signed(s359);
  assign s483 = $signed(s102) * $signed(s359);
  assign s484 = s485 [15];
  assign s487 = reset ? 1'd0 : s233;
  always @(*)
    case(s362)
      0: s16 = 32'd1073741824;
      1: s16 = 32'd992008094;
      2: s16 = 32'd759250124;
      3: s16 = 32'd410903206;
      4: s16 = 32'd0;
      5: s16 = 32'd3884064090;
      6: s16 = 32'd3535717172;
      7: s16 = 32'd3302959202;
    endcase
  always @(*)
    case(s397)
      0: s19 = 32'd0;
      1: s19 = 32'd209476638;
      2: s19 = 32'd410903206;
      3: s19 = 32'd596538995;
      4: s19 = 32'd759250124;
      5: s19 = 32'd892783698;
      6: s19 = 32'd992008094;
      7: s19 = 32'd1053110175;
      8: s19 = 32'd1073741824;
      9: s19 = 32'd1053110175;
      10: s19 = 32'd992008094;
      11: s19 = 32'd892783698;
      12: s19 = 32'd759250124;
      13: s19 = 32'd596538995;
      14: s19 = 32'd410903206;
      15: s19 = 32'd209476638;
    endcase
  always @(*)
    case(s397)
      0: s20 = 32'd1073741824;
      1: s20 = 32'd1053110175;
      2: s20 = 32'd992008094;
      3: s20 = 32'd892783698;
      4: s20 = 32'd759250124;
      5: s20 = 32'd596538995;
      6: s20 = 32'd410903206;
      7: s20 = 32'd209476638;
      8: s20 = 32'd0;
      9: s20 = 32'd4085490658;
      10: s20 = 32'd3884064090;
      11: s20 = 32'd3698428301;
      12: s20 = 32'd3535717172;
      13: s20 = 32'd3402183598;
      14: s20 = 32'd3302959202;
      15: s20 = 32'd3241857121;
    endcase
  always @(*)
    case(s286)
      0: s44 = s221;
      1: s44 = s256;
      2: s44 = s205;
      3: s44 = s92;
    endcase
  always @(*)
    case(s362)
      0: s189 = 32'd0;
      1: s189 = 32'd410903206;
      2: s189 = 32'd759250124;
      3: s189 = 32'd992008094;
      4: s189 = 32'd1073741824;
      5: s189 = 32'd992008094;
      6: s189 = 32'd759250124;
      7: s189 = 32'd410903206;
    endcase
  always @(*)
    case(s408)
      0: s195 = 32'd0;
      1: s195 = s395;
      2: s195 = s72;
      3: s195 = s395;
    endcase
  always @(*)
    case(s408)
      0: s196 = 32'd0;
      1: s196 = s393;
      2: s196 = s70;
      3: s196 = s393;
    endcase
  always @(*)
    case(s390)
      0: s282 = 4'd0;
      1: s282 = 4'd1;
      2: s282 = 4'd3;
      3: s282 = 4'd7;
      4: s282 = 4'd15;
      5: s282 = 4'd14;
      6: s282 = 4'd12;
      7: s282 = 4'd8;
    endcase
  always @(*)
    case(s408)
      0: s301 = s70;
      1: s301 = s393;
      2: s301 = 32'd0;
      3: s301 = s227;
    endcase
  always @(*)
    case(s408)
      0: s302 = s72;
      1: s302 = s395;
      2: s302 = 32'd0;
      3: s302 = s228;
    endcase
  always @(posedge clk)
    begin
      s3 <= s106;
      s4 <= s179;
      s6 [0] <= s17;
      for (i = 1; i < 6; i = i + 1)
        s6 [i] <= s6 [i - 1];
      s8 [0] <= s18;
      for (i = 1; i < 6; i = i + 1)
        s8 [i] <= s8 [i - 1];
      s10 [0] <= s33;
      for (i = 1; i < 6; i = i + 1)
        s10 [i] <= s10 [i - 1];
      s12 [0] <= s34;
      for (i = 1; i < 6; i = i + 1)
        s12 [i] <= s12 [i - 1];
      s14 [0] <= s479;
      for (i = 1; i < 7; i = i + 1)
        s14 [i] <= s14 [i - 1];
      s15 <= s377;
      s22 [0] <= s199;
      for (i = 1; i < 17; i = i + 1)
        s22 [i] <= s22 [i - 1];
      s24 <= s310;
      s26 [0] <= s354;
      for (i = 1; i < 3; i = i + 1)
        s26 [i] <= s26 [i - 1];
      s28 [0] <= s355;
      for (i = 1; i < 3; i = i + 1)
        s28 [i] <= s28 [i - 1];
      s29 <= s285;
      s30 <= s141;
      s31 <= s301;
      s32 <= s302;
      s36 [0] <= s82;
      for (i = 1; i < 4; i = i + 1)
        s36 [i] <= s36 [i - 1];
      s39 <= s236;
      s40 <= s184;
      s42 <= s278;
      s43 <= s232;
      s46 <= s121;
      s45 <= s46;
      s53 <= s169;
      s54 <= s170;
      s55 <= s404;
      s56 <= s110;
      s59 <= s472;
      s62 [0] <= s24;
      for (i = 1; i < 27; i = i + 1)
        s62 [i] <= s62 [i - 1];
      s63 <= s23;
      s64 <= s153;
      s66 [0] <= s271;
      for (i = 1; i < 3; i = i + 1)
        s66 [i] <= s66 [i - 1];
      s69 <= s130;
      s71 [0] <= s417;
      for (i = 1; i < 3; i = i + 1)
        s71 [i] <= s71 [i - 1];
      s73 [0] <= s418;
      for (i = 1; i < 3; i = i + 1)
        s73 [i] <= s73 [i - 1];
      s74 <= s240;
      s75 <= s241;
      s79 <= s345;
      s78 <= s79;
      s81 <= s346;
      s80 <= s81;
      s83 <= s86;
      s82 <= s83;
      s85 [s113] <= s266;
      s84 <= s85 [s361];
      s87 [0] <= s21;
      for (i = 1; i < 10; i = i + 1)
        s87 [i] <= s87 [i - 1];
      s91 [0] <= s426;
      for (i = 1; i < 8; i = i + 1)
        s91 [i] <= s91 [i - 1];
      s93 <= s269;
      s94 <= s270;
      s99 [s287] <= s392;
      s98 <= s99 [s293];
      s100 <= s158;
      s101 <= s159;
      s102 <= s145;
      s103 <= s146;
      s107 [s303] <= s217;
      s106 <= s107 [s421];
      s109 [0] <= s137;
      for (i = 1; i < 6; i = i + 1)
        s109 [i] <= s109 [i - 1];
      s111 <= s37;
      s112 <= s467;
      s113 <= s361;
      s116 <= s147;
      s117 <= s218;
      s120 <= s329;
      s122 [0] <= s208;
      for (i = 1; i < 22; i = i + 1)
        s122 [i] <= s122 [i - 1];
      s124 [0] <= s215;
      for (i = 1; i < 3; i = i + 1)
        s124 [i] <= s124 [i - 1];
      s126 [0] <= s216;
      for (i = 1; i < 3; i = i + 1)
        s126 [i] <= s126 [i - 1];
      s128 [0] <= s463;
      for (i = 1; i < 40; i = i + 1)
        s128 [i] <= s128 [i - 1];
      s133 <= s206;
      s135 [0] <= s90;
      for (i = 1; i < 4; i = i + 1)
        s135 [i] <= s135 [i - 1];
      s138 [0] <= s468;
      for (i = 1; i < 67; i = i + 1)
        s138 [i] <= s138 [i - 1];
      s144 <= s453;
      s143 <= s144;
      s148 [s181] <= s188;
      s147 <= s148 [s176];
      s150 [0] <= s348;
      for (i = 1; i < 3; i = i + 1)
        s150 [i] <= s150 [i - 1];
      s152 [0] <= s349;
      for (i = 1; i < 3; i = i + 1)
        s152 [i] <= s152 [i - 1];
      s154 [s185] <= s381;
      s153 <= s154 [s473];
      s155 <= s344;
      s156 <= s322;
      s157 <= s347;
      s161 [0] <= s280;
      for (i = 1; i < 3; i = i + 1)
        s161 [i] <= s161 [i - 1];
      s163 [0] <= s281;
      for (i = 1; i < 3; i = i + 1)
        s163 [i] <= s163 [i - 1];
      s165 [0] <= s177;
      for (i = 1; i < 6; i = i + 1)
        s165 [i] <= s165 [i - 1];
      s166 <= s95;
      s168 <= s136;
      s171 <= s98;
      s174 <= s114;
      s175 <= s115;
      s176 <= s258;
      s178 [0] <= s244;
      for (i = 1; i < 6; i = i + 1)
        s178 [i] <= s178 [i - 1];
      s180 <= s250;
      s182 [0] <= s176;
      for (i = 1; i < 7; i = i + 1)
        s182 [i] <= s182 [i - 1];
      s185 <= s473;
      s190 <= s477;
      s191 <= s478;
      s192 <= s475;
      s197 <= s294;
      s198 <= s295;
      s200 [0] <= s267;
      for (i = 1; i < 20; i = i + 1)
        s200 [i] <= s200 [i - 1];
      s201 <= s167;
      s203 <= s474;
      s212 <= s174;
      s211 <= s212;
      s214 <= s175;
      s213 <= s214;
      s222 [0] <= s13;
      for (i = 1; i < 9; i = i + 1)
        s222 [i] <= s222 [i - 1];
      s223 <= s44;
      s226 <= s173;
      s227 <= s193;
      s228 <= s194;
      s230 [0] <= s35;
      for (i = 1; i < 14; i = i + 1)
        s230 [i] <= s230 [i - 1];
      s231 <= s257;
      s232 <= s45;
      s237 <= s96;
      s238 <= s97;
      s239 <= s406;
      s243 <= s224;
      s245 [0] <= s332;
      for (i = 1; i < 28; i = i + 1)
        s245 [i] <= s245 [i - 1];
      s247 [0] <= s296;
      for (i = 1; i < 3; i = i + 1)
        s247 [i] <= s247 [i - 1];
      s249 [0] <= s297;
      for (i = 1; i < 3; i = i + 1)
        s249 [i] <= s249 [i - 1];
      s254 [s435] <= s462;
      s253 <= s254 [s320];
      s255 <= s16;
      s259 <= s289;
      s263 [0] <= s379;
      for (i = 1; i < 10; i = i + 1)
        s263 [i] <= s263 [i - 1];
      s264 <= s49;
      s265 <= s50;
      s268 [0] <= s374;
      for (i = 1; i < 15; i = i + 1)
        s268 [i] <= s268 [i - 1];
      s271 <= s129;
      s276 <= s385;
      s277 <= s386;
      s284 [0] <= s408;
      for (i = 1; i < 27; i = i + 1)
        s284 [i] <= s284 [i - 1];
      s286 <= s452;
      s288 [0] <= s293;
      for (i = 1; i < 7; i = i + 1)
        s288 [i] <= s288 [i - 1];
      s290 [s388] <= s183;
      s289 <= s290 [s155];
      s292 [0] <= s209;
      for (i = 1; i < 28; i = i + 1)
        s292 [i] <= s292 [i - 1];
      s293 <= s223;
      s299 <= s76;
      s300 <= s77;
      s304 [0] <= s421;
      for (i = 1; i < 7; i = i + 1)
        s304 [i] <= s304 [i - 1];
      s305 <= s104;
      s306 <= s105;
      s308 <= s234;
      s309 <= s235;
      s310 <= s142;
      s311 <= s367;
      s315 [0] <= s366;
      for (i = 1; i < 49; i = i + 1)
        s315 [i] <= s315 [i - 1];
      s316 <= s47;
      s317 <= s48;
      s318 <= s57;
      s319 <= s58;
      s320 <= s298;
      s321 <= s487;
      s323 <= s401;
      s325 <= s449;
      s326 <= s450;
      s327 <= s402;
      s330 <= s324;
      s335 <= s312;
      s336 <= s313;
      s337 <= s272;
      s338 <= s273;
      s342 <= s466;
      s343 <= s140;
      s359 <= s19;
      s360 <= s437;
      s361 <= s38;
      s363 [0] <= s435;
      for (i = 1; i < 7; i = i + 1)
        s363 [i] <= s363 [i - 1];
      s364 <= s189;
      s365 <= s20;
      s368 <= s382;
      s369 <= s383;
      s371 [0] <= s51;
      for (i = 1; i < 4; i = i + 1)
        s371 [i] <= s371 [i - 1];
      s373 [0] <= s52;
      for (i = 1; i < 4; i = i + 1)
        s373 [i] <= s373 [i - 1];
      s375 [0] <= s331;
      for (i = 1; i < 4; i = i + 1)
        s375 [i] <= s375 [i - 1];
      s376 <= s253;
      s378 [s447] <= s225;
      s377 <= s378 [s201];
      s380 [0] <= s61;
      for (i = 1; i < 12; i = i + 1)
        s380 [i] <= s380 [i - 1];
      s384 <= s279;
      s387 <= s321;
      s389 [0] <= s155;
      for (i = 1; i < 4; i = i + 1)
        s389 [i] <= s389 [i - 1];
      s390 <= s202;
      s394 [0] <= s67;
      for (i = 1; i < 3; i = i + 1)
        s394 [i] <= s394 [i - 1];
      s396 [0] <= s68;
      for (i = 1; i < 3; i = i + 1)
        s396 [i] <= s396 [i - 1];
      s398 <= s221;
      s397 <= s398;
      s403 <= s204;
      s405 [s65] <= s432;
      s404 <= s405 [s271];
      s407 <= s242;
      s409 [0] <= s113;
      for (i = 1; i < 10; i = i + 1)
        s409 [i] <= s409 [i - 1];
      s411 [0] <= s480;
      for (i = 1; i < 4; i = i + 1)
        s411 [i] <= s411 [i - 1];
      s413 [0] <= s481;
      for (i = 1; i < 4; i = i + 1)
        s413 [i] <= s413 [i - 1];
      s414 <= s195;
      s415 <= s196;
      s416 <= s442;
      s417 <= s335;
      s418 <= s336;
      s420 <= s84;
      s421 <= s132;
      s423 [0] <= s1;
      for (i = 1; i < 4; i = i + 1)
        s423 [i] <= s423 [i - 1];
      s425 [0] <= s2;
      for (i = 1; i < 4; i = i + 1)
        s425 [i] <= s425 [i - 1];
      s427 [0] <= s291;
      for (i = 1; i < 15; i = i + 1)
        s427 [i] <= s427 [i - 1];
      s429 <= s305;
      s428 <= s429;
      s431 <= s306;
      s430 <= s431;
      s433 <= s307;
      s434 <= s353;
      s436 [0] <= s320;
      for (i = 1; i < 3; i = i + 1)
        s436 [i] <= s436 [i - 1];
      s439 [0] <= s274;
      for (i = 1; i < 4; i = i + 1)
        s439 [i] <= s439 [i - 1];
      s441 [0] <= s275;
      for (i = 1; i < 4; i = i + 1)
        s441 [i] <= s441 [i - 1];
      s443 <= s282;
      s446 [0] <= s127;
      for (i = 1; i < 8; i = i + 1)
        s446 [i] <= s446 [i - 1];
      s448 [0] <= s201;
      for (i = 1; i < 4; i = i + 1)
        s448 [i] <= s448 [i - 1];
      s451 <= s139;
      s457 <= s350;
      s459 <= s276;
      s458 <= s459;
      s461 <= s277;
      s460 <= s461;
      s463 <= s43;
      s469 [0] <= next;
      for (i = 1; i < 16; i = i + 1)
        s469 [i] <= s469 [i - 1];
      s470 <= s251;
      s471 <= s252;
      s473 <= s341;
      s476 [s13] <= s444;
      s475 <= s476 [s479];
      s479 <= s262;
      s485 [0] <= s362;
      for (i = 1; i < 16; i = i + 1)
        s485 [i] <= s485 [i - 1];
      s486 <= s210;
    end
endmodule

