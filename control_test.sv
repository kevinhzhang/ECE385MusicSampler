module control_test();


timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

logic clk, reset, sample_clk, empty_even, empty_odd, 
								full_even, full_odd, fft_read;
						
logic write_even, write_odd, read, reset_fft, reset_max, fft_start;
logic [8:0] output_index;

control ctrl(.*);

always begin : CLOCK_GENERATION
#1 clk = ~clk;
end

initial begin: CLOCK_INITIALIZATION
    clk = 0;
end 

initial begin: TEST_VECTORS
reset = 1'b1;
empty_even = 1'b1;
empty_odd = 1'b1;
full_even = 1'b0;
full_odd = 1'b0;

#50
reset = 1'b0;
empty_even = 1'b0;
empty_odd = 1'b0;
#50
full_even = 1'b1;
full_odd = 1'b1;
#1000
empty_even = 1'b1;
empty_odd = 1'b1;
#3000
fft_read = 1'b1;
#1000

reset = 1'b1;
end

endmodule
