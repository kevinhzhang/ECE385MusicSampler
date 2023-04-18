module rendering(
	input Clk, Reset,
	// TODO: Bus interface 
	output logic hs, vs, 
	output logic [3:0] red, green, blue
);

	// VGA signals
	logic pixel_clk, blank, sync;
	logic [9:0] DrawX, DrawY;
	
	logic [3:0] bck_red, bck_green, bck_blue;
	
	vga_controller vga(.*);
	
	ledger ledg(
		.*, 
		.red(bck_red), 
		.green(bck_green), 
		.blue(bck_blue)
	);
	
	// modify once note-drawing is added
	always_ff @(posedge pixel_clk) begin: COLORS
	
		if(!blank) begin
			red <= bck_red;
			green <= bck_green;
			blue <= bck_blue;
		end
		else begin
			red <= 0;
			green <= 0;
			blue <= 0;
		end
		
	end

endmodule
