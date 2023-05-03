// Latency: 1373
// Gap: 512
// module_name_is:dft_top
module dft_top(clk, reset, next, next_out,
   X0, Y0,
   X1, Y1,
   X2, Y2,
   X3, Y3);

   output next_out;
   input clk, reset, next;

   input [15:0] X0,
      X1,
      X2,
      X3;

   output [15:0] Y0,
      Y1,
      Y2,
      Y3;

   wire [15:0] t0_0;
   wire [15:0] t0_1;
   wire [15:0] t0_2;
   wire [15:0] t0_3;
   wire next_0;
   wire [15:0] t1_0;
   wire [15:0] t1_1;
   wire [15:0] t1_2;
   wire [15:0] t1_3;
   wire next_1;
   wire [15:0] t2_0;
   wire [15:0] t2_1;
   wire [15:0] t2_2;
   wire [15:0] t2_3;
   wire next_2;
   wire [15:0] t3_0;
   wire [15:0] t3_1;
   wire [15:0] t3_2;
   wire [15:0] t3_3;
   wire next_3;
   wire [15:0] t4_0;
   wire [15:0] t4_1;
   wire [15:0] t4_2;
   wire [15:0] t4_3;
   wire next_4;
   wire [15:0] t5_0;
   wire [15:0] t5_1;
   wire [15:0] t5_2;
   wire [15:0] t5_3;
   wire next_5;
   wire [15:0] t6_0;
   wire [15:0] t6_1;
   wire [15:0] t6_2;
   wire [15:0] t6_3;
   wire next_6;
   wire [15:0] t7_0;
   wire [15:0] t7_1;
   wire [15:0] t7_2;
   wire [15:0] t7_3;
   wire next_7;
   wire [15:0] t8_0;
   wire [15:0] t8_1;
   wire [15:0] t8_2;
   wire [15:0] t8_3;
   wire next_8;
   wire [15:0] t9_0;
   wire [15:0] t9_1;
   wire [15:0] t9_2;
   wire [15:0] t9_3;
   wire next_9;
   wire [15:0] t10_0;
   wire [15:0] t10_1;
   wire [15:0] t10_2;
   wire [15:0] t10_3;
   wire next_10;
   wire [15:0] t11_0;
   wire [15:0] t11_1;
   wire [15:0] t11_2;
   wire [15:0] t11_3;
   wire next_11;
   wire [15:0] t12_0;
   wire [15:0] t12_1;
   wire [15:0] t12_2;
   wire [15:0] t12_3;
   wire next_12;
   wire [15:0] t13_0;
   wire [15:0] t13_1;
   wire [15:0] t13_2;
   wire [15:0] t13_3;
   wire next_13;
   wire [15:0] t14_0;
   wire [15:0] t14_1;
   wire [15:0] t14_2;
   wire [15:0] t14_3;
   wire next_14;
   wire [15:0] t15_0;
   wire [15:0] t15_1;
   wire [15:0] t15_2;
   wire [15:0] t15_3;
   wire next_15;
   wire [15:0] t16_0;
   wire [15:0] t16_1;
   wire [15:0] t16_2;
   wire [15:0] t16_3;
   wire next_16;
   wire [15:0] t17_0;
   wire [15:0] t17_1;
   wire [15:0] t17_2;
   wire [15:0] t17_3;
   wire next_17;
   wire [15:0] t18_0;
   wire [15:0] t18_1;
   wire [15:0] t18_2;
   wire [15:0] t18_3;
   wire next_18;
   wire [15:0] t19_0;
   wire [15:0] t19_1;
   wire [15:0] t19_2;
   wire [15:0] t19_3;
   wire next_19;
   wire [15:0] t20_0;
   wire [15:0] t20_1;
   wire [15:0] t20_2;
   wire [15:0] t20_3;
   wire next_20;
   wire [15:0] t21_0;
   wire [15:0] t21_1;
   wire [15:0] t21_2;
   wire [15:0] t21_3;
   wire next_21;
   wire [15:0] t22_0;
   wire [15:0] t22_1;
   wire [15:0] t22_2;
   wire [15:0] t22_3;
   wire next_22;
   wire [15:0] t23_0;
   wire [15:0] t23_1;
   wire [15:0] t23_2;
   wire [15:0] t23_3;
   wire next_23;
   wire [15:0] t24_0;
   wire [15:0] t24_1;
   wire [15:0] t24_2;
   wire [15:0] t24_3;
   wire next_24;
   wire [15:0] t25_0;
   wire [15:0] t25_1;
   wire [15:0] t25_2;
   wire [15:0] t25_3;
   wire next_25;
   wire [15:0] t26_0;
   wire [15:0] t26_1;
   wire [15:0] t26_2;
   wire [15:0] t26_3;
   wire next_26;
   wire [15:0] t27_0;
   wire [15:0] t27_1;
   wire [15:0] t27_2;
   wire [15:0] t27_3;
   wire next_27;
   wire [15:0] t28_0;
   wire [15:0] t28_1;
   wire [15:0] t28_2;
   wire [15:0] t28_3;
   wire next_28;
   wire [15:0] t29_0;
   wire [15:0] t29_1;
   wire [15:0] t29_2;
   wire [15:0] t29_3;
   wire next_29;
   wire [15:0] t30_0;
   wire [15:0] t30_1;
   wire [15:0] t30_2;
   wire [15:0] t30_3;
   wire next_30;
   assign t0_0 = X0;
   assign Y0 = t30_0;
   assign t0_1 = X1;
   assign Y1 = t30_1;
   assign t0_2 = X2;
   assign Y2 = t30_2;
   assign t0_3 = X3;
   assign Y3 = t30_3;
   assign next_0 = next;
   assign next_out = next_30;

// latency=484, gap=512
   rc57490 stage0(.clk(clk), .reset(reset), .next(next_0), .next_out(next_1),
    .X0(t0_0), .Y0(t1_0),
    .X1(t0_1), .Y1(t1_1),
    .X2(t0_2), .Y2(t1_2),
    .X3(t0_3), .Y3(t1_3));


// latency=2, gap=512
   codeBlock57492 stage1(.clk(clk), .reset(reset), .next_in(next_1), .next_out(next_2),
       .X0_in(t1_0), .Y0(t2_0),
       .X1_in(t1_1), .Y1(t2_1),
       .X2_in(t1_2), .Y2(t2_2),
       .X3_in(t1_3), .Y3(t2_3));


// latency=4, gap=512
   rc57573 stage2(.clk(clk), .reset(reset), .next(next_2), .next_out(next_3),
    .X0(t2_0), .Y0(t3_0),
    .X1(t2_1), .Y1(t3_1),
    .X2(t2_2), .Y2(t3_2),
    .X3(t2_3), .Y3(t3_3));


// latency=8, gap=512
   DirSum_57754 stage3(.next(next_3), .clk(clk), .reset(reset), .next_out(next_4),
       .X0(t3_0), .Y0(t4_0),
       .X1(t3_1), .Y1(t4_1),
       .X2(t3_2), .Y2(t4_2),
       .X3(t3_3), .Y3(t4_3));


// latency=2, gap=512
   codeBlock57757 stage4(.clk(clk), .reset(reset), .next_in(next_4), .next_out(next_5),
       .X0_in(t4_0), .Y0(t5_0),
       .X1_in(t4_1), .Y1(t5_1),
       .X2_in(t4_2), .Y2(t5_2),
       .X3_in(t4_3), .Y3(t5_3));


// latency=5, gap=512
   rc57838 stage5(.clk(clk), .reset(reset), .next(next_5), .next_out(next_6),
    .X0(t5_0), .Y0(t6_0),
    .X1(t5_1), .Y1(t6_1),
    .X2(t5_2), .Y2(t6_2),
    .X3(t5_3), .Y3(t6_3));


// latency=8, gap=512
   DirSum_58027 stage6(.next(next_6), .clk(clk), .reset(reset), .next_out(next_7),
       .X0(t6_0), .Y0(t7_0),
       .X1(t6_1), .Y1(t7_1),
       .X2(t6_2), .Y2(t7_2),
       .X3(t6_3), .Y3(t7_3));


// latency=2, gap=512
   codeBlock58030 stage7(.clk(clk), .reset(reset), .next_in(next_7), .next_out(next_8),
       .X0_in(t7_0), .Y0(t8_0),
       .X1_in(t7_1), .Y1(t8_1),
       .X2_in(t7_2), .Y2(t8_2),
       .X3_in(t7_3), .Y3(t8_3));


// latency=7, gap=512
   rc58111 stage8(.clk(clk), .reset(reset), .next(next_8), .next_out(next_9),
    .X0(t8_0), .Y0(t9_0),
    .X1(t8_1), .Y1(t9_1),
    .X2(t8_2), .Y2(t9_2),
    .X3(t8_3), .Y3(t9_3));


// latency=8, gap=512
   DirSum_58316 stage9(.next(next_9), .clk(clk), .reset(reset), .next_out(next_10),
       .X0(t9_0), .Y0(t10_0),
       .X1(t9_1), .Y1(t10_1),
       .X2(t9_2), .Y2(t10_2),
       .X3(t9_3), .Y3(t10_3));


// latency=2, gap=512
   codeBlock58319 stage10(.clk(clk), .reset(reset), .next_in(next_10), .next_out(next_11),
       .X0_in(t10_0), .Y0(t11_0),
       .X1_in(t10_1), .Y1(t11_1),
       .X2_in(t10_2), .Y2(t11_2),
       .X3_in(t10_3), .Y3(t11_3));


// latency=11, gap=512
   rc58400 stage11(.clk(clk), .reset(reset), .next(next_11), .next_out(next_12),
    .X0(t11_0), .Y0(t12_0),
    .X1(t11_1), .Y1(t12_1),
    .X2(t11_2), .Y2(t12_2),
    .X3(t11_3), .Y3(t12_3));


// latency=8, gap=512
   DirSum_58637 stage12(.next(next_12), .clk(clk), .reset(reset), .next_out(next_13),
       .X0(t12_0), .Y0(t13_0),
       .X1(t12_1), .Y1(t13_1),
       .X2(t12_2), .Y2(t13_2),
       .X3(t12_3), .Y3(t13_3));


// latency=2, gap=512
   codeBlock58640 stage13(.clk(clk), .reset(reset), .next_in(next_13), .next_out(next_14),
       .X0_in(t13_0), .Y0(t14_0),
       .X1_in(t13_1), .Y1(t14_1),
       .X2_in(t13_2), .Y2(t14_2),
       .X3_in(t13_3), .Y3(t14_3));


// latency=19, gap=512
   rc58721 stage14(.clk(clk), .reset(reset), .next(next_14), .next_out(next_15),
    .X0(t14_0), .Y0(t15_0),
    .X1(t14_1), .Y1(t15_1),
    .X2(t14_2), .Y2(t15_2),
    .X3(t14_3), .Y3(t15_3));


// latency=8, gap=512
   DirSum_59022 stage15(.next(next_15), .clk(clk), .reset(reset), .next_out(next_16),
       .X0(t15_0), .Y0(t16_0),
       .X1(t15_1), .Y1(t16_1),
       .X2(t15_2), .Y2(t16_2),
       .X3(t15_3), .Y3(t16_3));


// latency=2, gap=512
   codeBlock59025 stage16(.clk(clk), .reset(reset), .next_in(next_16), .next_out(next_17),
       .X0_in(t16_0), .Y0(t17_0),
       .X1_in(t16_1), .Y1(t17_1),
       .X2_in(t16_2), .Y2(t17_2),
       .X3_in(t16_3), .Y3(t17_3));


// latency=35, gap=512
   rc59106 stage17(.clk(clk), .reset(reset), .next(next_17), .next_out(next_18),
    .X0(t17_0), .Y0(t18_0),
    .X1(t17_1), .Y1(t18_1),
    .X2(t17_2), .Y2(t18_2),
    .X3(t17_3), .Y3(t18_3));


// latency=8, gap=512
   DirSum_59535 stage18(.next(next_18), .clk(clk), .reset(reset), .next_out(next_19),
       .X0(t18_0), .Y0(t19_0),
       .X1(t18_1), .Y1(t19_1),
       .X2(t18_2), .Y2(t19_2),
       .X3(t18_3), .Y3(t19_3));


// latency=2, gap=512
   codeBlock59538 stage19(.clk(clk), .reset(reset), .next_in(next_19), .next_out(next_20),
       .X0_in(t19_0), .Y0(t20_0),
       .X1_in(t19_1), .Y1(t20_1),
       .X2_in(t19_2), .Y2(t20_2),
       .X3_in(t19_3), .Y3(t20_3));


// latency=67, gap=512
   rc59619 stage20(.clk(clk), .reset(reset), .next(next_20), .next_out(next_21),
    .X0(t20_0), .Y0(t21_0),
    .X1(t20_1), .Y1(t21_1),
    .X2(t20_2), .Y2(t21_2),
    .X3(t20_3), .Y3(t21_3));


// latency=8, gap=512
   DirSum_60304 stage21(.next(next_21), .clk(clk), .reset(reset), .next_out(next_22),
       .X0(t21_0), .Y0(t22_0),
       .X1(t21_1), .Y1(t22_1),
       .X2(t21_2), .Y2(t22_2),
       .X3(t21_3), .Y3(t22_3));


// latency=2, gap=512
   codeBlock60307 stage22(.clk(clk), .reset(reset), .next_in(next_22), .next_out(next_23),
       .X0_in(t22_0), .Y0(t23_0),
       .X1_in(t22_1), .Y1(t23_1),
       .X2_in(t22_2), .Y2(t23_2),
       .X3_in(t22_3), .Y3(t23_3));


// latency=131, gap=512
   rc60388 stage23(.clk(clk), .reset(reset), .next(next_23), .next_out(next_24),
    .X0(t23_0), .Y0(t24_0),
    .X1(t23_1), .Y1(t24_1),
    .X2(t23_2), .Y2(t24_2),
    .X3(t23_3), .Y3(t24_3));


// latency=8, gap=512
   DirSum_61585 stage24(.next(next_24), .clk(clk), .reset(reset), .next_out(next_25),
       .X0(t24_0), .Y0(t25_0),
       .X1(t24_1), .Y1(t25_1),
       .X2(t24_2), .Y2(t25_2),
       .X3(t24_3), .Y3(t25_3));


// latency=2, gap=512
   codeBlock61588 stage25(.clk(clk), .reset(reset), .next_in(next_25), .next_out(next_26),
       .X0_in(t25_0), .Y0(t26_0),
       .X1_in(t25_1), .Y1(t26_1),
       .X2_in(t25_2), .Y2(t26_2),
       .X3_in(t25_3), .Y3(t26_3));


// latency=259, gap=512
   rc61669 stage26(.clk(clk), .reset(reset), .next(next_26), .next_out(next_27),
    .X0(t26_0), .Y0(t27_0),
    .X1(t26_1), .Y1(t27_1),
    .X2(t26_2), .Y2(t27_2),
    .X3(t26_3), .Y3(t27_3));


// latency=8, gap=512
   DirSum_63889 stage27(.next(next_27), .clk(clk), .reset(reset), .next_out(next_28),
       .X0(t27_0), .Y0(t28_0),
       .X1(t27_1), .Y1(t28_1),
       .X2(t27_2), .Y2(t28_2),
       .X3(t27_3), .Y3(t28_3));


// latency=2, gap=512
   codeBlock63892 stage28(.clk(clk), .reset(reset), .next_in(next_28), .next_out(next_29),
       .X0_in(t28_0), .Y0(t29_0),
       .X1_in(t28_1), .Y1(t29_1),
       .X2_in(t28_2), .Y2(t29_2),
       .X3_in(t28_3), .Y3(t29_3));


// latency=259, gap=512
   rc63973 stage29(.clk(clk), .reset(reset), .next(next_29), .next_out(next_30),
    .X0(t29_0), .Y0(t30_0),
    .X1(t29_1), .Y1(t30_1),
    .X2(t29_2), .Y2(t30_2),
    .X3(t29_3), .Y3(t30_3));
endmodule
