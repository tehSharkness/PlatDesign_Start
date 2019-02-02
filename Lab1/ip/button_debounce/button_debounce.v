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
// button_debounce.v
//
// A simple button debounce circuit
////////////////////////////////////////////////////////////////////////////
`timescale 1 ps / 1 ps
`default_nettype none

module button_debounce(
			 input wire csi_clock_clk,
			 input wire coe_button_in,
			 output reg button_qual = 1'b0,
			 output button_qual_n
			 );

reg [19:0] button_count = 20'h00000;
reg [2:0] button_reg = 3'b000;
reg [1:0] button_state = 2'b00;

assign button_qual_n = ~button_qual;

always @ (posedge csi_clock_clk)
	begin
		button_reg <= {button_reg[1:0],~coe_button_in};
	case (button_state)
		2'b00: begin
			button_qual <= 1'b0;
			button_count <= 8'h00;
			if (button_reg[2])
				button_state <= 2'b01;
			else
				button_state <= 2'b00;
	   end
	   2'b01: begin
			button_qual <= 1'b1;
			button_count <= button_count + 1'b1;
			button_state <= 2'b10;
	   end
	   2'b10: begin
			button_qual <= 1'b1;
			button_count <= button_count + 1'b1;
			button_state <= button_count[4] ? 2'b11 : 2'b10;
	   end
	   2'b11: begin
			button_qual <= 1'b0;
			button_count <= button_count + 1'b1;
			button_state <= button_count[19] ? 2'b00 : 2'b11;
	   end
	endcase
end

endmodule
