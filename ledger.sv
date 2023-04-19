module ledger(
	input Clk,
	input [9:0] DrawX, DrawY,
	output logic [3:0] gray
);

	parameter rows = 480;
	parameter cols = 80; // 640 / 8
	parameter dim = rows*cols;
	
	logic [31:0] RAM[0:dim - 1];
	logic [31:0] value;
	
	initial begin
		$readmemh("imgarray.txt", RAM);
	end
	
	always_ff @(posedge Clk) begin
		value <= RAM[80*DrawY + DrawX[9:3]];
	end
	
	assign gray = value[((7 - DrawX[2:0]) << 2) +:4]; // little endian

endmodule
