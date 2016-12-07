transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/CLOCK_DIVIDER.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/mem_components.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/subtractor.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/signExtender.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/registers.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/registerFileComponents.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/register_1bit.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/nand_logic.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/mux8.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/mux3.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/mux2.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/if_components.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/exe_components.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/decodeComponents.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/counter.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/components.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/alu.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/adder.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/instruction_memory.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/data_memory.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/hazardDetectionUnit.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/mux4.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/mem_access.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/writeBack.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/registerRead.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/registerFile.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/register16.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/multiple.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/microprocessor.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/inst_fetch.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/execute.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/decoderRF.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/Decode.vhd}
vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/forwardingUnit.vhd}

vcom -93 -work work {C:/Users/Ayush Agrawal/Desktop/Pipelined-Microprocessor/Codes/Central-Code/testbench.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
