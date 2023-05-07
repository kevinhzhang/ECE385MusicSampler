
//-------------------------------------------------------------------------
//      ECE 385 - Summer 2021 Lab 7 Top-level                            --
//                                                                       --
//      Updated Fall 2021 as Lab 7                                       --
//      For use with ECE 385                                             --
//      UIUC ECE Department                                              --
//-------------------------------------------------------------------------


module MusicSampler (

      ///////// Clocks /////////
      input    MAX10_CLK1_50,

      ///////// KEY /////////
      input    [ 1: 0]   KEY,

      ///////// SW /////////
      input    [ 9: 0]   SW,

      ///////// LEDR /////////
      output   [ 9: 0]   LEDR,

      ///////// HEX /////////
      output   [ 7: 0]   HEX0,
      output   [ 7: 0]   HEX1,
      output   [ 7: 0]   HEX2,
      output   [ 7: 0]   HEX3,
      output   [ 7: 0]   HEX4,
      output   [ 7: 0]   HEX5,

      ///////// SDRAM /////////
      output             DRAM_CLK,
      output             DRAM_CKE,
      output   [12: 0]   DRAM_ADDR,
      output   [ 1: 0]   DRAM_BA,
      inout    [15: 0]   DRAM_DQ,
      output             DRAM_LDQM,
      output             DRAM_UDQM,
      output             DRAM_CS_N,
      output             DRAM_WE_N,
      output             DRAM_CAS_N,
      output             DRAM_RAS_N,

      ///////// VGA /////////
      output             VGA_HS,
      output             VGA_VS,
      output   [ 3: 0]   VGA_R,
      output   [ 3: 0]   VGA_G,
      output   [ 3: 0]   VGA_B,





      ///////// ARDUINO /////////
      inout    [15: 0]   ARDUINO_IO,
      inout              ARDUINO_RESET_N 

);
logic [1:0] aud_mclk_ctr;
logic i2c0_scl_in, i2c0_sda_in, i2c0_scl_oe, i2c0_sda_oe;

//=======================================================
//  REG/WIRE declarations
//=======================================================
	logic SPI0_CS_N, SPI0_SCLK, SPI0_MISO, SPI0_MOSI, USB_GPX, USB_IRQ, USB_RST;
	logic [3:0] hex_num_4, hex_num_3, hex_num_1, hex_num_0; //4 bit input hex digits
	logic [1:0] signs;
	logic [1:0] hundreds;
	logic [7:0] keycode;	

//=======================================================
//  Structural coding
//=======================================================
	assign ARDUINO_IO[10] = SPI0_CS_N;
	assign ARDUINO_IO[13] = SPI0_SCLK;
	assign ARDUINO_IO[11] = SPI0_MOSI;
	assign ARDUINO_IO[12] = 1'bZ;
	assign SPI0_MISO = ARDUINO_IO[12];
	
	assign ARDUINO_IO[9] = 1'bZ;
	assign USB_IRQ = ARDUINO_IO[9];
	
	
	
	
	//Final Project Structure for input to output feedback:
      //Create 12.5 MHz clock using main clock
    assign ARDUINO_IO[3] = aud_mclk_ctr[1];
    //generate 12.5MHz CODEC mclk
    always_ff @(posedge MAX10_CLK1_50) begin
        aud_mclk_ctr <= aud_mclk_ctr + 1;
    end

    //I2C Connections:
    assign i2c0_scl_in = ARDUINO_IO[15];
    assign ARDUINO_IO[15] = i2c0_scl_oe ? 1'b0 : 1'bz;
    assign i2c0_sda_in = ARDUINO_IO[14];
    assign ARDUINO_IO[14] = i2c0_sda_oe ? 1'b0 : 1'bz;

    //Connect Line-In to Line-Out (delete later when create I2S)
//    assign ARDUINO_IO[2] = ARDUINO_IO[1];
////	 Makes this pin "read-only?"
//    assign ARDUINO_IO[1] = 1'bz;
	
//in theory this should work

logic [31:0] l_out, r_out;
 
i2s_input i2s_in(.clk(MAX10_CLK1_50), 
				.sclk(ARDUINO_IO[5]),
				.lrclk(ARDUINO_IO[4]),
				.data_in(ARDUINO_IO[1]),
				.l_out, .r_out);
//fifo data in depends on clock	
always_comb begin
	if(ARDUINO_IO[4]) begin
		data_fifo = l_out[30:19];
		end
	else begin
		data_fifo = r_out[30:19];
	end
end

logic [11:0] data_fifo, q_odd, q_even;
logic read, empty_odd, empty_even, full_even, full_odd, write_even, write_odd, fft_read;
logic alternate;
logic [8:0] output_index;

logic [2:0] downclk;
always_ff @ (posedge ARDUINO_IO[4]) begin
	downclk <= downclk + 1;
end

always_ff @ (posedge downclk[2]) begin
	alternate <= ~alternate;
end


FFT_fifo fifo_odd(.data(data_fifo),
	.rdclk(MAX10_CLK1_50),
	.rdreq(read),
	.wrclk(~alternate),
	.wrreq(write_odd),
	.q(q_odd),
	.rdempty(empty_odd),
	.wrfull(full_odd),
	.aclr(reset_h),
	.rdusedw(),
	.wrusedw());
	
FFT_fifo fifo_even(.data(data_fifo),
	.rdclk(MAX10_CLK1_50),
	.rdreq(read),
	.wrclk(alternate),
	.wrreq(write_even),
	.q(q_even),
	.rdempty(empty_even),
	.wrfull(full_even),
	.aclr(reset_h),
	.rdusedw(),
	.wrusedw());

logic reset_max;
logic reset_h;
sync reset_sync(.Clk(MAX10_CLK1_50), .d(~KEY[0]), .q(reset_h));
 
control ctrl(.clk(MAX10_CLK1_50),
					.reset(reset_h), 
					.full_even,
					.full_odd, 
					.fft_read,
					.write_odd,
					.write_even,
					.read,
					.reset_fft,
					.reset_max,
					.fft_start,
					.output_index
					);
logic [15:0] Y0, Y1, Y2, Y3;
logic signed [15:0] real0, imag0, real1, imag1;
logic [15:0]doext, deext;

sext1216 so(.p(q_odd), .q(doext));
sext1216 se(.p(q_even), .q(deext));


dft_top dft(.clk(MAX10_CLK1_50),
				.reset(reset_fft),
				.next(fft_start),
				.next_out(fft_read), 
				.X0(doext),
				.X1(16'b0),
				.X2(deext),
				.X3(16'b0), 
				.Y0,
				.Y1,
				.Y2,
				.Y3);
always_comb begin
	real0 = Y0;
	imag0 = Y1;
	real1 = Y2;
	imag1 = Y3;
end
logic [9:0] output_idx;
logic signed [35:0] m0, m1;
max_detect m(.clk(MAX10_CLK1_50), .*);

//DEBUG OUTPUT
i2s_output i2s_out(.clk(MAX10_CLK1_50), 
				.sclk(ARDUINO_IO[5]),
				.lrclk(ARDUINO_IO[4]),
				.data_l({1'b0, l_out[30:7], 7'b0}), 
				.data_r({1'b0, r_out[30:7], 7'b0}),
				.d_out(ARDUINO_IO[2]));

	
	//Assignments specific to Sparkfun USBHostShield-v13
	//assign ARDUINO_IO[7] = USB_RST;
	//assign ARDUINO_IO[8] = 1'bZ;
	//assign USB_GPX = ARDUINO_IO[8];
		
	//Assignments specific to Circuits At Home UHS_20
	assign ARDUINO_RESET_N = USB_RST;
	assign ARDUINO_IO[8] = 1'bZ;
	//GPX is unconnected to shield, not needed for standard USB host - set to 0 to prevent interrupt
	assign USB_GPX = 1'b0;
	
	//HEX drivers to convert numbers to HEX output
	HexDriver hex_driver5 (hex_num_5, HEX5[6:0]);
	assign HEX5[7] = 1'b1;
	
	HexDriver hex_driver4 (hex_num_4, HEX4[6:0]);
	assign HEX4[7] = 1'b1;
	
	HexDriver hex_driver3 (hex_num_3, HEX3[6:0]);
	assign HEX3[7] = 1'b1;
	HexDriver hex_driver2 ({2'b00, output_idx[9:8]}, HEX2[6:0]);
	assign HEX2[7] = 1'b1;
	HexDriver hex_driver1 (output_idx[7:4], HEX1[6:0]);
	assign HEX1[7] = 1'b1;
	
	HexDriver hex_driver0 (output_idx[3:0], HEX0[6:0]);
	assign HEX0[7] = 1'b1;
	
	//fill in the hundreds digit as well as the negative sign
//	assign HEX5 = {1'b1, ~signs[1], 3'b111, ~hundreds[1], ~hundreds[1], 1'b1};
//	assign HEX2 = {1'b1, ~signs[0], 3'b111, ~hundreds[0], ~hundreds[0], 1'b1};
//	HexDriver hex_driver11 ({3'b000,ARDUINO_IO[1]}, HEX2[6:0]);
//	HexDriver hex_driver12 ({3'b000,ARDUINO_IO[2]}, HEX5[6:0]);
//	assign HEX5[7] = 0;
//	assign HEX2[7] = 0;
	
	assign {Reset_h}=~ (KEY[0]); 

	//assign signs = 2'b00;
	//assign hex_num_4 = 4'h4;
	//assign hex_num_3 = 4'h3;
	//assign hex_num_1 = 4'h1;
	//assign hex_num_0 = 4'h0;
	
	//remember to rename the SOC as necessary
	lab7_soc u0 (
		.clk_clk                           (MAX10_CLK1_50),    //clk.clk
		.reset_reset_n                     (1'b1),             //reset.reset_n
		.i2c0_sda_in,
		.i2c0_scl_in,
    .i2c0_sda_oe,
	 .i2c0_scl_oe,
		.key_external_connection_export    (KEY),    		   //key_external_connection.export

		//SDRAM
		.sdram_clk_clk(DRAM_CLK),            				   //clk_sdram.clk
	   .sdram_wire_addr(DRAM_ADDR),               			   //sdram_wire.addr
		.sdram_wire_ba(DRAM_BA),                			   //.ba
		.sdram_wire_cas_n(DRAM_CAS_N),              		   //.cas_n
		.sdram_wire_cke(DRAM_CKE),                 			   //.cke
		.sdram_wire_cs_n(DRAM_CS_N),                		   //.cs_n
		.sdram_wire_dq(DRAM_DQ),                  			   //.dq
		.sdram_wire_dqm({DRAM_UDQM,DRAM_LDQM}),                //.dqm
		.sdram_wire_ras_n(DRAM_RAS_N),              		   //.ras_n
		.sdram_wire_we_n(DRAM_WE_N),                		   //.we_n

		//USB SPI	
		.spi0_SS_n(SPI0_CS_N),
		.spi0_MOSI(SPI0_MOSI),
		.spi0_MISO(SPI0_MISO),
		.spi0_SCLK(SPI0_SCLK),
		
		//USB GPIO
		.usb_rst_export(USB_RST),
		.usb_irq_export(USB_IRQ),
		.usb_gpx_export(USB_GPX),
		
		//LEDs and HEX
		.hex_digits_export({hex_num_4, hex_num_3, hex_num_1, hex_num_0}),
		.leds_export({hundreds, signs, LEDR}),
		.keycode_export(keycode),
		
		//VGA
		.vga_port_red(VGA_R),
		.vga_port_green (VGA_G),
		.vga_port_blue (VGA_B),
		.vga_port_hs(VGA_HS),
		.vga_port_vs(VGA_VS),
		
		.fft_bucket_export({22'b0, output_idx})
	 );
	 
	 //  Move this to SoC once bus is interfaced
//	 rendering rend(
//		.Clk(MAX10_CLK1_50),
//		.Reset(Reset_h),
//		.hs(VGA_HS),
//		.vs(VGA_VS),
//		.red(VGA_R),
//		.green(VGA_G),
//		.blue(VGA_B)
//	 );

endmodule
