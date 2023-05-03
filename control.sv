module control(input logic clk, reset, 
								full_even, full_odd, fft_read,
								output logic write_even, write_odd, read, reset_fft, reset_max, fft_start,
								output logic [8:0] output_index
								);
logic loadcount;
logic countup;
logic [8:0] input_count; 

enum logic [3:0] {start, reset_state, listen, prepare, load_fft, fft_wait, fft_out} State, Next_state;
always_ff @ (posedge clk)
	begin
		output_index = countup ? output_index + 1 : 0;
		input_count = loadcount ? input_count + 1 : 0;
		if (reset) 
			State <= reset_state;
		else 
			State <= Next_state;
	end

always_comb 
	begin
	Next_state = State; 
	write_even = 1'b1;
	write_odd = 1'b1;
	read = 1'b0;
	reset_fft = 1'b0; 
	reset_max = 1'b0;
	fft_start = 1'b0;
	countup = 1'b0;
	loadcount = 1'b0;
	unique case (State) 
		start : 
				Next_state = reset_state;
		reset_state :
			Next_state = listen;
		listen : 
			if (full_even && full_odd) 
				Next_state = prepare;
		prepare : 
			Next_state = load_fft;
		load_fft : 
			if (input_count == 9'b1111111111)
				Next_state = fft_wait;
		fft_wait :
			if(fft_read)
				Next_state = fft_out;
		fft_out : 
			if(output_index == 9'b1111111111)
				Next_state = listen;
		default : ;
	endcase
	
	case(State) 
		start : 
			begin
				write_even = 1'b0;
				write_odd = 1'b0;
			end
			
		reset_state : 
			begin
			write_even = 1'b0;
			write_odd = 1'b0;
			end
		listen : 
			begin
			reset_fft = 1'b1; 
			reset_max = 1'b1;		
			end
		prepare :
			begin
			fft_start = 1'b1;
			write_even = 1'b0;
			write_odd = 1'b0;
			read = 1'b1;
			end
		load_fft :
			begin
			read = 1'b1;
			loadcount = 1'b1;
			end
		fft_wait : ;
		fft_out : 
			begin
			countup = 1'b1;
			end
		default : ;
	endcase
end


endmodule
			
			
			
			