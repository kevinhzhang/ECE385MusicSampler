module note_rom (
	input [5:0] addr,
	output [7:0] data
);

	parameter ADDR_WIDTH = 6;
	parameter DATA_WIDTH = 8;
	
	// ROM definition
	parameter[0:2**ADDR_WIDTH-1][DATA_WIDTH-1:0] ROM = {
		  // CODE 0x00 - BLANK
        8'b00000000, // 0
        8'b00000000, // 1
        8'b00000000, // 2
        8'b00000000, // 3
        8'b00000000, // 4
        8'b00000000, // 5
        8'b00000000, // 6
        8'b00000000, // 7
		  // CODE 0x01 - BLACK BODY ("QUARTER")
        8'b00000000, // 0
        8'b00011000, // 1     **  
        8'b01111110, // 2   ******
        8'b11111111, // 3  ********
        8'b11111111, // 4  ********
        8'b01111110, // 5   ******
        8'b00011000, // 6     **
        8'b00000000, // 7
		  // CODE 0x02 - EMPTY BODY ("HALF")
        8'b00000000, // 0
        8'b00011000, // 1     **  
        8'b01111110, // 2   ******
        8'b10000001, // 3  *      *
        8'b10000001, // 4  *      *
        8'b01111110, // 5   ******
        8'b00011000, // 6     **
        8'b00000000, // 7
		  // CODE 0x03 - WHOLE BODY ("WHOLE")
        8'b00000000, // 0
        8'b00111100, // 1    ****
        8'b01111110, // 2   ******
        8'b10000001, // 3  *      *
        8'b10000001, // 4  *      *
        8'b01111110, // 5   ******
        8'b00111100, // 6    ****
        8'b00000000, // 7
		  // CODE 0x04 - EIGHTH REST
        8'b00000000, // 0
        8'b00000010, // 1        *   
        8'b00110110, // 2    ** **
        8'b00111010, // 3    *** *
        8'b00000100, // 4       *
        8'b00000100, // 5       *
        8'b00001000, // 6      *
        8'b00001000, // 7      *
		  // CODE 0x05 - QUARTER REST
        8'b00010000, // 0     *
        8'b00011000, // 1     **
        8'b00111100, // 2    ****
        8'b01110000, // 3   ***
        8'b00100000, // 4    *
        8'b01111000, // 5   ****
        8'b01100000, // 6   **
        8'b00100000, // 7    *
		  // CODE 0x06 -- HALF REST
        8'b00000000, // 0
        8'b00000000, // 1
        8'b00000000, // 2
        8'b01111110, // 3   ******
        8'b01111110, // 4   ******
        8'b11111111, // 5  ********
        8'b00000000, // 6
        8'b00000000, // 7
		  // CODE 0x07 -- WHOLE REST
        8'b00000000, // 0
        8'b00000000, // 1
        8'b00000000, // 2
        8'b11111111, // 3  ********
        8'b01111110, // 4   ******
        8'b01111110, // 5   ******
        8'b00000000, // 6
        8'b00000000, // 7
	};
	
	
	assign data = ROM[addr];

endmodule
