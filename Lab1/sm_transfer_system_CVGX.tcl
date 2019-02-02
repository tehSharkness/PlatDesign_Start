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


# Other I/O on the Host Board
set_location_assignment PIN_H12 -to clk_clk
set_location_assignment PIN_AB24 -to reset_reset_n

# Pushbutton connections
set_location_assignment PIN_P11 -to buttons_export[0]
set_location_assignment PIN_P12 -to buttons_export[1]
set_location_assignment PIN_Y15 -to buttons_export[2]
set_location_assignment PIN_Y16 -to buttons_export[3]

# Switch connections
set_location_assignment PIN_AE19 -to switches_export[9]
set_location_assignment PIN_Y11 -to switches_export[8]
set_location_assignment PIN_AC10 -to switches_export[7]
set_location_assignment PIN_V10 -to switches_export[6]
set_location_assignment PIN_AB10 -to switches_export[5]
set_location_assignment PIN_W11 -to switches_export[4]
set_location_assignment PIN_AC8 -to switches_export[3]
set_location_assignment PIN_AD13 -to switches_export[2]
set_location_assignment PIN_AE10 -to switches_export[1]
set_location_assignment PIN_AC9 -to switches_export[0]

# Green LED connections
set_location_assignment PIN_H9 -to greenled_out_export[7]
set_location_assignment PIN_H8 -to greenled_out_export[6]
set_location_assignment PIN_B6 -to greenled_out_export[5]
set_location_assignment PIN_A5 -to greenled_out_export[4]
set_location_assignment PIN_E9 -to greenled_out_export[3]
set_location_assignment PIN_D8 -to greenled_out_export[2]
set_location_assignment PIN_K6 -to greenled_out_export[1]
set_location_assignment PIN_L7 -to greenled_out_export[0]

# Red LED connections
set_location_assignment PIN_J10 -to redled_out_export[9]
set_location_assignment PIN_H7 -to redled_out_export[8]
set_location_assignment PIN_K8 -to redled_out_export[7]
set_location_assignment PIN_K10 -to redled_out_export[6]
set_location_assignment PIN_J7 -to redled_out_export[5]
set_location_assignment PIN_J8 -to redled_out_export[4]
set_location_assignment PIN_G7 -to redled_out_export[3]
set_location_assignment PIN_G6 -to redled_out_export[2]
set_location_assignment PIN_F6 -to redled_out_export[1]
set_location_assignment PIN_F7 -to redled_out_export[0]

# 7 segment connections
set_location_assignment PIN_Y18 -to hex0_out_export[6]
set_location_assignment PIN_Y19 -to hex0_out_export[5]
set_location_assignment PIN_Y20 -to hex0_out_export[4]
set_location_assignment PIN_W18 -to hex0_out_export[3]
set_location_assignment PIN_V17 -to hex0_out_export[2]
set_location_assignment PIN_V18 -to hex0_out_export[1]
set_location_assignment PIN_V19 -to hex0_out_export[0]
set_location_assignment PIN_AF24 -to hex1_out_export[6]
set_location_assignment PIN_AC19 -to hex1_out_export[5]
set_location_assignment PIN_AE25 -to hex1_out_export[4]
set_location_assignment PIN_AE26 -to hex1_out_export[3]
set_location_assignment PIN_AB19 -to hex1_out_export[2]
set_location_assignment PIN_AD26 -to hex1_out_export[1]
set_location_assignment PIN_AA18 -to hex1_out_export[0]
set_location_assignment PIN_W20 -to hex2_out_export[6]
set_location_assignment PIN_W21 -to hex2_out_export[5]
set_location_assignment PIN_V20 -to hex2_out_export[4]
set_location_assignment PIN_V22 -to hex2_out_export[3]
set_location_assignment PIN_U20 -to hex2_out_export[2]
set_location_assignment PIN_AD6 -to hex2_out_export[1]
set_location_assignment PIN_AD7 -to hex2_out_export[0]
set_location_assignment PIN_AC22 -to hex3_out_export[6]
set_location_assignment PIN_AC23 -to hex3_out_export[5]
set_location_assignment PIN_AC24 -to hex3_out_export[4]
set_location_assignment PIN_AA22 -to hex3_out_export[3]
set_location_assignment PIN_AA23 -to hex3_out_export[2]
set_location_assignment PIN_Y23 -to hex3_out_export[1]
set_location_assignment PIN_Y24 -to hex3_out_export[0]

#Tristate I/O (SSRAM)
set_location_assignment PIN_B25 -to ext_mem_bus_tcm_address_out[0]
set_location_assignment PIN_B26 -to ext_mem_bus_tcm_address_out[1]
set_location_assignment PIN_H19 -to ext_mem_bus_tcm_address_out[2]
set_location_assignment PIN_H20 -to ext_mem_bus_tcm_address_out[3]
set_location_assignment PIN_D25 -to ext_mem_bus_tcm_address_out[4]
set_location_assignment PIN_C25 -to ext_mem_bus_tcm_address_out[5]
set_location_assignment PIN_J20 -to ext_mem_bus_tcm_address_out[6]
set_location_assignment PIN_J21 -to ext_mem_bus_tcm_address_out[7]
set_location_assignment PIN_D22 -to ext_mem_bus_tcm_address_out[8]
set_location_assignment PIN_E23 -to ext_mem_bus_tcm_address_out[9]
set_location_assignment PIN_G20 -to ext_mem_bus_tcm_address_out[10]
set_location_assignment PIN_F21 -to ext_mem_bus_tcm_address_out[11]
set_location_assignment PIN_E21 -to ext_mem_bus_tcm_address_out[12]
set_location_assignment PIN_F22 -to ext_mem_bus_tcm_address_out[13]
set_location_assignment PIN_J25 -to ext_mem_bus_tcm_address_out[14]
set_location_assignment PIN_J26 -to ext_mem_bus_tcm_address_out[15]
set_location_assignment PIN_N24 -to ext_mem_bus_tcm_address_out[16]
set_location_assignment PIN_M24 -to ext_mem_bus_tcm_address_out[17]
set_location_assignment PIN_E24 -to ext_mem_bus_tcm_data_out[0]
set_location_assignment PIN_E25 -to ext_mem_bus_tcm_data_out[1]
set_location_assignment PIN_K24 -to ext_mem_bus_tcm_data_out[2]
set_location_assignment PIN_K23 -to ext_mem_bus_tcm_data_out[3]
set_location_assignment PIN_F24 -to ext_mem_bus_tcm_data_out[4]
set_location_assignment PIN_G24 -to ext_mem_bus_tcm_data_out[5]
set_location_assignment PIN_L23 -to ext_mem_bus_tcm_data_out[6]
set_location_assignment PIN_L24 -to ext_mem_bus_tcm_data_out[7]
set_location_assignment PIN_H23 -to ext_mem_bus_tcm_data_out[8]
set_location_assignment PIN_H24 -to ext_mem_bus_tcm_data_out[9]
set_location_assignment PIN_H22 -to ext_mem_bus_tcm_data_out[10]
set_location_assignment PIN_J23 -to ext_mem_bus_tcm_data_out[11]
set_location_assignment PIN_F23 -to ext_mem_bus_tcm_data_out[12]
set_location_assignment PIN_G22 -to ext_mem_bus_tcm_data_out[13]
set_location_assignment PIN_L22 -to ext_mem_bus_tcm_data_out[14]
set_location_assignment PIN_K21 -to ext_mem_bus_tcm_data_out[15]
set_location_assignment PIN_M22 -to ext_mem_bus_tcm_outputenable_n_out[0]
set_location_assignment PIN_N23 -to ext_mem_bus_tcm_chipselect_n_out[0]
set_location_assignment PIN_H25 -to ext_mem_bus_tcm_byteenable_n_out[0]
set_location_assignment PIN_M25 -to ext_mem_bus_tcm_byteenable_n_out[1]
set_location_assignment PIN_G25 -to ext_mem_bus_tcm_write_n_out[0]

# I/O standards
set_instance_assignment -name IO_STANDARD "2.5 V" -to clk_clk
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to reset_reset_n
set_instance_assignment -name IO_STANDARD "1.2 V" -to buttons_export[0]
set_instance_assignment -name IO_STANDARD "1.2 V" -to buttons_export[1]
set_instance_assignment -name IO_STANDARD "1.2 V" -to buttons_export[2]
set_instance_assignment -name IO_STANDARD "1.2 V" -to buttons_export[3]
set_instance_assignment -name IO_STANDARD "1.2 V" -to switches_export[9]
set_instance_assignment -name IO_STANDARD "1.2 V" -to switches_export[8]
set_instance_assignment -name IO_STANDARD "1.2 V" -to switches_export[7]
set_instance_assignment -name IO_STANDARD "1.2 V" -to switches_export[6]
set_instance_assignment -name IO_STANDARD "1.2 V" -to switches_export[5]
set_instance_assignment -name IO_STANDARD "1.2 V" -to switches_export[4]
set_instance_assignment -name IO_STANDARD "1.2 V" -to switches_export[3]
set_instance_assignment -name IO_STANDARD "1.2 V" -to switches_export[2]
set_instance_assignment -name IO_STANDARD "1.2 V" -to switches_export[1]
set_instance_assignment -name IO_STANDARD "1.2 V" -to switches_export[0]
set_instance_assignment -name IO_STANDARD "2.5 V" -to greenled_out_export[0]
set_instance_assignment -name IO_STANDARD "2.5 V" -to greenled_out_export[1]
set_instance_assignment -name IO_STANDARD "2.5 V" -to greenled_out_export[2]
set_instance_assignment -name IO_STANDARD "2.5 V" -to greenled_out_export[3]
set_instance_assignment -name IO_STANDARD "2.5 V" -to greenled_out_export[4]
set_instance_assignment -name IO_STANDARD "2.5 V" -to greenled_out_export[5]
set_instance_assignment -name IO_STANDARD "2.5 V" -to greenled_out_export[6]
set_instance_assignment -name IO_STANDARD "2.5 V" -to greenled_out_export[7]
set_instance_assignment -name IO_STANDARD "2.5 V" -to redled_out_export[0]
set_instance_assignment -name IO_STANDARD "2.5 V" -to redled_out_export[1]
set_instance_assignment -name IO_STANDARD "2.5 V" -to redled_out_export[2]
set_instance_assignment -name IO_STANDARD "2.5 V" -to redled_out_export[3]
set_instance_assignment -name IO_STANDARD "2.5 V" -to redled_out_export[4]
set_instance_assignment -name IO_STANDARD "2.5 V" -to redled_out_export[5]
set_instance_assignment -name IO_STANDARD "2.5 V" -to redled_out_export[6]
set_instance_assignment -name IO_STANDARD "2.5 V" -to redled_out_export[7]
set_instance_assignment -name IO_STANDARD "2.5 V" -to redled_out_export[8]
set_instance_assignment -name IO_STANDARD "2.5 V" -to redled_out_export[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_address_out[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_address_out[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_address_out[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_address_out[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_address_out[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_address_out[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_address_out[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_address_out[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_address_out[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_address_out[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_address_out[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_address_out[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_address_out[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_address_out[13]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_address_out[14]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_address_out[15]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_address_out[16]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_address_out[17]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_chipselect_n_out
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_data_out[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_data_out[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_data_out[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_data_out[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_data_out[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_data_out[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_data_out[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_data_out[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_data_out[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_data_out[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_data_out[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_data_out[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_data_out[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_data_out[13]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_data_out[14]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_data_out[15]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_byteenable_n_out[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_outputenable_n_out
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_byteenable_n_out[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ext_mem_bus_tcm_write_n_out
set_instance_assignment -name IO_STANDARD "1.2 V" -to hex0_out_export[6]
set_instance_assignment -name IO_STANDARD "1.2 V" -to hex0_out_export[5]
set_instance_assignment -name IO_STANDARD "1.2 V" -to hex0_out_export[4]
set_instance_assignment -name IO_STANDARD "1.2 V" -to hex0_out_export[3]
set_instance_assignment -name IO_STANDARD "1.2 V" -to hex0_out_export[2]
set_instance_assignment -name IO_STANDARD "1.2 V" -to hex0_out_export[1]
set_instance_assignment -name IO_STANDARD "1.2 V" -to hex0_out_export[0]
set_instance_assignment -name IO_STANDARD "1.2 V" -to hex1_out_export[6]
set_instance_assignment -name IO_STANDARD "1.2 V" -to hex1_out_export[5]
set_instance_assignment -name IO_STANDARD "1.2 V" -to hex1_out_export[4]
set_instance_assignment -name IO_STANDARD "1.2 V" -to hex1_out_export[3]
set_instance_assignment -name IO_STANDARD "1.2 V" -to hex1_out_export[2]
set_instance_assignment -name IO_STANDARD "1.2 V" -to hex1_out_export[1]
set_instance_assignment -name IO_STANDARD "1.2 V" -to hex1_out_export[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to hex2_out_export[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to hex2_out_export[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to hex2_out_export[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to hex2_out_export[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to hex2_out_export[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to hex2_out_export[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to hex2_out_export[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to hex3_out_export[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to hex3_out_export[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to hex3_out_export[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to hex3_out_export[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to hex3_out_export[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to hex3_out_export[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to hex3_out_export[0]

# Other device and optimization settings
set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
set_global_assignment -name NOMINAL_CORE_SUPPLY_VOLTAGE 1.2V
set_global_assignment -name OPTIMIZATION_TECHNIQUE Speed
set_global_assignment -name OPTIMIZE_MULTI_CORNER_TIMING ON
set_global_assignment -name PHYSICAL_SYNTHESIS_COMBO_LOGIC ON
set_global_assignment -name PHYSICAL_SYNTHESIS_EFFORT NORMAL
set_global_assignment -name PHYSICAL_SYNTHESIS_REGISTER_RETIMING ON
set_global_assignment -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION OFF
set_global_assignment -name PHYSICAL_SYNTHESIS_ASYNCHRONOUS_SIGNAL_PIPELINING OFF
set_global_assignment -name NUM_PARALLEL_PROCESSORS ALL
set_global_assignment -name RESERVE_ALL_UNUSED_PINS "As input tri-stated"
set_global_assignment -name RESERVE_DATA0_AFTER_CONFIGURATION "USE AS REGULAR IO"
set_global_assignment -name RESERVE_DATA1_AFTER_CONFIGURATION "USE AS REGULAR IO"
set_global_assignment -name RESERVE_FLASH_NCE_AFTER_CONFIGURATION "USE AS REGULAR IO"
set_global_assignment -name ON_CHIP_BITSTREAM_DECOMPRESSION OFF
set_global_assignment -name FORCE_CONFIGURATION_VCCIO ON

# Virtual pins
set_instance_assignment -name VIRTUAL_PIN ON -to ssram_clk
set_instance_assignment -name VIRTUAL_PIN ON -to greenled_out_export[9]
set_instance_assignment -name VIRTUAL_PIN ON -to greenled_out_export[10]
set_instance_assignment -name VIRTUAL_PIN ON -to greenled_out_export[11]
set_instance_assignment -name VIRTUAL_PIN ON -to greenled_out_export[12]
set_instance_assignment -name VIRTUAL_PIN ON -to greenled_out_export[13]
set_instance_assignment -name VIRTUAL_PIN ON -to greenled_out_export[14]
set_instance_assignment -name VIRTUAL_PIN ON -to greenled_out_export[15]
set_instance_assignment -name VIRTUAL_PIN ON -to greenled_out_export[16]
set_instance_assignment -name VIRTUAL_PIN ON -to greenled_out_export[17]
set_instance_assignment -name VIRTUAL_PIN ON -to greenled_out_export[18]
set_instance_assignment -name VIRTUAL_PIN ON -to greenled_out_export[19]
set_instance_assignment -name VIRTUAL_PIN ON -to greenled_out_export[20]
set_instance_assignment -name VIRTUAL_PIN ON -to greenled_out_export[21]
set_instance_assignment -name VIRTUAL_PIN ON -to greenled_out_export[22]
set_instance_assignment -name VIRTUAL_PIN ON -to greenled_out_export[23]
set_instance_assignment -name VIRTUAL_PIN ON -to greenled_out_export[24]
set_instance_assignment -name VIRTUAL_PIN ON -to greenled_out_export[25]
set_instance_assignment -name VIRTUAL_PIN ON -to greenled_out_export[26]
set_instance_assignment -name VIRTUAL_PIN ON -to greenled_out_export[27]
set_instance_assignment -name VIRTUAL_PIN ON -to greenled_out_export[28]
set_instance_assignment -name VIRTUAL_PIN ON -to greenled_out_export[29]
set_instance_assignment -name VIRTUAL_PIN ON -to greenled_out_export[30]
set_instance_assignment -name VIRTUAL_PIN ON -to greenled_out_export[31]
set_instance_assignment -name VIRTUAL_PIN ON -to greenled_out_export[8]
set_instance_assignment -name VIRTUAL_PIN ON -to redled_out_export[10]
set_instance_assignment -name VIRTUAL_PIN ON -to redled_out_export[11]
set_instance_assignment -name VIRTUAL_PIN ON -to redled_out_export[12]
set_instance_assignment -name VIRTUAL_PIN ON -to redled_out_export[13]
set_instance_assignment -name VIRTUAL_PIN ON -to redled_out_export[14]
set_instance_assignment -name VIRTUAL_PIN ON -to redled_out_export[15]
set_instance_assignment -name VIRTUAL_PIN ON -to redled_out_export[16]
set_instance_assignment -name VIRTUAL_PIN ON -to redled_out_export[17]
set_instance_assignment -name VIRTUAL_PIN ON -to redled_out_export[18]
set_instance_assignment -name VIRTUAL_PIN ON -to redled_out_export[19]
set_instance_assignment -name VIRTUAL_PIN ON -to redled_out_export[20]
set_instance_assignment -name VIRTUAL_PIN ON -to redled_out_export[21]
set_instance_assignment -name VIRTUAL_PIN ON -to redled_out_export[22]
set_instance_assignment -name VIRTUAL_PIN ON -to redled_out_export[23]
set_instance_assignment -name VIRTUAL_PIN ON -to redled_out_export[24]
set_instance_assignment -name VIRTUAL_PIN ON -to redled_out_export[25]
set_instance_assignment -name VIRTUAL_PIN ON -to redled_out_export[26]
set_instance_assignment -name VIRTUAL_PIN ON -to redled_out_export[27]
set_instance_assignment -name VIRTUAL_PIN ON -to redled_out_export[28]
set_instance_assignment -name VIRTUAL_PIN ON -to redled_out_export[29]
set_instance_assignment -name VIRTUAL_PIN ON -to redled_out_export[30]
set_instance_assignment -name VIRTUAL_PIN ON -to redled_out_export[31]