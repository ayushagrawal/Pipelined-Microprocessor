library ieee;
use ieee.std_logic_1164.all;

library work;
use work.components.all;

entity microprocessor is
	port(clock : in std_logic;
		  reset : in std_logic);
		  
architecture mic of microprocessor is
	signal pcIn;
	signal pcPlusOne,pcPlusOneR;
	signal instruction,instructionR;
	signal pcPlusOneOut_d;
	signal pcMux_crtl_d;
	signal A_sel_d;
	signal B_sel_d;
	signal rf_dataIn_mux_d;
	signal carryEnable_d;
	signal zeroEnable_d;
	signal signExt_d;
	signal alu_a_muxCrtl_d;
	signal alu_b_muxCrtl_d;
	signal r7_enable_d;
	signal memWrite_en_d;
	signal beq_pc_crtl_d;
	signal rf_wren_mux _d;
	signal rf_wren_d;
	signal counter_mux_d;
	signal mem_mux_d;
	signal rf_dataIn_sel_d;
	signal alu_crtl_d;
	signal op2in _d;	
	
begin

	IFetch : inst_fetch port map(clock => clock, reset => reset, pcIn => pcIn, pc_reg => '1',if_id_reg(15 downto 0) => pcPlusOne, if_id_reg(31 downto 16) => instruction);
	IF_ID  : registers generic map() port map(input(31 downto 16) => instruction, input(15 downto 0) => pcPlusOne,clock => clock, reset => reset, enable =>, output(31 downto 16) => instructionR, output(15 downto 0) => pcPlusOneR);
	
	Decoded: decode port map(instruction  => instructionR,
				clock	     => clock,
				pcPlusOneIn  => pcPlusOneR,
				pcPlusOneOut => pcPlusOneOut_d,
				pcMux_crtl	 => pcMux_crtl_d,
				A_sel		 => A_sel_d,
				B_sel		 => B_sel_d,
				rf_dataIn_mux=> rf_dataIn_mux_d,
				carryEnable  => carryEnable_d,
				zeroEnable   => zeroEnable_d,
				signExt      => signExt_d,
				alu_a_muxCrtl=> alu_a_muxCrtl_d,
				alu_b_muxCrtl=>alu_b_muxCrtl_d,
				r7_enable	=> r7_enable_d,
				memWrite_en  => memWrite_en_d,
				beq_pc_crtl  => beq_pc_crtl_d,
				rf_wren_mux  => rf_wren_mux _d,
				rf_wren		=> rf_wren_d,
				counter_mux  => counter_mux_d,
				mem_mux		=> mem_mux_d,
				rf_dataIn_sel=> rf_dataIn_sel_d,
				alu_crtl     => alu_crtl_d,
				op2in 	     => op2in _d);
end mic;
