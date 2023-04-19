module rendering(
	input Clk, Reset,
	// TODO: Bus interface 
	output logic hs, vs, 
	output logic [3:0] red, green, blue
);

	// VGA signals
	logic pixel_clk, blank, sync;
	logic [9:0] DrawX, DrawY;
	
	logic [3:0] gray;
	
	vga_controller vga(.*);
	
	ledger ledg(.*);
	
	// modify once note-drawing is added
	always_ff @(posedge pixel_clk) begin: COLORS
	
		if(blank) begin // blank is active low
			red <= gray;
			green <= gray;
			blue <= gray;
		end
		else begin
			red <= 0;
			green <= 0;
			blue <= 0;
		end
		
	end

endmodule
