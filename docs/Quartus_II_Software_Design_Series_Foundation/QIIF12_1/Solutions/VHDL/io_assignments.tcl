# Copyright (C) 1991-2012 Altera Corporation
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, Altera MegaCore Function License 
# Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the 
# applicable agreement for further details.

# Quartus II 64-Bit Version 12.1 Build 177 11/07/2012 SJ Full Version
# File: C:\altera_trn\Quartus_II_Software_Design_Series_Foundation\W\Verilog\io_assignments.tcl
# Generated on: Wed Dec 19 17:38:07 2012

package require ::quartus::project

set_location_assignment IOBANK_7 -to dataa
set_instance_assignment -name IO_STANDARD "2.5 V" -to dataa
set_location_assignment IOBANK_5 -to q
set_location_assignment IOBANK_6 -to rdaddress
set_location_assignment IOBANK_6 -to wraddress
set_instance_assignment -name IO_STANDARD "1.8 V" -to q
set_instance_assignment -name IO_STANDARD "1.8 V" -to rdaddress
set_instance_assignment -name IO_STANDARD "1.8 V" -to wraddress
set_location_assignment PIN_E15 -to clk1
set_instance_assignment -name IO_STANDARD "1.8 V" -to clk1
set_location_assignment PIN_K15 -to wren
set_instance_assignment -name IO_STANDARD "1.8 V" -to wren
set_location_assignment IOBANK_7 -to datab
set_location_assignment PIN_N13 -to q[0]
set_location_assignment PIN_M12 -to q[1]
set_location_assignment PIN_L12 -to q[2]
set_location_assignment PIN_K12 -to q[3]
set_location_assignment PIN_N14 -to q[4]
set_location_assignment PIN_P15 -to q[5]
set_location_assignment PIN_P16 -to q[6]
set_location_assignment PIN_R16 -to q[7]
set_location_assignment PIN_K11 -to q[8]
set_location_assignment PIN_N16 -to q[9]
set_location_assignment PIN_N15 -to q[10]
set_location_assignment PIN_L13 -to q[11]
set_location_assignment PIN_L16 -to q[12]
set_location_assignment PIN_L15 -to q[13]
set_location_assignment PIN_J11 -to q[14]
set_location_assignment PIN_K16 -to q[15]
set_location_assignment PIN_E16 -to wraddress[0]
set_location_assignment PIN_G16 -to wraddress[1]
set_location_assignment PIN_G15 -to wraddress[2]
set_location_assignment PIN_F13 -to wraddress[3]
set_location_assignment PIN_F15 -to wraddress[4]
set_location_assignment PIN_B16 -to rdaddress[0]
set_location_assignment PIN_D16 -to rdaddress[1]
set_location_assignment PIN_D15 -to rdaddress[2]
set_location_assignment PIN_G11 -to rdaddress[3]
set_location_assignment PIN_C16 -to rdaddress[4]
set_location_assignment PIN_C14 -to datab[1]
set_location_assignment PIN_D14 -to datab[0]
set_location_assignment PIN_D11 -to dataa[0]
set_location_assignment PIN_D12 -to dataa[1]
set_location_assignment PIN_A13 -to datab[3]
set_location_assignment PIN_B13 -to datab[2]
set_location_assignment PIN_A14 -to dataa[2]
set_location_assignment PIN_B14 -to dataa[3]
set_location_assignment PIN_E11 -to datab[5]
set_location_assignment PIN_E10 -to datab[4]
set_location_assignment PIN_A12 -to dataa[4]
set_location_assignment PIN_B12 -to dataa[5]
set_location_assignment PIN_A11 -to datab[6]
set_location_assignment PIN_B11 -to dataa[6]
set_location_assignment PIN_F10 -to dataa[7]
set_location_assignment PIN_F9 -to datab[7]
set_location_assignment PIN_C1 -to ~ALTERA_ASDO_DATA1~
set_location_assignment PIN_D2 -to ~ALTERA_FLASH_nCE_nCSO~
set_location_assignment PIN_H1 -to ~ALTERA_DCLK~
set_location_assignment PIN_H2 -to ~ALTERA_DATA0~
set_location_assignment PIN_F16 -to ~ALTERA_nCEO~
