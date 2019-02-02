# Copyright (c) 2001-2017 Intel Corporation
#  
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#  
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#  
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
# OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
# CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.



# +-----------------------------------
# | 
# | avalon_state_machine_master "Avalon State machine Master" v2.0
# | null 2011.02.03.23:07:54
# | Parameterizable state machine that implements an Avalon-MM master
# | 
# | C:/Designs/my_test_designs/qsys/sopc_no_nios/Lab/Design/avalon_state_machine_master/avalon_state_machine_master.v
# | 
# |    ./avalon_state_machine_master.v syn, sim
# | 
# +-----------------------------------

set perl "$env(QUARTUS_ROOTDIR)/bin64/perl/bin"

# +-----------------------------------
# | request TCL package from Specific Version
# | 
package require qsys 16.1
# | 
# +-----------------------------------

# +-----------------------------------
# | module avalon_state_machine_master
# | 
set_module_property DESCRIPTION "Parameterizable state machine that implements an Avalon-MM master"
set_module_property NAME avalon_state_machine_master
set_module_property VERSION 2.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP Training
set_module_property DISPLAY_NAME "Avalon State Machine Master"
set_module_property EDITABLE true
#set_module_property ANALYZE_HDL TRUE

# Fileset callback to generate synthesis and simulation verilog files
add_fileset sm_synth_fileset QUARTUS_SYNTH fileset_callback_procedure
add_fileset sm_sim_fileset SIM_VERILOG fileset_callback_procedure
set_fileset_property sm_synth_fileset TOP_LEVEL avalon_state_machine_master
set_fileset_property sm_sim_fileset TOP_LEVEL avalon_state_machine_master


# +-----------------------------------
# | display items
# | 
# | 
# +-----------------------------------
add_display_item Definition desc0 text "<html>This module demonstrates the use of a Platform Designer system \
without a processor.<br>\
<br>\
It generates a state machine which acts as an Avalon master component.<br>\
The state machine supports <b>idle</b>, <b>write</b>, <b>read</b>, <b>test</b>, <b>testbit</b>, \
<b>loop</b> and <b>end</b> commands<br>\
&#32;&#32;&#32;&#32;&#32;(each commmand must be separated by a '<b>;</b>').<br>\
One 32-bit data register is located in the state machine.<br>\
The <b>read</b> command loads data from a hex address to the data register.<br>\
The <b>write</b> command writes fixed hex data or the content of the data register (use<br>\
&#32;&#32;&#32;&#32;&#32;the keyword DATA) to a hex address.<br>\
The <b>testbit</b> command checks a single bit from the 32-bit data register against a<br>\
&#32;&#32;&#32;&#32;&#32;single bit value (0 or 1). You must perform a read before using this command.<br>\
&#32;&#32;&#32;&#32;&#32;If the data register bit and the single bit value match, the state machine<br>\
&#32;&#32;&#32;&#32;&#32;moves on. If not, the state machine goes back to the preceeding read command.<br>\
The <b>loop</b> command returns the state machine to the integer state number of a prior state.<br>\
The <b>end</b> command ends the state machine.<br>\
<i>You must end the state commands with either a loop or end state.</i><br>\
<br>\
<u>syntax</u><br>\
idle<br>\
write &lt;address&gt; &lt;data&gt;<br>\
read &lt;address&gt;<br>\
testbit &lt;bit number&gt; &lt;value&gt;<br>\
loop &lt;state_number&gt;<br>\
end<br>
<br>\
<u>Example</u><br>\
idle; read 4000; testbit 0 1; write 800C FF; end"


# +-----------------------------------
# | parameters
# | 
# | 
# +-----------------------------------
add_display_item Commands avalon_commands parameter
add_parameter avalon_commands String
set_parameter_property avalon_commands DISPLAY_NAME "Avalon Commands"
set_parameter_property avalon_commands AFFECTS_ELABORATION false
set_parameter_property avalon_commands DESCRIPTION "List of read/write commands to be performed by the state machine separated by ';'"


# +-----------------------------------
# | connection point clock
# | 
add_interface clock clock end
#set_interface_property clock clockRate 0

set_interface_property clock ENABLED true

add_interface_port clock clk clk Input 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point reset
# | 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT

set_interface_property reset ENABLED true

add_interface_port reset rst reset Input 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point avalon_master
# | 
add_interface avalon_master avalon start
set_interface_property avalon_master addressUnits SYMBOLS
set_interface_property avalon_master associatedClock clock
set_interface_property avalon_master associatedReset reset
set_interface_property avalon_master bitsPerSymbol 8
set_interface_property avalon_master burstOnBurstBoundariesOnly false
set_interface_property avalon_master burstcountUnits WORDS
set_interface_property avalon_master constantBurstBehavior true
set_interface_property avalon_master doStreamReads false
set_interface_property avalon_master doStreamWrites false
set_interface_property avalon_master holdTime 0
set_interface_property avalon_master linewrapBursts false
set_interface_property avalon_master maximumPendingReadTransactions 0
set_interface_property avalon_master readLatency 0
set_interface_property avalon_master readWaitTime 1
set_interface_property avalon_master setupTime 0
set_interface_property avalon_master timingUnits Cycles
set_interface_property avalon_master writeWaitTime 0

set_interface_property avalon_master ENABLED true

add_interface_port avalon_master am_waitreq waitrequest Input 1
add_interface_port avalon_master am_data_in readdata Input 32
add_interface_port avalon_master am_addr address Output 32
add_interface_port avalon_master am_data_out writedata Output 32
add_interface_port avalon_master am_rd read Output 1
add_interface_port avalon_master am_wr write Output 1
# | 
# +-----------------------------------
#
# +-----------------------------------
# | Fileset callback function
# | Entity name should be avalong_state_machine_master
proc fileset_callback_procedure {entityName} {
	send_message info "Starting Avalon State Machine Generation"
	if {[string compare $entityName avalon_state_machine_master] !=0} {
		send_message error "Unexpected entity name; require avalon_state_machine_master but got $entityName"
	}

	set fileLocation [ create_temp_file ${entityName} ]
	send_message info "Temporary fileLocation: $fileLocation"
	# get parameter value	
	set inst_param [get_parameter_value avalon_commands]
	# Call perl to execute perl script to generate HDL
	global perl
	exec $perl/perl.exe mk_avalon_state_machine_master.pl file=$fileLocation \
				 entityname=$entityName  av_commands=$inst_param
	add_fileset_file ./${entityName}.v VERILOG PATH $fileLocation
}

