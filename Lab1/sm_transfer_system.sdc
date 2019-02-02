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


## Define clocks and clock-related constraints
create_clock -name clk_in -period 20.0 [get_ports clk_clk]
derive_pll_clocks
derive_clock_uncertainty

## Cutting paths for the JTAG tdo, tdi, and tms pins
set_false_path -to   [get_ports altera_reserved_tdo]
set_false_path -from [get_ports altera_reserved_tdi]
set_false_path -from [get_ports altera_reserved_tms]


## Cut SRAM and reset paths
set_false_path -from [get_ports ext_mem_bus*] 
set_false_path -to [get_ports ext_mem_bus*]
set_false_path -from [get_ports reset*] 

## SRAM clock not needed with this development kit
set_false_path -to [get_ports ssram_clk]

# Cut switch and pushbutton paths
set_false_path -from [get_ports buttons*]
set_false_path -from [get_ports switches*]

# Cut LED paths
set_false_path -to [get_ports *led_out*]
set_false_path -to [get_ports hex*]