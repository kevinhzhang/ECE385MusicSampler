module ledger(
	input Clk,
	input [9:0] DrawX, DrawY,
	output logic draw_bck
);

	parameter rows = 480;
	parameter cols = 20; // 640 / 32
	parameter dim = rows*cols;
	
	logic [31:0] RAM[0:dim - 1];
	logic [31:0] value;
	
	initial begin
		$readmemb("imgarray.txt", RAM);
	end
	
	always_ff @(posedge Clk) begin
		value <= RAM[20*DrawY + DrawX[9:5]];
	end
	
	assign draw_bck = value[(31 - DrawX[4:0])]; // little endian

endmodule
