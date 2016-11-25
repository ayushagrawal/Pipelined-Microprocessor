// megafunction wizard: %RAM: 1-PORT%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: altsyncram 

// ============================================================
// File Name: instruction_memory.v
// Megafunction Name(s):
// 			altsyncram
//
// Simulation Library Files(s):
// 			altera_mf
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 16.1.0 Build 196 10/24/2016 SJ Lite Edition
// ************************************************************


//Copyright (C) 2016  Intel Corporation. All rights reserved.
//Your use of Intel Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Intel Program License 
//Subscription Agreement, the Intel Quartus Prime License Agreement,
//the Intel MegaCore Function License Agreement, or other 
//applicable license agreement, including, without limitation, 
//that your use is for the sole purpose of programming logic 
//devices manufactured by Intel and sold by Intel or its 
//authorized distributors.  Please refer to the applicable 
//agreement for further details.


//altsyncram CLOCK_ENABLE_INPUT_A="BYPASS" CLOCK_ENABLE_OUTPUT_A="BYPASS" DEVICE_FAMILY="Cyclone IV E" ENABLE_RUNTIME_MOD="NO" INIT_FILE="instruction.hex" NUMWORDS_A=64 OPERATION_MODE="SINGLE_PORT" OUTDATA_ACLR_A="NONE" OUTDATA_REG_A="UNREGISTERED" POWER_UP_UNINITIALIZED="FALSE" read_during_write_mode_port_a="NEW_DATA_NO_NBE_READ" WIDTH_A=16 WIDTH_BYTEENA_A=1 WIDTHAD_A=6 address_a clock0 data_a q_a wren_a
//VERSION_BEGIN 16.1 cbx_altera_syncram_nd_impl 2016:10:24:15:04:16:SJ cbx_altsyncram 2016:10:24:15:04:16:SJ cbx_cycloneii 2016:10:24:15:04:16:SJ cbx_lpm_add_sub 2016:10:24:15:04:16:SJ cbx_lpm_compare 2016:10:24:15:04:16:SJ cbx_lpm_decode 2016:10:24:15:04:16:SJ cbx_lpm_mux 2016:10:24:15:04:16:SJ cbx_mgl 2016:10:24:15:05:03:SJ cbx_nadder 2016:10:24:15:04:16:SJ cbx_stratix 2016:10:24:15:04:16:SJ cbx_stratixii 2016:10:24:15:04:16:SJ cbx_stratixiii 2016:10:24:15:04:16:SJ cbx_stratixv 2016:10:24:15:04:16:SJ cbx_util_mgl 2016:10:24:15:04:16:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463


//synthesis_resources = M9K 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
(* ALTERA_ATTRIBUTE = {"OPTIMIZE_POWER_DURING_SYNTHESIS=NORMAL_COMPILATION"} *)
module  instruction_memory_altsyncram
	( 
	address_a,
	clock0,
	data_a,
	q_a,
	wren_a) /* synthesis synthesis_clearbox=1 */;
	input   [5:0]  address_a;
	input   clock0;
	input   [15:0]  data_a;
	output   [15:0]  q_a;
	input   wren_a;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1   clock0;
	tri1   [15:0]  data_a;
	tri0   wren_a;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [0:0]   wire_ram_block1a_0portadataout;
	wire  [0:0]   wire_ram_block1a_1portadataout;
	wire  [0:0]   wire_ram_block1a_2portadataout;
	wire  [0:0]   wire_ram_block1a_3portadataout;
	wire  [0:0]   wire_ram_block1a_4portadataout;
	wire  [0:0]   wire_ram_block1a_5portadataout;
	wire  [0:0]   wire_ram_block1a_6portadataout;
	wire  [0:0]   wire_ram_block1a_7portadataout;
	wire  [0:0]   wire_ram_block1a_8portadataout;
	wire  [0:0]   wire_ram_block1a_9portadataout;
	wire  [0:0]   wire_ram_block1a_10portadataout;
	wire  [0:0]   wire_ram_block1a_11portadataout;
	wire  [0:0]   wire_ram_block1a_12portadataout;
	wire  [0:0]   wire_ram_block1a_13portadataout;
	wire  [0:0]   wire_ram_block1a_14portadataout;
	wire  [0:0]   wire_ram_block1a_15portadataout;
	wire  [5:0]  address_a_wire;

	cycloneive_ram_block   ram_block1a_0
	( 
	.clk0(clock0),
	.portaaddr({address_a_wire[5:0]}),
	.portadatain({data_a[0]}),
	.portadataout(wire_ram_block1a_0portadataout[0:0]),
	.portare(1'b1),
	.portawe(wren_a),
	.portbdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.ena2(1'b1),
	.ena3(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddr({1{1'b0}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}}),
	.portbre(1'b1),
	.portbwe(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_0.clk0_core_clock_enable = "none",
		ram_block1a_0.clk0_input_clock_enable = "none",
		ram_block1a_0.connectivity_checking = "OFF",
		ram_block1a_0.init_file = "instruction.hex",
		ram_block1a_0.init_file_layout = "port_a",
		ram_block1a_0.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_0.operation_mode = "single_port",
		ram_block1a_0.port_a_address_width = 6,
		ram_block1a_0.port_a_byte_enable_mask_width = 1,
		ram_block1a_0.port_a_byte_size = 1,
		ram_block1a_0.port_a_data_out_clear = "none",
		ram_block1a_0.port_a_data_out_clock = "none",
		ram_block1a_0.port_a_data_width = 1,
		ram_block1a_0.port_a_first_address = 0,
		ram_block1a_0.port_a_first_bit_number = 0,
		ram_block1a_0.port_a_last_address = 63,
		ram_block1a_0.port_a_logical_ram_depth = 64,
		ram_block1a_0.port_a_logical_ram_width = 16,
		ram_block1a_0.port_a_read_during_write_mode = "new_data_no_nbe_read",
		ram_block1a_0.power_up_uninitialized = "false",
		ram_block1a_0.ram_block_type = "AUTO",
		ram_block1a_0.lpm_type = "cycloneive_ram_block";
	cycloneive_ram_block   ram_block1a_1
	( 
	.clk0(clock0),
	.portaaddr({address_a_wire[5:0]}),
	.portadatain({data_a[1]}),
	.portadataout(wire_ram_block1a_1portadataout[0:0]),
	.portare(1'b1),
	.portawe(wren_a),
	.portbdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.ena2(1'b1),
	.ena3(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddr({1{1'b0}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}}),
	.portbre(1'b1),
	.portbwe(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_1.clk0_core_clock_enable = "none",
		ram_block1a_1.clk0_input_clock_enable = "none",
		ram_block1a_1.connectivity_checking = "OFF",
		ram_block1a_1.init_file = "instruction.hex",
		ram_block1a_1.init_file_layout = "port_a",
		ram_block1a_1.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_1.operation_mode = "single_port",
		ram_block1a_1.port_a_address_width = 6,
		ram_block1a_1.port_a_byte_enable_mask_width = 1,
		ram_block1a_1.port_a_byte_size = 1,
		ram_block1a_1.port_a_data_out_clear = "none",
		ram_block1a_1.port_a_data_out_clock = "none",
		ram_block1a_1.port_a_data_width = 1,
		ram_block1a_1.port_a_first_address = 0,
		ram_block1a_1.port_a_first_bit_number = 1,
		ram_block1a_1.port_a_last_address = 63,
		ram_block1a_1.port_a_logical_ram_depth = 64,
		ram_block1a_1.port_a_logical_ram_width = 16,
		ram_block1a_1.port_a_read_during_write_mode = "new_data_no_nbe_read",
		ram_block1a_1.power_up_uninitialized = "false",
		ram_block1a_1.ram_block_type = "AUTO",
		ram_block1a_1.lpm_type = "cycloneive_ram_block";
	cycloneive_ram_block   ram_block1a_2
	( 
	.clk0(clock0),
	.portaaddr({address_a_wire[5:0]}),
	.portadatain({data_a[2]}),
	.portadataout(wire_ram_block1a_2portadataout[0:0]),
	.portare(1'b1),
	.portawe(wren_a),
	.portbdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.ena2(1'b1),
	.ena3(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddr({1{1'b0}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}}),
	.portbre(1'b1),
	.portbwe(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_2.clk0_core_clock_enable = "none",
		ram_block1a_2.clk0_input_clock_enable = "none",
		ram_block1a_2.connectivity_checking = "OFF",
		ram_block1a_2.init_file = "instruction.hex",
		ram_block1a_2.init_file_layout = "port_a",
		ram_block1a_2.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_2.operation_mode = "single_port",
		ram_block1a_2.port_a_address_width = 6,
		ram_block1a_2.port_a_byte_enable_mask_width = 1,
		ram_block1a_2.port_a_byte_size = 1,
		ram_block1a_2.port_a_data_out_clear = "none",
		ram_block1a_2.port_a_data_out_clock = "none",
		ram_block1a_2.port_a_data_width = 1,
		ram_block1a_2.port_a_first_address = 0,
		ram_block1a_2.port_a_first_bit_number = 2,
		ram_block1a_2.port_a_last_address = 63,
		ram_block1a_2.port_a_logical_ram_depth = 64,
		ram_block1a_2.port_a_logical_ram_width = 16,
		ram_block1a_2.port_a_read_during_write_mode = "new_data_no_nbe_read",
		ram_block1a_2.power_up_uninitialized = "false",
		ram_block1a_2.ram_block_type = "AUTO",
		ram_block1a_2.lpm_type = "cycloneive_ram_block";
	cycloneive_ram_block   ram_block1a_3
	( 
	.clk0(clock0),
	.portaaddr({address_a_wire[5:0]}),
	.portadatain({data_a[3]}),
	.portadataout(wire_ram_block1a_3portadataout[0:0]),
	.portare(1'b1),
	.portawe(wren_a),
	.portbdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.ena2(1'b1),
	.ena3(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddr({1{1'b0}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}}),
	.portbre(1'b1),
	.portbwe(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_3.clk0_core_clock_enable = "none",
		ram_block1a_3.clk0_input_clock_enable = "none",
		ram_block1a_3.connectivity_checking = "OFF",
		ram_block1a_3.init_file = "instruction.hex",
		ram_block1a_3.init_file_layout = "port_a",
		ram_block1a_3.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_3.operation_mode = "single_port",
		ram_block1a_3.port_a_address_width = 6,
		ram_block1a_3.port_a_byte_enable_mask_width = 1,
		ram_block1a_3.port_a_byte_size = 1,
		ram_block1a_3.port_a_data_out_clear = "none",
		ram_block1a_3.port_a_data_out_clock = "none",
		ram_block1a_3.port_a_data_width = 1,
		ram_block1a_3.port_a_first_address = 0,
		ram_block1a_3.port_a_first_bit_number = 3,
		ram_block1a_3.port_a_last_address = 63,
		ram_block1a_3.port_a_logical_ram_depth = 64,
		ram_block1a_3.port_a_logical_ram_width = 16,
		ram_block1a_3.port_a_read_during_write_mode = "new_data_no_nbe_read",
		ram_block1a_3.power_up_uninitialized = "false",
		ram_block1a_3.ram_block_type = "AUTO",
		ram_block1a_3.lpm_type = "cycloneive_ram_block";
	cycloneive_ram_block   ram_block1a_4
	( 
	.clk0(clock0),
	.portaaddr({address_a_wire[5:0]}),
	.portadatain({data_a[4]}),
	.portadataout(wire_ram_block1a_4portadataout[0:0]),
	.portare(1'b1),
	.portawe(wren_a),
	.portbdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.ena2(1'b1),
	.ena3(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddr({1{1'b0}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}}),
	.portbre(1'b1),
	.portbwe(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_4.clk0_core_clock_enable = "none",
		ram_block1a_4.clk0_input_clock_enable = "none",
		ram_block1a_4.connectivity_checking = "OFF",
		ram_block1a_4.init_file = "instruction.hex",
		ram_block1a_4.init_file_layout = "port_a",
		ram_block1a_4.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_4.operation_mode = "single_port",
		ram_block1a_4.port_a_address_width = 6,
		ram_block1a_4.port_a_byte_enable_mask_width = 1,
		ram_block1a_4.port_a_byte_size = 1,
		ram_block1a_4.port_a_data_out_clear = "none",
		ram_block1a_4.port_a_data_out_clock = "none",
		ram_block1a_4.port_a_data_width = 1,
		ram_block1a_4.port_a_first_address = 0,
		ram_block1a_4.port_a_first_bit_number = 4,
		ram_block1a_4.port_a_last_address = 63,
		ram_block1a_4.port_a_logical_ram_depth = 64,
		ram_block1a_4.port_a_logical_ram_width = 16,
		ram_block1a_4.port_a_read_during_write_mode = "new_data_no_nbe_read",
		ram_block1a_4.power_up_uninitialized = "false",
		ram_block1a_4.ram_block_type = "AUTO",
		ram_block1a_4.lpm_type = "cycloneive_ram_block";
	cycloneive_ram_block   ram_block1a_5
	( 
	.clk0(clock0),
	.portaaddr({address_a_wire[5:0]}),
	.portadatain({data_a[5]}),
	.portadataout(wire_ram_block1a_5portadataout[0:0]),
	.portare(1'b1),
	.portawe(wren_a),
	.portbdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.ena2(1'b1),
	.ena3(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddr({1{1'b0}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}}),
	.portbre(1'b1),
	.portbwe(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_5.clk0_core_clock_enable = "none",
		ram_block1a_5.clk0_input_clock_enable = "none",
		ram_block1a_5.connectivity_checking = "OFF",
		ram_block1a_5.init_file = "instruction.hex",
		ram_block1a_5.init_file_layout = "port_a",
		ram_block1a_5.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_5.operation_mode = "single_port",
		ram_block1a_5.port_a_address_width = 6,
		ram_block1a_5.port_a_byte_enable_mask_width = 1,
		ram_block1a_5.port_a_byte_size = 1,
		ram_block1a_5.port_a_data_out_clear = "none",
		ram_block1a_5.port_a_data_out_clock = "none",
		ram_block1a_5.port_a_data_width = 1,
		ram_block1a_5.port_a_first_address = 0,
		ram_block1a_5.port_a_first_bit_number = 5,
		ram_block1a_5.port_a_last_address = 63,
		ram_block1a_5.port_a_logical_ram_depth = 64,
		ram_block1a_5.port_a_logical_ram_width = 16,
		ram_block1a_5.port_a_read_during_write_mode = "new_data_no_nbe_read",
		ram_block1a_5.power_up_uninitialized = "false",
		ram_block1a_5.ram_block_type = "AUTO",
		ram_block1a_5.lpm_type = "cycloneive_ram_block";
	cycloneive_ram_block   ram_block1a_6
	( 
	.clk0(clock0),
	.portaaddr({address_a_wire[5:0]}),
	.portadatain({data_a[6]}),
	.portadataout(wire_ram_block1a_6portadataout[0:0]),
	.portare(1'b1),
	.portawe(wren_a),
	.portbdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.ena2(1'b1),
	.ena3(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddr({1{1'b0}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}}),
	.portbre(1'b1),
	.portbwe(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_6.clk0_core_clock_enable = "none",
		ram_block1a_6.clk0_input_clock_enable = "none",
		ram_block1a_6.connectivity_checking = "OFF",
		ram_block1a_6.init_file = "instruction.hex",
		ram_block1a_6.init_file_layout = "port_a",
		ram_block1a_6.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_6.operation_mode = "single_port",
		ram_block1a_6.port_a_address_width = 6,
		ram_block1a_6.port_a_byte_enable_mask_width = 1,
		ram_block1a_6.port_a_byte_size = 1,
		ram_block1a_6.port_a_data_out_clear = "none",
		ram_block1a_6.port_a_data_out_clock = "none",
		ram_block1a_6.port_a_data_width = 1,
		ram_block1a_6.port_a_first_address = 0,
		ram_block1a_6.port_a_first_bit_number = 6,
		ram_block1a_6.port_a_last_address = 63,
		ram_block1a_6.port_a_logical_ram_depth = 64,
		ram_block1a_6.port_a_logical_ram_width = 16,
		ram_block1a_6.port_a_read_during_write_mode = "new_data_no_nbe_read",
		ram_block1a_6.power_up_uninitialized = "false",
		ram_block1a_6.ram_block_type = "AUTO",
		ram_block1a_6.lpm_type = "cycloneive_ram_block";
	cycloneive_ram_block   ram_block1a_7
	( 
	.clk0(clock0),
	.portaaddr({address_a_wire[5:0]}),
	.portadatain({data_a[7]}),
	.portadataout(wire_ram_block1a_7portadataout[0:0]),
	.portare(1'b1),
	.portawe(wren_a),
	.portbdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.ena2(1'b1),
	.ena3(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddr({1{1'b0}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}}),
	.portbre(1'b1),
	.portbwe(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_7.clk0_core_clock_enable = "none",
		ram_block1a_7.clk0_input_clock_enable = "none",
		ram_block1a_7.connectivity_checking = "OFF",
		ram_block1a_7.init_file = "instruction.hex",
		ram_block1a_7.init_file_layout = "port_a",
		ram_block1a_7.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_7.operation_mode = "single_port",
		ram_block1a_7.port_a_address_width = 6,
		ram_block1a_7.port_a_byte_enable_mask_width = 1,
		ram_block1a_7.port_a_byte_size = 1,
		ram_block1a_7.port_a_data_out_clear = "none",
		ram_block1a_7.port_a_data_out_clock = "none",
		ram_block1a_7.port_a_data_width = 1,
		ram_block1a_7.port_a_first_address = 0,
		ram_block1a_7.port_a_first_bit_number = 7,
		ram_block1a_7.port_a_last_address = 63,
		ram_block1a_7.port_a_logical_ram_depth = 64,
		ram_block1a_7.port_a_logical_ram_width = 16,
		ram_block1a_7.port_a_read_during_write_mode = "new_data_no_nbe_read",
		ram_block1a_7.power_up_uninitialized = "false",
		ram_block1a_7.ram_block_type = "AUTO",
		ram_block1a_7.lpm_type = "cycloneive_ram_block";
	cycloneive_ram_block   ram_block1a_8
	( 
	.clk0(clock0),
	.portaaddr({address_a_wire[5:0]}),
	.portadatain({data_a[8]}),
	.portadataout(wire_ram_block1a_8portadataout[0:0]),
	.portare(1'b1),
	.portawe(wren_a),
	.portbdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.ena2(1'b1),
	.ena3(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddr({1{1'b0}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}}),
	.portbre(1'b1),
	.portbwe(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_8.clk0_core_clock_enable = "none",
		ram_block1a_8.clk0_input_clock_enable = "none",
		ram_block1a_8.connectivity_checking = "OFF",
		ram_block1a_8.init_file = "instruction.hex",
		ram_block1a_8.init_file_layout = "port_a",
		ram_block1a_8.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_8.operation_mode = "single_port",
		ram_block1a_8.port_a_address_width = 6,
		ram_block1a_8.port_a_byte_enable_mask_width = 1,
		ram_block1a_8.port_a_byte_size = 1,
		ram_block1a_8.port_a_data_out_clear = "none",
		ram_block1a_8.port_a_data_out_clock = "none",
		ram_block1a_8.port_a_data_width = 1,
		ram_block1a_8.port_a_first_address = 0,
		ram_block1a_8.port_a_first_bit_number = 8,
		ram_block1a_8.port_a_last_address = 63,
		ram_block1a_8.port_a_logical_ram_depth = 64,
		ram_block1a_8.port_a_logical_ram_width = 16,
		ram_block1a_8.port_a_read_during_write_mode = "new_data_no_nbe_read",
		ram_block1a_8.power_up_uninitialized = "false",
		ram_block1a_8.ram_block_type = "AUTO",
		ram_block1a_8.lpm_type = "cycloneive_ram_block";
	cycloneive_ram_block   ram_block1a_9
	( 
	.clk0(clock0),
	.portaaddr({address_a_wire[5:0]}),
	.portadatain({data_a[9]}),
	.portadataout(wire_ram_block1a_9portadataout[0:0]),
	.portare(1'b1),
	.portawe(wren_a),
	.portbdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.ena2(1'b1),
	.ena3(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddr({1{1'b0}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}}),
	.portbre(1'b1),
	.portbwe(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_9.clk0_core_clock_enable = "none",
		ram_block1a_9.clk0_input_clock_enable = "none",
		ram_block1a_9.connectivity_checking = "OFF",
		ram_block1a_9.init_file = "instruction.hex",
		ram_block1a_9.init_file_layout = "port_a",
		ram_block1a_9.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_9.operation_mode = "single_port",
		ram_block1a_9.port_a_address_width = 6,
		ram_block1a_9.port_a_byte_enable_mask_width = 1,
		ram_block1a_9.port_a_byte_size = 1,
		ram_block1a_9.port_a_data_out_clear = "none",
		ram_block1a_9.port_a_data_out_clock = "none",
		ram_block1a_9.port_a_data_width = 1,
		ram_block1a_9.port_a_first_address = 0,
		ram_block1a_9.port_a_first_bit_number = 9,
		ram_block1a_9.port_a_last_address = 63,
		ram_block1a_9.port_a_logical_ram_depth = 64,
		ram_block1a_9.port_a_logical_ram_width = 16,
		ram_block1a_9.port_a_read_during_write_mode = "new_data_no_nbe_read",
		ram_block1a_9.power_up_uninitialized = "false",
		ram_block1a_9.ram_block_type = "AUTO",
		ram_block1a_9.lpm_type = "cycloneive_ram_block";
	cycloneive_ram_block   ram_block1a_10
	( 
	.clk0(clock0),
	.portaaddr({address_a_wire[5:0]}),
	.portadatain({data_a[10]}),
	.portadataout(wire_ram_block1a_10portadataout[0:0]),
	.portare(1'b1),
	.portawe(wren_a),
	.portbdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.ena2(1'b1),
	.ena3(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddr({1{1'b0}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}}),
	.portbre(1'b1),
	.portbwe(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_10.clk0_core_clock_enable = "none",
		ram_block1a_10.clk0_input_clock_enable = "none",
		ram_block1a_10.connectivity_checking = "OFF",
		ram_block1a_10.init_file = "instruction.hex",
		ram_block1a_10.init_file_layout = "port_a",
		ram_block1a_10.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_10.operation_mode = "single_port",
		ram_block1a_10.port_a_address_width = 6,
		ram_block1a_10.port_a_byte_enable_mask_width = 1,
		ram_block1a_10.port_a_byte_size = 1,
		ram_block1a_10.port_a_data_out_clear = "none",
		ram_block1a_10.port_a_data_out_clock = "none",
		ram_block1a_10.port_a_data_width = 1,
		ram_block1a_10.port_a_first_address = 0,
		ram_block1a_10.port_a_first_bit_number = 10,
		ram_block1a_10.port_a_last_address = 63,
		ram_block1a_10.port_a_logical_ram_depth = 64,
		ram_block1a_10.port_a_logical_ram_width = 16,
		ram_block1a_10.port_a_read_during_write_mode = "new_data_no_nbe_read",
		ram_block1a_10.power_up_uninitialized = "false",
		ram_block1a_10.ram_block_type = "AUTO",
		ram_block1a_10.lpm_type = "cycloneive_ram_block";
	cycloneive_ram_block   ram_block1a_11
	( 
	.clk0(clock0),
	.portaaddr({address_a_wire[5:0]}),
	.portadatain({data_a[11]}),
	.portadataout(wire_ram_block1a_11portadataout[0:0]),
	.portare(1'b1),
	.portawe(wren_a),
	.portbdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.ena2(1'b1),
	.ena3(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddr({1{1'b0}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}}),
	.portbre(1'b1),
	.portbwe(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_11.clk0_core_clock_enable = "none",
		ram_block1a_11.clk0_input_clock_enable = "none",
		ram_block1a_11.connectivity_checking = "OFF",
		ram_block1a_11.init_file = "instruction.hex",
		ram_block1a_11.init_file_layout = "port_a",
		ram_block1a_11.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_11.operation_mode = "single_port",
		ram_block1a_11.port_a_address_width = 6,
		ram_block1a_11.port_a_byte_enable_mask_width = 1,
		ram_block1a_11.port_a_byte_size = 1,
		ram_block1a_11.port_a_data_out_clear = "none",
		ram_block1a_11.port_a_data_out_clock = "none",
		ram_block1a_11.port_a_data_width = 1,
		ram_block1a_11.port_a_first_address = 0,
		ram_block1a_11.port_a_first_bit_number = 11,
		ram_block1a_11.port_a_last_address = 63,
		ram_block1a_11.port_a_logical_ram_depth = 64,
		ram_block1a_11.port_a_logical_ram_width = 16,
		ram_block1a_11.port_a_read_during_write_mode = "new_data_no_nbe_read",
		ram_block1a_11.power_up_uninitialized = "false",
		ram_block1a_11.ram_block_type = "AUTO",
		ram_block1a_11.lpm_type = "cycloneive_ram_block";
	cycloneive_ram_block   ram_block1a_12
	( 
	.clk0(clock0),
	.portaaddr({address_a_wire[5:0]}),
	.portadatain({data_a[12]}),
	.portadataout(wire_ram_block1a_12portadataout[0:0]),
	.portare(1'b1),
	.portawe(wren_a),
	.portbdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.ena2(1'b1),
	.ena3(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddr({1{1'b0}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}}),
	.portbre(1'b1),
	.portbwe(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_12.clk0_core_clock_enable = "none",
		ram_block1a_12.clk0_input_clock_enable = "none",
		ram_block1a_12.connectivity_checking = "OFF",
		ram_block1a_12.init_file = "instruction.hex",
		ram_block1a_12.init_file_layout = "port_a",
		ram_block1a_12.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_12.operation_mode = "single_port",
		ram_block1a_12.port_a_address_width = 6,
		ram_block1a_12.port_a_byte_enable_mask_width = 1,
		ram_block1a_12.port_a_byte_size = 1,
		ram_block1a_12.port_a_data_out_clear = "none",
		ram_block1a_12.port_a_data_out_clock = "none",
		ram_block1a_12.port_a_data_width = 1,
		ram_block1a_12.port_a_first_address = 0,
		ram_block1a_12.port_a_first_bit_number = 12,
		ram_block1a_12.port_a_last_address = 63,
		ram_block1a_12.port_a_logical_ram_depth = 64,
		ram_block1a_12.port_a_logical_ram_width = 16,
		ram_block1a_12.port_a_read_during_write_mode = "new_data_no_nbe_read",
		ram_block1a_12.power_up_uninitialized = "false",
		ram_block1a_12.ram_block_type = "AUTO",
		ram_block1a_12.lpm_type = "cycloneive_ram_block";
	cycloneive_ram_block   ram_block1a_13
	( 
	.clk0(clock0),
	.portaaddr({address_a_wire[5:0]}),
	.portadatain({data_a[13]}),
	.portadataout(wire_ram_block1a_13portadataout[0:0]),
	.portare(1'b1),
	.portawe(wren_a),
	.portbdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.ena2(1'b1),
	.ena3(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddr({1{1'b0}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}}),
	.portbre(1'b1),
	.portbwe(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_13.clk0_core_clock_enable = "none",
		ram_block1a_13.clk0_input_clock_enable = "none",
		ram_block1a_13.connectivity_checking = "OFF",
		ram_block1a_13.init_file = "instruction.hex",
		ram_block1a_13.init_file_layout = "port_a",
		ram_block1a_13.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_13.operation_mode = "single_port",
		ram_block1a_13.port_a_address_width = 6,
		ram_block1a_13.port_a_byte_enable_mask_width = 1,
		ram_block1a_13.port_a_byte_size = 1,
		ram_block1a_13.port_a_data_out_clear = "none",
		ram_block1a_13.port_a_data_out_clock = "none",
		ram_block1a_13.port_a_data_width = 1,
		ram_block1a_13.port_a_first_address = 0,
		ram_block1a_13.port_a_first_bit_number = 13,
		ram_block1a_13.port_a_last_address = 63,
		ram_block1a_13.port_a_logical_ram_depth = 64,
		ram_block1a_13.port_a_logical_ram_width = 16,
		ram_block1a_13.port_a_read_during_write_mode = "new_data_no_nbe_read",
		ram_block1a_13.power_up_uninitialized = "false",
		ram_block1a_13.ram_block_type = "AUTO",
		ram_block1a_13.lpm_type = "cycloneive_ram_block";
	cycloneive_ram_block   ram_block1a_14
	( 
	.clk0(clock0),
	.portaaddr({address_a_wire[5:0]}),
	.portadatain({data_a[14]}),
	.portadataout(wire_ram_block1a_14portadataout[0:0]),
	.portare(1'b1),
	.portawe(wren_a),
	.portbdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.ena2(1'b1),
	.ena3(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddr({1{1'b0}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}}),
	.portbre(1'b1),
	.portbwe(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_14.clk0_core_clock_enable = "none",
		ram_block1a_14.clk0_input_clock_enable = "none",
		ram_block1a_14.connectivity_checking = "OFF",
		ram_block1a_14.init_file = "instruction.hex",
		ram_block1a_14.init_file_layout = "port_a",
		ram_block1a_14.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_14.operation_mode = "single_port",
		ram_block1a_14.port_a_address_width = 6,
		ram_block1a_14.port_a_byte_enable_mask_width = 1,
		ram_block1a_14.port_a_byte_size = 1,
		ram_block1a_14.port_a_data_out_clear = "none",
		ram_block1a_14.port_a_data_out_clock = "none",
		ram_block1a_14.port_a_data_width = 1,
		ram_block1a_14.port_a_first_address = 0,
		ram_block1a_14.port_a_first_bit_number = 14,
		ram_block1a_14.port_a_last_address = 63,
		ram_block1a_14.port_a_logical_ram_depth = 64,
		ram_block1a_14.port_a_logical_ram_width = 16,
		ram_block1a_14.port_a_read_during_write_mode = "new_data_no_nbe_read",
		ram_block1a_14.power_up_uninitialized = "false",
		ram_block1a_14.ram_block_type = "AUTO",
		ram_block1a_14.lpm_type = "cycloneive_ram_block";
	cycloneive_ram_block   ram_block1a_15
	( 
	.clk0(clock0),
	.portaaddr({address_a_wire[5:0]}),
	.portadatain({data_a[15]}),
	.portadataout(wire_ram_block1a_15portadataout[0:0]),
	.portare(1'b1),
	.portawe(wren_a),
	.portbdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.ena2(1'b1),
	.ena3(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddr({1{1'b0}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}}),
	.portbre(1'b1),
	.portbwe(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_15.clk0_core_clock_enable = "none",
		ram_block1a_15.clk0_input_clock_enable = "none",
		ram_block1a_15.connectivity_checking = "OFF",
		ram_block1a_15.init_file = "instruction.hex",
		ram_block1a_15.init_file_layout = "port_a",
		ram_block1a_15.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_15.operation_mode = "single_port",
		ram_block1a_15.port_a_address_width = 6,
		ram_block1a_15.port_a_byte_enable_mask_width = 1,
		ram_block1a_15.port_a_byte_size = 1,
		ram_block1a_15.port_a_data_out_clear = "none",
		ram_block1a_15.port_a_data_out_clock = "none",
		ram_block1a_15.port_a_data_width = 1,
		ram_block1a_15.port_a_first_address = 0,
		ram_block1a_15.port_a_first_bit_number = 15,
		ram_block1a_15.port_a_last_address = 63,
		ram_block1a_15.port_a_logical_ram_depth = 64,
		ram_block1a_15.port_a_logical_ram_width = 16,
		ram_block1a_15.port_a_read_during_write_mode = "new_data_no_nbe_read",
		ram_block1a_15.power_up_uninitialized = "false",
		ram_block1a_15.ram_block_type = "AUTO",
		ram_block1a_15.lpm_type = "cycloneive_ram_block";
	assign
		address_a_wire = address_a,
		q_a = {wire_ram_block1a_15portadataout[0], wire_ram_block1a_14portadataout[0], wire_ram_block1a_13portadataout[0], wire_ram_block1a_12portadataout[0], wire_ram_block1a_11portadataout[0], wire_ram_block1a_10portadataout[0], wire_ram_block1a_9portadataout[0], wire_ram_block1a_8portadataout[0], wire_ram_block1a_7portadataout[0], wire_ram_block1a_6portadataout[0], wire_ram_block1a_5portadataout[0], wire_ram_block1a_4portadataout[0], wire_ram_block1a_3portadataout[0], wire_ram_block1a_2portadataout[0], wire_ram_block1a_1portadataout[0], wire_ram_block1a_0portadataout[0]};
	initial/*synthesis enable_verilog_initial_construct*/
 	begin
		$display("Warning: Memory initialization file instruction.hex is not found. This may result in inconsistent simulation results.");
	end
endmodule //instruction_memory_altsyncram
//VALID FILE


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module instruction_memory (
	address,
	clock,
	data,
	wren,
	q)/* synthesis synthesis_clearbox = 1 */;

	input	[5:0]  address;
	input	  clock;
	input	[15:0]  data;
	input	  wren;
	output	[15:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	  clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire [15:0] sub_wire0;
	wire [15:0] q = sub_wire0[15:0];

	instruction_memory_altsyncram	instruction_memory_altsyncram_component (
				.address_a (address),
				.clock0 (clock),
				.data_a (data),
				.wren_a (wren),
				.q_a (sub_wire0));

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: ADDRESSSTALL_A NUMERIC "0"
// Retrieval info: PRIVATE: AclrAddr NUMERIC "0"
// Retrieval info: PRIVATE: AclrByte NUMERIC "0"
// Retrieval info: PRIVATE: AclrData NUMERIC "0"
// Retrieval info: PRIVATE: AclrOutput NUMERIC "0"
// Retrieval info: PRIVATE: BYTE_ENABLE NUMERIC "0"
// Retrieval info: PRIVATE: BYTE_SIZE NUMERIC "8"
// Retrieval info: PRIVATE: BlankMemory NUMERIC "0"
// Retrieval info: PRIVATE: CLOCK_ENABLE_INPUT_A NUMERIC "0"
// Retrieval info: PRIVATE: CLOCK_ENABLE_OUTPUT_A NUMERIC "0"
// Retrieval info: PRIVATE: Clken NUMERIC "0"
// Retrieval info: PRIVATE: DataBusSeparated NUMERIC "1"
// Retrieval info: PRIVATE: IMPLEMENT_IN_LES NUMERIC "0"
// Retrieval info: PRIVATE: INIT_FILE_LAYOUT STRING "PORT_A"
// Retrieval info: PRIVATE: INIT_TO_SIM_X NUMERIC "0"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone IV E"
// Retrieval info: PRIVATE: JTAG_ENABLED NUMERIC "0"
// Retrieval info: PRIVATE: JTAG_ID STRING "NONE"
// Retrieval info: PRIVATE: MAXIMUM_DEPTH NUMERIC "0"
// Retrieval info: PRIVATE: MIFfilename STRING "instruction.hex"
// Retrieval info: PRIVATE: NUMWORDS_A NUMERIC "64"
// Retrieval info: PRIVATE: RAM_BLOCK_TYPE NUMERIC "0"
// Retrieval info: PRIVATE: READ_DURING_WRITE_MODE_PORT_A NUMERIC "3"
// Retrieval info: PRIVATE: RegAddr NUMERIC "1"
// Retrieval info: PRIVATE: RegData NUMERIC "1"
// Retrieval info: PRIVATE: RegOutput NUMERIC "0"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "1"
// Retrieval info: PRIVATE: SingleClock NUMERIC "1"
// Retrieval info: PRIVATE: UseDQRAM NUMERIC "1"
// Retrieval info: PRIVATE: WRCONTROL_ACLR_A NUMERIC "0"
// Retrieval info: PRIVATE: WidthAddr NUMERIC "6"
// Retrieval info: PRIVATE: WidthData NUMERIC "16"
// Retrieval info: PRIVATE: rden NUMERIC "0"
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: CONSTANT: CLOCK_ENABLE_INPUT_A STRING "BYPASS"
// Retrieval info: CONSTANT: CLOCK_ENABLE_OUTPUT_A STRING "BYPASS"
// Retrieval info: CONSTANT: INIT_FILE STRING "instruction.hex"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone IV E"
// Retrieval info: CONSTANT: LPM_HINT STRING "ENABLE_RUNTIME_MOD=NO"
// Retrieval info: CONSTANT: LPM_TYPE STRING "altsyncram"
// Retrieval info: CONSTANT: NUMWORDS_A NUMERIC "64"
// Retrieval info: CONSTANT: OPERATION_MODE STRING "SINGLE_PORT"
// Retrieval info: CONSTANT: OUTDATA_ACLR_A STRING "NONE"
// Retrieval info: CONSTANT: OUTDATA_REG_A STRING "UNREGISTERED"
// Retrieval info: CONSTANT: POWER_UP_UNINITIALIZED STRING "FALSE"
// Retrieval info: CONSTANT: READ_DURING_WRITE_MODE_PORT_A STRING "NEW_DATA_NO_NBE_READ"
// Retrieval info: CONSTANT: WIDTHAD_A NUMERIC "6"
// Retrieval info: CONSTANT: WIDTH_A NUMERIC "16"
// Retrieval info: CONSTANT: WIDTH_BYTEENA_A NUMERIC "1"
// Retrieval info: USED_PORT: address 0 0 6 0 INPUT NODEFVAL "address[5..0]"
// Retrieval info: USED_PORT: clock 0 0 0 0 INPUT VCC "clock"
// Retrieval info: USED_PORT: data 0 0 16 0 INPUT NODEFVAL "data[15..0]"
// Retrieval info: USED_PORT: q 0 0 16 0 OUTPUT NODEFVAL "q[15..0]"
// Retrieval info: USED_PORT: wren 0 0 0 0 INPUT NODEFVAL "wren"
// Retrieval info: CONNECT: @address_a 0 0 6 0 address 0 0 6 0
// Retrieval info: CONNECT: @clock0 0 0 0 0 clock 0 0 0 0
// Retrieval info: CONNECT: @data_a 0 0 16 0 data 0 0 16 0
// Retrieval info: CONNECT: @wren_a 0 0 0 0 wren 0 0 0 0
// Retrieval info: CONNECT: q 0 0 16 0 @q_a 0 0 16 0
// Retrieval info: GEN_FILE: TYPE_NORMAL instruction_memory.vhd TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL instruction_memory.inc TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL instruction_memory.cmp TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL instruction_memory.bsf TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL instruction_memory_inst.vhd TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL instruction_memory_syn.v TRUE
// Retrieval info: LIB_FILE: altera_mf
