module rendering(
	input Clk, Reset,
	
	// AVL Bus interface
	input logic AVL_READ,
	input logic AVL_WRITE,
	input logic AVL_CS,
	input logic [3:0] AVL_BYTE_EN,
	input logic [12:0] AVL_ADDR, // 80 cols * 60 rows / 2 chars per address
	input logic [31:0] AVL_WRITEDATA,
	output logic [31:0] AVL_READDATA,
	
	// Exported conduit
	output logic hs, vs, 
	output logic [3:0] red, green, blue
);
	
	// temp variables
	logic [31:0] temp_avl_readdata;
	logic [15:0] symbol;
	logic [7:0] note_data, line_data, LL_data, dot_data;
	
	// memory variables
	logic [12:0] reg_idx;
	logic [11:0] ADDR;
	logic [3:0] BYTE_EN;
	logic [31:0] READDATA;
	//logic [15:0] glyph;
	
	logic pixel_on;

	// VGA signals
	logic pixel_clk, blank, sync;
	logic [9:0] DrawX, DrawY;
	
	// TODO: VRAM 
	
	note_ram ram0(
	.address_a(AVL_ADDR[11:0]), 
	.address_b(ADDR), 
	.byteena_a(AVL_BYTE_EN),
	.byteena_b(BYTE_EN),
	.clock(Clk),
	.data_a(AVL_WRITEDATA),
	.data_b(32'b0),
	.rden_a(AVL_READ & AVL_CS),
	.rden_b(1'b1),
	.wren_a(AVL_WRITE & AVL_CS),
	.wren_b(1'b0),
	.q_a(temp_avl_readdata),
	.q_b(READDATA)	
		
	);
	
	// background render
	
	logic draw_bck;
	
	vga_controller vga(.*);
	
	ledger ledg(.*);
	
	// note render ROMs
	
	note_rom note(
		.addr({symbol[15:11], DrawY[2:0]}),
		.data(note_data)
	);
	
	ledger_line_rom LL (
	   .addr({symbol[7:6], DrawY[2:0]}),
		.data(LL_data)
	);
	
	line_rom line(
		.addr({symbol[4:3], DrawY[2:0]}),
		.data(line_data)
	);
	
	dot_rom dot(
		.addr({symbol[1:0], DrawY[2:0]}),
		.data(dot_data)
	);
	
	always_ff @(posedge Clk) begin
		if (AVL_READ) begin
			AVL_READDATA <= temp_avl_readdata;
		end
	end
	
	// determine if should draw
	assign pixel_on = draw_bck & ~(
	note_data[7 - ((DrawX) & 3'h7)] | 
	LL_data[7 - ((DrawX) & 3'h7)] | 
	line_data[7 - ((DrawX) & 3'h7)] |
	dot_data[7 - ((DrawX) & 3'h7)]);
//	assign pixel_on = draw_bck & ~(
//	note_data[7 - ((DrawX) & 3'h7)] |
//	LL_data[7 - ((DrawX) & 3'h7)]);
	
	// drawing logic
	always_ff @(posedge pixel_clk) begin: COLORS
	
		if(blank) begin // blank is active low
			red <= {4{pixel_on}};
			green <= {4{pixel_on}};
			blue <= {4{pixel_on}};
		end
		else begin
			red <= 0;
			green <= 0;
			blue <= 0;
		end
		
	end
	
	// extracting indices
	always_comb begin
		reg_idx = ((80 * (DrawY >> 3)) + (DrawX >> 3));
	
		ADDR = reg_idx[12:1];
		
		case (reg_idx[0])
			1'b0: begin
				BYTE_EN = 4'b0011;
				symbol = READDATA[15:0];
			end
			1'b1: begin
				BYTE_EN = 4'b1100;
				symbol = READDATA[31:16];
			end
		endcase
	end

endmodule
