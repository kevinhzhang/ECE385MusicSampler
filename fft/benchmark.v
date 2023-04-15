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

module test;
    reg clk,rst,next;
    reg [63:0] i0;
    reg [63:0] i1;
    wire next_out;
    wire [63:0] o0;
    wire [63:0] o1;

 //Clock
    always
      begin
        clk <= 0;#50;
        clk <= 1;#50;
      end

//inputs
    initial
      begin
        @(posedge clk);
        next <= 0;
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        rst <= 1;
        @(posedge clk);
        @(posedge clk);
        rst <= 0;
        @(posedge clk); //cycle -6
        next <= 1;
        @(posedge clk); //cycle -5
        next <= 0;
        @(posedge clk); //cycle -4
        @(posedge clk); //cycle -3
        @(posedge clk); //cycle -2
        @(posedge clk); //cycle -1
        @(posedge clk); //cycle 0
        //dataset 0 enters.
        i0 <= 64'd0;
        i1 <= 64'd1;
        @(posedge clk); //cycle 1
        i0 <= 64'd2;
        i1 <= 64'd3;
        @(posedge clk); //cycle 2
        i0 <= 64'd4;
        i1 <= 64'd5;
        @(posedge clk); //cycle 3
        i0 <= 64'd6;
        i1 <= 64'd7;
        @(posedge clk); //cycle 4
        i0 <= 64'd8;
        i1 <= 64'd9;
        @(posedge clk); //cycle 5
        i0 <= 64'd10;
        i1 <= 64'd11;
        @(posedge clk); //cycle 6
        i0 <= 64'd12;
        i1 <= 64'd13;
        @(posedge clk); //cycle 7
        i0 <= 64'd14;
        i1 <= 64'd15;
        @(posedge clk); //cycle 8
        i0 <= 64'd16;
        i1 <= 64'd17;
        @(posedge clk); //cycle 9
        i0 <= 64'd18;
        i1 <= 64'd19;
        @(posedge clk); //cycle 10
        next <= 1;
        i0 <= 64'd20;
        i1 <= 64'd21;
        @(posedge clk); //cycle 11
        next <= 0;
        i0 <= 64'd22;
        i1 <= 64'd23;
        @(posedge clk); //cycle 12
        i0 <= 64'd24;
        i1 <= 64'd25;
        @(posedge clk); //cycle 13
        i0 <= 64'd26;
        i1 <= 64'd27;
        @(posedge clk); //cycle 14
        i0 <= 64'd28;
        i1 <= 64'd29;
        @(posedge clk); //cycle 15
        i0 <= 64'd30;
        i1 <= 64'd31;
        @(posedge clk); //cycle 16
        //dataset 1 enters.
        i0 <= 64'd32;
        i1 <= 64'd33;
        @(posedge clk); //cycle 17
        i0 <= 64'd34;
        i1 <= 64'd35;
        @(posedge clk); //cycle 18
        i0 <= 64'd36;
        i1 <= 64'd37;
        @(posedge clk); //cycle 19
        i0 <= 64'd38;
        i1 <= 64'd39;
        @(posedge clk); //cycle 20
        i0 <= 64'd40;
        i1 <= 64'd41;
        @(posedge clk); //cycle 21
        i0 <= 64'd42;
        i1 <= 64'd43;
        @(posedge clk); //cycle 22
        i0 <= 64'd44;
        i1 <= 64'd45;
        @(posedge clk); //cycle 23
        i0 <= 64'd46;
        i1 <= 64'd47;
        @(posedge clk); //cycle 24
        i0 <= 64'd48;
        i1 <= 64'd49;
        @(posedge clk); //cycle 25
        i0 <= 64'd50;
        i1 <= 64'd51;
        @(posedge clk); //cycle 26
        i0 <= 64'd52;
        i1 <= 64'd53;
        @(posedge clk); //cycle 27
        i0 <= 64'd54;
        i1 <= 64'd55;
        @(posedge clk); //cycle 28
        i0 <= 64'd56;
        i1 <= 64'd57;
        @(posedge clk); //cycle 29
        i0 <= 64'd58;
        i1 <= 64'd59;
        @(posedge clk); //cycle 30
        i0 <= 64'd60;
        i1 <= 64'd61;
        @(posedge clk); //cycle 31
        i0 <= 64'd62;
        i1 <= 64'd63;
      end
    initial
      begin
        @(posedge next_out);//#100;
        #50;
        $display("output0: %0d (expected: 496)",o0);
        $display("output1: %0d (expected: 700079669232)",o1);
        #100;
        $display("output2: %0d (expected: 347892350960)",o0);
        $display("output3: %0d (expected: 227633266672)",o1);
        #100;
        $display("output4: %0d (expected: 167503724528)",o0);
        $display("output5: %0d (expected: 128849018865)",o1);
        #100;
        $display("output6: %0d (expected: 103079215088)",o0);
        $display("output7: %0d (expected: 85899345904)",o1);
        #100;
        $display("output8: %0d (expected: 73014444016)",o0);
        $display("output9: %0d (expected: 60129542129)",o1);
        #100;
        $display("output10: %0d (expected: 47244640241)",o0);
        $display("output11: %0d (expected: 38654705648)",o1);
        #100;
        $display("output12: %0d (expected: 30064771056)",o0);
        $display("output13: %0d (expected: 21474836465)",o1);
        #100;
        $display("output14: %0d (expected: 17179869168)",o0);
        $display("output15: %0d (expected: 8589934576)",o1);
        #100;
        $display("output16: %0d (expected: 4294967280)",o0);
        $display("output17: %0d (expected: 18446744073709551601)",o1);
        #100;
        $display("output18: %0d (expected: 18446744065119617008)",o0);
        $display("output19: %0d (expected: 18446744060824649713)",o1);
        #100;
        $display("output20: %0d (expected: 18446744052234715121)",o0);
        $display("output21: %0d (expected: 18446744043644780529)",o1);
        #100;
        $display("output22: %0d (expected: 18446744035054845937)",o0);
        $display("output23: %0d (expected: 18446744022169944048)",o1);
        #100;
        $display("output24: %0d (expected: 18446744009285042160)",o0);
        $display("output25: %0d (expected: 18446743996400140272)",o1);
        #100;
        $display("output26: %0d (expected: 18446743979220271089)",o0);
        $display("output27: %0d (expected: 18446743953450467313)",o1);
        #100;
        $display("output28: %0d (expected: 18446743914795761649)",o0);
        $display("output29: %0d (expected: 18446743854666219504)",o1);
        #100;
        $display("output30: %0d (expected: 18446743734407135217)",o0);
        $display("output31: %0d (expected: 18446743382219816945)",o1);
        #100;
        #0; //gap
        $display("output32: %0d (expected: 1520)",o0);
        $display("output33: %0d (expected: 700079669232)",o1);
        #100;
        $display("output34: %0d (expected: 347892350960)",o0);
        $display("output35: %0d (expected: 227633266672)",o1);
        #100;
        $display("output36: %0d (expected: 167503724528)",o0);
        $display("output37: %0d (expected: 128849018865)",o1);
        #100;
        $display("output38: %0d (expected: 103079215088)",o0);
        $display("output39: %0d (expected: 85899345904)",o1);
        #100;
        $display("output40: %0d (expected: 73014444016)",o0);
        $display("output41: %0d (expected: 60129542129)",o1);
        #100;
        $display("output42: %0d (expected: 47244640241)",o0);
        $display("output43: %0d (expected: 38654705648)",o1);
        #100;
        $display("output44: %0d (expected: 30064771056)",o0);
        $display("output45: %0d (expected: 21474836465)",o1);
        #100;
        $display("output46: %0d (expected: 17179869168)",o0);
        $display("output47: %0d (expected: 8589934576)",o1);
        #100;
        $display("output48: %0d (expected: 4294967280)",o0);
        $display("output49: %0d (expected: 18446744073709551601)",o1);
        #100;
        $display("output50: %0d (expected: 18446744065119617008)",o0);
        $display("output51: %0d (expected: 18446744060824649713)",o1);
        #100;
        $display("output52: %0d (expected: 18446744052234715121)",o0);
        $display("output53: %0d (expected: 18446744043644780529)",o1);
        #100;
        $display("output54: %0d (expected: 18446744035054845937)",o0);
        $display("output55: %0d (expected: 18446744022169944048)",o1);
        #100;
        $display("output56: %0d (expected: 18446744009285042160)",o0);
        $display("output57: %0d (expected: 18446743996400140272)",o1);
        #100;
        $display("output58: %0d (expected: 18446743979220271089)",o0);
        $display("output59: %0d (expected: 18446743953450467313)",o1);
        #100;
        $display("output60: %0d (expected: 18446743914795761649)",o0);
        $display("output61: %0d (expected: 18446743854666219504)",o1);
        #100;
        $display("output62: %0d (expected: 18446743734407135217)",o0);
        $display("output63: %0d (expected: 18446743382219816945)",o1);
        #100;
        #0; //gap
        $display("Success.");
        $finish();
      end
      product uut(clk,rst,next,i0,i1,next_out,o0,o1);
endmodule
