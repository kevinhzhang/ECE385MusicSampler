
// Latency: 484
// Gap: 512
module rc57490(clk, reset, next, next_out,
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

   wire [31:0] t0;
   wire [31:0] s0;
   assign t0 = {X0, X1};
   wire [31:0] t1;
   wire [31:0] s1;
   assign t1 = {X2, X3};
   assign Y0 = s0[31:16];
   assign Y1 = s0[15:0];
   assign Y2 = s1[31:16];
   assign Y3 = s1[15:0];

   perm57488 instPerm65470(.x0(t0), .y0(s0),
    .x1(t1), .y1(s1),
   .clk(clk), .next(next), .next_out(next_out), .reset(reset)
);



endmodule

// Latency: 484
// Gap: 512
module perm57488(clk, next, reset, next_out,
   x0, y0,
   x1, y1);
   parameter numBanks = 2;
   parameter logBanks = 1;
   parameter depth = 512;
   parameter logDepth = 9;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 1'd0};
   assign    addr0b = {outCount, 1'd0};
   assign    addr0c = {outCount_for_rd_addr, 1'd0};
   assign    addr1 = {inCount, 1'd1};
   assign    addr1b = {outCount, 1'd1};
   assign    addr1c = {outCount_for_rd_addr, 1'd1};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_1_0, w_1_1;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    wire [width-1:0] z_1_0, z_1_1;

    wire [logDepth-1:0] u_0_0, u_0_1, u_1_0, u_1_1;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[9] ^ addr0[0];
   assign inAddr0[0] = addr0[8];
   assign inAddr0[1] = addr0[7];
   assign inAddr0[2] = addr0[6];
   assign inAddr0[3] = addr0[5];
   assign inAddr0[4] = addr0[4];
   assign inAddr0[5] = addr0[3];
   assign inAddr0[6] = addr0[2];
   assign inAddr0[7] = addr0[1];
   assign inAddr0[8] = addr0[0];
   assign outBank0[0] = addr0b[9] ^ addr0b[0];
   assign outAddr0[0] = addr0b[1];
   assign outAddr0[1] = addr0b[2];
   assign outAddr0[2] = addr0b[3];
   assign outAddr0[3] = addr0b[4];
   assign outAddr0[4] = addr0b[5];
   assign outAddr0[5] = addr0b[6];
   assign outAddr0[6] = addr0b[7];
   assign outAddr0[7] = addr0b[8];
   assign outAddr0[8] = addr0b[9];
   assign outBank_a0[0] = addr0c[9] ^ addr0c[0];
   assign outAddr_a0[0] = addr0c[1];
   assign outAddr_a0[1] = addr0c[2];
   assign outAddr_a0[2] = addr0c[3];
   assign outAddr_a0[3] = addr0c[4];
   assign outAddr_a0[4] = addr0c[5];
   assign outAddr_a0[5] = addr0c[6];
   assign outAddr_a0[6] = addr0c[7];
   assign outAddr_a0[7] = addr0c[8];
   assign outAddr_a0[8] = addr0c[9];

   assign inBank1[0] = addr1[9] ^ addr1[0];
   assign inAddr1[0] = addr1[8];
   assign inAddr1[1] = addr1[7];
   assign inAddr1[2] = addr1[6];
   assign inAddr1[3] = addr1[5];
   assign inAddr1[4] = addr1[4];
   assign inAddr1[5] = addr1[3];
   assign inAddr1[6] = addr1[2];
   assign inAddr1[7] = addr1[1];
   assign inAddr1[8] = addr1[0];
   assign outBank1[0] = addr1b[9] ^ addr1b[0];
   assign outAddr1[0] = addr1b[1];
   assign outAddr1[1] = addr1b[2];
   assign outAddr1[2] = addr1b[3];
   assign outAddr1[3] = addr1b[4];
   assign outAddr1[4] = addr1b[5];
   assign outAddr1[5] = addr1b[6];
   assign outAddr1[6] = addr1b[7];
   assign outAddr1[7] = addr1b[8];
   assign outAddr1[8] = addr1b[9];
   assign outBank_a1[0] = addr1c[9] ^ addr1c[0];
   assign outAddr_a1[0] = addr1c[1];
   assign outAddr_a1[1] = addr1c[2];
   assign outAddr_a1[2] = addr1c[3];
   assign outAddr_a1[3] = addr1c[4];
   assign outAddr_a1[4] = addr1c[5];
   assign outAddr_a1[5] = addr1c[6];
   assign outAddr_a1[6] = addr1c[7];
   assign outAddr_a1[7] = addr1c[8];
   assign outAddr_a1[8] = addr1c[9];

   nextReg #(482, 9) nextReg_65475(.X(next), .Y(next0), .reset(reset), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_65478(.X(next0), .Y(next_out), .clk(clk));


   memArray1024_57488 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 481)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 483)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
         if (inCount == 481) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 511) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 481)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[8];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[8];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[8];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
endmodule

module memArray1024_57488(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                clk, inFlip, outFlip);

   parameter numBanks = 2;
   parameter logBanks = 1;
   parameter depth = 512;
   parameter logDepth = 9;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   nextReg #(512, 9) nextReg_65483(.X(next), .Y(next0), .reset(reset), .clk(clk));


   memMod #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
endmodule

module nextReg(X, Y, reset, clk);
   parameter depth=2, logDepth=1;

   output Y;
   input X;
   input              clk, reset;
   reg [logDepth:0] count;
   reg                active;

   assign Y = (count == depth) ? 1 : 0;

   always @ (posedge clk) begin
      if (reset == 1) begin
         count <= 0;
         active <= 0;
      end
      else if (X == 1) begin
         active <= 1;
         count <= 1;
      end
      else if (count == depth) begin
         count <= 0;
         active <= 0;
      end
      else if (active)
         count <= count+1;
   end
endmodule


module memMod(in, out, inAddr, outAddr, writeSel, clk);
   
   parameter depth=1024, width=16, logDepth=10;
   
   input [width-1:0]    in;
   input [logDepth-1:0] inAddr, outAddr;
   input 	        writeSel, clk;
   output [width-1:0] 	out;
   reg [width-1:0] 	out;
   
   // synthesis attribute ram_style of mem is block

   reg [width-1:0] 	mem[depth-1:0]; 
   
   always @(posedge clk) begin
      out <= mem[outAddr];
      
      if (writeSel)
        mem[inAddr] <= in;
   end
endmodule 



module memMod_dist(in, out, inAddr, outAddr, writeSel, clk);
   
   parameter depth=1024, width=16, logDepth=10;
   
   input [width-1:0]    in;
   input [logDepth-1:0] inAddr, outAddr;
   input 	        writeSel, clk;
   output [width-1:0] 	out;
   reg [width-1:0] 	out;
   
   // synthesis attribute ram_style of mem is distributed

   reg [width-1:0] 	mem[depth-1:0]; 
   
   always @(posedge clk) begin
      out <= mem[outAddr];
      
      if (writeSel)
        mem[inAddr] <= in;
   end
endmodule 

module switch(ctrl, x0, x1, y0, y1);
    parameter width = 16;
    input [width-1:0] x0, x1;
    output [width-1:0] y0, y1;
    input ctrl;
    assign y0 = (ctrl == 0) ? x0 : x1;
    assign y1 = (ctrl == 0) ? x1 : x0;
endmodule

module shiftRegFIFO(X, Y, clk);
   parameter depth=1, width=1;

   output [width-1:0] Y;
   input  [width-1:0] X;
   input              clk;

   reg [width-1:0]    mem [depth-1:0];
   integer            index;

   assign Y = mem[depth-1];

   always @ (posedge clk) begin
      for(index=1;index<depth;index=index+1) begin
         mem[index] <= mem[index-1];
      end
      mem[0]<=X;
   end
endmodule

// Latency: 2
// Gap: 1
module codeBlock57492(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [15:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [15:0] X0,
      X1,
      X2,
      X3;

   output [15:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_65490(.X(next), .Y(next_out), .clk(clk));


   wire signed [15:0] a550;
   wire signed [15:0] a551;
   wire signed [15:0] a552;
   wire signed [15:0] a553;
   wire signed [15:0] t237;
   wire signed [15:0] t238;
   wire signed [15:0] t239;
   wire signed [15:0] t240;
   wire signed [15:0] Y0;
   wire signed [15:0] Y1;
   wire signed [15:0] Y2;
   wire signed [15:0] Y3;


   assign a550 = X0;
   assign a551 = X2;
   assign a552 = X1;
   assign a553 = X3;
   assign Y0 = t237;
   assign Y1 = t238;
   assign Y2 = t239;
   assign Y3 = t240;

    addfxp #(16, 1) add57504(.a(a550), .b(a551), .clk(clk), .q(t237));    // 0
    addfxp #(16, 1) add57519(.a(a552), .b(a553), .clk(clk), .q(t238));    // 0
    subfxp #(16, 1) sub57534(.a(a550), .b(a551), .clk(clk), .q(t239));    // 0
    subfxp #(16, 1) sub57549(.a(a552), .b(a553), .clk(clk), .q(t240));    // 0


   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
      end
   end
endmodule

// Latency: 4
// Gap: 2
module rc57573(clk, reset, next, next_out,
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

   wire [31:0] t0;
   wire [31:0] s0;
   assign t0 = {X0, X1};
   wire [31:0] t1;
   wire [31:0] s1;
   assign t1 = {X2, X3};
   assign Y0 = s0[31:16];
   assign Y1 = s0[15:0];
   assign Y2 = s1[31:16];
   assign Y3 = s1[15:0];

   perm57571 instPerm65491(.x0(t0), .y0(s0),
    .x1(t1), .y1(s1),
   .clk(clk), .next(next), .next_out(next_out), .reset(reset)
);



endmodule

// Latency: 4
// Gap: 2
module perm57571(clk, next, reset, next_out,
   x0, y0,
   x1, y1);
   parameter numBanks = 2;
   parameter logBanks = 1;
   parameter depth = 2;
   parameter logDepth = 1;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 1'd0};
   assign    addr0b = {outCount, 1'd0};
   assign    addr0c = {outCount_for_rd_addr, 1'd0};
   assign    addr1 = {inCount, 1'd1};
   assign    addr1b = {outCount, 1'd1};
   assign    addr1c = {outCount_for_rd_addr, 1'd1};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_1_0, w_1_1;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    wire [width-1:0] z_1_0, z_1_1;

    wire [logDepth-1:0] u_0_0, u_0_1, u_1_0, u_1_1;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[1] ^ addr0[0];
   assign inAddr0[0] = addr0[0];
   assign outBank0[0] = addr0b[1] ^ addr0b[0];
   assign outAddr0[0] = addr0b[1];
   assign outBank_a0[0] = addr0c[1] ^ addr0c[0];
   assign outAddr_a0[0] = addr0c[1];

   assign inBank1[0] = addr1[1] ^ addr1[0];
   assign inAddr1[0] = addr1[0];
   assign outBank1[0] = addr1b[1] ^ addr1b[0];
   assign outAddr1[0] = addr1b[1];
   assign outBank_a1[0] = addr1c[1] ^ addr1c[0];
   assign outAddr_a1[0] = addr1c[1];

   shiftRegFIFO #(2, 1) shiftFIFO_65494(.X(next), .Y(next0), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_65497(.X(next0), .Y(next_out), .clk(clk));


   memArray4_57571 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .clk(clk));

    reg resetOutCountRd2_2;
    reg resetOutCountRd2_3;

    always @(posedge clk) begin
        if (reset == 1) begin
            resetOutCountRd2_2 <= 0;
            resetOutCountRd2_3 <= 0;
        end
        else begin
            resetOutCountRd2_2 <= (inCount == 1) ? 1'b1 : 1'b0;
            resetOutCountRd2_3 <= resetOutCountRd2_2;
            if (resetOutCountRd2_3 == 1'b1)
                outCount_for_rd_data <= 0;
            else
                outCount_for_rd_data <= outCount_for_rd_data+1;
        end
    end
   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 1)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
         if (inCount == 1) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 1) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 1)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[0];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[0];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[0];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
endmodule

module memArray4_57571(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                clk, inFlip, outFlip);

   parameter numBanks = 2;
   parameter logBanks = 1;
   parameter depth = 2;
   parameter logDepth = 1;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   shiftRegFIFO #(2, 1) shiftFIFO_65500(.X(next), .Y(next0), .clk(clk));


   memMod #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 8
// Gap: 2
module DirSum_57754(clk, reset, next, next_out,
      X0, Y0,
      X1, Y1,
      X2, Y2,
      X3, Y3);

   output next_out;
   input clk, reset, next;

   reg [0:0] i9;

   input [15:0] X0,
      X1,
      X2,
      X3;

   output [15:0] Y0,
      Y1,
      Y2,
      Y3;

   always @(posedge clk) begin
      if (reset == 1) begin
         i9 <= 0;
      end
      else begin
         if (next == 1)
            i9 <= 0;
         else if (i9 == 1)
            i9 <= 0;
         else
            i9 <= i9 + 1;
      end
   end

   codeBlock57576 codeBlockIsnt65501(.clk(clk), .reset(reset), .next_in(next), .next_out(next_out),
.i9_in(i9),
       .X0_in(X0), .Y0(Y0),
       .X1_in(X1), .Y1(Y1),
       .X2_in(X2), .Y2(Y2),
       .X3_in(X3), .Y3(Y3));

endmodule

module D36_57740(addr, out, clk);
   input clk;
   output [15:0] out;
   reg [15:0] out, out2, out3;
   input [0:0] addr;

   always @(posedge clk) begin
      out2 <= out3;
      out <= out2;
   case(addr)
      0: out3 <= 16'h0;
      1: out3 <= 16'hc000;
      default: out3 <= 0;
   endcase
   end
// synthesis attribute rom_style of out3 is "block"
endmodule



module D34_57748(addr, out, clk);
   input clk;
   output [15:0] out;
   reg [15:0] out, out2, out3;
   input [0:0] addr;

   always @(posedge clk) begin
      out2 <= out3;
      out <= out2;
   case(addr)
      0: out3 <= 16'h4000;
      1: out3 <= 16'h0;
      default: out3 <= 0;
   endcase
   end
// synthesis attribute rom_style of out3 is "block"
endmodule



// Latency: 8
// Gap: 1
module codeBlock57576(clk, reset, next_in, next_out,
   i9_in,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;
   input [0:0] i9_in;
   reg [0:0] i9;

   input [15:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [15:0] X0,
      X1,
      X2,
      X3;

   output [15:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(7, 1) shiftFIFO_65504(.X(next), .Y(next_out), .clk(clk));


   wire signed [15:0] a534;
   wire signed [15:0] a523;
   wire signed [15:0] a537;
   wire signed [15:0] a527;
   wire signed [15:0] a538;
   wire signed [15:0] a539;
   reg signed [15:0] tm234;
   reg signed [15:0] tm238;
   reg signed [15:0] tm250;
   reg signed [15:0] tm257;
   reg signed [15:0] tm235;
   reg signed [15:0] tm239;
   reg signed [15:0] tm251;
   reg signed [15:0] tm258;
   wire signed [15:0] tm2;
   wire signed [15:0] a528;
   wire signed [15:0] tm3;
   wire signed [15:0] a530;
   reg signed [15:0] tm236;
   reg signed [15:0] tm240;
   reg signed [15:0] tm252;
   reg signed [15:0] tm259;
   reg signed [15:0] tm40;
   reg signed [15:0] tm41;
   reg signed [15:0] tm237;
   reg signed [15:0] tm241;
   reg signed [15:0] tm253;
   reg signed [15:0] tm260;
   reg signed [15:0] tm254;
   reg signed [15:0] tm261;
   wire signed [15:0] a529;
   wire signed [15:0] a531;
   wire signed [15:0] a532;
   wire signed [15:0] a533;
   reg signed [15:0] tm255;
   reg signed [15:0] tm262;
   wire signed [15:0] Y0;
   wire signed [15:0] Y1;
   wire signed [15:0] Y2;
   wire signed [15:0] Y3;
   reg signed [15:0] tm256;
   reg signed [15:0] tm263;


   assign a534 = X0;
   assign a523 = a534;
   assign a537 = X1;
   assign a527 = a537;
   assign a538 = X2;
   assign a539 = X3;
   assign a528 = tm2;
   assign a530 = tm3;
   assign Y0 = tm256;
   assign Y1 = tm263;

   D36_57740 instD36inst0_57740(.addr(i9[0:0]), .out(tm3), .clk(clk));

   D34_57748 instD34inst0_57748(.addr(i9[0:0]), .out(tm2), .clk(clk));

    multfix #(16, 2) m57675(.a(tm40), .b(tm237), .clk(clk), .q_sc(a529), .q_unsc(), .rst(reset));
    multfix #(16, 2) m57697(.a(tm41), .b(tm241), .clk(clk), .q_sc(a531), .q_unsc(), .rst(reset));
    multfix #(16, 2) m57715(.a(tm41), .b(tm237), .clk(clk), .q_sc(a532), .q_unsc(), .rst(reset));
    multfix #(16, 2) m57726(.a(tm40), .b(tm241), .clk(clk), .q_sc(a533), .q_unsc(), .rst(reset));
    subfxp #(16, 1) sub57704(.a(a529), .b(a531), .clk(clk), .q(Y2));    // 6
    addfxp #(16, 1) add57733(.a(a532), .b(a533), .clk(clk), .q(Y3));    // 6


   always @(posedge clk) begin
      if (reset == 1) begin
         tm40 <= 0;
         tm237 <= 0;
         tm41 <= 0;
         tm241 <= 0;
         tm41 <= 0;
         tm237 <= 0;
         tm40 <= 0;
         tm241 <= 0;
      end
      else begin
         i9 <= i9_in;
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         tm234 <= a538;
         tm238 <= a539;
         tm250 <= a523;
         tm257 <= a527;
         tm235 <= tm234;
         tm239 <= tm238;
         tm251 <= tm250;
         tm258 <= tm257;
         tm236 <= tm235;
         tm240 <= tm239;
         tm252 <= tm251;
         tm259 <= tm258;
         tm40 <= a528;
         tm41 <= a530;
         tm237 <= tm236;
         tm241 <= tm240;
         tm253 <= tm252;
         tm260 <= tm259;
         tm254 <= tm253;
         tm261 <= tm260;
         tm255 <= tm254;
         tm262 <= tm261;
         tm256 <= tm255;
         tm263 <= tm262;
      end
   end
endmodule

// Latency: 2
// Gap: 1
module codeBlock57757(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [15:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [15:0] X0,
      X1,
      X2,
      X3;

   output [15:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_65507(.X(next), .Y(next_out), .clk(clk));


   wire signed [15:0] a490;
   wire signed [15:0] a491;
   wire signed [15:0] a492;
   wire signed [15:0] a493;
   wire signed [15:0] t213;
   wire signed [15:0] t214;
   wire signed [15:0] t215;
   wire signed [15:0] t216;
   wire signed [15:0] Y0;
   wire signed [15:0] Y1;
   wire signed [15:0] Y2;
   wire signed [15:0] Y3;


   assign a490 = X0;
   assign a491 = X2;
   assign a492 = X1;
   assign a493 = X3;
   assign Y0 = t213;
   assign Y1 = t214;
   assign Y2 = t215;
   assign Y3 = t216;

    addfxp #(16, 1) add57769(.a(a490), .b(a491), .clk(clk), .q(t213));    // 0
    addfxp #(16, 1) add57784(.a(a492), .b(a493), .clk(clk), .q(t214));    // 0
    subfxp #(16, 1) sub57799(.a(a490), .b(a491), .clk(clk), .q(t215));    // 0
    subfxp #(16, 1) sub57814(.a(a492), .b(a493), .clk(clk), .q(t216));    // 0


   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
      end
   end
endmodule

// Latency: 5
// Gap: 4
module rc57838(clk, reset, next, next_out,
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

   wire [31:0] t0;
   wire [31:0] s0;
   assign t0 = {X0, X1};
   wire [31:0] t1;
   wire [31:0] s1;
   assign t1 = {X2, X3};
   assign Y0 = s0[31:16];
   assign Y1 = s0[15:0];
   assign Y2 = s1[31:16];
   assign Y3 = s1[15:0];

   perm57836 instPerm65508(.x0(t0), .y0(s0),
    .x1(t1), .y1(s1),
   .clk(clk), .next(next), .next_out(next_out), .reset(reset)
);



endmodule

// Latency: 5
// Gap: 4
module perm57836(clk, next, reset, next_out,
   x0, y0,
   x1, y1);
   parameter numBanks = 2;
   parameter logBanks = 1;
   parameter depth = 4;
   parameter logDepth = 2;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 1'd0};
   assign    addr0b = {outCount, 1'd0};
   assign    addr0c = {outCount_for_rd_addr, 1'd0};
   assign    addr1 = {inCount, 1'd1};
   assign    addr1b = {outCount, 1'd1};
   assign    addr1c = {outCount_for_rd_addr, 1'd1};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_1_0, w_1_1;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    wire [width-1:0] z_1_0, z_1_1;

    wire [logDepth-1:0] u_0_0, u_0_1, u_1_0, u_1_1;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[2] ^ addr0[0];
   assign inAddr0[0] = addr0[1];
   assign inAddr0[1] = addr0[0];
   assign outBank0[0] = addr0b[2] ^ addr0b[0];
   assign outAddr0[0] = addr0b[1];
   assign outAddr0[1] = addr0b[2];
   assign outBank_a0[0] = addr0c[2] ^ addr0c[0];
   assign outAddr_a0[0] = addr0c[1];
   assign outAddr_a0[1] = addr0c[2];

   assign inBank1[0] = addr1[2] ^ addr1[0];
   assign inAddr1[0] = addr1[1];
   assign inAddr1[1] = addr1[0];
   assign outBank1[0] = addr1b[2] ^ addr1b[0];
   assign outAddr1[0] = addr1b[1];
   assign outAddr1[1] = addr1b[2];
   assign outBank_a1[0] = addr1c[2] ^ addr1c[0];
   assign outAddr_a1[0] = addr1c[1];
   assign outAddr_a1[1] = addr1c[2];

   shiftRegFIFO #(3, 1) shiftFIFO_65511(.X(next), .Y(next0), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_65514(.X(next0), .Y(next_out), .clk(clk));


   memArray8_57836 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .clk(clk));

    reg resetOutCountRd2_4;

    always @(posedge clk) begin
        if (reset == 1) begin
            resetOutCountRd2_4 <= 0;
        end
        else begin
            resetOutCountRd2_4 <= (inCount == 3) ? 1'b1 : 1'b0;
            if (resetOutCountRd2_4 == 1'b1)
                outCount_for_rd_data <= 0;
            else
                outCount_for_rd_data <= outCount_for_rd_data+1;
        end
    end
   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 2)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
         if (inCount == 2) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 3) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 2)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[1];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[1];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[1];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
endmodule

module memArray8_57836(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                clk, inFlip, outFlip);

   parameter numBanks = 2;
   parameter logBanks = 1;
   parameter depth = 4;
   parameter logDepth = 2;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   shiftRegFIFO #(4, 1) shiftFIFO_65517(.X(next), .Y(next0), .clk(clk));


   memMod #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 8
// Gap: 4
module DirSum_58027(clk, reset, next, next_out,
      X0, Y0,
      X1, Y1,
      X2, Y2,
      X3, Y3);

   output next_out;
   input clk, reset, next;

   reg [1:0] i8;

   input [15:0] X0,
      X1,
      X2,
      X3;

   output [15:0] Y0,
      Y1,
      Y2,
      Y3;

   always @(posedge clk) begin
      if (reset == 1) begin
         i8 <= 0;
      end
      else begin
         if (next == 1)
            i8 <= 0;
         else if (i8 == 3)
            i8 <= 0;
         else
            i8 <= i8 + 1;
      end
   end

   codeBlock57841 codeBlockIsnt65518(.clk(clk), .reset(reset), .next_in(next), .next_out(next_out),
.i8_in(i8),
       .X0_in(X0), .Y0(Y0),
       .X1_in(X1), .Y1(Y1),
       .X2_in(X2), .Y2(Y2),
       .X3_in(X3), .Y3(Y3));

endmodule

module D32_58007(addr, out, clk);
   input clk;
   output [15:0] out;
   reg [15:0] out, out2, out3;
   input [1:0] addr;

   always @(posedge clk) begin
      out2 <= out3;
      out <= out2;
   case(addr)
      0: out3 <= 16'h0;
      1: out3 <= 16'hd2bf;
      2: out3 <= 16'hc000;
      3: out3 <= 16'hd2bf;
      default: out3 <= 0;
   endcase
   end
// synthesis attribute rom_style of out3 is "block"
endmodule



module D30_58019(addr, out, clk);
   input clk;
   output [15:0] out;
   reg [15:0] out, out2, out3;
   input [1:0] addr;

   always @(posedge clk) begin
      out2 <= out3;
      out <= out2;
   case(addr)
      0: out3 <= 16'h4000;
      1: out3 <= 16'h2d41;
      2: out3 <= 16'h0;
      3: out3 <= 16'hd2bf;
      default: out3 <= 0;
   endcase
   end
// synthesis attribute rom_style of out3 is "block"
endmodule



// Latency: 8
// Gap: 1
module codeBlock57841(clk, reset, next_in, next_out,
   i8_in,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;
   input [1:0] i8_in;
   reg [1:0] i8;

   input [15:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [15:0] X0,
      X1,
      X2,
      X3;

   output [15:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(7, 1) shiftFIFO_65521(.X(next), .Y(next_out), .clk(clk));


   wire signed [15:0] a474;
   wire signed [15:0] a463;
   wire signed [15:0] a477;
   wire signed [15:0] a467;
   wire signed [15:0] a478;
   wire signed [15:0] a479;
   reg signed [15:0] tm264;
   reg signed [15:0] tm268;
   reg signed [15:0] tm280;
   reg signed [15:0] tm287;
   reg signed [15:0] tm265;
   reg signed [15:0] tm269;
   reg signed [15:0] tm281;
   reg signed [15:0] tm288;
   wire signed [15:0] tm6;
   wire signed [15:0] a468;
   wire signed [15:0] tm7;
   wire signed [15:0] a470;
   reg signed [15:0] tm266;
   reg signed [15:0] tm270;
   reg signed [15:0] tm282;
   reg signed [15:0] tm289;
   reg signed [15:0] tm48;
   reg signed [15:0] tm49;
   reg signed [15:0] tm267;
   reg signed [15:0] tm271;
   reg signed [15:0] tm283;
   reg signed [15:0] tm290;
   reg signed [15:0] tm284;
   reg signed [15:0] tm291;
   wire signed [15:0] a469;
   wire signed [15:0] a471;
   wire signed [15:0] a472;
   wire signed [15:0] a473;
   reg signed [15:0] tm285;
   reg signed [15:0] tm292;
   wire signed [15:0] Y0;
   wire signed [15:0] Y1;
   wire signed [15:0] Y2;
   wire signed [15:0] Y3;
   reg signed [15:0] tm286;
   reg signed [15:0] tm293;


   assign a474 = X0;
   assign a463 = a474;
   assign a477 = X1;
   assign a467 = a477;
   assign a478 = X2;
   assign a479 = X3;
   assign a468 = tm6;
   assign a470 = tm7;
   assign Y0 = tm286;
   assign Y1 = tm293;

   D32_58007 instD32inst0_58007(.addr(i8[1:0]), .out(tm7), .clk(clk));

   D30_58019 instD30inst0_58019(.addr(i8[1:0]), .out(tm6), .clk(clk));

    multfix #(16, 2) m57940(.a(tm48), .b(tm267), .clk(clk), .q_sc(a469), .q_unsc(), .rst(reset));
    multfix #(16, 2) m57962(.a(tm49), .b(tm271), .clk(clk), .q_sc(a471), .q_unsc(), .rst(reset));
    multfix #(16, 2) m57980(.a(tm49), .b(tm267), .clk(clk), .q_sc(a472), .q_unsc(), .rst(reset));
    multfix #(16, 2) m57991(.a(tm48), .b(tm271), .clk(clk), .q_sc(a473), .q_unsc(), .rst(reset));
    subfxp #(16, 1) sub57969(.a(a469), .b(a471), .clk(clk), .q(Y2));    // 6
    addfxp #(16, 1) add57998(.a(a472), .b(a473), .clk(clk), .q(Y3));    // 6


   always @(posedge clk) begin
      if (reset == 1) begin
         tm48 <= 0;
         tm267 <= 0;
         tm49 <= 0;
         tm271 <= 0;
         tm49 <= 0;
         tm267 <= 0;
         tm48 <= 0;
         tm271 <= 0;
      end
      else begin
         i8 <= i8_in;
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         tm264 <= a478;
         tm268 <= a479;
         tm280 <= a463;
         tm287 <= a467;
         tm265 <= tm264;
         tm269 <= tm268;
         tm281 <= tm280;
         tm288 <= tm287;
         tm266 <= tm265;
         tm270 <= tm269;
         tm282 <= tm281;
         tm289 <= tm288;
         tm48 <= a468;
         tm49 <= a470;
         tm267 <= tm266;
         tm271 <= tm270;
         tm283 <= tm282;
         tm290 <= tm289;
         tm284 <= tm283;
         tm291 <= tm290;
         tm285 <= tm284;
         tm292 <= tm291;
         tm286 <= tm285;
         tm293 <= tm292;
      end
   end
endmodule

// Latency: 2
// Gap: 1
module codeBlock58030(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [15:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [15:0] X0,
      X1,
      X2,
      X3;

   output [15:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_65524(.X(next), .Y(next_out), .clk(clk));


   wire signed [15:0] a430;
   wire signed [15:0] a431;
   wire signed [15:0] a432;
   wire signed [15:0] a433;
   wire signed [15:0] t189;
   wire signed [15:0] t190;
   wire signed [15:0] t191;
   wire signed [15:0] t192;
   wire signed [15:0] Y0;
   wire signed [15:0] Y1;
   wire signed [15:0] Y2;
   wire signed [15:0] Y3;


   assign a430 = X0;
   assign a431 = X2;
   assign a432 = X1;
   assign a433 = X3;
   assign Y0 = t189;
   assign Y1 = t190;
   assign Y2 = t191;
   assign Y3 = t192;

    addfxp #(16, 1) add58042(.a(a430), .b(a431), .clk(clk), .q(t189));    // 0
    addfxp #(16, 1) add58057(.a(a432), .b(a433), .clk(clk), .q(t190));    // 0
    subfxp #(16, 1) sub58072(.a(a430), .b(a431), .clk(clk), .q(t191));    // 0
    subfxp #(16, 1) sub58087(.a(a432), .b(a433), .clk(clk), .q(t192));    // 0


   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
      end
   end
endmodule

// Latency: 7
// Gap: 8
module rc58111(clk, reset, next, next_out,
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

   wire [31:0] t0;
   wire [31:0] s0;
   assign t0 = {X0, X1};
   wire [31:0] t1;
   wire [31:0] s1;
   assign t1 = {X2, X3};
   assign Y0 = s0[31:16];
   assign Y1 = s0[15:0];
   assign Y2 = s1[31:16];
   assign Y3 = s1[15:0];

   perm58109 instPerm65525(.x0(t0), .y0(s0),
    .x1(t1), .y1(s1),
   .clk(clk), .next(next), .next_out(next_out), .reset(reset)
);



endmodule

// Latency: 7
// Gap: 8
module perm58109(clk, next, reset, next_out,
   x0, y0,
   x1, y1);
   parameter numBanks = 2;
   parameter logBanks = 1;
   parameter depth = 8;
   parameter logDepth = 3;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 1'd0};
   assign    addr0b = {outCount, 1'd0};
   assign    addr0c = {outCount_for_rd_addr, 1'd0};
   assign    addr1 = {inCount, 1'd1};
   assign    addr1b = {outCount, 1'd1};
   assign    addr1c = {outCount_for_rd_addr, 1'd1};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_1_0, w_1_1;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    wire [width-1:0] z_1_0, z_1_1;

    wire [logDepth-1:0] u_0_0, u_0_1, u_1_0, u_1_1;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[3] ^ addr0[0];
   assign inAddr0[0] = addr0[1];
   assign inAddr0[1] = addr0[2];
   assign inAddr0[2] = addr0[0];
   assign outBank0[0] = addr0b[3] ^ addr0b[0];
   assign outAddr0[0] = addr0b[1];
   assign outAddr0[1] = addr0b[2];
   assign outAddr0[2] = addr0b[3];
   assign outBank_a0[0] = addr0c[3] ^ addr0c[0];
   assign outAddr_a0[0] = addr0c[1];
   assign outAddr_a0[1] = addr0c[2];
   assign outAddr_a0[2] = addr0c[3];

   assign inBank1[0] = addr1[3] ^ addr1[0];
   assign inAddr1[0] = addr1[1];
   assign inAddr1[1] = addr1[2];
   assign inAddr1[2] = addr1[0];
   assign outBank1[0] = addr1b[3] ^ addr1b[0];
   assign outAddr1[0] = addr1b[1];
   assign outAddr1[1] = addr1b[2];
   assign outAddr1[2] = addr1b[3];
   assign outBank_a1[0] = addr1c[3] ^ addr1c[0];
   assign outAddr_a1[0] = addr1c[1];
   assign outAddr_a1[1] = addr1c[2];
   assign outAddr_a1[2] = addr1c[3];

   shiftRegFIFO #(5, 1) shiftFIFO_65528(.X(next), .Y(next0), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_65531(.X(next0), .Y(next_out), .clk(clk));


   memArray16_58109 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 4)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 6)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
         if (inCount == 4) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 7) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 4)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[2];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[2];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[2];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
endmodule

module memArray16_58109(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                clk, inFlip, outFlip);

   parameter numBanks = 2;
   parameter logBanks = 1;
   parameter depth = 8;
   parameter logDepth = 3;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   shiftRegFIFO #(8, 1) shiftFIFO_65534(.X(next), .Y(next0), .clk(clk));


   memMod #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 8
// Gap: 8
module DirSum_58316(clk, reset, next, next_out,
      X0, Y0,
      X1, Y1,
      X2, Y2,
      X3, Y3);

   output next_out;
   input clk, reset, next;

   reg [2:0] i7;

   input [15:0] X0,
      X1,
      X2,
      X3;

   output [15:0] Y0,
      Y1,
      Y2,
      Y3;

   always @(posedge clk) begin
      if (reset == 1) begin
         i7 <= 0;
      end
      else begin
         if (next == 1)
            i7 <= 0;
         else if (i7 == 7)
            i7 <= 0;
         else
            i7 <= i7 + 1;
      end
   end

   codeBlock58114 codeBlockIsnt65535(.clk(clk), .reset(reset), .next_in(next), .next_out(next_out),
.i7_in(i7),
       .X0_in(X0), .Y0(Y0),
       .X1_in(X1), .Y1(Y1),
       .X2_in(X2), .Y2(Y2),
       .X3_in(X3), .Y3(Y3));

endmodule

module D28_58284(addr, out, clk);
   input clk;
   output [15:0] out;
   reg [15:0] out, out2, out3;
   input [2:0] addr;

   always @(posedge clk) begin
      out2 <= out3;
      out <= out2;
   case(addr)
      0: out3 <= 16'h0;
      1: out3 <= 16'he782;
      2: out3 <= 16'hd2bf;
      3: out3 <= 16'hc4df;
      4: out3 <= 16'hc000;
      5: out3 <= 16'hc4df;
      6: out3 <= 16'hd2bf;
      7: out3 <= 16'he782;
      default: out3 <= 0;
   endcase
   end
// synthesis attribute rom_style of out3 is "block"
endmodule



module D26_58304(addr, out, clk);
   input clk;
   output [15:0] out;
   reg [15:0] out, out2, out3;
   input [2:0] addr;

   always @(posedge clk) begin
      out2 <= out3;
      out <= out2;
   case(addr)
      0: out3 <= 16'h4000;
      1: out3 <= 16'h3b21;
      2: out3 <= 16'h2d41;
      3: out3 <= 16'h187e;
      4: out3 <= 16'h0;
      5: out3 <= 16'he782;
      6: out3 <= 16'hd2bf;
      7: out3 <= 16'hc4df;
      default: out3 <= 0;
   endcase
   end
// synthesis attribute rom_style of out3 is "block"
endmodule



// Latency: 8
// Gap: 1
module codeBlock58114(clk, reset, next_in, next_out,
   i7_in,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;
   input [2:0] i7_in;
   reg [2:0] i7;

   input [15:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [15:0] X0,
      X1,
      X2,
      X3;

   output [15:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(7, 1) shiftFIFO_65538(.X(next), .Y(next_out), .clk(clk));


   wire signed [15:0] a414;
   wire signed [15:0] a403;
   wire signed [15:0] a417;
   wire signed [15:0] a407;
   wire signed [15:0] a418;
   wire signed [15:0] a419;
   reg signed [15:0] tm294;
   reg signed [15:0] tm298;
   reg signed [15:0] tm310;
   reg signed [15:0] tm317;
   reg signed [15:0] tm295;
   reg signed [15:0] tm299;
   reg signed [15:0] tm311;
   reg signed [15:0] tm318;
   wire signed [15:0] tm10;
   wire signed [15:0] a408;
   wire signed [15:0] tm11;
   wire signed [15:0] a410;
   reg signed [15:0] tm296;
   reg signed [15:0] tm300;
   reg signed [15:0] tm312;
   reg signed [15:0] tm319;
   reg signed [15:0] tm56;
   reg signed [15:0] tm57;
   reg signed [15:0] tm297;
   reg signed [15:0] tm301;
   reg signed [15:0] tm313;
   reg signed [15:0] tm320;
   reg signed [15:0] tm314;
   reg signed [15:0] tm321;
   wire signed [15:0] a409;
   wire signed [15:0] a411;
   wire signed [15:0] a412;
   wire signed [15:0] a413;
   reg signed [15:0] tm315;
   reg signed [15:0] tm322;
   wire signed [15:0] Y0;
   wire signed [15:0] Y1;
   wire signed [15:0] Y2;
   wire signed [15:0] Y3;
   reg signed [15:0] tm316;
   reg signed [15:0] tm323;


   assign a414 = X0;
   assign a403 = a414;
   assign a417 = X1;
   assign a407 = a417;
   assign a418 = X2;
   assign a419 = X3;
   assign a408 = tm10;
   assign a410 = tm11;
   assign Y0 = tm316;
   assign Y1 = tm323;

   D28_58284 instD28inst0_58284(.addr(i7[2:0]), .out(tm11), .clk(clk));

   D26_58304 instD26inst0_58304(.addr(i7[2:0]), .out(tm10), .clk(clk));

    multfix #(16, 2) m58213(.a(tm56), .b(tm297), .clk(clk), .q_sc(a409), .q_unsc(), .rst(reset));
    multfix #(16, 2) m58235(.a(tm57), .b(tm301), .clk(clk), .q_sc(a411), .q_unsc(), .rst(reset));
    multfix #(16, 2) m58253(.a(tm57), .b(tm297), .clk(clk), .q_sc(a412), .q_unsc(), .rst(reset));
    multfix #(16, 2) m58264(.a(tm56), .b(tm301), .clk(clk), .q_sc(a413), .q_unsc(), .rst(reset));
    subfxp #(16, 1) sub58242(.a(a409), .b(a411), .clk(clk), .q(Y2));    // 6
    addfxp #(16, 1) add58271(.a(a412), .b(a413), .clk(clk), .q(Y3));    // 6


   always @(posedge clk) begin
      if (reset == 1) begin
         tm56 <= 0;
         tm297 <= 0;
         tm57 <= 0;
         tm301 <= 0;
         tm57 <= 0;
         tm297 <= 0;
         tm56 <= 0;
         tm301 <= 0;
      end
      else begin
         i7 <= i7_in;
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         tm294 <= a418;
         tm298 <= a419;
         tm310 <= a403;
         tm317 <= a407;
         tm295 <= tm294;
         tm299 <= tm298;
         tm311 <= tm310;
         tm318 <= tm317;
         tm296 <= tm295;
         tm300 <= tm299;
         tm312 <= tm311;
         tm319 <= tm318;
         tm56 <= a408;
         tm57 <= a410;
         tm297 <= tm296;
         tm301 <= tm300;
         tm313 <= tm312;
         tm320 <= tm319;
         tm314 <= tm313;
         tm321 <= tm320;
         tm315 <= tm314;
         tm322 <= tm321;
         tm316 <= tm315;
         tm323 <= tm322;
      end
   end
endmodule

// Latency: 2
// Gap: 1
module codeBlock58319(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [15:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [15:0] X0,
      X1,
      X2,
      X3;

   output [15:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_65541(.X(next), .Y(next_out), .clk(clk));


   wire signed [15:0] a369;
   wire signed [15:0] a370;
   wire signed [15:0] a371;
   wire signed [15:0] a372;
   wire signed [15:0] t165;
   wire signed [15:0] t166;
   wire signed [15:0] t167;
   wire signed [15:0] t168;
   wire signed [15:0] Y0;
   wire signed [15:0] Y1;
   wire signed [15:0] Y2;
   wire signed [15:0] Y3;


   assign a369 = X0;
   assign a370 = X2;
   assign a371 = X1;
   assign a372 = X3;
   assign Y0 = t165;
   assign Y1 = t166;
   assign Y2 = t167;
   assign Y3 = t168;

    addfxp #(16, 1) add58331(.a(a369), .b(a370), .clk(clk), .q(t165));    // 0
    addfxp #(16, 1) add58346(.a(a371), .b(a372), .clk(clk), .q(t166));    // 0
    subfxp #(16, 1) sub58361(.a(a369), .b(a370), .clk(clk), .q(t167));    // 0
    subfxp #(16, 1) sub58376(.a(a371), .b(a372), .clk(clk), .q(t168));    // 0


   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
      end
   end
endmodule

// Latency: 11
// Gap: 16
module rc58400(clk, reset, next, next_out,
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

   wire [31:0] t0;
   wire [31:0] s0;
   assign t0 = {X0, X1};
   wire [31:0] t1;
   wire [31:0] s1;
   assign t1 = {X2, X3};
   assign Y0 = s0[31:16];
   assign Y1 = s0[15:0];
   assign Y2 = s1[31:16];
   assign Y3 = s1[15:0];

   perm58398 instPerm65542(.x0(t0), .y0(s0),
    .x1(t1), .y1(s1),
   .clk(clk), .next(next), .next_out(next_out), .reset(reset)
);



endmodule

// Latency: 11
// Gap: 16
module perm58398(clk, next, reset, next_out,
   x0, y0,
   x1, y1);
   parameter numBanks = 2;
   parameter logBanks = 1;
   parameter depth = 16;
   parameter logDepth = 4;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 1'd0};
   assign    addr0b = {outCount, 1'd0};
   assign    addr0c = {outCount_for_rd_addr, 1'd0};
   assign    addr1 = {inCount, 1'd1};
   assign    addr1b = {outCount, 1'd1};
   assign    addr1c = {outCount_for_rd_addr, 1'd1};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_1_0, w_1_1;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    wire [width-1:0] z_1_0, z_1_1;

    wire [logDepth-1:0] u_0_0, u_0_1, u_1_0, u_1_1;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[4] ^ addr0[0];
   assign inAddr0[0] = addr0[1];
   assign inAddr0[1] = addr0[2];
   assign inAddr0[2] = addr0[3];
   assign inAddr0[3] = addr0[0];
   assign outBank0[0] = addr0b[4] ^ addr0b[0];
   assign outAddr0[0] = addr0b[1];
   assign outAddr0[1] = addr0b[2];
   assign outAddr0[2] = addr0b[3];
   assign outAddr0[3] = addr0b[4];
   assign outBank_a0[0] = addr0c[4] ^ addr0c[0];
   assign outAddr_a0[0] = addr0c[1];
   assign outAddr_a0[1] = addr0c[2];
   assign outAddr_a0[2] = addr0c[3];
   assign outAddr_a0[3] = addr0c[4];

   assign inBank1[0] = addr1[4] ^ addr1[0];
   assign inAddr1[0] = addr1[1];
   assign inAddr1[1] = addr1[2];
   assign inAddr1[2] = addr1[3];
   assign inAddr1[3] = addr1[0];
   assign outBank1[0] = addr1b[4] ^ addr1b[0];
   assign outAddr1[0] = addr1b[1];
   assign outAddr1[1] = addr1b[2];
   assign outAddr1[2] = addr1b[3];
   assign outAddr1[3] = addr1b[4];
   assign outBank_a1[0] = addr1c[4] ^ addr1c[0];
   assign outAddr_a1[0] = addr1c[1];
   assign outAddr_a1[1] = addr1c[2];
   assign outAddr_a1[2] = addr1c[3];
   assign outAddr_a1[3] = addr1c[4];

   nextReg #(9, 4) nextReg_65547(.X(next), .Y(next0), .reset(reset), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_65550(.X(next0), .Y(next_out), .clk(clk));


   memArray32_58398 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 8)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 10)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
         if (inCount == 8) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 15) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 8)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[3];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[3];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[3];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
endmodule

module memArray32_58398(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                clk, inFlip, outFlip);

   parameter numBanks = 2;
   parameter logBanks = 1;
   parameter depth = 16;
   parameter logDepth = 4;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   nextReg #(16, 4) nextReg_65555(.X(next), .Y(next0), .reset(reset), .clk(clk));


   memMod #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 8
// Gap: 16
module DirSum_58637(clk, reset, next, next_out,
      X0, Y0,
      X1, Y1,
      X2, Y2,
      X3, Y3);

   output next_out;
   input clk, reset, next;

   reg [3:0] i6;

   input [15:0] X0,
      X1,
      X2,
      X3;

   output [15:0] Y0,
      Y1,
      Y2,
      Y3;

   always @(posedge clk) begin
      if (reset == 1) begin
         i6 <= 0;
      end
      else begin
         if (next == 1)
            i6 <= 0;
         else if (i6 == 15)
            i6 <= 0;
         else
            i6 <= i6 + 1;
      end
   end

   codeBlock58403 codeBlockIsnt65560(.clk(clk), .reset(reset), .next_in(next), .next_out(next_out),
.i6_in(i6),
       .X0_in(X0), .Y0(Y0),
       .X1_in(X1), .Y1(Y1),
       .X2_in(X2), .Y2(Y2),
       .X3_in(X3), .Y3(Y3));

endmodule

module D24_58581(addr, out, clk);
   input clk;
   output [15:0] out;
   reg [15:0] out, out2, out3;
   input [3:0] addr;

   always @(posedge clk) begin
      out2 <= out3;
      out <= out2;
   case(addr)
      0: out3 <= 16'h0;
      1: out3 <= 16'hf384;
      2: out3 <= 16'he782;
      3: out3 <= 16'hdc72;
      4: out3 <= 16'hd2bf;
      5: out3 <= 16'hcac9;
      6: out3 <= 16'hc4df;
      7: out3 <= 16'hc13b;
      8: out3 <= 16'hc000;
      9: out3 <= 16'hc13b;
      10: out3 <= 16'hc4df;
      11: out3 <= 16'hcac9;
      12: out3 <= 16'hd2bf;
      13: out3 <= 16'hdc72;
      14: out3 <= 16'he782;
      15: out3 <= 16'hf384;
      default: out3 <= 0;
   endcase
   end
// synthesis attribute rom_style of out3 is "block"
endmodule



module D22_58617(addr, out, clk);
   input clk;
   output [15:0] out;
   reg [15:0] out, out2, out3;
   input [3:0] addr;

   always @(posedge clk) begin
      out2 <= out3;
      out <= out2;
   case(addr)
      0: out3 <= 16'h4000;
      1: out3 <= 16'h3ec5;
      2: out3 <= 16'h3b21;
      3: out3 <= 16'h3537;
      4: out3 <= 16'h2d41;
      5: out3 <= 16'h238e;
      6: out3 <= 16'h187e;
      7: out3 <= 16'hc7c;
      8: out3 <= 16'h0;
      9: out3 <= 16'hf384;
      10: out3 <= 16'he782;
      11: out3 <= 16'hdc72;
      12: out3 <= 16'hd2bf;
      13: out3 <= 16'hcac9;
      14: out3 <= 16'hc4df;
      15: out3 <= 16'hc13b;
      default: out3 <= 0;
   endcase
   end
// synthesis attribute rom_style of out3 is "block"
endmodule



// Latency: 8
// Gap: 1
module codeBlock58403(clk, reset, next_in, next_out,
   i6_in,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;
   input [3:0] i6_in;
   reg [3:0] i6;

   input [15:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [15:0] X0,
      X1,
      X2,
      X3;

   output [15:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(7, 1) shiftFIFO_65563(.X(next), .Y(next_out), .clk(clk));


   wire signed [15:0] a353;
   wire signed [15:0] a342;
   wire signed [15:0] a356;
   wire signed [15:0] a346;
   wire signed [15:0] a357;
   wire signed [15:0] a358;
   reg signed [15:0] tm324;
   reg signed [15:0] tm328;
   reg signed [15:0] tm340;
   reg signed [15:0] tm347;
   reg signed [15:0] tm325;
   reg signed [15:0] tm329;
   reg signed [15:0] tm341;
   reg signed [15:0] tm348;
   wire signed [15:0] tm14;
   wire signed [15:0] a347;
   wire signed [15:0] tm15;
   wire signed [15:0] a349;
   reg signed [15:0] tm326;
   reg signed [15:0] tm330;
   reg signed [15:0] tm342;
   reg signed [15:0] tm349;
   reg signed [15:0] tm64;
   reg signed [15:0] tm65;
   reg signed [15:0] tm327;
   reg signed [15:0] tm331;
   reg signed [15:0] tm343;
   reg signed [15:0] tm350;
   reg signed [15:0] tm344;
   reg signed [15:0] tm351;
   wire signed [15:0] a348;
   wire signed [15:0] a350;
   wire signed [15:0] a351;
   wire signed [15:0] a352;
   reg signed [15:0] tm345;
   reg signed [15:0] tm352;
   wire signed [15:0] Y0;
   wire signed [15:0] Y1;
   wire signed [15:0] Y2;
   wire signed [15:0] Y3;
   reg signed [15:0] tm346;
   reg signed [15:0] tm353;


   assign a353 = X0;
   assign a342 = a353;
   assign a356 = X1;
   assign a346 = a356;
   assign a357 = X2;
   assign a358 = X3;
   assign a347 = tm14;
   assign a349 = tm15;
   assign Y0 = tm346;
   assign Y1 = tm353;

   D24_58581 instD24inst0_58581(.addr(i6[3:0]), .out(tm15), .clk(clk));

   D22_58617 instD22inst0_58617(.addr(i6[3:0]), .out(tm14), .clk(clk));

    multfix #(16, 2) m58502(.a(tm64), .b(tm327), .clk(clk), .q_sc(a348), .q_unsc(), .rst(reset));
    multfix #(16, 2) m58524(.a(tm65), .b(tm331), .clk(clk), .q_sc(a350), .q_unsc(), .rst(reset));
    multfix #(16, 2) m58542(.a(tm65), .b(tm327), .clk(clk), .q_sc(a351), .q_unsc(), .rst(reset));
    multfix #(16, 2) m58553(.a(tm64), .b(tm331), .clk(clk), .q_sc(a352), .q_unsc(), .rst(reset));
    subfxp #(16, 1) sub58531(.a(a348), .b(a350), .clk(clk), .q(Y2));    // 6
    addfxp #(16, 1) add58560(.a(a351), .b(a352), .clk(clk), .q(Y3));    // 6


   always @(posedge clk) begin
      if (reset == 1) begin
         tm64 <= 0;
         tm327 <= 0;
         tm65 <= 0;
         tm331 <= 0;
         tm65 <= 0;
         tm327 <= 0;
         tm64 <= 0;
         tm331 <= 0;
      end
      else begin
         i6 <= i6_in;
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         tm324 <= a357;
         tm328 <= a358;
         tm340 <= a342;
         tm347 <= a346;
         tm325 <= tm324;
         tm329 <= tm328;
         tm341 <= tm340;
         tm348 <= tm347;
         tm326 <= tm325;
         tm330 <= tm329;
         tm342 <= tm341;
         tm349 <= tm348;
         tm64 <= a347;
         tm65 <= a349;
         tm327 <= tm326;
         tm331 <= tm330;
         tm343 <= tm342;
         tm350 <= tm349;
         tm344 <= tm343;
         tm351 <= tm350;
         tm345 <= tm344;
         tm352 <= tm351;
         tm346 <= tm345;
         tm353 <= tm352;
      end
   end
endmodule

// Latency: 2
// Gap: 1
module codeBlock58640(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [15:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [15:0] X0,
      X1,
      X2,
      X3;

   output [15:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_65566(.X(next), .Y(next_out), .clk(clk));


   wire signed [15:0] a309;
   wire signed [15:0] a310;
   wire signed [15:0] a311;
   wire signed [15:0] a312;
   wire signed [15:0] t141;
   wire signed [15:0] t142;
   wire signed [15:0] t143;
   wire signed [15:0] t144;
   wire signed [15:0] Y0;
   wire signed [15:0] Y1;
   wire signed [15:0] Y2;
   wire signed [15:0] Y3;


   assign a309 = X0;
   assign a310 = X2;
   assign a311 = X1;
   assign a312 = X3;
   assign Y0 = t141;
   assign Y1 = t142;
   assign Y2 = t143;
   assign Y3 = t144;

    addfxp #(16, 1) add58652(.a(a309), .b(a310), .clk(clk), .q(t141));    // 0
    addfxp #(16, 1) add58667(.a(a311), .b(a312), .clk(clk), .q(t142));    // 0
    subfxp #(16, 1) sub58682(.a(a309), .b(a310), .clk(clk), .q(t143));    // 0
    subfxp #(16, 1) sub58697(.a(a311), .b(a312), .clk(clk), .q(t144));    // 0


   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
      end
   end
endmodule

// Latency: 19
// Gap: 32
module rc58721(clk, reset, next, next_out,
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

   wire [31:0] t0;
   wire [31:0] s0;
   assign t0 = {X0, X1};
   wire [31:0] t1;
   wire [31:0] s1;
   assign t1 = {X2, X3};
   assign Y0 = s0[31:16];
   assign Y1 = s0[15:0];
   assign Y2 = s1[31:16];
   assign Y3 = s1[15:0];

   perm58719 instPerm65567(.x0(t0), .y0(s0),
    .x1(t1), .y1(s1),
   .clk(clk), .next(next), .next_out(next_out), .reset(reset)
);



endmodule

// Latency: 19
// Gap: 32
module perm58719(clk, next, reset, next_out,
   x0, y0,
   x1, y1);
   parameter numBanks = 2;
   parameter logBanks = 1;
   parameter depth = 32;
   parameter logDepth = 5;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 1'd0};
   assign    addr0b = {outCount, 1'd0};
   assign    addr0c = {outCount_for_rd_addr, 1'd0};
   assign    addr1 = {inCount, 1'd1};
   assign    addr1b = {outCount, 1'd1};
   assign    addr1c = {outCount_for_rd_addr, 1'd1};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_1_0, w_1_1;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    wire [width-1:0] z_1_0, z_1_1;

    wire [logDepth-1:0] u_0_0, u_0_1, u_1_0, u_1_1;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[5] ^ addr0[0];
   assign inAddr0[0] = addr0[1];
   assign inAddr0[1] = addr0[2];
   assign inAddr0[2] = addr0[3];
   assign inAddr0[3] = addr0[4];
   assign inAddr0[4] = addr0[0];
   assign outBank0[0] = addr0b[5] ^ addr0b[0];
   assign outAddr0[0] = addr0b[1];
   assign outAddr0[1] = addr0b[2];
   assign outAddr0[2] = addr0b[3];
   assign outAddr0[3] = addr0b[4];
   assign outAddr0[4] = addr0b[5];
   assign outBank_a0[0] = addr0c[5] ^ addr0c[0];
   assign outAddr_a0[0] = addr0c[1];
   assign outAddr_a0[1] = addr0c[2];
   assign outAddr_a0[2] = addr0c[3];
   assign outAddr_a0[3] = addr0c[4];
   assign outAddr_a0[4] = addr0c[5];

   assign inBank1[0] = addr1[5] ^ addr1[0];
   assign inAddr1[0] = addr1[1];
   assign inAddr1[1] = addr1[2];
   assign inAddr1[2] = addr1[3];
   assign inAddr1[3] = addr1[4];
   assign inAddr1[4] = addr1[0];
   assign outBank1[0] = addr1b[5] ^ addr1b[0];
   assign outAddr1[0] = addr1b[1];
   assign outAddr1[1] = addr1b[2];
   assign outAddr1[2] = addr1b[3];
   assign outAddr1[3] = addr1b[4];
   assign outAddr1[4] = addr1b[5];
   assign outBank_a1[0] = addr1c[5] ^ addr1c[0];
   assign outAddr_a1[0] = addr1c[1];
   assign outAddr_a1[1] = addr1c[2];
   assign outAddr_a1[2] = addr1c[3];
   assign outAddr_a1[3] = addr1c[4];
   assign outAddr_a1[4] = addr1c[5];

   nextReg #(17, 5) nextReg_65572(.X(next), .Y(next0), .reset(reset), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_65575(.X(next0), .Y(next_out), .clk(clk));


   memArray64_58719 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 16)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 18)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
         if (inCount == 16) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 31) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 16)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[4];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[4];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[4];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
endmodule

module memArray64_58719(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                clk, inFlip, outFlip);

   parameter numBanks = 2;
   parameter logBanks = 1;
   parameter depth = 32;
   parameter logDepth = 5;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   nextReg #(32, 5) nextReg_65580(.X(next), .Y(next0), .reset(reset), .clk(clk));


   memMod #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 8
// Gap: 32
module DirSum_59022(clk, reset, next, next_out,
      X0, Y0,
      X1, Y1,
      X2, Y2,
      X3, Y3);

   output next_out;
   input clk, reset, next;

   reg [4:0] i5;

   input [15:0] X0,
      X1,
      X2,
      X3;

   output [15:0] Y0,
      Y1,
      Y2,
      Y3;

   always @(posedge clk) begin
      if (reset == 1) begin
         i5 <= 0;
      end
      else begin
         if (next == 1)
            i5 <= 0;
         else if (i5 == 31)
            i5 <= 0;
         else
            i5 <= i5 + 1;
      end
   end

   codeBlock58724 codeBlockIsnt65585(.clk(clk), .reset(reset), .next_in(next), .next_out(next_out),
.i5_in(i5),
       .X0_in(X0), .Y0(Y0),
       .X1_in(X1), .Y1(Y1),
       .X2_in(X2), .Y2(Y2),
       .X3_in(X3), .Y3(Y3));

endmodule

module D20_58918(addr, out, clk);
   input clk;
   output [15:0] out;
   reg [15:0] out, out2, out3;
   input [4:0] addr;

   always @(posedge clk) begin
      out2 <= out3;
      out <= out2;
   case(addr)
      0: out3 <= 16'h0;
      1: out3 <= 16'hf9ba;
      2: out3 <= 16'hf384;
      3: out3 <= 16'hed6c;
      4: out3 <= 16'he782;
      5: out3 <= 16'he1d5;
      6: out3 <= 16'hdc72;
      7: out3 <= 16'hd766;
      8: out3 <= 16'hd2bf;
      9: out3 <= 16'hce87;
      10: out3 <= 16'hcac9;
      11: out3 <= 16'hc78f;
      12: out3 <= 16'hc4df;
      13: out3 <= 16'hc2c1;
      14: out3 <= 16'hc13b;
      15: out3 <= 16'hc04f;
      16: out3 <= 16'hc000;
      17: out3 <= 16'hc04f;
      18: out3 <= 16'hc13b;
      19: out3 <= 16'hc2c1;
      20: out3 <= 16'hc4df;
      21: out3 <= 16'hc78f;
      22: out3 <= 16'hcac9;
      23: out3 <= 16'hce87;
      24: out3 <= 16'hd2bf;
      25: out3 <= 16'hd766;
      26: out3 <= 16'hdc72;
      27: out3 <= 16'he1d5;
      28: out3 <= 16'he782;
      29: out3 <= 16'hed6c;
      30: out3 <= 16'hf384;
      31: out3 <= 16'hf9ba;
      default: out3 <= 0;
   endcase
   end
// synthesis attribute rom_style of out3 is "block"
endmodule



module D18_58986(addr, out, clk);
   input clk;
   output [15:0] out;
   reg [15:0] out, out2, out3;
   input [4:0] addr;

   always @(posedge clk) begin
      out2 <= out3;
      out <= out2;
   case(addr)
      0: out3 <= 16'h4000;
      1: out3 <= 16'h3fb1;
      2: out3 <= 16'h3ec5;
      3: out3 <= 16'h3d3f;
      4: out3 <= 16'h3b21;
      5: out3 <= 16'h3871;
      6: out3 <= 16'h3537;
      7: out3 <= 16'h3179;
      8: out3 <= 16'h2d41;
      9: out3 <= 16'h289a;
      10: out3 <= 16'h238e;
      11: out3 <= 16'h1e2b;
      12: out3 <= 16'h187e;
      13: out3 <= 16'h1294;
      14: out3 <= 16'hc7c;
      15: out3 <= 16'h646;
      16: out3 <= 16'h0;
      17: out3 <= 16'hf9ba;
      18: out3 <= 16'hf384;
      19: out3 <= 16'hed6c;
      20: out3 <= 16'he782;
      21: out3 <= 16'he1d5;
      22: out3 <= 16'hdc72;
      23: out3 <= 16'hd766;
      24: out3 <= 16'hd2bf;
      25: out3 <= 16'hce87;
      26: out3 <= 16'hcac9;
      27: out3 <= 16'hc78f;
      28: out3 <= 16'hc4df;
      29: out3 <= 16'hc2c1;
      30: out3 <= 16'hc13b;
      31: out3 <= 16'hc04f;
      default: out3 <= 0;
   endcase
   end
// synthesis attribute rom_style of out3 is "block"
endmodule



// Latency: 8
// Gap: 1
module codeBlock58724(clk, reset, next_in, next_out,
   i5_in,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;
   input [4:0] i5_in;
   reg [4:0] i5;

   input [15:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [15:0] X0,
      X1,
      X2,
      X3;

   output [15:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(7, 1) shiftFIFO_65588(.X(next), .Y(next_out), .clk(clk));


   wire signed [15:0] a293;
   wire signed [15:0] a282;
   wire signed [15:0] a296;
   wire signed [15:0] a286;
   wire signed [15:0] a297;
   wire signed [15:0] a298;
   reg signed [15:0] tm354;
   reg signed [15:0] tm358;
   reg signed [15:0] tm370;
   reg signed [15:0] tm377;
   reg signed [15:0] tm355;
   reg signed [15:0] tm359;
   reg signed [15:0] tm371;
   reg signed [15:0] tm378;
   wire signed [15:0] tm18;
   wire signed [15:0] a287;
   wire signed [15:0] tm19;
   wire signed [15:0] a289;
   reg signed [15:0] tm356;
   reg signed [15:0] tm360;
   reg signed [15:0] tm372;
   reg signed [15:0] tm379;
   reg signed [15:0] tm72;
   reg signed [15:0] tm73;
   reg signed [15:0] tm357;
   reg signed [15:0] tm361;
   reg signed [15:0] tm373;
   reg signed [15:0] tm380;
   reg signed [15:0] tm374;
   reg signed [15:0] tm381;
   wire signed [15:0] a288;
   wire signed [15:0] a290;
   wire signed [15:0] a291;
   wire signed [15:0] a292;
   reg signed [15:0] tm375;
   reg signed [15:0] tm382;
   wire signed [15:0] Y0;
   wire signed [15:0] Y1;
   wire signed [15:0] Y2;
   wire signed [15:0] Y3;
   reg signed [15:0] tm376;
   reg signed [15:0] tm383;


   assign a293 = X0;
   assign a282 = a293;
   assign a296 = X1;
   assign a286 = a296;
   assign a297 = X2;
   assign a298 = X3;
   assign a287 = tm18;
   assign a289 = tm19;
   assign Y0 = tm376;
   assign Y1 = tm383;

   D20_58918 instD20inst0_58918(.addr(i5[4:0]), .out(tm19), .clk(clk));

   D18_58986 instD18inst0_58986(.addr(i5[4:0]), .out(tm18), .clk(clk));

    multfix #(16, 2) m58823(.a(tm72), .b(tm357), .clk(clk), .q_sc(a288), .q_unsc(), .rst(reset));
    multfix #(16, 2) m58845(.a(tm73), .b(tm361), .clk(clk), .q_sc(a290), .q_unsc(), .rst(reset));
    multfix #(16, 2) m58863(.a(tm73), .b(tm357), .clk(clk), .q_sc(a291), .q_unsc(), .rst(reset));
    multfix #(16, 2) m58874(.a(tm72), .b(tm361), .clk(clk), .q_sc(a292), .q_unsc(), .rst(reset));
    subfxp #(16, 1) sub58852(.a(a288), .b(a290), .clk(clk), .q(Y2));    // 6
    addfxp #(16, 1) add58881(.a(a291), .b(a292), .clk(clk), .q(Y3));    // 6


   always @(posedge clk) begin
      if (reset == 1) begin
         tm72 <= 0;
         tm357 <= 0;
         tm73 <= 0;
         tm361 <= 0;
         tm73 <= 0;
         tm357 <= 0;
         tm72 <= 0;
         tm361 <= 0;
      end
      else begin
         i5 <= i5_in;
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         tm354 <= a297;
         tm358 <= a298;
         tm370 <= a282;
         tm377 <= a286;
         tm355 <= tm354;
         tm359 <= tm358;
         tm371 <= tm370;
         tm378 <= tm377;
         tm356 <= tm355;
         tm360 <= tm359;
         tm372 <= tm371;
         tm379 <= tm378;
         tm72 <= a287;
         tm73 <= a289;
         tm357 <= tm356;
         tm361 <= tm360;
         tm373 <= tm372;
         tm380 <= tm379;
         tm374 <= tm373;
         tm381 <= tm380;
         tm375 <= tm374;
         tm382 <= tm381;
         tm376 <= tm375;
         tm383 <= tm382;
      end
   end
endmodule

// Latency: 2
// Gap: 1
module codeBlock59025(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [15:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [15:0] X0,
      X1,
      X2,
      X3;

   output [15:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_65591(.X(next), .Y(next_out), .clk(clk));


   wire signed [15:0] a249;
   wire signed [15:0] a250;
   wire signed [15:0] a251;
   wire signed [15:0] a252;
   wire signed [15:0] t117;
   wire signed [15:0] t118;
   wire signed [15:0] t119;
   wire signed [15:0] t120;
   wire signed [15:0] Y0;
   wire signed [15:0] Y1;
   wire signed [15:0] Y2;
   wire signed [15:0] Y3;


   assign a249 = X0;
   assign a250 = X2;
   assign a251 = X1;
   assign a252 = X3;
   assign Y0 = t117;
   assign Y1 = t118;
   assign Y2 = t119;
   assign Y3 = t120;

    addfxp #(16, 1) add59037(.a(a249), .b(a250), .clk(clk), .q(t117));    // 0
    addfxp #(16, 1) add59052(.a(a251), .b(a252), .clk(clk), .q(t118));    // 0
    subfxp #(16, 1) sub59067(.a(a249), .b(a250), .clk(clk), .q(t119));    // 0
    subfxp #(16, 1) sub59082(.a(a251), .b(a252), .clk(clk), .q(t120));    // 0


   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
      end
   end
endmodule

// Latency: 35
// Gap: 64
module rc59106(clk, reset, next, next_out,
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

   wire [31:0] t0;
   wire [31:0] s0;
   assign t0 = {X0, X1};
   wire [31:0] t1;
   wire [31:0] s1;
   assign t1 = {X2, X3};
   assign Y0 = s0[31:16];
   assign Y1 = s0[15:0];
   assign Y2 = s1[31:16];
   assign Y3 = s1[15:0];

   perm59104 instPerm65592(.x0(t0), .y0(s0),
    .x1(t1), .y1(s1),
   .clk(clk), .next(next), .next_out(next_out), .reset(reset)
);



endmodule

// Latency: 35
// Gap: 64
module perm59104(clk, next, reset, next_out,
   x0, y0,
   x1, y1);
   parameter numBanks = 2;
   parameter logBanks = 1;
   parameter depth = 64;
   parameter logDepth = 6;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 1'd0};
   assign    addr0b = {outCount, 1'd0};
   assign    addr0c = {outCount_for_rd_addr, 1'd0};
   assign    addr1 = {inCount, 1'd1};
   assign    addr1b = {outCount, 1'd1};
   assign    addr1c = {outCount_for_rd_addr, 1'd1};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_1_0, w_1_1;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    wire [width-1:0] z_1_0, z_1_1;

    wire [logDepth-1:0] u_0_0, u_0_1, u_1_0, u_1_1;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[6] ^ addr0[0];
   assign inAddr0[0] = addr0[1];
   assign inAddr0[1] = addr0[2];
   assign inAddr0[2] = addr0[3];
   assign inAddr0[3] = addr0[4];
   assign inAddr0[4] = addr0[5];
   assign inAddr0[5] = addr0[0];
   assign outBank0[0] = addr0b[6] ^ addr0b[0];
   assign outAddr0[0] = addr0b[1];
   assign outAddr0[1] = addr0b[2];
   assign outAddr0[2] = addr0b[3];
   assign outAddr0[3] = addr0b[4];
   assign outAddr0[4] = addr0b[5];
   assign outAddr0[5] = addr0b[6];
   assign outBank_a0[0] = addr0c[6] ^ addr0c[0];
   assign outAddr_a0[0] = addr0c[1];
   assign outAddr_a0[1] = addr0c[2];
   assign outAddr_a0[2] = addr0c[3];
   assign outAddr_a0[3] = addr0c[4];
   assign outAddr_a0[4] = addr0c[5];
   assign outAddr_a0[5] = addr0c[6];

   assign inBank1[0] = addr1[6] ^ addr1[0];
   assign inAddr1[0] = addr1[1];
   assign inAddr1[1] = addr1[2];
   assign inAddr1[2] = addr1[3];
   assign inAddr1[3] = addr1[4];
   assign inAddr1[4] = addr1[5];
   assign inAddr1[5] = addr1[0];
   assign outBank1[0] = addr1b[6] ^ addr1b[0];
   assign outAddr1[0] = addr1b[1];
   assign outAddr1[1] = addr1b[2];
   assign outAddr1[2] = addr1b[3];
   assign outAddr1[3] = addr1b[4];
   assign outAddr1[4] = addr1b[5];
   assign outAddr1[5] = addr1b[6];
   assign outBank_a1[0] = addr1c[6] ^ addr1c[0];
   assign outAddr_a1[0] = addr1c[1];
   assign outAddr_a1[1] = addr1c[2];
   assign outAddr_a1[2] = addr1c[3];
   assign outAddr_a1[3] = addr1c[4];
   assign outAddr_a1[4] = addr1c[5];
   assign outAddr_a1[5] = addr1c[6];

   nextReg #(33, 6) nextReg_65597(.X(next), .Y(next0), .reset(reset), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_65600(.X(next0), .Y(next_out), .clk(clk));


   memArray128_59104 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 32)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 34)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
         if (inCount == 32) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 63) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 32)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[5];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[5];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[5];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
endmodule

module memArray128_59104(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                clk, inFlip, outFlip);

   parameter numBanks = 2;
   parameter logBanks = 1;
   parameter depth = 64;
   parameter logDepth = 6;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   nextReg #(64, 6) nextReg_65605(.X(next), .Y(next0), .reset(reset), .clk(clk));


   memMod #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 8
// Gap: 64
module DirSum_59535(clk, reset, next, next_out,
      X0, Y0,
      X1, Y1,
      X2, Y2,
      X3, Y3);

   output next_out;
   input clk, reset, next;

   reg [5:0] i4;

   input [15:0] X0,
      X1,
      X2,
      X3;

   output [15:0] Y0,
      Y1,
      Y2,
      Y3;

   always @(posedge clk) begin
      if (reset == 1) begin
         i4 <= 0;
      end
      else begin
         if (next == 1)
            i4 <= 0;
         else if (i4 == 63)
            i4 <= 0;
         else
            i4 <= i4 + 1;
      end
   end

   codeBlock59109 codeBlockIsnt65610(.clk(clk), .reset(reset), .next_in(next), .next_out(next_out),
.i4_in(i4),
       .X0_in(X0), .Y0(Y0),
       .X1_in(X1), .Y1(Y1),
       .X2_in(X2), .Y2(Y2),
       .X3_in(X3), .Y3(Y3));

endmodule

module D16_59335(addr, out, clk);
   input clk;
   output [15:0] out;
   reg [15:0] out, out2, out3;
   input [5:0] addr;

   always @(posedge clk) begin
      out2 <= out3;
      out <= out2;
   case(addr)
      0: out3 <= 16'h0;
      1: out3 <= 16'hfcdc;
      2: out3 <= 16'hf9ba;
      3: out3 <= 16'hf69c;
      4: out3 <= 16'hf384;
      5: out3 <= 16'hf073;
      6: out3 <= 16'hed6c;
      7: out3 <= 16'hea70;
      8: out3 <= 16'he782;
      9: out3 <= 16'he4a3;
      10: out3 <= 16'he1d5;
      11: out3 <= 16'hdf19;
      12: out3 <= 16'hdc72;
      13: out3 <= 16'hd9e0;
      14: out3 <= 16'hd766;
      15: out3 <= 16'hd505;
      16: out3 <= 16'hd2bf;
      17: out3 <= 16'hd094;
      18: out3 <= 16'hce87;
      19: out3 <= 16'hcc98;
      20: out3 <= 16'hcac9;
      21: out3 <= 16'hc91b;
      22: out3 <= 16'hc78f;
      23: out3 <= 16'hc625;
      24: out3 <= 16'hc4df;
      25: out3 <= 16'hc3be;
      26: out3 <= 16'hc2c1;
      27: out3 <= 16'hc1eb;
      28: out3 <= 16'hc13b;
      29: out3 <= 16'hc0b1;
      30: out3 <= 16'hc04f;
      31: out3 <= 16'hc014;
      32: out3 <= 16'hc000;
      33: out3 <= 16'hc014;
      34: out3 <= 16'hc04f;
      35: out3 <= 16'hc0b1;
      36: out3 <= 16'hc13b;
      37: out3 <= 16'hc1eb;
      38: out3 <= 16'hc2c1;
      39: out3 <= 16'hc3be;
      40: out3 <= 16'hc4df;
      41: out3 <= 16'hc625;
      42: out3 <= 16'hc78f;
      43: out3 <= 16'hc91b;
      44: out3 <= 16'hcac9;
      45: out3 <= 16'hcc98;
      46: out3 <= 16'hce87;
      47: out3 <= 16'hd094;
      48: out3 <= 16'hd2bf;
      49: out3 <= 16'hd505;
      50: out3 <= 16'hd766;
      51: out3 <= 16'hd9e0;
      52: out3 <= 16'hdc72;
      53: out3 <= 16'hdf19;
      54: out3 <= 16'he1d5;
      55: out3 <= 16'he4a3;
      56: out3 <= 16'he782;
      57: out3 <= 16'hea70;
      58: out3 <= 16'hed6c;
      59: out3 <= 16'hf073;
      60: out3 <= 16'hf384;
      61: out3 <= 16'hf69c;
      62: out3 <= 16'hf9ba;
      63: out3 <= 16'hfcdc;
      default: out3 <= 0;
   endcase
   end
// synthesis attribute rom_style of out3 is "block"
endmodule



module D14_59533(addr, out, clk);
   input clk;
   output [15:0] out;
   reg [15:0] out, out2, out3;
   input [5:0] addr;

   always @(posedge clk) begin
      out2 <= out3;
      out <= out2;
   case(addr)
      0: out3 <= 16'h4000;
      1: out3 <= 16'h3fec;
      2: out3 <= 16'h3fb1;
      3: out3 <= 16'h3f4f;
      4: out3 <= 16'h3ec5;
      5: out3 <= 16'h3e15;
      6: out3 <= 16'h3d3f;
      7: out3 <= 16'h3c42;
      8: out3 <= 16'h3b21;
      9: out3 <= 16'h39db;
      10: out3 <= 16'h3871;
      11: out3 <= 16'h36e5;
      12: out3 <= 16'h3537;
      13: out3 <= 16'h3368;
      14: out3 <= 16'h3179;
      15: out3 <= 16'h2f6c;
      16: out3 <= 16'h2d41;
      17: out3 <= 16'h2afb;
      18: out3 <= 16'h289a;
      19: out3 <= 16'h2620;
      20: out3 <= 16'h238e;
      21: out3 <= 16'h20e7;
      22: out3 <= 16'h1e2b;
      23: out3 <= 16'h1b5d;
      24: out3 <= 16'h187e;
      25: out3 <= 16'h1590;
      26: out3 <= 16'h1294;
      27: out3 <= 16'hf8d;
      28: out3 <= 16'hc7c;
      29: out3 <= 16'h964;
      30: out3 <= 16'h646;
      31: out3 <= 16'h324;
      32: out3 <= 16'h0;
      33: out3 <= 16'hfcdc;
      34: out3 <= 16'hf9ba;
      35: out3 <= 16'hf69c;
      36: out3 <= 16'hf384;
      37: out3 <= 16'hf073;
      38: out3 <= 16'hed6c;
      39: out3 <= 16'hea70;
      40: out3 <= 16'he782;
      41: out3 <= 16'he4a3;
      42: out3 <= 16'he1d5;
      43: out3 <= 16'hdf19;
      44: out3 <= 16'hdc72;
      45: out3 <= 16'hd9e0;
      46: out3 <= 16'hd766;
      47: out3 <= 16'hd505;
      48: out3 <= 16'hd2bf;
      49: out3 <= 16'hd094;
      50: out3 <= 16'hce87;
      51: out3 <= 16'hcc98;
      52: out3 <= 16'hcac9;
      53: out3 <= 16'hc91b;
      54: out3 <= 16'hc78f;
      55: out3 <= 16'hc625;
      56: out3 <= 16'hc4df;
      57: out3 <= 16'hc3be;
      58: out3 <= 16'hc2c1;
      59: out3 <= 16'hc1eb;
      60: out3 <= 16'hc13b;
      61: out3 <= 16'hc0b1;
      62: out3 <= 16'hc04f;
      63: out3 <= 16'hc014;
      default: out3 <= 0;
   endcase
   end
// synthesis attribute rom_style of out3 is "block"
endmodule



// Latency: 8
// Gap: 1
module codeBlock59109(clk, reset, next_in, next_out,
   i4_in,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;
   input [5:0] i4_in;
   reg [5:0] i4;

   input [15:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [15:0] X0,
      X1,
      X2,
      X3;

   output [15:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(7, 1) shiftFIFO_65613(.X(next), .Y(next_out), .clk(clk));


   wire signed [15:0] a233;
   wire signed [15:0] a222;
   wire signed [15:0] a236;
   wire signed [15:0] a226;
   wire signed [15:0] a237;
   wire signed [15:0] a238;
   reg signed [15:0] tm384;
   reg signed [15:0] tm388;
   reg signed [15:0] tm400;
   reg signed [15:0] tm407;
   reg signed [15:0] tm385;
   reg signed [15:0] tm389;
   reg signed [15:0] tm401;
   reg signed [15:0] tm408;
   wire signed [15:0] tm22;
   wire signed [15:0] a227;
   wire signed [15:0] tm23;
   wire signed [15:0] a229;
   reg signed [15:0] tm386;
   reg signed [15:0] tm390;
   reg signed [15:0] tm402;
   reg signed [15:0] tm409;
   reg signed [15:0] tm80;
   reg signed [15:0] tm81;
   reg signed [15:0] tm387;
   reg signed [15:0] tm391;
   reg signed [15:0] tm403;
   reg signed [15:0] tm410;
   reg signed [15:0] tm404;
   reg signed [15:0] tm411;
   wire signed [15:0] a228;
   wire signed [15:0] a230;
   wire signed [15:0] a231;
   wire signed [15:0] a232;
   reg signed [15:0] tm405;
   reg signed [15:0] tm412;
   wire signed [15:0] Y0;
   wire signed [15:0] Y1;
   wire signed [15:0] Y2;
   wire signed [15:0] Y3;
   reg signed [15:0] tm406;
   reg signed [15:0] tm413;


   assign a233 = X0;
   assign a222 = a233;
   assign a236 = X1;
   assign a226 = a236;
   assign a237 = X2;
   assign a238 = X3;
   assign a227 = tm22;
   assign a229 = tm23;
   assign Y0 = tm406;
   assign Y1 = tm413;

   D16_59335 instD16inst0_59335(.addr(i4[5:0]), .out(tm23), .clk(clk));

   D14_59533 instD14inst0_59533(.addr(i4[5:0]), .out(tm22), .clk(clk));

    multfix #(16, 2) m59208(.a(tm80), .b(tm387), .clk(clk), .q_sc(a228), .q_unsc(), .rst(reset));
    multfix #(16, 2) m59230(.a(tm81), .b(tm391), .clk(clk), .q_sc(a230), .q_unsc(), .rst(reset));
    multfix #(16, 2) m59248(.a(tm81), .b(tm387), .clk(clk), .q_sc(a231), .q_unsc(), .rst(reset));
    multfix #(16, 2) m59259(.a(tm80), .b(tm391), .clk(clk), .q_sc(a232), .q_unsc(), .rst(reset));
    subfxp #(16, 1) sub59237(.a(a228), .b(a230), .clk(clk), .q(Y2));    // 6
    addfxp #(16, 1) add59266(.a(a231), .b(a232), .clk(clk), .q(Y3));    // 6


   always @(posedge clk) begin
      if (reset == 1) begin
         tm80 <= 0;
         tm387 <= 0;
         tm81 <= 0;
         tm391 <= 0;
         tm81 <= 0;
         tm387 <= 0;
         tm80 <= 0;
         tm391 <= 0;
      end
      else begin
         i4 <= i4_in;
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         tm384 <= a237;
         tm388 <= a238;
         tm400 <= a222;
         tm407 <= a226;
         tm385 <= tm384;
         tm389 <= tm388;
         tm401 <= tm400;
         tm408 <= tm407;
         tm386 <= tm385;
         tm390 <= tm389;
         tm402 <= tm401;
         tm409 <= tm408;
         tm80 <= a227;
         tm81 <= a229;
         tm387 <= tm386;
         tm391 <= tm390;
         tm403 <= tm402;
         tm410 <= tm409;
         tm404 <= tm403;
         tm411 <= tm410;
         tm405 <= tm404;
         tm412 <= tm411;
         tm406 <= tm405;
         tm413 <= tm412;
      end
   end
endmodule

// Latency: 2
// Gap: 1
module codeBlock59538(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [15:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [15:0] X0,
      X1,
      X2,
      X3;

   output [15:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_65616(.X(next), .Y(next_out), .clk(clk));


   wire signed [15:0] a189;
   wire signed [15:0] a190;
   wire signed [15:0] a191;
   wire signed [15:0] a192;
   wire signed [15:0] t93;
   wire signed [15:0] t94;
   wire signed [15:0] t95;
   wire signed [15:0] t96;
   wire signed [15:0] Y0;
   wire signed [15:0] Y1;
   wire signed [15:0] Y2;
   wire signed [15:0] Y3;


   assign a189 = X0;
   assign a190 = X2;
   assign a191 = X1;
   assign a192 = X3;
   assign Y0 = t93;
   assign Y1 = t94;
   assign Y2 = t95;
   assign Y3 = t96;

    addfxp #(16, 1) add59550(.a(a189), .b(a190), .clk(clk), .q(t93));    // 0
    addfxp #(16, 1) add59565(.a(a191), .b(a192), .clk(clk), .q(t94));    // 0
    subfxp #(16, 1) sub59580(.a(a189), .b(a190), .clk(clk), .q(t95));    // 0
    subfxp #(16, 1) sub59595(.a(a191), .b(a192), .clk(clk), .q(t96));    // 0


   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
      end
   end
endmodule

// Latency: 67
// Gap: 128
module rc59619(clk, reset, next, next_out,
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

   wire [31:0] t0;
   wire [31:0] s0;
   assign t0 = {X0, X1};
   wire [31:0] t1;
   wire [31:0] s1;
   assign t1 = {X2, X3};
   assign Y0 = s0[31:16];
   assign Y1 = s0[15:0];
   assign Y2 = s1[31:16];
   assign Y3 = s1[15:0];

   perm59617 instPerm65617(.x0(t0), .y0(s0),
    .x1(t1), .y1(s1),
   .clk(clk), .next(next), .next_out(next_out), .reset(reset)
);



endmodule

// Latency: 67
// Gap: 128
module perm59617(clk, next, reset, next_out,
   x0, y0,
   x1, y1);
   parameter numBanks = 2;
   parameter logBanks = 1;
   parameter depth = 128;
   parameter logDepth = 7;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 1'd0};
   assign    addr0b = {outCount, 1'd0};
   assign    addr0c = {outCount_for_rd_addr, 1'd0};
   assign    addr1 = {inCount, 1'd1};
   assign    addr1b = {outCount, 1'd1};
   assign    addr1c = {outCount_for_rd_addr, 1'd1};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_1_0, w_1_1;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    wire [width-1:0] z_1_0, z_1_1;

    wire [logDepth-1:0] u_0_0, u_0_1, u_1_0, u_1_1;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[7] ^ addr0[0];
   assign inAddr0[0] = addr0[1];
   assign inAddr0[1] = addr0[2];
   assign inAddr0[2] = addr0[3];
   assign inAddr0[3] = addr0[4];
   assign inAddr0[4] = addr0[5];
   assign inAddr0[5] = addr0[6];
   assign inAddr0[6] = addr0[0];
   assign outBank0[0] = addr0b[7] ^ addr0b[0];
   assign outAddr0[0] = addr0b[1];
   assign outAddr0[1] = addr0b[2];
   assign outAddr0[2] = addr0b[3];
   assign outAddr0[3] = addr0b[4];
   assign outAddr0[4] = addr0b[5];
   assign outAddr0[5] = addr0b[6];
   assign outAddr0[6] = addr0b[7];
   assign outBank_a0[0] = addr0c[7] ^ addr0c[0];
   assign outAddr_a0[0] = addr0c[1];
   assign outAddr_a0[1] = addr0c[2];
   assign outAddr_a0[2] = addr0c[3];
   assign outAddr_a0[3] = addr0c[4];
   assign outAddr_a0[4] = addr0c[5];
   assign outAddr_a0[5] = addr0c[6];
   assign outAddr_a0[6] = addr0c[7];

   assign inBank1[0] = addr1[7] ^ addr1[0];
   assign inAddr1[0] = addr1[1];
   assign inAddr1[1] = addr1[2];
   assign inAddr1[2] = addr1[3];
   assign inAddr1[3] = addr1[4];
   assign inAddr1[4] = addr1[5];
   assign inAddr1[5] = addr1[6];
   assign inAddr1[6] = addr1[0];
   assign outBank1[0] = addr1b[7] ^ addr1b[0];
   assign outAddr1[0] = addr1b[1];
   assign outAddr1[1] = addr1b[2];
   assign outAddr1[2] = addr1b[3];
   assign outAddr1[3] = addr1b[4];
   assign outAddr1[4] = addr1b[5];
   assign outAddr1[5] = addr1b[6];
   assign outAddr1[6] = addr1b[7];
   assign outBank_a1[0] = addr1c[7] ^ addr1c[0];
   assign outAddr_a1[0] = addr1c[1];
   assign outAddr_a1[1] = addr1c[2];
   assign outAddr_a1[2] = addr1c[3];
   assign outAddr_a1[3] = addr1c[4];
   assign outAddr_a1[4] = addr1c[5];
   assign outAddr_a1[5] = addr1c[6];
   assign outAddr_a1[6] = addr1c[7];

   nextReg #(65, 7) nextReg_65622(.X(next), .Y(next0), .reset(reset), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_65625(.X(next0), .Y(next_out), .clk(clk));


   memArray256_59617 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 64)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 66)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
         if (inCount == 64) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 127) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 64)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[6];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[6];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[6];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
endmodule

module memArray256_59617(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                clk, inFlip, outFlip);

   parameter numBanks = 2;
   parameter logBanks = 1;
   parameter depth = 128;
   parameter logDepth = 7;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   nextReg #(128, 7) nextReg_65630(.X(next), .Y(next0), .reset(reset), .clk(clk));


   memMod #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 8
// Gap: 128
module DirSum_60304(clk, reset, next, next_out,
      X0, Y0,
      X1, Y1,
      X2, Y2,
      X3, Y3);

   output next_out;
   input clk, reset, next;

   reg [6:0] i3;

   input [15:0] X0,
      X1,
      X2,
      X3;

   output [15:0] Y0,
      Y1,
      Y2,
      Y3;

   always @(posedge clk) begin
      if (reset == 1) begin
         i3 <= 0;
      end
      else begin
         if (next == 1)
            i3 <= 0;
         else if (i3 == 127)
            i3 <= 0;
         else
            i3 <= i3 + 1;
      end
   end

   codeBlock59622 codeBlockIsnt65635(.clk(clk), .reset(reset), .next_in(next), .next_out(next_out),
.i3_in(i3),
       .X0_in(X0), .Y0(Y0),
       .X1_in(X1), .Y1(Y1),
       .X2_in(X2), .Y2(Y2),
       .X3_in(X3), .Y3(Y3));

endmodule

module D10_60042(addr, out, clk);
   input clk;
   output [15:0] out;
   reg [15:0] out, out2, out3;
   input [6:0] addr;

   always @(posedge clk) begin
      out2 <= out3;
      out <= out2;
   case(addr)
      0: out3 <= 16'h4000;
      1: out3 <= 16'h3ffb;
      2: out3 <= 16'h3fec;
      3: out3 <= 16'h3fd4;
      4: out3 <= 16'h3fb1;
      5: out3 <= 16'h3f85;
      6: out3 <= 16'h3f4f;
      7: out3 <= 16'h3f0f;
      8: out3 <= 16'h3ec5;
      9: out3 <= 16'h3e72;
      10: out3 <= 16'h3e15;
      11: out3 <= 16'h3daf;
      12: out3 <= 16'h3d3f;
      13: out3 <= 16'h3cc5;
      14: out3 <= 16'h3c42;
      15: out3 <= 16'h3bb6;
      16: out3 <= 16'h3b21;
      17: out3 <= 16'h3a82;
      18: out3 <= 16'h39db;
      19: out3 <= 16'h392b;
      20: out3 <= 16'h3871;
      21: out3 <= 16'h37b0;
      22: out3 <= 16'h36e5;
      23: out3 <= 16'h3612;
      24: out3 <= 16'h3537;
      25: out3 <= 16'h3453;
      26: out3 <= 16'h3368;
      27: out3 <= 16'h3274;
      28: out3 <= 16'h3179;
      29: out3 <= 16'h3076;
      30: out3 <= 16'h2f6c;
      31: out3 <= 16'h2e5a;
      32: out3 <= 16'h2d41;
      33: out3 <= 16'h2c21;
      34: out3 <= 16'h2afb;
      35: out3 <= 16'h29ce;
      36: out3 <= 16'h289a;
      37: out3 <= 16'h2760;
      38: out3 <= 16'h2620;
      39: out3 <= 16'h24da;
      40: out3 <= 16'h238e;
      41: out3 <= 16'h223d;
      42: out3 <= 16'h20e7;
      43: out3 <= 16'h1f8c;
      44: out3 <= 16'h1e2b;
      45: out3 <= 16'h1cc6;
      46: out3 <= 16'h1b5d;
      47: out3 <= 16'h19ef;
      48: out3 <= 16'h187e;
      49: out3 <= 16'h1709;
      50: out3 <= 16'h1590;
      51: out3 <= 16'h1413;
      52: out3 <= 16'h1294;
      53: out3 <= 16'h1112;
      54: out3 <= 16'hf8d;
      55: out3 <= 16'he06;
      56: out3 <= 16'hc7c;
      57: out3 <= 16'haf1;
      58: out3 <= 16'h964;
      59: out3 <= 16'h7d6;
      60: out3 <= 16'h646;
      61: out3 <= 16'h4b5;
      62: out3 <= 16'h324;
      63: out3 <= 16'h192;
      64: out3 <= 16'h0;
      65: out3 <= 16'hfe6e;
      66: out3 <= 16'hfcdc;
      67: out3 <= 16'hfb4b;
      68: out3 <= 16'hf9ba;
      69: out3 <= 16'hf82a;
      70: out3 <= 16'hf69c;
      71: out3 <= 16'hf50f;
      72: out3 <= 16'hf384;
      73: out3 <= 16'hf1fa;
      74: out3 <= 16'hf073;
      75: out3 <= 16'heeee;
      76: out3 <= 16'hed6c;
      77: out3 <= 16'hebed;
      78: out3 <= 16'hea70;
      79: out3 <= 16'he8f7;
      80: out3 <= 16'he782;
      81: out3 <= 16'he611;
      82: out3 <= 16'he4a3;
      83: out3 <= 16'he33a;
      84: out3 <= 16'he1d5;
      85: out3 <= 16'he074;
      86: out3 <= 16'hdf19;
      87: out3 <= 16'hddc3;
      88: out3 <= 16'hdc72;
      89: out3 <= 16'hdb26;
      90: out3 <= 16'hd9e0;
      91: out3 <= 16'hd8a0;
      92: out3 <= 16'hd766;
      93: out3 <= 16'hd632;
      94: out3 <= 16'hd505;
      95: out3 <= 16'hd3df;
      96: out3 <= 16'hd2bf;
      97: out3 <= 16'hd1a6;
      98: out3 <= 16'hd094;
      99: out3 <= 16'hcf8a;
      100: out3 <= 16'hce87;
      101: out3 <= 16'hcd8c;
      102: out3 <= 16'hcc98;
      103: out3 <= 16'hcbad;
      104: out3 <= 16'hcac9;
      105: out3 <= 16'hc9ee;
      106: out3 <= 16'hc91b;
      107: out3 <= 16'hc850;
      108: out3 <= 16'hc78f;
      109: out3 <= 16'hc6d5;
      110: out3 <= 16'hc625;
      111: out3 <= 16'hc57e;
      112: out3 <= 16'hc4df;
      113: out3 <= 16'hc44a;
      114: out3 <= 16'hc3be;
      115: out3 <= 16'hc33b;
      116: out3 <= 16'hc2c1;
      117: out3 <= 16'hc251;
      118: out3 <= 16'hc1eb;
      119: out3 <= 16'hc18e;
      120: out3 <= 16'hc13b;
      121: out3 <= 16'hc0f1;
      122: out3 <= 16'hc0b1;
      123: out3 <= 16'hc07b;
      124: out3 <= 16'hc04f;
      125: out3 <= 16'hc02c;
      126: out3 <= 16'hc014;
      127: out3 <= 16'hc005;
      default: out3 <= 0;
   endcase
   end
// synthesis attribute rom_style of out3 is "block"
endmodule



module D12_60302(addr, out, clk);
   input clk;
   output [15:0] out;
   reg [15:0] out, out2, out3;
   input [6:0] addr;

   always @(posedge clk) begin
      out2 <= out3;
      out <= out2;
   case(addr)
      0: out3 <= 16'h0;
      1: out3 <= 16'hfe6e;
      2: out3 <= 16'hfcdc;
      3: out3 <= 16'hfb4b;
      4: out3 <= 16'hf9ba;
      5: out3 <= 16'hf82a;
      6: out3 <= 16'hf69c;
      7: out3 <= 16'hf50f;
      8: out3 <= 16'hf384;
      9: out3 <= 16'hf1fa;
      10: out3 <= 16'hf073;
      11: out3 <= 16'heeee;
      12: out3 <= 16'hed6c;
      13: out3 <= 16'hebed;
      14: out3 <= 16'hea70;
      15: out3 <= 16'he8f7;
      16: out3 <= 16'he782;
      17: out3 <= 16'he611;
      18: out3 <= 16'he4a3;
      19: out3 <= 16'he33a;
      20: out3 <= 16'he1d5;
      21: out3 <= 16'he074;
      22: out3 <= 16'hdf19;
      23: out3 <= 16'hddc3;
      24: out3 <= 16'hdc72;
      25: out3 <= 16'hdb26;
      26: out3 <= 16'hd9e0;
      27: out3 <= 16'hd8a0;
      28: out3 <= 16'hd766;
      29: out3 <= 16'hd632;
      30: out3 <= 16'hd505;
      31: out3 <= 16'hd3df;
      32: out3 <= 16'hd2bf;
      33: out3 <= 16'hd1a6;
      34: out3 <= 16'hd094;
      35: out3 <= 16'hcf8a;
      36: out3 <= 16'hce87;
      37: out3 <= 16'hcd8c;
      38: out3 <= 16'hcc98;
      39: out3 <= 16'hcbad;
      40: out3 <= 16'hcac9;
      41: out3 <= 16'hc9ee;
      42: out3 <= 16'hc91b;
      43: out3 <= 16'hc850;
      44: out3 <= 16'hc78f;
      45: out3 <= 16'hc6d5;
      46: out3 <= 16'hc625;
      47: out3 <= 16'hc57e;
      48: out3 <= 16'hc4df;
      49: out3 <= 16'hc44a;
      50: out3 <= 16'hc3be;
      51: out3 <= 16'hc33b;
      52: out3 <= 16'hc2c1;
      53: out3 <= 16'hc251;
      54: out3 <= 16'hc1eb;
      55: out3 <= 16'hc18e;
      56: out3 <= 16'hc13b;
      57: out3 <= 16'hc0f1;
      58: out3 <= 16'hc0b1;
      59: out3 <= 16'hc07b;
      60: out3 <= 16'hc04f;
      61: out3 <= 16'hc02c;
      62: out3 <= 16'hc014;
      63: out3 <= 16'hc005;
      64: out3 <= 16'hc000;
      65: out3 <= 16'hc005;
      66: out3 <= 16'hc014;
      67: out3 <= 16'hc02c;
      68: out3 <= 16'hc04f;
      69: out3 <= 16'hc07b;
      70: out3 <= 16'hc0b1;
      71: out3 <= 16'hc0f1;
      72: out3 <= 16'hc13b;
      73: out3 <= 16'hc18e;
      74: out3 <= 16'hc1eb;
      75: out3 <= 16'hc251;
      76: out3 <= 16'hc2c1;
      77: out3 <= 16'hc33b;
      78: out3 <= 16'hc3be;
      79: out3 <= 16'hc44a;
      80: out3 <= 16'hc4df;
      81: out3 <= 16'hc57e;
      82: out3 <= 16'hc625;
      83: out3 <= 16'hc6d5;
      84: out3 <= 16'hc78f;
      85: out3 <= 16'hc850;
      86: out3 <= 16'hc91b;
      87: out3 <= 16'hc9ee;
      88: out3 <= 16'hcac9;
      89: out3 <= 16'hcbad;
      90: out3 <= 16'hcc98;
      91: out3 <= 16'hcd8c;
      92: out3 <= 16'hce87;
      93: out3 <= 16'hcf8a;
      94: out3 <= 16'hd094;
      95: out3 <= 16'hd1a6;
      96: out3 <= 16'hd2bf;
      97: out3 <= 16'hd3df;
      98: out3 <= 16'hd505;
      99: out3 <= 16'hd632;
      100: out3 <= 16'hd766;
      101: out3 <= 16'hd8a0;
      102: out3 <= 16'hd9e0;
      103: out3 <= 16'hdb26;
      104: out3 <= 16'hdc72;
      105: out3 <= 16'hddc3;
      106: out3 <= 16'hdf19;
      107: out3 <= 16'he074;
      108: out3 <= 16'he1d5;
      109: out3 <= 16'he33a;
      110: out3 <= 16'he4a3;
      111: out3 <= 16'he611;
      112: out3 <= 16'he782;
      113: out3 <= 16'he8f7;
      114: out3 <= 16'hea70;
      115: out3 <= 16'hebed;
      116: out3 <= 16'hed6c;
      117: out3 <= 16'heeee;
      118: out3 <= 16'hf073;
      119: out3 <= 16'hf1fa;
      120: out3 <= 16'hf384;
      121: out3 <= 16'hf50f;
      122: out3 <= 16'hf69c;
      123: out3 <= 16'hf82a;
      124: out3 <= 16'hf9ba;
      125: out3 <= 16'hfb4b;
      126: out3 <= 16'hfcdc;
      127: out3 <= 16'hfe6e;
      default: out3 <= 0;
   endcase
   end
// synthesis attribute rom_style of out3 is "block"
endmodule



// Latency: 8
// Gap: 1
module codeBlock59622(clk, reset, next_in, next_out,
   i3_in,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;
   input [6:0] i3_in;
   reg [6:0] i3;

   input [15:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [15:0] X0,
      X1,
      X2,
      X3;

   output [15:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(7, 1) shiftFIFO_65638(.X(next), .Y(next_out), .clk(clk));


   wire signed [15:0] a173;
   wire signed [15:0] a162;
   wire signed [15:0] a176;
   wire signed [15:0] a166;
   wire signed [15:0] a177;
   wire signed [15:0] a178;
   reg signed [15:0] tm414;
   reg signed [15:0] tm418;
   reg signed [15:0] tm430;
   reg signed [15:0] tm437;
   reg signed [15:0] tm415;
   reg signed [15:0] tm419;
   reg signed [15:0] tm431;
   reg signed [15:0] tm438;
   wire signed [15:0] tm26;
   wire signed [15:0] a167;
   wire signed [15:0] tm27;
   wire signed [15:0] a169;
   reg signed [15:0] tm416;
   reg signed [15:0] tm420;
   reg signed [15:0] tm432;
   reg signed [15:0] tm439;
   reg signed [15:0] tm88;
   reg signed [15:0] tm89;
   reg signed [15:0] tm417;
   reg signed [15:0] tm421;
   reg signed [15:0] tm433;
   reg signed [15:0] tm440;
   reg signed [15:0] tm434;
   reg signed [15:0] tm441;
   wire signed [15:0] a168;
   wire signed [15:0] a170;
   wire signed [15:0] a171;
   wire signed [15:0] a172;
   reg signed [15:0] tm435;
   reg signed [15:0] tm442;
   wire signed [15:0] Y0;
   wire signed [15:0] Y1;
   wire signed [15:0] Y2;
   wire signed [15:0] Y3;
   reg signed [15:0] tm436;
   reg signed [15:0] tm443;


   assign a173 = X0;
   assign a162 = a173;
   assign a176 = X1;
   assign a166 = a176;
   assign a177 = X2;
   assign a178 = X3;
   assign a167 = tm26;
   assign a169 = tm27;
   assign Y0 = tm436;
   assign Y1 = tm443;

   D10_60042 instD10inst0_60042(.addr(i3[6:0]), .out(tm26), .clk(clk));

   D12_60302 instD12inst0_60302(.addr(i3[6:0]), .out(tm27), .clk(clk));

    multfix #(16, 2) m59721(.a(tm88), .b(tm417), .clk(clk), .q_sc(a168), .q_unsc(), .rst(reset));
    multfix #(16, 2) m59743(.a(tm89), .b(tm421), .clk(clk), .q_sc(a170), .q_unsc(), .rst(reset));
    multfix #(16, 2) m59761(.a(tm89), .b(tm417), .clk(clk), .q_sc(a171), .q_unsc(), .rst(reset));
    multfix #(16, 2) m59772(.a(tm88), .b(tm421), .clk(clk), .q_sc(a172), .q_unsc(), .rst(reset));
    subfxp #(16, 1) sub59750(.a(a168), .b(a170), .clk(clk), .q(Y2));    // 6
    addfxp #(16, 1) add59779(.a(a171), .b(a172), .clk(clk), .q(Y3));    // 6


   always @(posedge clk) begin
      if (reset == 1) begin
         tm88 <= 0;
         tm417 <= 0;
         tm89 <= 0;
         tm421 <= 0;
         tm89 <= 0;
         tm417 <= 0;
         tm88 <= 0;
         tm421 <= 0;
      end
      else begin
         i3 <= i3_in;
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         tm414 <= a177;
         tm418 <= a178;
         tm430 <= a162;
         tm437 <= a166;
         tm415 <= tm414;
         tm419 <= tm418;
         tm431 <= tm430;
         tm438 <= tm437;
         tm416 <= tm415;
         tm420 <= tm419;
         tm432 <= tm431;
         tm439 <= tm438;
         tm88 <= a167;
         tm89 <= a169;
         tm417 <= tm416;
         tm421 <= tm420;
         tm433 <= tm432;
         tm440 <= tm439;
         tm434 <= tm433;
         tm441 <= tm440;
         tm435 <= tm434;
         tm442 <= tm441;
         tm436 <= tm435;
         tm443 <= tm442;
      end
   end
endmodule

// Latency: 2
// Gap: 1
module codeBlock60307(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [15:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [15:0] X0,
      X1,
      X2,
      X3;

   output [15:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_65641(.X(next), .Y(next_out), .clk(clk));


   wire signed [15:0] a129;
   wire signed [15:0] a130;
   wire signed [15:0] a131;
   wire signed [15:0] a132;
   wire signed [15:0] t69;
   wire signed [15:0] t70;
   wire signed [15:0] t71;
   wire signed [15:0] t72;
   wire signed [15:0] Y0;
   wire signed [15:0] Y1;
   wire signed [15:0] Y2;
   wire signed [15:0] Y3;


   assign a129 = X0;
   assign a130 = X2;
   assign a131 = X1;
   assign a132 = X3;
   assign Y0 = t69;
   assign Y1 = t70;
   assign Y2 = t71;
   assign Y3 = t72;

    addfxp #(16, 1) add60319(.a(a129), .b(a130), .clk(clk), .q(t69));    // 0
    addfxp #(16, 1) add60334(.a(a131), .b(a132), .clk(clk), .q(t70));    // 0
    subfxp #(16, 1) sub60349(.a(a129), .b(a130), .clk(clk), .q(t71));    // 0
    subfxp #(16, 1) sub60364(.a(a131), .b(a132), .clk(clk), .q(t72));    // 0


   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
      end
   end
endmodule

// Latency: 131
// Gap: 256
module rc60388(clk, reset, next, next_out,
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

   wire [31:0] t0;
   wire [31:0] s0;
   assign t0 = {X0, X1};
   wire [31:0] t1;
   wire [31:0] s1;
   assign t1 = {X2, X3};
   assign Y0 = s0[31:16];
   assign Y1 = s0[15:0];
   assign Y2 = s1[31:16];
   assign Y3 = s1[15:0];

   perm60386 instPerm65642(.x0(t0), .y0(s0),
    .x1(t1), .y1(s1),
   .clk(clk), .next(next), .next_out(next_out), .reset(reset)
);



endmodule

// Latency: 131
// Gap: 256
module perm60386(clk, next, reset, next_out,
   x0, y0,
   x1, y1);
   parameter numBanks = 2;
   parameter logBanks = 1;
   parameter depth = 256;
   parameter logDepth = 8;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 1'd0};
   assign    addr0b = {outCount, 1'd0};
   assign    addr0c = {outCount_for_rd_addr, 1'd0};
   assign    addr1 = {inCount, 1'd1};
   assign    addr1b = {outCount, 1'd1};
   assign    addr1c = {outCount_for_rd_addr, 1'd1};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_1_0, w_1_1;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    wire [width-1:0] z_1_0, z_1_1;

    wire [logDepth-1:0] u_0_0, u_0_1, u_1_0, u_1_1;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[8] ^ addr0[0];
   assign inAddr0[0] = addr0[1];
   assign inAddr0[1] = addr0[2];
   assign inAddr0[2] = addr0[3];
   assign inAddr0[3] = addr0[4];
   assign inAddr0[4] = addr0[5];
   assign inAddr0[5] = addr0[6];
   assign inAddr0[6] = addr0[7];
   assign inAddr0[7] = addr0[0];
   assign outBank0[0] = addr0b[8] ^ addr0b[0];
   assign outAddr0[0] = addr0b[1];
   assign outAddr0[1] = addr0b[2];
   assign outAddr0[2] = addr0b[3];
   assign outAddr0[3] = addr0b[4];
   assign outAddr0[4] = addr0b[5];
   assign outAddr0[5] = addr0b[6];
   assign outAddr0[6] = addr0b[7];
   assign outAddr0[7] = addr0b[8];
   assign outBank_a0[0] = addr0c[8] ^ addr0c[0];
   assign outAddr_a0[0] = addr0c[1];
   assign outAddr_a0[1] = addr0c[2];
   assign outAddr_a0[2] = addr0c[3];
   assign outAddr_a0[3] = addr0c[4];
   assign outAddr_a0[4] = addr0c[5];
   assign outAddr_a0[5] = addr0c[6];
   assign outAddr_a0[6] = addr0c[7];
   assign outAddr_a0[7] = addr0c[8];

   assign inBank1[0] = addr1[8] ^ addr1[0];
   assign inAddr1[0] = addr1[1];
   assign inAddr1[1] = addr1[2];
   assign inAddr1[2] = addr1[3];
   assign inAddr1[3] = addr1[4];
   assign inAddr1[4] = addr1[5];
   assign inAddr1[5] = addr1[6];
   assign inAddr1[6] = addr1[7];
   assign inAddr1[7] = addr1[0];
   assign outBank1[0] = addr1b[8] ^ addr1b[0];
   assign outAddr1[0] = addr1b[1];
   assign outAddr1[1] = addr1b[2];
   assign outAddr1[2] = addr1b[3];
   assign outAddr1[3] = addr1b[4];
   assign outAddr1[4] = addr1b[5];
   assign outAddr1[5] = addr1b[6];
   assign outAddr1[6] = addr1b[7];
   assign outAddr1[7] = addr1b[8];
   assign outBank_a1[0] = addr1c[8] ^ addr1c[0];
   assign outAddr_a1[0] = addr1c[1];
   assign outAddr_a1[1] = addr1c[2];
   assign outAddr_a1[2] = addr1c[3];
   assign outAddr_a1[3] = addr1c[4];
   assign outAddr_a1[4] = addr1c[5];
   assign outAddr_a1[5] = addr1c[6];
   assign outAddr_a1[6] = addr1c[7];
   assign outAddr_a1[7] = addr1c[8];

   nextReg #(129, 8) nextReg_65647(.X(next), .Y(next0), .reset(reset), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_65650(.X(next0), .Y(next_out), .clk(clk));


   memArray512_60386 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 128)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 130)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
         if (inCount == 128) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 255) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 128)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[7];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[7];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[7];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
endmodule

module memArray512_60386(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                clk, inFlip, outFlip);

   parameter numBanks = 2;
   parameter logBanks = 1;
   parameter depth = 256;
   parameter logDepth = 8;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   nextReg #(256, 8) nextReg_65655(.X(next), .Y(next0), .reset(reset), .clk(clk));


   memMod #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 8
// Gap: 256
module DirSum_61585(clk, reset, next, next_out,
      X0, Y0,
      X1, Y1,
      X2, Y2,
      X3, Y3);

   output next_out;
   input clk, reset, next;

   reg [7:0] i2;

   input [15:0] X0,
      X1,
      X2,
      X3;

   output [15:0] Y0,
      Y1,
      Y2,
      Y3;

   always @(posedge clk) begin
      if (reset == 1) begin
         i2 <= 0;
      end
      else begin
         if (next == 1)
            i2 <= 0;
         else if (i2 == 255)
            i2 <= 0;
         else
            i2 <= i2 + 1;
      end
   end

   codeBlock60391 codeBlockIsnt65660(.clk(clk), .reset(reset), .next_in(next), .next_out(next_out),
.i2_in(i2),
       .X0_in(X0), .Y0(Y0),
       .X1_in(X1), .Y1(Y1),
       .X2_in(X2), .Y2(Y2),
       .X3_in(X3), .Y3(Y3));

endmodule

module D8_60809(addr, out, clk);
   input clk;
   output [15:0] out;
   reg [15:0] out, out2, out3;
   input [7:0] addr;

   always @(posedge clk) begin
      out2 <= out3;
      out <= out2;
   case(addr)
      0: out3 <= 16'h0;
      1: out3 <= 16'hff37;
      2: out3 <= 16'hfe6e;
      3: out3 <= 16'hfda5;
      4: out3 <= 16'hfcdc;
      5: out3 <= 16'hfc13;
      6: out3 <= 16'hfb4b;
      7: out3 <= 16'hfa82;
      8: out3 <= 16'hf9ba;
      9: out3 <= 16'hf8f2;
      10: out3 <= 16'hf82a;
      11: out3 <= 16'hf763;
      12: out3 <= 16'hf69c;
      13: out3 <= 16'hf5d5;
      14: out3 <= 16'hf50f;
      15: out3 <= 16'hf449;
      16: out3 <= 16'hf384;
      17: out3 <= 16'hf2bf;
      18: out3 <= 16'hf1fa;
      19: out3 <= 16'hf136;
      20: out3 <= 16'hf073;
      21: out3 <= 16'hefb0;
      22: out3 <= 16'heeee;
      23: out3 <= 16'hee2d;
      24: out3 <= 16'hed6c;
      25: out3 <= 16'hecac;
      26: out3 <= 16'hebed;
      27: out3 <= 16'heb2e;
      28: out3 <= 16'hea70;
      29: out3 <= 16'he9b4;
      30: out3 <= 16'he8f7;
      31: out3 <= 16'he83c;
      32: out3 <= 16'he782;
      33: out3 <= 16'he6c9;
      34: out3 <= 16'he611;
      35: out3 <= 16'he559;
      36: out3 <= 16'he4a3;
      37: out3 <= 16'he3ee;
      38: out3 <= 16'he33a;
      39: out3 <= 16'he287;
      40: out3 <= 16'he1d5;
      41: out3 <= 16'he124;
      42: out3 <= 16'he074;
      43: out3 <= 16'hdfc6;
      44: out3 <= 16'hdf19;
      45: out3 <= 16'hde6d;
      46: out3 <= 16'hddc3;
      47: out3 <= 16'hdd19;
      48: out3 <= 16'hdc72;
      49: out3 <= 16'hdbcb;
      50: out3 <= 16'hdb26;
      51: out3 <= 16'hda82;
      52: out3 <= 16'hd9e0;
      53: out3 <= 16'hd93f;
      54: out3 <= 16'hd8a0;
      55: out3 <= 16'hd802;
      56: out3 <= 16'hd766;
      57: out3 <= 16'hd6cb;
      58: out3 <= 16'hd632;
      59: out3 <= 16'hd59b;
      60: out3 <= 16'hd505;
      61: out3 <= 16'hd471;
      62: out3 <= 16'hd3df;
      63: out3 <= 16'hd34e;
      64: out3 <= 16'hd2bf;
      65: out3 <= 16'hd231;
      66: out3 <= 16'hd1a6;
      67: out3 <= 16'hd11c;
      68: out3 <= 16'hd094;
      69: out3 <= 16'hd00e;
      70: out3 <= 16'hcf8a;
      71: out3 <= 16'hcf07;
      72: out3 <= 16'hce87;
      73: out3 <= 16'hce08;
      74: out3 <= 16'hcd8c;
      75: out3 <= 16'hcd11;
      76: out3 <= 16'hcc98;
      77: out3 <= 16'hcc21;
      78: out3 <= 16'hcbad;
      79: out3 <= 16'hcb3a;
      80: out3 <= 16'hcac9;
      81: out3 <= 16'hca5b;
      82: out3 <= 16'hc9ee;
      83: out3 <= 16'hc983;
      84: out3 <= 16'hc91b;
      85: out3 <= 16'hc8b5;
      86: out3 <= 16'hc850;
      87: out3 <= 16'hc7ee;
      88: out3 <= 16'hc78f;
      89: out3 <= 16'hc731;
      90: out3 <= 16'hc6d5;
      91: out3 <= 16'hc67c;
      92: out3 <= 16'hc625;
      93: out3 <= 16'hc5d0;
      94: out3 <= 16'hc57e;
      95: out3 <= 16'hc52d;
      96: out3 <= 16'hc4df;
      97: out3 <= 16'hc493;
      98: out3 <= 16'hc44a;
      99: out3 <= 16'hc403;
      100: out3 <= 16'hc3be;
      101: out3 <= 16'hc37b;
      102: out3 <= 16'hc33b;
      103: out3 <= 16'hc2fd;
      104: out3 <= 16'hc2c1;
      105: out3 <= 16'hc288;
      106: out3 <= 16'hc251;
      107: out3 <= 16'hc21d;
      108: out3 <= 16'hc1eb;
      109: out3 <= 16'hc1bb;
      110: out3 <= 16'hc18e;
      111: out3 <= 16'hc163;
      112: out3 <= 16'hc13b;
      113: out3 <= 16'hc115;
      114: out3 <= 16'hc0f1;
      115: out3 <= 16'hc0d0;
      116: out3 <= 16'hc0b1;
      117: out3 <= 16'hc095;
      118: out3 <= 16'hc07b;
      119: out3 <= 16'hc064;
      120: out3 <= 16'hc04f;
      121: out3 <= 16'hc03c;
      122: out3 <= 16'hc02c;
      123: out3 <= 16'hc01f;
      124: out3 <= 16'hc014;
      125: out3 <= 16'hc00b;
      126: out3 <= 16'hc005;
      127: out3 <= 16'hc001;
      128: out3 <= 16'hc000;
      129: out3 <= 16'hc001;
      130: out3 <= 16'hc005;
      131: out3 <= 16'hc00b;
      132: out3 <= 16'hc014;
      133: out3 <= 16'hc01f;
      134: out3 <= 16'hc02c;
      135: out3 <= 16'hc03c;
      136: out3 <= 16'hc04f;
      137: out3 <= 16'hc064;
      138: out3 <= 16'hc07b;
      139: out3 <= 16'hc095;
      140: out3 <= 16'hc0b1;
      141: out3 <= 16'hc0d0;
      142: out3 <= 16'hc0f1;
      143: out3 <= 16'hc115;
      144: out3 <= 16'hc13b;
      145: out3 <= 16'hc163;
      146: out3 <= 16'hc18e;
      147: out3 <= 16'hc1bb;
      148: out3 <= 16'hc1eb;
      149: out3 <= 16'hc21d;
      150: out3 <= 16'hc251;
      151: out3 <= 16'hc288;
      152: out3 <= 16'hc2c1;
      153: out3 <= 16'hc2fd;
      154: out3 <= 16'hc33b;
      155: out3 <= 16'hc37b;
      156: out3 <= 16'hc3be;
      157: out3 <= 16'hc403;
      158: out3 <= 16'hc44a;
      159: out3 <= 16'hc493;
      160: out3 <= 16'hc4df;
      161: out3 <= 16'hc52d;
      162: out3 <= 16'hc57e;
      163: out3 <= 16'hc5d0;
      164: out3 <= 16'hc625;
      165: out3 <= 16'hc67c;
      166: out3 <= 16'hc6d5;
      167: out3 <= 16'hc731;
      168: out3 <= 16'hc78f;
      169: out3 <= 16'hc7ee;
      170: out3 <= 16'hc850;
      171: out3 <= 16'hc8b5;
      172: out3 <= 16'hc91b;
      173: out3 <= 16'hc983;
      174: out3 <= 16'hc9ee;
      175: out3 <= 16'hca5b;
      176: out3 <= 16'hcac9;
      177: out3 <= 16'hcb3a;
      178: out3 <= 16'hcbad;
      179: out3 <= 16'hcc21;
      180: out3 <= 16'hcc98;
      181: out3 <= 16'hcd11;
      182: out3 <= 16'hcd8c;
      183: out3 <= 16'hce08;
      184: out3 <= 16'hce87;
      185: out3 <= 16'hcf07;
      186: out3 <= 16'hcf8a;
      187: out3 <= 16'hd00e;
      188: out3 <= 16'hd094;
      189: out3 <= 16'hd11c;
      190: out3 <= 16'hd1a6;
      191: out3 <= 16'hd231;
      192: out3 <= 16'hd2bf;
      193: out3 <= 16'hd34e;
      194: out3 <= 16'hd3df;
      195: out3 <= 16'hd471;
      196: out3 <= 16'hd505;
      197: out3 <= 16'hd59b;
      198: out3 <= 16'hd632;
      199: out3 <= 16'hd6cb;
      200: out3 <= 16'hd766;
      201: out3 <= 16'hd802;
      202: out3 <= 16'hd8a0;
      203: out3 <= 16'hd93f;
      204: out3 <= 16'hd9e0;
      205: out3 <= 16'hda82;
      206: out3 <= 16'hdb26;
      207: out3 <= 16'hdbcb;
      208: out3 <= 16'hdc72;
      209: out3 <= 16'hdd19;
      210: out3 <= 16'hddc3;
      211: out3 <= 16'hde6d;
      212: out3 <= 16'hdf19;
      213: out3 <= 16'hdfc6;
      214: out3 <= 16'he074;
      215: out3 <= 16'he124;
      216: out3 <= 16'he1d5;
      217: out3 <= 16'he287;
      218: out3 <= 16'he33a;
      219: out3 <= 16'he3ee;
      220: out3 <= 16'he4a3;
      221: out3 <= 16'he559;
      222: out3 <= 16'he611;
      223: out3 <= 16'he6c9;
      224: out3 <= 16'he782;
      225: out3 <= 16'he83c;
      226: out3 <= 16'he8f7;
      227: out3 <= 16'he9b4;
      228: out3 <= 16'hea70;
      229: out3 <= 16'heb2e;
      230: out3 <= 16'hebed;
      231: out3 <= 16'hecac;
      232: out3 <= 16'hed6c;
      233: out3 <= 16'hee2d;
      234: out3 <= 16'heeee;
      235: out3 <= 16'hefb0;
      236: out3 <= 16'hf073;
      237: out3 <= 16'hf136;
      238: out3 <= 16'hf1fa;
      239: out3 <= 16'hf2bf;
      240: out3 <= 16'hf384;
      241: out3 <= 16'hf449;
      242: out3 <= 16'hf50f;
      243: out3 <= 16'hf5d5;
      244: out3 <= 16'hf69c;
      245: out3 <= 16'hf763;
      246: out3 <= 16'hf82a;
      247: out3 <= 16'hf8f2;
      248: out3 <= 16'hf9ba;
      249: out3 <= 16'hfa82;
      250: out3 <= 16'hfb4b;
      251: out3 <= 16'hfc13;
      252: out3 <= 16'hfcdc;
      253: out3 <= 16'hfda5;
      254: out3 <= 16'hfe6e;
      255: out3 <= 16'hff37;
      default: out3 <= 0;
   endcase
   end
// synthesis attribute rom_style of out3 is "block"
endmodule



module D6_61583(addr, out, clk);
   input clk;
   output [15:0] out;
   reg [15:0] out, out2, out3;
   input [7:0] addr;

   always @(posedge clk) begin
      out2 <= out3;
      out <= out2;
   case(addr)
      0: out3 <= 16'h4000;
      1: out3 <= 16'h3fff;
      2: out3 <= 16'h3ffb;
      3: out3 <= 16'h3ff5;
      4: out3 <= 16'h3fec;
      5: out3 <= 16'h3fe1;
      6: out3 <= 16'h3fd4;
      7: out3 <= 16'h3fc4;
      8: out3 <= 16'h3fb1;
      9: out3 <= 16'h3f9c;
      10: out3 <= 16'h3f85;
      11: out3 <= 16'h3f6b;
      12: out3 <= 16'h3f4f;
      13: out3 <= 16'h3f30;
      14: out3 <= 16'h3f0f;
      15: out3 <= 16'h3eeb;
      16: out3 <= 16'h3ec5;
      17: out3 <= 16'h3e9d;
      18: out3 <= 16'h3e72;
      19: out3 <= 16'h3e45;
      20: out3 <= 16'h3e15;
      21: out3 <= 16'h3de3;
      22: out3 <= 16'h3daf;
      23: out3 <= 16'h3d78;
      24: out3 <= 16'h3d3f;
      25: out3 <= 16'h3d03;
      26: out3 <= 16'h3cc5;
      27: out3 <= 16'h3c85;
      28: out3 <= 16'h3c42;
      29: out3 <= 16'h3bfd;
      30: out3 <= 16'h3bb6;
      31: out3 <= 16'h3b6d;
      32: out3 <= 16'h3b21;
      33: out3 <= 16'h3ad3;
      34: out3 <= 16'h3a82;
      35: out3 <= 16'h3a30;
      36: out3 <= 16'h39db;
      37: out3 <= 16'h3984;
      38: out3 <= 16'h392b;
      39: out3 <= 16'h38cf;
      40: out3 <= 16'h3871;
      41: out3 <= 16'h3812;
      42: out3 <= 16'h37b0;
      43: out3 <= 16'h374b;
      44: out3 <= 16'h36e5;
      45: out3 <= 16'h367d;
      46: out3 <= 16'h3612;
      47: out3 <= 16'h35a5;
      48: out3 <= 16'h3537;
      49: out3 <= 16'h34c6;
      50: out3 <= 16'h3453;
      51: out3 <= 16'h33df;
      52: out3 <= 16'h3368;
      53: out3 <= 16'h32ef;
      54: out3 <= 16'h3274;
      55: out3 <= 16'h31f8;
      56: out3 <= 16'h3179;
      57: out3 <= 16'h30f9;
      58: out3 <= 16'h3076;
      59: out3 <= 16'h2ff2;
      60: out3 <= 16'h2f6c;
      61: out3 <= 16'h2ee4;
      62: out3 <= 16'h2e5a;
      63: out3 <= 16'h2dcf;
      64: out3 <= 16'h2d41;
      65: out3 <= 16'h2cb2;
      66: out3 <= 16'h2c21;
      67: out3 <= 16'h2b8f;
      68: out3 <= 16'h2afb;
      69: out3 <= 16'h2a65;
      70: out3 <= 16'h29ce;
      71: out3 <= 16'h2935;
      72: out3 <= 16'h289a;
      73: out3 <= 16'h27fe;
      74: out3 <= 16'h2760;
      75: out3 <= 16'h26c1;
      76: out3 <= 16'h2620;
      77: out3 <= 16'h257e;
      78: out3 <= 16'h24da;
      79: out3 <= 16'h2435;
      80: out3 <= 16'h238e;
      81: out3 <= 16'h22e7;
      82: out3 <= 16'h223d;
      83: out3 <= 16'h2193;
      84: out3 <= 16'h20e7;
      85: out3 <= 16'h203a;
      86: out3 <= 16'h1f8c;
      87: out3 <= 16'h1edc;
      88: out3 <= 16'h1e2b;
      89: out3 <= 16'h1d79;
      90: out3 <= 16'h1cc6;
      91: out3 <= 16'h1c12;
      92: out3 <= 16'h1b5d;
      93: out3 <= 16'h1aa7;
      94: out3 <= 16'h19ef;
      95: out3 <= 16'h1937;
      96: out3 <= 16'h187e;
      97: out3 <= 16'h17c4;
      98: out3 <= 16'h1709;
      99: out3 <= 16'h164c;
      100: out3 <= 16'h1590;
      101: out3 <= 16'h14d2;
      102: out3 <= 16'h1413;
      103: out3 <= 16'h1354;
      104: out3 <= 16'h1294;
      105: out3 <= 16'h11d3;
      106: out3 <= 16'h1112;
      107: out3 <= 16'h1050;
      108: out3 <= 16'hf8d;
      109: out3 <= 16'heca;
      110: out3 <= 16'he06;
      111: out3 <= 16'hd41;
      112: out3 <= 16'hc7c;
      113: out3 <= 16'hbb7;
      114: out3 <= 16'haf1;
      115: out3 <= 16'ha2b;
      116: out3 <= 16'h964;
      117: out3 <= 16'h89d;
      118: out3 <= 16'h7d6;
      119: out3 <= 16'h70e;
      120: out3 <= 16'h646;
      121: out3 <= 16'h57e;
      122: out3 <= 16'h4b5;
      123: out3 <= 16'h3ed;
      124: out3 <= 16'h324;
      125: out3 <= 16'h25b;
      126: out3 <= 16'h192;
      127: out3 <= 16'hc9;
      128: out3 <= 16'h0;
      129: out3 <= 16'hff37;
      130: out3 <= 16'hfe6e;
      131: out3 <= 16'hfda5;
      132: out3 <= 16'hfcdc;
      133: out3 <= 16'hfc13;
      134: out3 <= 16'hfb4b;
      135: out3 <= 16'hfa82;
      136: out3 <= 16'hf9ba;
      137: out3 <= 16'hf8f2;
      138: out3 <= 16'hf82a;
      139: out3 <= 16'hf763;
      140: out3 <= 16'hf69c;
      141: out3 <= 16'hf5d5;
      142: out3 <= 16'hf50f;
      143: out3 <= 16'hf449;
      144: out3 <= 16'hf384;
      145: out3 <= 16'hf2bf;
      146: out3 <= 16'hf1fa;
      147: out3 <= 16'hf136;
      148: out3 <= 16'hf073;
      149: out3 <= 16'hefb0;
      150: out3 <= 16'heeee;
      151: out3 <= 16'hee2d;
      152: out3 <= 16'hed6c;
      153: out3 <= 16'hecac;
      154: out3 <= 16'hebed;
      155: out3 <= 16'heb2e;
      156: out3 <= 16'hea70;
      157: out3 <= 16'he9b4;
      158: out3 <= 16'he8f7;
      159: out3 <= 16'he83c;
      160: out3 <= 16'he782;
      161: out3 <= 16'he6c9;
      162: out3 <= 16'he611;
      163: out3 <= 16'he559;
      164: out3 <= 16'he4a3;
      165: out3 <= 16'he3ee;
      166: out3 <= 16'he33a;
      167: out3 <= 16'he287;
      168: out3 <= 16'he1d5;
      169: out3 <= 16'he124;
      170: out3 <= 16'he074;
      171: out3 <= 16'hdfc6;
      172: out3 <= 16'hdf19;
      173: out3 <= 16'hde6d;
      174: out3 <= 16'hddc3;
      175: out3 <= 16'hdd19;
      176: out3 <= 16'hdc72;
      177: out3 <= 16'hdbcb;
      178: out3 <= 16'hdb26;
      179: out3 <= 16'hda82;
      180: out3 <= 16'hd9e0;
      181: out3 <= 16'hd93f;
      182: out3 <= 16'hd8a0;
      183: out3 <= 16'hd802;
      184: out3 <= 16'hd766;
      185: out3 <= 16'hd6cb;
      186: out3 <= 16'hd632;
      187: out3 <= 16'hd59b;
      188: out3 <= 16'hd505;
      189: out3 <= 16'hd471;
      190: out3 <= 16'hd3df;
      191: out3 <= 16'hd34e;
      192: out3 <= 16'hd2bf;
      193: out3 <= 16'hd231;
      194: out3 <= 16'hd1a6;
      195: out3 <= 16'hd11c;
      196: out3 <= 16'hd094;
      197: out3 <= 16'hd00e;
      198: out3 <= 16'hcf8a;
      199: out3 <= 16'hcf07;
      200: out3 <= 16'hce87;
      201: out3 <= 16'hce08;
      202: out3 <= 16'hcd8c;
      203: out3 <= 16'hcd11;
      204: out3 <= 16'hcc98;
      205: out3 <= 16'hcc21;
      206: out3 <= 16'hcbad;
      207: out3 <= 16'hcb3a;
      208: out3 <= 16'hcac9;
      209: out3 <= 16'hca5b;
      210: out3 <= 16'hc9ee;
      211: out3 <= 16'hc983;
      212: out3 <= 16'hc91b;
      213: out3 <= 16'hc8b5;
      214: out3 <= 16'hc850;
      215: out3 <= 16'hc7ee;
      216: out3 <= 16'hc78f;
      217: out3 <= 16'hc731;
      218: out3 <= 16'hc6d5;
      219: out3 <= 16'hc67c;
      220: out3 <= 16'hc625;
      221: out3 <= 16'hc5d0;
      222: out3 <= 16'hc57e;
      223: out3 <= 16'hc52d;
      224: out3 <= 16'hc4df;
      225: out3 <= 16'hc493;
      226: out3 <= 16'hc44a;
      227: out3 <= 16'hc403;
      228: out3 <= 16'hc3be;
      229: out3 <= 16'hc37b;
      230: out3 <= 16'hc33b;
      231: out3 <= 16'hc2fd;
      232: out3 <= 16'hc2c1;
      233: out3 <= 16'hc288;
      234: out3 <= 16'hc251;
      235: out3 <= 16'hc21d;
      236: out3 <= 16'hc1eb;
      237: out3 <= 16'hc1bb;
      238: out3 <= 16'hc18e;
      239: out3 <= 16'hc163;
      240: out3 <= 16'hc13b;
      241: out3 <= 16'hc115;
      242: out3 <= 16'hc0f1;
      243: out3 <= 16'hc0d0;
      244: out3 <= 16'hc0b1;
      245: out3 <= 16'hc095;
      246: out3 <= 16'hc07b;
      247: out3 <= 16'hc064;
      248: out3 <= 16'hc04f;
      249: out3 <= 16'hc03c;
      250: out3 <= 16'hc02c;
      251: out3 <= 16'hc01f;
      252: out3 <= 16'hc014;
      253: out3 <= 16'hc00b;
      254: out3 <= 16'hc005;
      255: out3 <= 16'hc001;
      default: out3 <= 0;
   endcase
   end
// synthesis attribute rom_style of out3 is "block"
endmodule



// Latency: 8
// Gap: 1
module codeBlock60391(clk, reset, next_in, next_out,
   i2_in,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;
   input [7:0] i2_in;
   reg [7:0] i2;

   input [15:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [15:0] X0,
      X1,
      X2,
      X3;

   output [15:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(7, 1) shiftFIFO_65663(.X(next), .Y(next_out), .clk(clk));


   wire signed [15:0] a113;
   wire signed [15:0] a102;
   wire signed [15:0] a116;
   wire signed [15:0] a106;
   wire signed [15:0] a117;
   wire signed [15:0] a118;
   reg signed [15:0] tm444;
   reg signed [15:0] tm448;
   reg signed [15:0] tm460;
   reg signed [15:0] tm467;
   reg signed [15:0] tm445;
   reg signed [15:0] tm449;
   reg signed [15:0] tm461;
   reg signed [15:0] tm468;
   wire signed [15:0] tm30;
   wire signed [15:0] a107;
   wire signed [15:0] tm31;
   wire signed [15:0] a109;
   reg signed [15:0] tm446;
   reg signed [15:0] tm450;
   reg signed [15:0] tm462;
   reg signed [15:0] tm469;
   reg signed [15:0] tm96;
   reg signed [15:0] tm97;
   reg signed [15:0] tm447;
   reg signed [15:0] tm451;
   reg signed [15:0] tm463;
   reg signed [15:0] tm470;
   reg signed [15:0] tm464;
   reg signed [15:0] tm471;
   wire signed [15:0] a108;
   wire signed [15:0] a110;
   wire signed [15:0] a111;
   wire signed [15:0] a112;
   reg signed [15:0] tm465;
   reg signed [15:0] tm472;
   wire signed [15:0] Y0;
   wire signed [15:0] Y1;
   wire signed [15:0] Y2;
   wire signed [15:0] Y3;
   reg signed [15:0] tm466;
   reg signed [15:0] tm473;


   assign a113 = X0;
   assign a102 = a113;
   assign a116 = X1;
   assign a106 = a116;
   assign a117 = X2;
   assign a118 = X3;
   assign a107 = tm30;
   assign a109 = tm31;
   assign Y0 = tm466;
   assign Y1 = tm473;

   D8_60809 instD8inst0_60809(.addr(i2[7:0]), .out(tm31), .clk(clk));

   D6_61583 instD6inst0_61583(.addr(i2[7:0]), .out(tm30), .clk(clk));

    multfix #(16, 2) m60490(.a(tm96), .b(tm447), .clk(clk), .q_sc(a108), .q_unsc(), .rst(reset));
    multfix #(16, 2) m60512(.a(tm97), .b(tm451), .clk(clk), .q_sc(a110), .q_unsc(), .rst(reset));
    multfix #(16, 2) m60530(.a(tm97), .b(tm447), .clk(clk), .q_sc(a111), .q_unsc(), .rst(reset));
    multfix #(16, 2) m60541(.a(tm96), .b(tm451), .clk(clk), .q_sc(a112), .q_unsc(), .rst(reset));
    subfxp #(16, 1) sub60519(.a(a108), .b(a110), .clk(clk), .q(Y2));    // 6
    addfxp #(16, 1) add60548(.a(a111), .b(a112), .clk(clk), .q(Y3));    // 6


   always @(posedge clk) begin
      if (reset == 1) begin
         tm96 <= 0;
         tm447 <= 0;
         tm97 <= 0;
         tm451 <= 0;
         tm97 <= 0;
         tm447 <= 0;
         tm96 <= 0;
         tm451 <= 0;
      end
      else begin
         i2 <= i2_in;
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         tm444 <= a117;
         tm448 <= a118;
         tm460 <= a102;
         tm467 <= a106;
         tm445 <= tm444;
         tm449 <= tm448;
         tm461 <= tm460;
         tm468 <= tm467;
         tm446 <= tm445;
         tm450 <= tm449;
         tm462 <= tm461;
         tm469 <= tm468;
         tm96 <= a107;
         tm97 <= a109;
         tm447 <= tm446;
         tm451 <= tm450;
         tm463 <= tm462;
         tm470 <= tm469;
         tm464 <= tm463;
         tm471 <= tm470;
         tm465 <= tm464;
         tm472 <= tm471;
         tm466 <= tm465;
         tm473 <= tm472;
      end
   end
endmodule

// Latency: 2
// Gap: 1
module codeBlock61588(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [15:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [15:0] X0,
      X1,
      X2,
      X3;

   output [15:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_65666(.X(next), .Y(next_out), .clk(clk));


   wire signed [15:0] a69;
   wire signed [15:0] a70;
   wire signed [15:0] a71;
   wire signed [15:0] a72;
   wire signed [15:0] t45;
   wire signed [15:0] t46;
   wire signed [15:0] t47;
   wire signed [15:0] t48;
   wire signed [15:0] Y0;
   wire signed [15:0] Y1;
   wire signed [15:0] Y2;
   wire signed [15:0] Y3;


   assign a69 = X0;
   assign a70 = X2;
   assign a71 = X1;
   assign a72 = X3;
   assign Y0 = t45;
   assign Y1 = t46;
   assign Y2 = t47;
   assign Y3 = t48;

    addfxp #(16, 1) add61600(.a(a69), .b(a70), .clk(clk), .q(t45));    // 0
    addfxp #(16, 1) add61615(.a(a71), .b(a72), .clk(clk), .q(t46));    // 0
    subfxp #(16, 1) sub61630(.a(a69), .b(a70), .clk(clk), .q(t47));    // 0
    subfxp #(16, 1) sub61645(.a(a71), .b(a72), .clk(clk), .q(t48));    // 0


   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
      end
   end
endmodule

// Latency: 259
// Gap: 512
module rc61669(clk, reset, next, next_out,
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

   wire [31:0] t0;
   wire [31:0] s0;
   assign t0 = {X0, X1};
   wire [31:0] t1;
   wire [31:0] s1;
   assign t1 = {X2, X3};
   assign Y0 = s0[31:16];
   assign Y1 = s0[15:0];
   assign Y2 = s1[31:16];
   assign Y3 = s1[15:0];

   perm61667 instPerm65667(.x0(t0), .y0(s0),
    .x1(t1), .y1(s1),
   .clk(clk), .next(next), .next_out(next_out), .reset(reset)
);



endmodule

// Latency: 259
// Gap: 512
module perm61667(clk, next, reset, next_out,
   x0, y0,
   x1, y1);
   parameter numBanks = 2;
   parameter logBanks = 1;
   parameter depth = 512;
   parameter logDepth = 9;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 1'd0};
   assign    addr0b = {outCount, 1'd0};
   assign    addr0c = {outCount_for_rd_addr, 1'd0};
   assign    addr1 = {inCount, 1'd1};
   assign    addr1b = {outCount, 1'd1};
   assign    addr1c = {outCount_for_rd_addr, 1'd1};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_1_0, w_1_1;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    wire [width-1:0] z_1_0, z_1_1;

    wire [logDepth-1:0] u_0_0, u_0_1, u_1_0, u_1_1;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[9] ^ addr0[0];
   assign inAddr0[0] = addr0[1];
   assign inAddr0[1] = addr0[2];
   assign inAddr0[2] = addr0[3];
   assign inAddr0[3] = addr0[4];
   assign inAddr0[4] = addr0[5];
   assign inAddr0[5] = addr0[6];
   assign inAddr0[6] = addr0[7];
   assign inAddr0[7] = addr0[8];
   assign inAddr0[8] = addr0[0];
   assign outBank0[0] = addr0b[9] ^ addr0b[0];
   assign outAddr0[0] = addr0b[1];
   assign outAddr0[1] = addr0b[2];
   assign outAddr0[2] = addr0b[3];
   assign outAddr0[3] = addr0b[4];
   assign outAddr0[4] = addr0b[5];
   assign outAddr0[5] = addr0b[6];
   assign outAddr0[6] = addr0b[7];
   assign outAddr0[7] = addr0b[8];
   assign outAddr0[8] = addr0b[9];
   assign outBank_a0[0] = addr0c[9] ^ addr0c[0];
   assign outAddr_a0[0] = addr0c[1];
   assign outAddr_a0[1] = addr0c[2];
   assign outAddr_a0[2] = addr0c[3];
   assign outAddr_a0[3] = addr0c[4];
   assign outAddr_a0[4] = addr0c[5];
   assign outAddr_a0[5] = addr0c[6];
   assign outAddr_a0[6] = addr0c[7];
   assign outAddr_a0[7] = addr0c[8];
   assign outAddr_a0[8] = addr0c[9];

   assign inBank1[0] = addr1[9] ^ addr1[0];
   assign inAddr1[0] = addr1[1];
   assign inAddr1[1] = addr1[2];
   assign inAddr1[2] = addr1[3];
   assign inAddr1[3] = addr1[4];
   assign inAddr1[4] = addr1[5];
   assign inAddr1[5] = addr1[6];
   assign inAddr1[6] = addr1[7];
   assign inAddr1[7] = addr1[8];
   assign inAddr1[8] = addr1[0];
   assign outBank1[0] = addr1b[9] ^ addr1b[0];
   assign outAddr1[0] = addr1b[1];
   assign outAddr1[1] = addr1b[2];
   assign outAddr1[2] = addr1b[3];
   assign outAddr1[3] = addr1b[4];
   assign outAddr1[4] = addr1b[5];
   assign outAddr1[5] = addr1b[6];
   assign outAddr1[6] = addr1b[7];
   assign outAddr1[7] = addr1b[8];
   assign outAddr1[8] = addr1b[9];
   assign outBank_a1[0] = addr1c[9] ^ addr1c[0];
   assign outAddr_a1[0] = addr1c[1];
   assign outAddr_a1[1] = addr1c[2];
   assign outAddr_a1[2] = addr1c[3];
   assign outAddr_a1[3] = addr1c[4];
   assign outAddr_a1[4] = addr1c[5];
   assign outAddr_a1[5] = addr1c[6];
   assign outAddr_a1[6] = addr1c[7];
   assign outAddr_a1[7] = addr1c[8];
   assign outAddr_a1[8] = addr1c[9];

   nextReg #(257, 9) nextReg_65672(.X(next), .Y(next0), .reset(reset), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_65675(.X(next0), .Y(next_out), .clk(clk));


   memArray1024_61667 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 256)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 258)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
         if (inCount == 256) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 511) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 256)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[8];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[8];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[8];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
endmodule

module memArray1024_61667(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                clk, inFlip, outFlip);

   parameter numBanks = 2;
   parameter logBanks = 1;
   parameter depth = 512;
   parameter logDepth = 9;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   nextReg #(512, 9) nextReg_65680(.X(next), .Y(next0), .reset(reset), .clk(clk));


   memMod #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 8
// Gap: 512
module DirSum_63889(clk, reset, next, next_out,
      X0, Y0,
      X1, Y1,
      X2, Y2,
      X3, Y3);

   output next_out;
   input clk, reset, next;

   reg [8:0] i1;

   input [15:0] X0,
      X1,
      X2,
      X3;

   output [15:0] Y0,
      Y1,
      Y2,
      Y3;

   always @(posedge clk) begin
      if (reset == 1) begin
         i1 <= 0;
      end
      else begin
         if (next == 1)
            i1 <= 0;
         else if (i1 == 511)
            i1 <= 0;
         else
            i1 <= i1 + 1;
      end
   end

   codeBlock61671 codeBlockIsnt65685(.clk(clk), .reset(reset), .next_in(next), .next_out(next_out),
.i1_in(i1),
       .X0_in(X0), .Y0(Y0),
       .X1_in(X1), .Y1(Y1),
       .X2_in(X2), .Y2(Y2),
       .X3_in(X3), .Y3(Y3));

endmodule

module D4_62859(addr, out, clk);
   input clk;
   output [15:0] out;
   reg [15:0] out, out2, out3;
   input [8:0] addr;

   always @(posedge clk) begin
      out2 <= out3;
      out <= out2;
   case(addr)
      0: out3 <= 16'h0;
      1: out3 <= 16'hff9b;
      2: out3 <= 16'hff37;
      3: out3 <= 16'hfed2;
      4: out3 <= 16'hfe6e;
      5: out3 <= 16'hfe09;
      6: out3 <= 16'hfda5;
      7: out3 <= 16'hfd40;
      8: out3 <= 16'hfcdc;
      9: out3 <= 16'hfc78;
      10: out3 <= 16'hfc13;
      11: out3 <= 16'hfbaf;
      12: out3 <= 16'hfb4b;
      13: out3 <= 16'hfae6;
      14: out3 <= 16'hfa82;
      15: out3 <= 16'hfa1e;
      16: out3 <= 16'hf9ba;
      17: out3 <= 16'hf956;
      18: out3 <= 16'hf8f2;
      19: out3 <= 16'hf88e;
      20: out3 <= 16'hf82a;
      21: out3 <= 16'hf7c7;
      22: out3 <= 16'hf763;
      23: out3 <= 16'hf6ff;
      24: out3 <= 16'hf69c;
      25: out3 <= 16'hf639;
      26: out3 <= 16'hf5d5;
      27: out3 <= 16'hf572;
      28: out3 <= 16'hf50f;
      29: out3 <= 16'hf4ac;
      30: out3 <= 16'hf449;
      31: out3 <= 16'hf3e6;
      32: out3 <= 16'hf384;
      33: out3 <= 16'hf321;
      34: out3 <= 16'hf2bf;
      35: out3 <= 16'hf25c;
      36: out3 <= 16'hf1fa;
      37: out3 <= 16'hf198;
      38: out3 <= 16'hf136;
      39: out3 <= 16'hf0d5;
      40: out3 <= 16'hf073;
      41: out3 <= 16'hf012;
      42: out3 <= 16'hefb0;
      43: out3 <= 16'hef4f;
      44: out3 <= 16'heeee;
      45: out3 <= 16'hee8d;
      46: out3 <= 16'hee2d;
      47: out3 <= 16'hedcc;
      48: out3 <= 16'hed6c;
      49: out3 <= 16'hed0c;
      50: out3 <= 16'hecac;
      51: out3 <= 16'hec4c;
      52: out3 <= 16'hebed;
      53: out3 <= 16'heb8d;
      54: out3 <= 16'heb2e;
      55: out3 <= 16'heacf;
      56: out3 <= 16'hea70;
      57: out3 <= 16'hea12;
      58: out3 <= 16'he9b4;
      59: out3 <= 16'he955;
      60: out3 <= 16'he8f7;
      61: out3 <= 16'he89a;
      62: out3 <= 16'he83c;
      63: out3 <= 16'he7df;
      64: out3 <= 16'he782;
      65: out3 <= 16'he725;
      66: out3 <= 16'he6c9;
      67: out3 <= 16'he66d;
      68: out3 <= 16'he611;
      69: out3 <= 16'he5b5;
      70: out3 <= 16'he559;
      71: out3 <= 16'he4fe;
      72: out3 <= 16'he4a3;
      73: out3 <= 16'he448;
      74: out3 <= 16'he3ee;
      75: out3 <= 16'he394;
      76: out3 <= 16'he33a;
      77: out3 <= 16'he2e0;
      78: out3 <= 16'he287;
      79: out3 <= 16'he22d;
      80: out3 <= 16'he1d5;
      81: out3 <= 16'he17c;
      82: out3 <= 16'he124;
      83: out3 <= 16'he0cc;
      84: out3 <= 16'he074;
      85: out3 <= 16'he01d;
      86: out3 <= 16'hdfc6;
      87: out3 <= 16'hdf6f;
      88: out3 <= 16'hdf19;
      89: out3 <= 16'hdec3;
      90: out3 <= 16'hde6d;
      91: out3 <= 16'hde18;
      92: out3 <= 16'hddc3;
      93: out3 <= 16'hdd6e;
      94: out3 <= 16'hdd19;
      95: out3 <= 16'hdcc5;
      96: out3 <= 16'hdc72;
      97: out3 <= 16'hdc1e;
      98: out3 <= 16'hdbcb;
      99: out3 <= 16'hdb78;
      100: out3 <= 16'hdb26;
      101: out3 <= 16'hdad4;
      102: out3 <= 16'hda82;
      103: out3 <= 16'hda31;
      104: out3 <= 16'hd9e0;
      105: out3 <= 16'hd98f;
      106: out3 <= 16'hd93f;
      107: out3 <= 16'hd8ef;
      108: out3 <= 16'hd8a0;
      109: out3 <= 16'hd851;
      110: out3 <= 16'hd802;
      111: out3 <= 16'hd7b4;
      112: out3 <= 16'hd766;
      113: out3 <= 16'hd719;
      114: out3 <= 16'hd6cb;
      115: out3 <= 16'hd67f;
      116: out3 <= 16'hd632;
      117: out3 <= 16'hd5e6;
      118: out3 <= 16'hd59b;
      119: out3 <= 16'hd550;
      120: out3 <= 16'hd505;
      121: out3 <= 16'hd4bb;
      122: out3 <= 16'hd471;
      123: out3 <= 16'hd428;
      124: out3 <= 16'hd3df;
      125: out3 <= 16'hd396;
      126: out3 <= 16'hd34e;
      127: out3 <= 16'hd306;
      128: out3 <= 16'hd2bf;
      129: out3 <= 16'hd278;
      130: out3 <= 16'hd231;
      131: out3 <= 16'hd1eb;
      132: out3 <= 16'hd1a6;
      133: out3 <= 16'hd161;
      134: out3 <= 16'hd11c;
      135: out3 <= 16'hd0d8;
      136: out3 <= 16'hd094;
      137: out3 <= 16'hd051;
      138: out3 <= 16'hd00e;
      139: out3 <= 16'hcfcc;
      140: out3 <= 16'hcf8a;
      141: out3 <= 16'hcf48;
      142: out3 <= 16'hcf07;
      143: out3 <= 16'hcec7;
      144: out3 <= 16'hce87;
      145: out3 <= 16'hce47;
      146: out3 <= 16'hce08;
      147: out3 <= 16'hcdca;
      148: out3 <= 16'hcd8c;
      149: out3 <= 16'hcd4e;
      150: out3 <= 16'hcd11;
      151: out3 <= 16'hccd4;
      152: out3 <= 16'hcc98;
      153: out3 <= 16'hcc5d;
      154: out3 <= 16'hcc21;
      155: out3 <= 16'hcbe7;
      156: out3 <= 16'hcbad;
      157: out3 <= 16'hcb73;
      158: out3 <= 16'hcb3a;
      159: out3 <= 16'hcb01;
      160: out3 <= 16'hcac9;
      161: out3 <= 16'hca92;
      162: out3 <= 16'hca5b;
      163: out3 <= 16'hca24;
      164: out3 <= 16'hc9ee;
      165: out3 <= 16'hc9b8;
      166: out3 <= 16'hc983;
      167: out3 <= 16'hc94f;
      168: out3 <= 16'hc91b;
      169: out3 <= 16'hc8e8;
      170: out3 <= 16'hc8b5;
      171: out3 <= 16'hc882;
      172: out3 <= 16'hc850;
      173: out3 <= 16'hc81f;
      174: out3 <= 16'hc7ee;
      175: out3 <= 16'hc7be;
      176: out3 <= 16'hc78f;
      177: out3 <= 16'hc75f;
      178: out3 <= 16'hc731;
      179: out3 <= 16'hc703;
      180: out3 <= 16'hc6d5;
      181: out3 <= 16'hc6a8;
      182: out3 <= 16'hc67c;
      183: out3 <= 16'hc650;
      184: out3 <= 16'hc625;
      185: out3 <= 16'hc5fa;
      186: out3 <= 16'hc5d0;
      187: out3 <= 16'hc5a7;
      188: out3 <= 16'hc57e;
      189: out3 <= 16'hc555;
      190: out3 <= 16'hc52d;
      191: out3 <= 16'hc506;
      192: out3 <= 16'hc4df;
      193: out3 <= 16'hc4b9;
      194: out3 <= 16'hc493;
      195: out3 <= 16'hc46e;
      196: out3 <= 16'hc44a;
      197: out3 <= 16'hc426;
      198: out3 <= 16'hc403;
      199: out3 <= 16'hc3e0;
      200: out3 <= 16'hc3be;
      201: out3 <= 16'hc39c;
      202: out3 <= 16'hc37b;
      203: out3 <= 16'hc35b;
      204: out3 <= 16'hc33b;
      205: out3 <= 16'hc31c;
      206: out3 <= 16'hc2fd;
      207: out3 <= 16'hc2df;
      208: out3 <= 16'hc2c1;
      209: out3 <= 16'hc2a5;
      210: out3 <= 16'hc288;
      211: out3 <= 16'hc26d;
      212: out3 <= 16'hc251;
      213: out3 <= 16'hc237;
      214: out3 <= 16'hc21d;
      215: out3 <= 16'hc204;
      216: out3 <= 16'hc1eb;
      217: out3 <= 16'hc1d3;
      218: out3 <= 16'hc1bb;
      219: out3 <= 16'hc1a4;
      220: out3 <= 16'hc18e;
      221: out3 <= 16'hc178;
      222: out3 <= 16'hc163;
      223: out3 <= 16'hc14f;
      224: out3 <= 16'hc13b;
      225: out3 <= 16'hc128;
      226: out3 <= 16'hc115;
      227: out3 <= 16'hc103;
      228: out3 <= 16'hc0f1;
      229: out3 <= 16'hc0e0;
      230: out3 <= 16'hc0d0;
      231: out3 <= 16'hc0c0;
      232: out3 <= 16'hc0b1;
      233: out3 <= 16'hc0a3;
      234: out3 <= 16'hc095;
      235: out3 <= 16'hc088;
      236: out3 <= 16'hc07b;
      237: out3 <= 16'hc06f;
      238: out3 <= 16'hc064;
      239: out3 <= 16'hc059;
      240: out3 <= 16'hc04f;
      241: out3 <= 16'hc045;
      242: out3 <= 16'hc03c;
      243: out3 <= 16'hc034;
      244: out3 <= 16'hc02c;
      245: out3 <= 16'hc025;
      246: out3 <= 16'hc01f;
      247: out3 <= 16'hc019;
      248: out3 <= 16'hc014;
      249: out3 <= 16'hc00f;
      250: out3 <= 16'hc00b;
      251: out3 <= 16'hc008;
      252: out3 <= 16'hc005;
      253: out3 <= 16'hc003;
      254: out3 <= 16'hc001;
      255: out3 <= 16'hc000;
      256: out3 <= 16'hc000;
      257: out3 <= 16'hc000;
      258: out3 <= 16'hc001;
      259: out3 <= 16'hc003;
      260: out3 <= 16'hc005;
      261: out3 <= 16'hc008;
      262: out3 <= 16'hc00b;
      263: out3 <= 16'hc00f;
      264: out3 <= 16'hc014;
      265: out3 <= 16'hc019;
      266: out3 <= 16'hc01f;
      267: out3 <= 16'hc025;
      268: out3 <= 16'hc02c;
      269: out3 <= 16'hc034;
      270: out3 <= 16'hc03c;
      271: out3 <= 16'hc045;
      272: out3 <= 16'hc04f;
      273: out3 <= 16'hc059;
      274: out3 <= 16'hc064;
      275: out3 <= 16'hc06f;
      276: out3 <= 16'hc07b;
      277: out3 <= 16'hc088;
      278: out3 <= 16'hc095;
      279: out3 <= 16'hc0a3;
      280: out3 <= 16'hc0b1;
      281: out3 <= 16'hc0c0;
      282: out3 <= 16'hc0d0;
      283: out3 <= 16'hc0e0;
      284: out3 <= 16'hc0f1;
      285: out3 <= 16'hc103;
      286: out3 <= 16'hc115;
      287: out3 <= 16'hc128;
      288: out3 <= 16'hc13b;
      289: out3 <= 16'hc14f;
      290: out3 <= 16'hc163;
      291: out3 <= 16'hc178;
      292: out3 <= 16'hc18e;
      293: out3 <= 16'hc1a4;
      294: out3 <= 16'hc1bb;
      295: out3 <= 16'hc1d3;
      296: out3 <= 16'hc1eb;
      297: out3 <= 16'hc204;
      298: out3 <= 16'hc21d;
      299: out3 <= 16'hc237;
      300: out3 <= 16'hc251;
      301: out3 <= 16'hc26d;
      302: out3 <= 16'hc288;
      303: out3 <= 16'hc2a5;
      304: out3 <= 16'hc2c1;
      305: out3 <= 16'hc2df;
      306: out3 <= 16'hc2fd;
      307: out3 <= 16'hc31c;
      308: out3 <= 16'hc33b;
      309: out3 <= 16'hc35b;
      310: out3 <= 16'hc37b;
      311: out3 <= 16'hc39c;
      312: out3 <= 16'hc3be;
      313: out3 <= 16'hc3e0;
      314: out3 <= 16'hc403;
      315: out3 <= 16'hc426;
      316: out3 <= 16'hc44a;
      317: out3 <= 16'hc46e;
      318: out3 <= 16'hc493;
      319: out3 <= 16'hc4b9;
      320: out3 <= 16'hc4df;
      321: out3 <= 16'hc506;
      322: out3 <= 16'hc52d;
      323: out3 <= 16'hc555;
      324: out3 <= 16'hc57e;
      325: out3 <= 16'hc5a7;
      326: out3 <= 16'hc5d0;
      327: out3 <= 16'hc5fa;
      328: out3 <= 16'hc625;
      329: out3 <= 16'hc650;
      330: out3 <= 16'hc67c;
      331: out3 <= 16'hc6a8;
      332: out3 <= 16'hc6d5;
      333: out3 <= 16'hc703;
      334: out3 <= 16'hc731;
      335: out3 <= 16'hc75f;
      336: out3 <= 16'hc78f;
      337: out3 <= 16'hc7be;
      338: out3 <= 16'hc7ee;
      339: out3 <= 16'hc81f;
      340: out3 <= 16'hc850;
      341: out3 <= 16'hc882;
      342: out3 <= 16'hc8b5;
      343: out3 <= 16'hc8e8;
      344: out3 <= 16'hc91b;
      345: out3 <= 16'hc94f;
      346: out3 <= 16'hc983;
      347: out3 <= 16'hc9b8;
      348: out3 <= 16'hc9ee;
      349: out3 <= 16'hca24;
      350: out3 <= 16'hca5b;
      351: out3 <= 16'hca92;
      352: out3 <= 16'hcac9;
      353: out3 <= 16'hcb01;
      354: out3 <= 16'hcb3a;
      355: out3 <= 16'hcb73;
      356: out3 <= 16'hcbad;
      357: out3 <= 16'hcbe7;
      358: out3 <= 16'hcc21;
      359: out3 <= 16'hcc5d;
      360: out3 <= 16'hcc98;
      361: out3 <= 16'hccd4;
      362: out3 <= 16'hcd11;
      363: out3 <= 16'hcd4e;
      364: out3 <= 16'hcd8c;
      365: out3 <= 16'hcdca;
      366: out3 <= 16'hce08;
      367: out3 <= 16'hce47;
      368: out3 <= 16'hce87;
      369: out3 <= 16'hcec7;
      370: out3 <= 16'hcf07;
      371: out3 <= 16'hcf48;
      372: out3 <= 16'hcf8a;
      373: out3 <= 16'hcfcc;
      374: out3 <= 16'hd00e;
      375: out3 <= 16'hd051;
      376: out3 <= 16'hd094;
      377: out3 <= 16'hd0d8;
      378: out3 <= 16'hd11c;
      379: out3 <= 16'hd161;
      380: out3 <= 16'hd1a6;
      381: out3 <= 16'hd1eb;
      382: out3 <= 16'hd231;
      383: out3 <= 16'hd278;
      384: out3 <= 16'hd2bf;
      385: out3 <= 16'hd306;
      386: out3 <= 16'hd34e;
      387: out3 <= 16'hd396;
      388: out3 <= 16'hd3df;
      389: out3 <= 16'hd428;
      390: out3 <= 16'hd471;
      391: out3 <= 16'hd4bb;
      392: out3 <= 16'hd505;
      393: out3 <= 16'hd550;
      394: out3 <= 16'hd59b;
      395: out3 <= 16'hd5e6;
      396: out3 <= 16'hd632;
      397: out3 <= 16'hd67f;
      398: out3 <= 16'hd6cb;
      399: out3 <= 16'hd719;
      400: out3 <= 16'hd766;
      401: out3 <= 16'hd7b4;
      402: out3 <= 16'hd802;
      403: out3 <= 16'hd851;
      404: out3 <= 16'hd8a0;
      405: out3 <= 16'hd8ef;
      406: out3 <= 16'hd93f;
      407: out3 <= 16'hd98f;
      408: out3 <= 16'hd9e0;
      409: out3 <= 16'hda31;
      410: out3 <= 16'hda82;
      411: out3 <= 16'hdad4;
      412: out3 <= 16'hdb26;
      413: out3 <= 16'hdb78;
      414: out3 <= 16'hdbcb;
      415: out3 <= 16'hdc1e;
      416: out3 <= 16'hdc72;
      417: out3 <= 16'hdcc5;
      418: out3 <= 16'hdd19;
      419: out3 <= 16'hdd6e;
      420: out3 <= 16'hddc3;
      421: out3 <= 16'hde18;
      422: out3 <= 16'hde6d;
      423: out3 <= 16'hdec3;
      424: out3 <= 16'hdf19;
      425: out3 <= 16'hdf6f;
      426: out3 <= 16'hdfc6;
      427: out3 <= 16'he01d;
      428: out3 <= 16'he074;
      429: out3 <= 16'he0cc;
      430: out3 <= 16'he124;
      431: out3 <= 16'he17c;
      432: out3 <= 16'he1d5;
      433: out3 <= 16'he22d;
      434: out3 <= 16'he287;
      435: out3 <= 16'he2e0;
      436: out3 <= 16'he33a;
      437: out3 <= 16'he394;
      438: out3 <= 16'he3ee;
      439: out3 <= 16'he448;
      440: out3 <= 16'he4a3;
      441: out3 <= 16'he4fe;
      442: out3 <= 16'he559;
      443: out3 <= 16'he5b5;
      444: out3 <= 16'he611;
      445: out3 <= 16'he66d;
      446: out3 <= 16'he6c9;
      447: out3 <= 16'he725;
      448: out3 <= 16'he782;
      449: out3 <= 16'he7df;
      450: out3 <= 16'he83c;
      451: out3 <= 16'he89a;
      452: out3 <= 16'he8f7;
      453: out3 <= 16'he955;
      454: out3 <= 16'he9b4;
      455: out3 <= 16'hea12;
      456: out3 <= 16'hea70;
      457: out3 <= 16'heacf;
      458: out3 <= 16'heb2e;
      459: out3 <= 16'heb8d;
      460: out3 <= 16'hebed;
      461: out3 <= 16'hec4c;
      462: out3 <= 16'hecac;
      463: out3 <= 16'hed0c;
      464: out3 <= 16'hed6c;
      465: out3 <= 16'hedcc;
      466: out3 <= 16'hee2d;
      467: out3 <= 16'hee8d;
      468: out3 <= 16'heeee;
      469: out3 <= 16'hef4f;
      470: out3 <= 16'hefb0;
      471: out3 <= 16'hf012;
      472: out3 <= 16'hf073;
      473: out3 <= 16'hf0d5;
      474: out3 <= 16'hf136;
      475: out3 <= 16'hf198;
      476: out3 <= 16'hf1fa;
      477: out3 <= 16'hf25c;
      478: out3 <= 16'hf2bf;
      479: out3 <= 16'hf321;
      480: out3 <= 16'hf384;
      481: out3 <= 16'hf3e6;
      482: out3 <= 16'hf449;
      483: out3 <= 16'hf4ac;
      484: out3 <= 16'hf50f;
      485: out3 <= 16'hf572;
      486: out3 <= 16'hf5d5;
      487: out3 <= 16'hf639;
      488: out3 <= 16'hf69c;
      489: out3 <= 16'hf6ff;
      490: out3 <= 16'hf763;
      491: out3 <= 16'hf7c7;
      492: out3 <= 16'hf82a;
      493: out3 <= 16'hf88e;
      494: out3 <= 16'hf8f2;
      495: out3 <= 16'hf956;
      496: out3 <= 16'hf9ba;
      497: out3 <= 16'hfa1e;
      498: out3 <= 16'hfa82;
      499: out3 <= 16'hfae6;
      500: out3 <= 16'hfb4b;
      501: out3 <= 16'hfbaf;
      502: out3 <= 16'hfc13;
      503: out3 <= 16'hfc78;
      504: out3 <= 16'hfcdc;
      505: out3 <= 16'hfd40;
      506: out3 <= 16'hfda5;
      507: out3 <= 16'hfe09;
      508: out3 <= 16'hfe6e;
      509: out3 <= 16'hfed2;
      510: out3 <= 16'hff37;
      511: out3 <= 16'hff9b;
      default: out3 <= 0;
   endcase
   end
// synthesis attribute rom_style of out3 is "block"
endmodule



module D2_63887(addr, out, clk);
   input clk;
   output [15:0] out;
   reg [15:0] out, out2, out3;
   input [8:0] addr;

   always @(posedge clk) begin
      out2 <= out3;
      out <= out2;
   case(addr)
      0: out3 <= 16'h4000;
      1: out3 <= 16'h4000;
      2: out3 <= 16'h3fff;
      3: out3 <= 16'h3ffd;
      4: out3 <= 16'h3ffb;
      5: out3 <= 16'h3ff8;
      6: out3 <= 16'h3ff5;
      7: out3 <= 16'h3ff1;
      8: out3 <= 16'h3fec;
      9: out3 <= 16'h3fe7;
      10: out3 <= 16'h3fe1;
      11: out3 <= 16'h3fdb;
      12: out3 <= 16'h3fd4;
      13: out3 <= 16'h3fcc;
      14: out3 <= 16'h3fc4;
      15: out3 <= 16'h3fbb;
      16: out3 <= 16'h3fb1;
      17: out3 <= 16'h3fa7;
      18: out3 <= 16'h3f9c;
      19: out3 <= 16'h3f91;
      20: out3 <= 16'h3f85;
      21: out3 <= 16'h3f78;
      22: out3 <= 16'h3f6b;
      23: out3 <= 16'h3f5d;
      24: out3 <= 16'h3f4f;
      25: out3 <= 16'h3f40;
      26: out3 <= 16'h3f30;
      27: out3 <= 16'h3f20;
      28: out3 <= 16'h3f0f;
      29: out3 <= 16'h3efd;
      30: out3 <= 16'h3eeb;
      31: out3 <= 16'h3ed8;
      32: out3 <= 16'h3ec5;
      33: out3 <= 16'h3eb1;
      34: out3 <= 16'h3e9d;
      35: out3 <= 16'h3e88;
      36: out3 <= 16'h3e72;
      37: out3 <= 16'h3e5c;
      38: out3 <= 16'h3e45;
      39: out3 <= 16'h3e2d;
      40: out3 <= 16'h3e15;
      41: out3 <= 16'h3dfc;
      42: out3 <= 16'h3de3;
      43: out3 <= 16'h3dc9;
      44: out3 <= 16'h3daf;
      45: out3 <= 16'h3d93;
      46: out3 <= 16'h3d78;
      47: out3 <= 16'h3d5b;
      48: out3 <= 16'h3d3f;
      49: out3 <= 16'h3d21;
      50: out3 <= 16'h3d03;
      51: out3 <= 16'h3ce4;
      52: out3 <= 16'h3cc5;
      53: out3 <= 16'h3ca5;
      54: out3 <= 16'h3c85;
      55: out3 <= 16'h3c64;
      56: out3 <= 16'h3c42;
      57: out3 <= 16'h3c20;
      58: out3 <= 16'h3bfd;
      59: out3 <= 16'h3bda;
      60: out3 <= 16'h3bb6;
      61: out3 <= 16'h3b92;
      62: out3 <= 16'h3b6d;
      63: out3 <= 16'h3b47;
      64: out3 <= 16'h3b21;
      65: out3 <= 16'h3afa;
      66: out3 <= 16'h3ad3;
      67: out3 <= 16'h3aab;
      68: out3 <= 16'h3a82;
      69: out3 <= 16'h3a59;
      70: out3 <= 16'h3a30;
      71: out3 <= 16'h3a06;
      72: out3 <= 16'h39db;
      73: out3 <= 16'h39b0;
      74: out3 <= 16'h3984;
      75: out3 <= 16'h3958;
      76: out3 <= 16'h392b;
      77: out3 <= 16'h38fd;
      78: out3 <= 16'h38cf;
      79: out3 <= 16'h38a1;
      80: out3 <= 16'h3871;
      81: out3 <= 16'h3842;
      82: out3 <= 16'h3812;
      83: out3 <= 16'h37e1;
      84: out3 <= 16'h37b0;
      85: out3 <= 16'h377e;
      86: out3 <= 16'h374b;
      87: out3 <= 16'h3718;
      88: out3 <= 16'h36e5;
      89: out3 <= 16'h36b1;
      90: out3 <= 16'h367d;
      91: out3 <= 16'h3648;
      92: out3 <= 16'h3612;
      93: out3 <= 16'h35dc;
      94: out3 <= 16'h35a5;
      95: out3 <= 16'h356e;
      96: out3 <= 16'h3537;
      97: out3 <= 16'h34ff;
      98: out3 <= 16'h34c6;
      99: out3 <= 16'h348d;
      100: out3 <= 16'h3453;
      101: out3 <= 16'h3419;
      102: out3 <= 16'h33df;
      103: out3 <= 16'h33a3;
      104: out3 <= 16'h3368;
      105: out3 <= 16'h332c;
      106: out3 <= 16'h32ef;
      107: out3 <= 16'h32b2;
      108: out3 <= 16'h3274;
      109: out3 <= 16'h3236;
      110: out3 <= 16'h31f8;
      111: out3 <= 16'h31b9;
      112: out3 <= 16'h3179;
      113: out3 <= 16'h3139;
      114: out3 <= 16'h30f9;
      115: out3 <= 16'h30b8;
      116: out3 <= 16'h3076;
      117: out3 <= 16'h3034;
      118: out3 <= 16'h2ff2;
      119: out3 <= 16'h2faf;
      120: out3 <= 16'h2f6c;
      121: out3 <= 16'h2f28;
      122: out3 <= 16'h2ee4;
      123: out3 <= 16'h2e9f;
      124: out3 <= 16'h2e5a;
      125: out3 <= 16'h2e15;
      126: out3 <= 16'h2dcf;
      127: out3 <= 16'h2d88;
      128: out3 <= 16'h2d41;
      129: out3 <= 16'h2cfa;
      130: out3 <= 16'h2cb2;
      131: out3 <= 16'h2c6a;
      132: out3 <= 16'h2c21;
      133: out3 <= 16'h2bd8;
      134: out3 <= 16'h2b8f;
      135: out3 <= 16'h2b45;
      136: out3 <= 16'h2afb;
      137: out3 <= 16'h2ab0;
      138: out3 <= 16'h2a65;
      139: out3 <= 16'h2a1a;
      140: out3 <= 16'h29ce;
      141: out3 <= 16'h2981;
      142: out3 <= 16'h2935;
      143: out3 <= 16'h28e7;
      144: out3 <= 16'h289a;
      145: out3 <= 16'h284c;
      146: out3 <= 16'h27fe;
      147: out3 <= 16'h27af;
      148: out3 <= 16'h2760;
      149: out3 <= 16'h2711;
      150: out3 <= 16'h26c1;
      151: out3 <= 16'h2671;
      152: out3 <= 16'h2620;
      153: out3 <= 16'h25cf;
      154: out3 <= 16'h257e;
      155: out3 <= 16'h252c;
      156: out3 <= 16'h24da;
      157: out3 <= 16'h2488;
      158: out3 <= 16'h2435;
      159: out3 <= 16'h23e2;
      160: out3 <= 16'h238e;
      161: out3 <= 16'h233b;
      162: out3 <= 16'h22e7;
      163: out3 <= 16'h2292;
      164: out3 <= 16'h223d;
      165: out3 <= 16'h21e8;
      166: out3 <= 16'h2193;
      167: out3 <= 16'h213d;
      168: out3 <= 16'h20e7;
      169: out3 <= 16'h2091;
      170: out3 <= 16'h203a;
      171: out3 <= 16'h1fe3;
      172: out3 <= 16'h1f8c;
      173: out3 <= 16'h1f34;
      174: out3 <= 16'h1edc;
      175: out3 <= 16'h1e84;
      176: out3 <= 16'h1e2b;
      177: out3 <= 16'h1dd3;
      178: out3 <= 16'h1d79;
      179: out3 <= 16'h1d20;
      180: out3 <= 16'h1cc6;
      181: out3 <= 16'h1c6c;
      182: out3 <= 16'h1c12;
      183: out3 <= 16'h1bb8;
      184: out3 <= 16'h1b5d;
      185: out3 <= 16'h1b02;
      186: out3 <= 16'h1aa7;
      187: out3 <= 16'h1a4b;
      188: out3 <= 16'h19ef;
      189: out3 <= 16'h1993;
      190: out3 <= 16'h1937;
      191: out3 <= 16'h18db;
      192: out3 <= 16'h187e;
      193: out3 <= 16'h1821;
      194: out3 <= 16'h17c4;
      195: out3 <= 16'h1766;
      196: out3 <= 16'h1709;
      197: out3 <= 16'h16ab;
      198: out3 <= 16'h164c;
      199: out3 <= 16'h15ee;
      200: out3 <= 16'h1590;
      201: out3 <= 16'h1531;
      202: out3 <= 16'h14d2;
      203: out3 <= 16'h1473;
      204: out3 <= 16'h1413;
      205: out3 <= 16'h13b4;
      206: out3 <= 16'h1354;
      207: out3 <= 16'h12f4;
      208: out3 <= 16'h1294;
      209: out3 <= 16'h1234;
      210: out3 <= 16'h11d3;
      211: out3 <= 16'h1173;
      212: out3 <= 16'h1112;
      213: out3 <= 16'h10b1;
      214: out3 <= 16'h1050;
      215: out3 <= 16'hfee;
      216: out3 <= 16'hf8d;
      217: out3 <= 16'hf2b;
      218: out3 <= 16'heca;
      219: out3 <= 16'he68;
      220: out3 <= 16'he06;
      221: out3 <= 16'hda4;
      222: out3 <= 16'hd41;
      223: out3 <= 16'hcdf;
      224: out3 <= 16'hc7c;
      225: out3 <= 16'hc1a;
      226: out3 <= 16'hbb7;
      227: out3 <= 16'hb54;
      228: out3 <= 16'haf1;
      229: out3 <= 16'ha8e;
      230: out3 <= 16'ha2b;
      231: out3 <= 16'h9c7;
      232: out3 <= 16'h964;
      233: out3 <= 16'h901;
      234: out3 <= 16'h89d;
      235: out3 <= 16'h839;
      236: out3 <= 16'h7d6;
      237: out3 <= 16'h772;
      238: out3 <= 16'h70e;
      239: out3 <= 16'h6aa;
      240: out3 <= 16'h646;
      241: out3 <= 16'h5e2;
      242: out3 <= 16'h57e;
      243: out3 <= 16'h51a;
      244: out3 <= 16'h4b5;
      245: out3 <= 16'h451;
      246: out3 <= 16'h3ed;
      247: out3 <= 16'h388;
      248: out3 <= 16'h324;
      249: out3 <= 16'h2c0;
      250: out3 <= 16'h25b;
      251: out3 <= 16'h1f7;
      252: out3 <= 16'h192;
      253: out3 <= 16'h12e;
      254: out3 <= 16'hc9;
      255: out3 <= 16'h65;
      256: out3 <= 16'h0;
      257: out3 <= 16'hff9b;
      258: out3 <= 16'hff37;
      259: out3 <= 16'hfed2;
      260: out3 <= 16'hfe6e;
      261: out3 <= 16'hfe09;
      262: out3 <= 16'hfda5;
      263: out3 <= 16'hfd40;
      264: out3 <= 16'hfcdc;
      265: out3 <= 16'hfc78;
      266: out3 <= 16'hfc13;
      267: out3 <= 16'hfbaf;
      268: out3 <= 16'hfb4b;
      269: out3 <= 16'hfae6;
      270: out3 <= 16'hfa82;
      271: out3 <= 16'hfa1e;
      272: out3 <= 16'hf9ba;
      273: out3 <= 16'hf956;
      274: out3 <= 16'hf8f2;
      275: out3 <= 16'hf88e;
      276: out3 <= 16'hf82a;
      277: out3 <= 16'hf7c7;
      278: out3 <= 16'hf763;
      279: out3 <= 16'hf6ff;
      280: out3 <= 16'hf69c;
      281: out3 <= 16'hf639;
      282: out3 <= 16'hf5d5;
      283: out3 <= 16'hf572;
      284: out3 <= 16'hf50f;
      285: out3 <= 16'hf4ac;
      286: out3 <= 16'hf449;
      287: out3 <= 16'hf3e6;
      288: out3 <= 16'hf384;
      289: out3 <= 16'hf321;
      290: out3 <= 16'hf2bf;
      291: out3 <= 16'hf25c;
      292: out3 <= 16'hf1fa;
      293: out3 <= 16'hf198;
      294: out3 <= 16'hf136;
      295: out3 <= 16'hf0d5;
      296: out3 <= 16'hf073;
      297: out3 <= 16'hf012;
      298: out3 <= 16'hefb0;
      299: out3 <= 16'hef4f;
      300: out3 <= 16'heeee;
      301: out3 <= 16'hee8d;
      302: out3 <= 16'hee2d;
      303: out3 <= 16'hedcc;
      304: out3 <= 16'hed6c;
      305: out3 <= 16'hed0c;
      306: out3 <= 16'hecac;
      307: out3 <= 16'hec4c;
      308: out3 <= 16'hebed;
      309: out3 <= 16'heb8d;
      310: out3 <= 16'heb2e;
      311: out3 <= 16'heacf;
      312: out3 <= 16'hea70;
      313: out3 <= 16'hea12;
      314: out3 <= 16'he9b4;
      315: out3 <= 16'he955;
      316: out3 <= 16'he8f7;
      317: out3 <= 16'he89a;
      318: out3 <= 16'he83c;
      319: out3 <= 16'he7df;
      320: out3 <= 16'he782;
      321: out3 <= 16'he725;
      322: out3 <= 16'he6c9;
      323: out3 <= 16'he66d;
      324: out3 <= 16'he611;
      325: out3 <= 16'he5b5;
      326: out3 <= 16'he559;
      327: out3 <= 16'he4fe;
      328: out3 <= 16'he4a3;
      329: out3 <= 16'he448;
      330: out3 <= 16'he3ee;
      331: out3 <= 16'he394;
      332: out3 <= 16'he33a;
      333: out3 <= 16'he2e0;
      334: out3 <= 16'he287;
      335: out3 <= 16'he22d;
      336: out3 <= 16'he1d5;
      337: out3 <= 16'he17c;
      338: out3 <= 16'he124;
      339: out3 <= 16'he0cc;
      340: out3 <= 16'he074;
      341: out3 <= 16'he01d;
      342: out3 <= 16'hdfc6;
      343: out3 <= 16'hdf6f;
      344: out3 <= 16'hdf19;
      345: out3 <= 16'hdec3;
      346: out3 <= 16'hde6d;
      347: out3 <= 16'hde18;
      348: out3 <= 16'hddc3;
      349: out3 <= 16'hdd6e;
      350: out3 <= 16'hdd19;
      351: out3 <= 16'hdcc5;
      352: out3 <= 16'hdc72;
      353: out3 <= 16'hdc1e;
      354: out3 <= 16'hdbcb;
      355: out3 <= 16'hdb78;
      356: out3 <= 16'hdb26;
      357: out3 <= 16'hdad4;
      358: out3 <= 16'hda82;
      359: out3 <= 16'hda31;
      360: out3 <= 16'hd9e0;
      361: out3 <= 16'hd98f;
      362: out3 <= 16'hd93f;
      363: out3 <= 16'hd8ef;
      364: out3 <= 16'hd8a0;
      365: out3 <= 16'hd851;
      366: out3 <= 16'hd802;
      367: out3 <= 16'hd7b4;
      368: out3 <= 16'hd766;
      369: out3 <= 16'hd719;
      370: out3 <= 16'hd6cb;
      371: out3 <= 16'hd67f;
      372: out3 <= 16'hd632;
      373: out3 <= 16'hd5e6;
      374: out3 <= 16'hd59b;
      375: out3 <= 16'hd550;
      376: out3 <= 16'hd505;
      377: out3 <= 16'hd4bb;
      378: out3 <= 16'hd471;
      379: out3 <= 16'hd428;
      380: out3 <= 16'hd3df;
      381: out3 <= 16'hd396;
      382: out3 <= 16'hd34e;
      383: out3 <= 16'hd306;
      384: out3 <= 16'hd2bf;
      385: out3 <= 16'hd278;
      386: out3 <= 16'hd231;
      387: out3 <= 16'hd1eb;
      388: out3 <= 16'hd1a6;
      389: out3 <= 16'hd161;
      390: out3 <= 16'hd11c;
      391: out3 <= 16'hd0d8;
      392: out3 <= 16'hd094;
      393: out3 <= 16'hd051;
      394: out3 <= 16'hd00e;
      395: out3 <= 16'hcfcc;
      396: out3 <= 16'hcf8a;
      397: out3 <= 16'hcf48;
      398: out3 <= 16'hcf07;
      399: out3 <= 16'hcec7;
      400: out3 <= 16'hce87;
      401: out3 <= 16'hce47;
      402: out3 <= 16'hce08;
      403: out3 <= 16'hcdca;
      404: out3 <= 16'hcd8c;
      405: out3 <= 16'hcd4e;
      406: out3 <= 16'hcd11;
      407: out3 <= 16'hccd4;
      408: out3 <= 16'hcc98;
      409: out3 <= 16'hcc5d;
      410: out3 <= 16'hcc21;
      411: out3 <= 16'hcbe7;
      412: out3 <= 16'hcbad;
      413: out3 <= 16'hcb73;
      414: out3 <= 16'hcb3a;
      415: out3 <= 16'hcb01;
      416: out3 <= 16'hcac9;
      417: out3 <= 16'hca92;
      418: out3 <= 16'hca5b;
      419: out3 <= 16'hca24;
      420: out3 <= 16'hc9ee;
      421: out3 <= 16'hc9b8;
      422: out3 <= 16'hc983;
      423: out3 <= 16'hc94f;
      424: out3 <= 16'hc91b;
      425: out3 <= 16'hc8e8;
      426: out3 <= 16'hc8b5;
      427: out3 <= 16'hc882;
      428: out3 <= 16'hc850;
      429: out3 <= 16'hc81f;
      430: out3 <= 16'hc7ee;
      431: out3 <= 16'hc7be;
      432: out3 <= 16'hc78f;
      433: out3 <= 16'hc75f;
      434: out3 <= 16'hc731;
      435: out3 <= 16'hc703;
      436: out3 <= 16'hc6d5;
      437: out3 <= 16'hc6a8;
      438: out3 <= 16'hc67c;
      439: out3 <= 16'hc650;
      440: out3 <= 16'hc625;
      441: out3 <= 16'hc5fa;
      442: out3 <= 16'hc5d0;
      443: out3 <= 16'hc5a7;
      444: out3 <= 16'hc57e;
      445: out3 <= 16'hc555;
      446: out3 <= 16'hc52d;
      447: out3 <= 16'hc506;
      448: out3 <= 16'hc4df;
      449: out3 <= 16'hc4b9;
      450: out3 <= 16'hc493;
      451: out3 <= 16'hc46e;
      452: out3 <= 16'hc44a;
      453: out3 <= 16'hc426;
      454: out3 <= 16'hc403;
      455: out3 <= 16'hc3e0;
      456: out3 <= 16'hc3be;
      457: out3 <= 16'hc39c;
      458: out3 <= 16'hc37b;
      459: out3 <= 16'hc35b;
      460: out3 <= 16'hc33b;
      461: out3 <= 16'hc31c;
      462: out3 <= 16'hc2fd;
      463: out3 <= 16'hc2df;
      464: out3 <= 16'hc2c1;
      465: out3 <= 16'hc2a5;
      466: out3 <= 16'hc288;
      467: out3 <= 16'hc26d;
      468: out3 <= 16'hc251;
      469: out3 <= 16'hc237;
      470: out3 <= 16'hc21d;
      471: out3 <= 16'hc204;
      472: out3 <= 16'hc1eb;
      473: out3 <= 16'hc1d3;
      474: out3 <= 16'hc1bb;
      475: out3 <= 16'hc1a4;
      476: out3 <= 16'hc18e;
      477: out3 <= 16'hc178;
      478: out3 <= 16'hc163;
      479: out3 <= 16'hc14f;
      480: out3 <= 16'hc13b;
      481: out3 <= 16'hc128;
      482: out3 <= 16'hc115;
      483: out3 <= 16'hc103;
      484: out3 <= 16'hc0f1;
      485: out3 <= 16'hc0e0;
      486: out3 <= 16'hc0d0;
      487: out3 <= 16'hc0c0;
      488: out3 <= 16'hc0b1;
      489: out3 <= 16'hc0a3;
      490: out3 <= 16'hc095;
      491: out3 <= 16'hc088;
      492: out3 <= 16'hc07b;
      493: out3 <= 16'hc06f;
      494: out3 <= 16'hc064;
      495: out3 <= 16'hc059;
      496: out3 <= 16'hc04f;
      497: out3 <= 16'hc045;
      498: out3 <= 16'hc03c;
      499: out3 <= 16'hc034;
      500: out3 <= 16'hc02c;
      501: out3 <= 16'hc025;
      502: out3 <= 16'hc01f;
      503: out3 <= 16'hc019;
      504: out3 <= 16'hc014;
      505: out3 <= 16'hc00f;
      506: out3 <= 16'hc00b;
      507: out3 <= 16'hc008;
      508: out3 <= 16'hc005;
      509: out3 <= 16'hc003;
      510: out3 <= 16'hc001;
      511: out3 <= 16'hc000;
      default: out3 <= 0;
   endcase
   end
// synthesis attribute rom_style of out3 is "block"
endmodule



// Latency: 8
// Gap: 1
module codeBlock61671(clk, reset, next_in, next_out,
   i1_in,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;
   input [8:0] i1_in;
   reg [8:0] i1;

   input [15:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [15:0] X0,
      X1,
      X2,
      X3;

   output [15:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(7, 1) shiftFIFO_65688(.X(next), .Y(next_out), .clk(clk));


   wire signed [15:0] a53;
   wire signed [15:0] a42;
   wire signed [15:0] a56;
   wire signed [15:0] a46;
   wire signed [15:0] a57;
   wire signed [15:0] a58;
   reg signed [15:0] tm474;
   reg signed [15:0] tm478;
   reg signed [15:0] tm490;
   reg signed [15:0] tm497;
   reg signed [15:0] tm475;
   reg signed [15:0] tm479;
   reg signed [15:0] tm491;
   reg signed [15:0] tm498;
   wire signed [15:0] tm34;
   wire signed [15:0] a47;
   wire signed [15:0] tm35;
   wire signed [15:0] a49;
   reg signed [15:0] tm476;
   reg signed [15:0] tm480;
   reg signed [15:0] tm492;
   reg signed [15:0] tm499;
   reg signed [15:0] tm104;
   reg signed [15:0] tm105;
   reg signed [15:0] tm477;
   reg signed [15:0] tm481;
   reg signed [15:0] tm493;
   reg signed [15:0] tm500;
   reg signed [15:0] tm494;
   reg signed [15:0] tm501;
   wire signed [15:0] a48;
   wire signed [15:0] a50;
   wire signed [15:0] a51;
   wire signed [15:0] a52;
   reg signed [15:0] tm495;
   reg signed [15:0] tm502;
   wire signed [15:0] Y0;
   wire signed [15:0] Y1;
   wire signed [15:0] Y2;
   wire signed [15:0] Y3;
   reg signed [15:0] tm496;
   reg signed [15:0] tm503;


   assign a53 = X0;
   assign a42 = a53;
   assign a56 = X1;
   assign a46 = a56;
   assign a57 = X2;
   assign a58 = X3;
   assign a47 = tm34;
   assign a49 = tm35;
   assign Y0 = tm496;
   assign Y1 = tm503;

   D4_62859 instD4inst0_62859(.addr(i1[8:0]), .out(tm35), .clk(clk));

   D2_63887 instD2inst0_63887(.addr(i1[8:0]), .out(tm34), .clk(clk));

    multfix #(16, 2) m61770(.a(tm104), .b(tm477), .clk(clk), .q_sc(a48), .q_unsc(), .rst(reset));
    multfix #(16, 2) m61792(.a(tm105), .b(tm481), .clk(clk), .q_sc(a50), .q_unsc(), .rst(reset));
    multfix #(16, 2) m61810(.a(tm105), .b(tm477), .clk(clk), .q_sc(a51), .q_unsc(), .rst(reset));
    multfix #(16, 2) m61821(.a(tm104), .b(tm481), .clk(clk), .q_sc(a52), .q_unsc(), .rst(reset));
    subfxp #(16, 1) sub61799(.a(a48), .b(a50), .clk(clk), .q(Y2));    // 6
    addfxp #(16, 1) add61828(.a(a51), .b(a52), .clk(clk), .q(Y3));    // 6


   always @(posedge clk) begin
      if (reset == 1) begin
         tm104 <= 0;
         tm477 <= 0;
         tm105 <= 0;
         tm481 <= 0;
         tm105 <= 0;
         tm477 <= 0;
         tm104 <= 0;
         tm481 <= 0;
      end
      else begin
         i1 <= i1_in;
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         tm474 <= a57;
         tm478 <= a58;
         tm490 <= a42;
         tm497 <= a46;
         tm475 <= tm474;
         tm479 <= tm478;
         tm491 <= tm490;
         tm498 <= tm497;
         tm476 <= tm475;
         tm480 <= tm479;
         tm492 <= tm491;
         tm499 <= tm498;
         tm104 <= a47;
         tm105 <= a49;
         tm477 <= tm476;
         tm481 <= tm480;
         tm493 <= tm492;
         tm500 <= tm499;
         tm494 <= tm493;
         tm501 <= tm500;
         tm495 <= tm494;
         tm502 <= tm501;
         tm496 <= tm495;
         tm503 <= tm502;
      end
   end
endmodule

// Latency: 2
// Gap: 1
module codeBlock63892(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [15:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [15:0] X0,
      X1,
      X2,
      X3;

   output [15:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_65691(.X(next), .Y(next_out), .clk(clk));


   wire signed [15:0] a9;
   wire signed [15:0] a10;
   wire signed [15:0] a11;
   wire signed [15:0] a12;
   wire signed [15:0] t21;
   wire signed [15:0] t22;
   wire signed [15:0] t23;
   wire signed [15:0] t24;
   wire signed [15:0] Y0;
   wire signed [15:0] Y1;
   wire signed [15:0] Y2;
   wire signed [15:0] Y3;


   assign a9 = X0;
   assign a10 = X2;
   assign a11 = X1;
   assign a12 = X3;
   assign Y0 = t21;
   assign Y1 = t22;
   assign Y2 = t23;
   assign Y3 = t24;

    addfxp #(16, 1) add63904(.a(a9), .b(a10), .clk(clk), .q(t21));    // 0
    addfxp #(16, 1) add63919(.a(a11), .b(a12), .clk(clk), .q(t22));    // 0
    subfxp #(16, 1) sub63934(.a(a9), .b(a10), .clk(clk), .q(t23));    // 0
    subfxp #(16, 1) sub63949(.a(a11), .b(a12), .clk(clk), .q(t24));    // 0


   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
      end
   end
endmodule

// Latency: 259
// Gap: 512
module rc63973(clk, reset, next, next_out,
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

   wire [31:0] t0;
   wire [31:0] s0;
   assign t0 = {X0, X1};
   wire [31:0] t1;
   wire [31:0] s1;
   assign t1 = {X2, X3};
   assign Y0 = s0[31:16];
   assign Y1 = s0[15:0];
   assign Y2 = s1[31:16];
   assign Y3 = s1[15:0];

   perm63971 instPerm65692(.x0(t0), .y0(s0),
    .x1(t1), .y1(s1),
   .clk(clk), .next(next), .next_out(next_out), .reset(reset)
);



endmodule

// Latency: 259
// Gap: 512
module perm63971(clk, next, reset, next_out,
   x0, y0,
   x1, y1);
   parameter numBanks = 2;
   parameter logBanks = 1;
   parameter depth = 512;
   parameter logDepth = 9;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 1'd0};
   assign    addr0b = {outCount, 1'd0};
   assign    addr0c = {outCount_for_rd_addr, 1'd0};
   assign    addr1 = {inCount, 1'd1};
   assign    addr1b = {outCount, 1'd1};
   assign    addr1c = {outCount_for_rd_addr, 1'd1};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_1_0, w_1_1;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    wire [width-1:0] z_1_0, z_1_1;

    wire [logDepth-1:0] u_0_0, u_0_1, u_1_0, u_1_1;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[1] ^ addr0[0];
   assign inAddr0[0] = addr0[2];
   assign inAddr0[1] = addr0[3];
   assign inAddr0[2] = addr0[4];
   assign inAddr0[3] = addr0[5];
   assign inAddr0[4] = addr0[6];
   assign inAddr0[5] = addr0[7];
   assign inAddr0[6] = addr0[8];
   assign inAddr0[7] = addr0[9];
   assign inAddr0[8] = addr0[0];
   assign outBank0[0] = addr0b[9] ^ addr0b[0];
   assign outAddr0[0] = addr0b[1];
   assign outAddr0[1] = addr0b[2];
   assign outAddr0[2] = addr0b[3];
   assign outAddr0[3] = addr0b[4];
   assign outAddr0[4] = addr0b[5];
   assign outAddr0[5] = addr0b[6];
   assign outAddr0[6] = addr0b[7];
   assign outAddr0[7] = addr0b[8];
   assign outAddr0[8] = addr0b[9];
   assign outBank_a0[0] = addr0c[9] ^ addr0c[0];
   assign outAddr_a0[0] = addr0c[1];
   assign outAddr_a0[1] = addr0c[2];
   assign outAddr_a0[2] = addr0c[3];
   assign outAddr_a0[3] = addr0c[4];
   assign outAddr_a0[4] = addr0c[5];
   assign outAddr_a0[5] = addr0c[6];
   assign outAddr_a0[6] = addr0c[7];
   assign outAddr_a0[7] = addr0c[8];
   assign outAddr_a0[8] = addr0c[9];

   assign inBank1[0] = addr1[1] ^ addr1[0];
   assign inAddr1[0] = addr1[2];
   assign inAddr1[1] = addr1[3];
   assign inAddr1[2] = addr1[4];
   assign inAddr1[3] = addr1[5];
   assign inAddr1[4] = addr1[6];
   assign inAddr1[5] = addr1[7];
   assign inAddr1[6] = addr1[8];
   assign inAddr1[7] = addr1[9];
   assign inAddr1[8] = addr1[0];
   assign outBank1[0] = addr1b[9] ^ addr1b[0];
   assign outAddr1[0] = addr1b[1];
   assign outAddr1[1] = addr1b[2];
   assign outAddr1[2] = addr1b[3];
   assign outAddr1[3] = addr1b[4];
   assign outAddr1[4] = addr1b[5];
   assign outAddr1[5] = addr1b[6];
   assign outAddr1[6] = addr1b[7];
   assign outAddr1[7] = addr1b[8];
   assign outAddr1[8] = addr1b[9];
   assign outBank_a1[0] = addr1c[9] ^ addr1c[0];
   assign outAddr_a1[0] = addr1c[1];
   assign outAddr_a1[1] = addr1c[2];
   assign outAddr_a1[2] = addr1c[3];
   assign outAddr_a1[3] = addr1c[4];
   assign outAddr_a1[4] = addr1c[5];
   assign outAddr_a1[5] = addr1c[6];
   assign outAddr_a1[6] = addr1c[7];
   assign outAddr_a1[7] = addr1c[8];
   assign outAddr_a1[8] = addr1c[9];

   nextReg #(257, 9) nextReg_65697(.X(next), .Y(next0), .reset(reset), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_65700(.X(next0), .Y(next_out), .clk(clk));


   memArray1024_63971 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 256)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 258)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
         if (inCount == 256) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 511) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 256)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[0];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[8];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[8];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
endmodule

module memArray1024_63971(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                clk, inFlip, outFlip);

   parameter numBanks = 2;
   parameter logBanks = 1;
   parameter depth = 512;
   parameter logDepth = 9;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   nextReg #(512, 9) nextReg_65705(.X(next), .Y(next0), .reset(reset), .clk(clk));


   memMod #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
endmodule


						module multfix(clk, rst, a, b, q_sc, q_unsc);
						   parameter WIDTH=35, CYCLES=6;

						   input signed [WIDTH-1:0]    a,b;
						   output [WIDTH-1:0]          q_sc;
						   output [WIDTH-1:0]              q_unsc;

						   input                       clk, rst;
						   
						   reg signed [2*WIDTH-1:0]    q[CYCLES-1:0];
						   wire signed [2*WIDTH-1:0]   res;   
						   integer                     i;

						   assign                      res = q[CYCLES-1];   
						   
						   assign                      q_unsc = res[WIDTH-1:0];
						   assign                      q_sc = {res[2*WIDTH-1], res[2*WIDTH-4:WIDTH-2]};
						      
						   always @(posedge clk) begin
						      q[0] <= a * b;
						      for (i = 1; i < CYCLES; i=i+1) begin
						         q[i] <= q[i-1];
						      end
						   end
						                  
						endmodule 
module addfxp(a, b, q, clk);

   parameter width = 16, cycles=1;
   
   input signed [width-1:0]  a, b;
   input                     clk;   
   output signed [width-1:0] q;
   reg signed [width-1:0]    res[cycles-1:0];

   assign                    q = res[cycles-1];
   
   integer                   i;   
   
   always @(posedge clk) begin
     res[0] <= a+b;
      for (i=1; i < cycles; i = i+1)
        res[i] <= res[i-1];
      
   end
   
endmodule

module subfxp(a, b, q, clk);

   parameter width = 16, cycles=1;
   
   input signed [width-1:0]  a, b;
   input                     clk;   
   output signed [width-1:0] q;
   reg signed [width-1:0]    res[cycles-1:0];

   assign                    q = res[cycles-1];
   
   integer                   i;   
   
   always @(posedge clk) begin
     res[0] <= a-b;
      for (i=1; i < cycles; i = i+1)
        res[i] <= res[i-1];
      
   end
  
endmodule