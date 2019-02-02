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
// button_switch_pio.v
//
// A custom parallel IO (PIO) component that stores button presses
// and DIP switch settings, either coming from the board or from the 
// virtual buttons and switches in a System Console dashboard
////////////////////////////////////////////////////////////////////////////

module button_switch_pio  #(parameter BUTTON_WIDTH = 4, SWITCH_WIDTH = 8) (
										
	// Clock and reset
	input csi_clock_clk,
	input rsi_reset_n,
										
	// Avalon slave
	input [1:0] avs_buttonreg_address,
	input avs_buttonreg_write, avs_buttonreg_read,
	input [31:0] avs_buttonreg_writedata,
	output [31:0] avs_buttonreg_readdata,
										
	// Conduits
	input [BUTTON_WIDTH-1:0] coe_buttons_in,			// board pushbuttons in
	input [SWITCH_WIDTH-1:0] coe_switches_in			// board DIP switches in
//	output [BUTTON_WIDTH-1:0] coe_buttonsout_out,		// pushbuttons out to control from System Console
//	output [SWITCH_WIDTH-1:0] coe_switchesout_out,		// switches out to control from System Console
//	output coe_direction_out								// pass control direction out to hardware
);
										
reg [31:0] button_data_in;
reg [31:0] switch_data_in;
reg [31:0] control_dir = 0;				// 0: controlled by board, otherwise controlled by System Console
reg [31:0] button_data_reg;
reg [31:0] switch_data_reg;

 
//address decoder for readdata
assign avs_buttonreg_readdata = ({32{(avs_buttonreg_address == 2'h0)}} & button_data_reg) |
					({32{(avs_buttonreg_address == 2'h1)}} & switch_data_reg) |
					({32{(avs_buttonreg_address == 2'h2)}} & control_dir);
					
//assign coe_buttonsout_out = button_data_reg[BUTTON_WIDTH-1:0];		// export from system to control hardware via System Console
//assign coe_switchesout_out = switch_data_reg[SWITCH_WIDTH-1:0];
//assign coe_direction_out = (control_dir==0) ? 1'b0 : 1'b1;			// tell hardware to use board control (0) or System Console (1)

// Choose to read button and switch settings from board or JTAG
always @ (*)
	begin
		if (control_dir == 0) begin
			button_data_in = coe_buttons_in;  //read from buttons
			switch_data_in = coe_switches_in; //read from switches
		end
		else if ((avs_buttonreg_write) && (avs_buttonreg_address == 2'h0)) begin // read buttons from JTAG
			button_data_in = avs_buttonreg_writedata[31:0];
			switch_data_in = switch_data_reg;
		end
		else if ((avs_buttonreg_write) && (avs_buttonreg_address == 2'h1)) begin // read switch values from JTAG
			switch_data_in = avs_buttonreg_writedata[31:0];
			button_data_in = button_data_reg;
		end
//		else if ((~avs_buttonreg_write) && (button_data_reg != 0)) begin			// clear System Console button presses from register
//			button_data_in = 0;
//			switch_data_in = switch_data_reg;
//		end
		else begin
			button_data_in = button_data_reg;
			switch_data_in = switch_data_reg;
		end
	end
	 
// Reset data registers or store incoming data into them
always @ (posedge csi_clock_clk or negedge rsi_reset_n)
	begin
		if (rsi_reset_n == 0) begin
			button_data_reg <= 0;
		end
		else begin
			button_data_reg <= button_data_in;
			switch_data_reg <= switch_data_in;
		end
	end

// Reset data direction register or set it from JTAG
always @ (posedge csi_clock_clk)
	begin
		if ((avs_buttonreg_address == 2'h2) && (avs_buttonreg_write))
			control_dir <= avs_buttonreg_writedata[31:0];
		else
			control_dir <= control_dir;
	end

endmodule

