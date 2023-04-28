module rendering(
	input Clk, Reset,
	
	// AVL Bus interface
	input logic AVL_READ,
	input logic AVL_WRITE,
	input logic AVL_CS,
	input logic AVL_BYTE_EN,
	input logic [12:0] AVL_ADDR, // 80 cols * 60 rows / 2 chars per address
	input logic [31:0] AVL_WRITEDATA,
	output logic [31:0] AVL_READDATA,
	
	// Exported conduit
	output logic hs, vs, 
	output logic [3:0] red, green, blue
);
	
	// temp variables
	logic [15:0] symbol;
	logic [7:0] note_data;

	// VGA signals
	logic pixel_clk, blank, sync;
	logic [9:0] DrawX, DrawY;
	
	// background render
	
	logic draw_bck;
	
	vga_controller vga(.*);
	
	ledger ledg(.*);
	
	// note render ROMs
	
	note_rom note(
		.addr({symbol[15:13], DrawY[2:0]}), 
		.data(note_data)
	);
	
	// modify once note-drawing is added
	always_ff @(posedge pixel_clk) begin: COLORS
	
		if(blank) begin // blank is active low
			red <= {4{draw_bck}};
			green <= {4{draw_bck}};
			blue <= {4{draw_bck}};
		end
		else begin
			red <= 0;
			green <= 0;
			blue <= 0;
		end
		
	end

endmodule
