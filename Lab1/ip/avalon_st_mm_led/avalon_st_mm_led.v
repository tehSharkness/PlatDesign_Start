// Copyright (c) 2001-2017 Intel Corporation
//  
// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and associated documentation files (the
// "Software"), to deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to
// the following conditions:
//  
// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Software.
//  
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
// OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
// CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
// TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
// SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

////////////////////////////////////////////////////////////////////////////
// avalon_st_mm_led.v
//
// A custom component that bridges between an Avalon streaming and Avalon
// memory-mapped interface and connects to board LEDs to light them based
// off of System Console dashboard
////////////////////////////////////////////////////////////////////////////

 module avalon_st_mm_led 
  # ( parameter  COUNT_MAX = 32'h1000000, GREEN_WIDTH = 8, RED_WIDTH = 8)
  (	
   input                  csi_clock_clk,
   input                  rsi_reset_n,
   input                  asi_ledfifo_valid,
   input [31:0]           asi_ledfifo_data,
   output reg             asi_ledfifo_ready,

	output [GREEN_WIDTH-1:0] coe_greenled_out, 
	output [RED_WIDTH-1:0] coe_redled_out,

	input [31:0] avs_led_writedata,
	input [1:0] avs_led_address,
	input avs_led_write, avs_led_read,
	output [31:0] avs_led_readdata,

	output reg [6:0]		coe_hex0_out, coe_hex1_out, coe_hex2_out, coe_hex3_out,
	output reg [31:0]		avm_swpb_address,
	input [31:0]			avm_swpb_readdata,
	input						avm_swpb_waitrequest,
	output reg				avm_swpb_read_n
);

	reg [31:0] greenled_reg;
	reg [31:0] redled_reg;
	reg [31:0] greenled_in;
	reg [31:0] redled_in;
	reg [31:0] led_dir;

   reg        count_load;
   reg        count_en;
   reg [31:0] count;
   reg [31:0] asi_data_reg;
   
	wire       asi_data_reg_ena;
   reg [1:0]  next_state, current_state;

   localparam   idle = 0,        // idle/reset state
                sm_load = 1,     // load counter with max value
                sm_led_on = 2,   // turn on LEDs and start counting
                sm_led_off = 3;  // turn off LEDs
					 
	// address decoder for readdata
	assign avs_led_readdata = ({32{(avs_led_address == 2'h0)}} & greenled_reg) |
			({32{(avs_led_address == 2'h1)}} & redled_reg) |
			({32{(avs_led_address == 2'h2)}} & led_dir);

	// Set red LEDs based on slide switches
	always @ (posedge csi_clock_clk)
		begin
			avm_swpb_address <= 32'h00000004;
			avm_swpb_read_n <= 1'b0;
			if (~rsi_reset_n) begin
				avm_swpb_address <= 32'h00000004;
				avm_swpb_read_n <= 1'b0;
			end
			else if (~avm_swpb_waitrequest) begin
				redled_in <= avm_swpb_readdata;
				redled_reg <= redled_in;
			end
		end

	// state machine for managing streaming input LED data	
   always @ (posedge csi_clock_clk)
		begin:  state_trans_proc
      if (~rsi_reset_n)
         current_state <= idle;
      else
         current_state <= next_state;
   end
	
   always @ *
   begin:  next_state_proc
      next_state <= current_state;  //state machine defaults to current state
      case (current_state)
         idle:       if (asi_ledfifo_valid)				// wait for valid data from FIFO
                        next_state <= sm_load;
         sm_load:    next_state <= sm_led_on;
         sm_led_on:  if (count == (COUNT_MAX >> 1))	// keep LED on until almost at end of count
                        next_state <= sm_led_off;
         sm_led_off: if (count == 32'h0)
                        next_state <= idle;
      endcase
   end
	
   always @ (current_state, asi_data_reg)
   begin:  output_logic_proc
      asi_ledfifo_ready <= 1'b0;           // default state machine outputs
      count_en <= 1'b0;
      count_load <= 1'b0;
		greenled_reg <= 32'h00000000;
      case (current_state)
         idle:        asi_ledfifo_ready <= 1'b1;		// enable handshaking with FIFO to accept data
         sm_load:     count_load <= 1'b1;					
         sm_led_on:   begin
								count_en <= 1'b1;					// start the counter
								greenled_reg <= asi_data_reg; // load the FIFO data for display on green LEDs
							 end
         sm_led_off:  count_en <= 1'b1;
      endcase
   end
	
   // Down counter with synchronous load and enable
   always @ (posedge csi_clock_clk)
   begin:  counter_proc
      if (~rsi_reset_n)
         count <= 32'h0;
      else begin
			if (count_load)
				count <= COUNT_MAX;
			else if (count_en)
				count <= count - 1;
      end
   end		
					
   // Load Avalon data value (LED pattern) from FIFO into internal registers
   always @ (posedge csi_clock_clk)
   begin:  latch_data_proc
      if (~rsi_reset_n)
         asi_data_reg <= 32'h0;
      else if (asi_ledfifo_valid && asi_ledfifo_ready)
         asi_data_reg <= asi_ledfifo_data;
   end
	
	// Reset LED data direction register or set it from JTAG
	always @ (posedge csi_clock_clk)
		begin
			if (~rsi_reset_n)
				led_dir <= 0;
			else if (avs_led_write && (avs_led_address == 2'h2))
				led_dir <= avs_led_writedata[31:0];
		end

	// green LEDs turned off when value is 0 for easier viewing (active high LEDs)
	assign coe_greenled_out[7:0] = (greenled_reg[7:0] == 0) ? 8'b00000000 : {4'b0, greenled_reg[3:0]};
	assign coe_redled_out = redled_reg;

	// Set dev kit 7-segment displays
	// HEX0 displays value of lower 4 green LEDs
	// HEX3, HEX2, HEX1 display value of 10 red LEDs
	always @ (greenled_reg, redled_reg) begin
		if (greenled_reg[3:0] == 4'b0)
			coe_hex0_out = 7'b1111111;
		else coe_hex0_out = seven_seg_decode (greenled_reg[3:0]);
		coe_hex1_out = seven_seg_decode (redled_reg[3:0]);
		coe_hex2_out = seven_seg_decode (redled_reg[7:4]);
		coe_hex3_out = seven_seg_decode (redled_reg[9:8]);
	end

	// 7-segment display decoding function (active low)
	function [6:0] seven_seg_decode;
		input [3:0] nibble;
		reg [6:0] nibble_decoded;
	begin
		case (nibble)
			4'h0 : nibble_decoded = 7'b1000000;
			4'h1 : nibble_decoded = 7'b1111001;
			4'h2 : nibble_decoded = 7'b0100100;
			4'h3 : nibble_decoded = 7'b0110000;
			4'h4 : nibble_decoded = 7'b0011001;
			4'h5 : nibble_decoded = 7'b0010010;
			4'h6 : nibble_decoded = 7'b0000010;
			4'h7 : nibble_decoded = 7'b1111000;
			4'h8 : nibble_decoded = 7'b0000000;
			4'h9 : nibble_decoded = 7'b0011000;
			4'ha : nibble_decoded = 7'b0001000;
			4'hb : nibble_decoded = 7'b0000011;
			4'hc : nibble_decoded = 7'b1000110;
			4'hd : nibble_decoded = 7'b0100001;
			4'he : nibble_decoded = 7'b0000110;
			4'hf : nibble_decoded = 7'b0001110;
			default : nibble_decoded = 7'b0110110;
		endcase
		seven_seg_decode = nibble_decoded;
	end
	endfunction
	
endmodule