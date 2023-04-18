module ledger(
	input [9:0] DrawX, DrawY,
	output logic [3:0] red, green, blue
);

	parameter rows = 480;
	parameter cols = 80; // 640 / 8
	parameter dim = rows*cols;
	
	logic [31:0] RAM[0:dim - 1];
	logic [31:0] value;
	
	initial begin
		$readmemh("imgarray.txt", RAM);
	end
	
	assign value = RAM[80*DrawY[9:4] + DrawX[9:3]];
	assign red = value[(7 - (DrawX[2:0] << 2)) +:4]; // little endian
	assign blue = red;
	assign green = red;

endmodule
