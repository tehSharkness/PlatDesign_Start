/*******************************************************************************
 *                                                                             *
 *                  Copyright (C) 2011 Altera Corporation                      *
 *                                                                             *
 * ALTERA, ARRIA, CYCLONE, HARDCOPY, MAX, MEGACORE, NIOS, QUARTUS & STRATIX    *
 * are Reg. U.S. Pat. & Tm. Off. and Altera marks in and outside the U.S.      *
 *                                                                             *
 * All information provided herein is provided on an "as is" basis,            *
 * without warranty of any kind.                                               *
 *                                                                             *
 * Module Name: avalon_state_machine_master                                    *
 * File Name:   avalon_state_machine_master.v                                  *
 *                                                                             *
 * Module Function: This file contains an Avalon state machine master which    *
 *                  will create Avalon-MM bus transactions.                    *
 *                                                                             *
 * REVISION HISTORY:                                                           *
 *  Revision 1.0    02/28/2011 - Initial Revision                              *
 *  Revision 2.0    04/18/2011 - Added header                                  *
 ******************************************************************************/

module avalon_state_machine_master (
	input 				rst, clk,
	input 				am_waitreq,
	input [31:0] 		am_data_in,
	output reg [31:0]	am_addr,
	output reg [31:0] 	am_data_out,
	output reg			am_rd, am_wr
);

	reg [31:0]			data_reg;
	reg					data_reg_wr;
	
	reg [3:0]		current_state, next_state;
	localparam		jm_0 = 0, 
					jm_1 = 1, 
					jm_2 = 3, 
					jm_3 = 4, 
					jm_4 = 5, 
					jm_5 = 6;
	
	
	// Data register
	always @ (posedge clk, posedge rst)
	begin:  data_reg_proc
		if (rst)
			data_reg <= 32'b0;
		else begin
			if (data_reg_wr)
				data_reg <= am_data_in;
		end
	end // data_reg_proc
	
	// State register transitions
	always @ (posedge clk, posedge rst)
	begin:  state_reg_proc
		if (rst)
			current_state <= jm_0;
		else
			current_state <= next_state;
	end // state_reg_proc
	
	// Next state logic
	always @ (current_state, am_waitreq, data_reg)
	begin:  next_state_proc
		am_addr <= 32'b0;
		am_wr <= 1'b0;
		am_rd <= 1'b0;
		am_data_out <= 32'b0;
		
		case (current_state)

			// Insert avalon_state_machine_master
						
			jm_5 :	// Endless loop
						next_state <= jm_5;
						
			default :// idle
						next_state <= jm_0;
						
		endcase
	end
					
endmodule
