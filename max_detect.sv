module max_detect(input logic clk, reset_fft,
						input logic [8:0] output_index,
						input logic signed [15:0] real0, imag0, real1, imag1, 
						output logic [9:0] output_idx,
						output logic signed [35:0] m0, m1);

logic signed [35:0] max, bigger;
logic newval, onebig;
logic [9:0] max_idx; 

always_comb
begin
	if(!reset_fft) 
		begin
		m0 = real0 * real0 + imag0 * imag0;
		m1 = real1 * real1 + imag1 * imag1;
		end
	else 
		begin
		m0 = 0;
		m1 = 0;
		end
	if(m1 > m0) 
		begin
		bigger = m1;
		onebig = 1'b1;
		end
	else 
		begin
		bigger = m0;
		onebig = 1'b0;
		end
		
end
always_ff @ (posedge clk)
	begin
//	ignores DC output
		if(reset_fft) begin
			max_idx <= 10'b0;
			max <= 0; 
			end
		else if(bigger > max && !output_index[8]) begin
			max <= bigger;
			max_idx <= {output_index[8:0], onebig};
			end

	end

always_ff @ (posedge reset_fft)
	begin
		output_idx <= max_idx; 
	end
endmodule
