## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

## Door LED Board
set_property PACKAGE_PIN V3 [get_ports {door[5]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {door[5]}]
set_property PACKAGE_PIN W3 [get_ports {door[4]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {door[4]}]
set_property PACKAGE_PIN U3 [get_ports {door[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {door[3]}]
set_property PACKAGE_PIN P3 [get_ports {door[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {door[2]}]
set_property PACKAGE_PIN N3 [get_ports {door[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {door[1]}]
set_property PACKAGE_PIN P1 [get_ports {door[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {door[0]}]
#set_property PACKAGE_PIN L1 [get_ports {door[2]}]
#	set_property IOSTANDARD LVCMOS33 [get_ports {door[2]}]


## 7 segment display
set_property PACKAGE_PIN W7 [get_ports {segB[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {segB[0]}]
set_property PACKAGE_PIN W6 [get_ports {segB[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {segB[1]}]
set_property PACKAGE_PIN U8 [get_ports {segB[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {segB[2]}]
set_property PACKAGE_PIN V8 [get_ports {segB[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {segB[3]}]
set_property PACKAGE_PIN U5 [get_ports {segB[4]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {segB[4]}]
set_property PACKAGE_PIN V5 [get_ports {segB[5]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {segB[5]}]
set_property PACKAGE_PIN U7 [get_ports {segB[6]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {segB[6]}]

## Select 7 segment
set_property PACKAGE_PIN U2 [get_ports {an[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 [get_ports {an[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 [get_ports {an[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]


## JA for Seg display
#Sch name = JA1
set_property PACKAGE_PIN J1 [get_ports {seg[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]
#Sch name = JA2
set_property PACKAGE_PIN L2 [get_ports {seg[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]
#Sch name = JA3
set_property PACKAGE_PIN J2 [get_ports {seg[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]
#Sch name = JA4
set_property PACKAGE_PIN G2 [get_ports {seg[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]
#Sch name = JA7
set_property PACKAGE_PIN H1 [get_ports {seg[4]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]
#Sch name = JA8
set_property PACKAGE_PIN K2 [get_ports {seg[5]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]
#Sch name = JA9
set_property PACKAGE_PIN H2 [get_ports {seg[6]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]
#Sch name = JA10
set_property PACKAGE_PIN G3 [get_ports {seg[7]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[7]}]



## JB for Input BTN and Output LED_BTN
#Sch name = JB1
set_property PACKAGE_PIN A14 [get_ports UO1]
	set_property IOSTANDARD LVCMOS33 [get_ports UO1]
#Sch name = JB2
set_property PACKAGE_PIN A16 [get_ports DO2]
	set_property IOSTANDARD LVCMOS33 [get_ports DO2]
#Sch name = JB3
set_property PACKAGE_PIN B15 [get_ports UO2]
	set_property IOSTANDARD LVCMOS33 [get_ports UO2]
#Sch name = JB4
set_property PACKAGE_PIN B16 [get_ports DO3]
	set_property IOSTANDARD LVCMOS33 [get_ports DO3]
#Sch name = JB7
set_property PACKAGE_PIN A15 [get_ports LU1]
	set_property IOSTANDARD LVCMOS33 [get_ports LU1]
#Sch name = JB8
set_property PACKAGE_PIN A17 [get_ports LD2]
	set_property IOSTANDARD LVCMOS33 [get_ports LD2]
#Sch name = JB9
set_property PACKAGE_PIN C15 [get_ports LU2]
	set_property IOSTANDARD LVCMOS33 [get_ports LU2]
#Sch name = JB10
set_property PACKAGE_PIN C16 [get_ports LD3]
	set_property IOSTANDARD LVCMOS33 [get_ports LD3]



##JC for Input BTN and Output LED_BTN
##Sch name = JC1
set_property PACKAGE_PIN K17 [get_ports UO3]
	set_property IOSTANDARD LVCMOS33 [get_ports UO3]
#Sch name = JC2
set_property PACKAGE_PIN M18 [get_ports DO4]
	set_property IOSTANDARD LVCMOS33 [get_ports DO4]
##Sch name = JC3
#set_property PACKAGE_PIN N17 [get_ports {JC[2]}]
	#set_property IOSTANDARD LVCMOS33 [get_ports {JC[2]}]
##Sch name = JC4
set_property PACKAGE_PIN P18 [get_ports ledDown]
	set_property IOSTANDARD LVCMOS33 [get_ports ledDown]
##Sch name = JC7
set_property PACKAGE_PIN L17 [get_ports LU3]
	set_property IOSTANDARD LVCMOS33 [get_ports LU3]
#Sch name = JC8
set_property PACKAGE_PIN M19 [get_ports LD4]
	set_property IOSTANDARD LVCMOS33 [get_ports LD4]
##Sch name = JC9
#set_property PACKAGE_PIN P17 [get_ports {JC[6]}]
	#set_property IOSTANDARD LVCMOS33 [get_ports {JC[6]}]
##Sch name = JC10
set_property PACKAGE_PIN R18 [get_ports ledUp]
	set_property IOSTANDARD LVCMOS33 [get_ports ledUp]


## JXADC for Input BTN and Output LED_BTN
##Sch name = XA1_P
set_property PACKAGE_PIN J3 [get_ports IN1]
	set_property IOSTANDARD LVCMOS33 [get_ports IN1]
#Sch name = XA2_P
set_property PACKAGE_PIN L3 [get_ports IN2]
	set_property IOSTANDARD LVCMOS33 [get_ports IN2]
#Sch name = XA3_P
set_property PACKAGE_PIN M2 [get_ports IN3]
	set_property IOSTANDARD LVCMOS33 [get_ports IN3]
#Sch name = XA4_P
set_property PACKAGE_PIN N2 [get_ports IN4]
	set_property IOSTANDARD LVCMOS33 [get_ports IN4]
#Sch name = XA1_N
set_property PACKAGE_PIN K3 [get_ports LI1]
	set_property IOSTANDARD LVCMOS33 [get_ports LI1]
#Sch name = XA2_N
set_property PACKAGE_PIN M3 [get_ports LI2]
	set_property IOSTANDARD LVCMOS33 [get_ports LI2]
#Sch name = XA3_N
set_property PACKAGE_PIN M1 [get_ports LI3]
	set_property IOSTANDARD LVCMOS33 [get_ports LI3]
#Sch name = XA4_N
set_property PACKAGE_PIN N1 [get_ports LI4]
	set_property IOSTANDARD LVCMOS33 [get_ports LI4]
	

## Configuration options, can be used for all designs
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets UO1_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets UO2_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets UO3_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets DO2_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets DO3_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets DO4_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets IN1_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets IN2_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets IN3_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets IN4_IBUF]
