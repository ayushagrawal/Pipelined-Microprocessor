library ieee;
use ieee.std_logic_1164.all;

library work;
use work.components.all;

entity microprocessor is
	port(clock : in std_logic;
		  reset : in std_logic);
		  
architecture mic of microprocessor is
	signal pcIn : std_logic_vector(15 downto 0);
	signal pcPlusOne,pcPlusOneR: std_logic_vector(15 downto 0);
	signal instruction,instructionR: std_logic_vector(15 downto 0);
	signal pcPlusOneOut_d: std_logic_vector(15 downto 0);
	signal pcMux_crtl_d : std_logic_vector(1 downto 0);	
	signal A_sel_d : std_logic_vector(2 downto 0);	
	signal B_sel_d : std_logic_vector(2 downto 0);	
	signal rf_dataIn_mux_d : std_logic_vector(1 downto 0);	
	signal carryEnable_d : std_logic;
	signal zeroEnable_d : std_logic;
	signal signExt_d: std_logic_vector(15 downto 0);
	signal alu_a_muxCrtl_d : std_logic;
	signal alu_b_muxCrtl_d std_logic_vector(1 downto 0);	
	signal r7_enable_d : std_logic;
	signal memWrite_en_d : std_logic;
	signal beq_pc_crtl_d : std_logic;
	signal rf_wren_mux _d : std_logic;
	signal rf_wren_d : std_logic;
	signal counter_mux_d : std_logic;
	signal mem_mux_d : std_logic;
	signal rf_dataIn_sel_d : std_logic_vector(2 downto 0);	
	signal alu_crtl_d : std_logic_vector(1 downto 0);	
	signal op2in _d : std_logic_vector(1 downto 0);	
	
begin

	IFetch : inst_fetch port map(clock => clock, reset => reset, pcIn => pcIn, pc_reg => '1',if_id_reg(15 downto 0) => pcPlusOne, if_id_reg(31 downto 16) => instruction);
	IF_ID  : registers generic map(N => 32) port map(input(31 downto 16) => instruction, input(15 downto 0) => pcPlusOne,clock => clock, reset => reset, enable =>, output(31 downto 16) => instructionR, output(15 downto 0) => pcPlusOneR);
	
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
	
	ID_RR : registers generic map(N => 61) port map(clock	     => clock,
																	reset      => reset,
																	enabe		  => ,
																	input(60 downto 45) => pcPlusOneOut_d,
																	input(44 downto 43)	 => pcMux_crtl_d,
																	input(42 downto 40)		 => A_sel_d,
																	input(39 downto 37)		 => B_sel_d,
																	input(36 downto 35)=> rf_dataIn_mux_d,
																	input(34)  => carryEnable_d,
																	input(33)   => zeroEnable_d,
																	input(32 downto 17)      => signExt_d,
																	input(16)=> alu_a_muxCrtl_d,
																	input(15 downto 14)=>alu_b_muxCrtl_d,
																	input(13)	=> r7_enable_d,
																	input(12)  => memWrite_en_d,
																	input(11)  => beq_pc_crtl_d,
																	input(10)  => rf_wren_mux _d,
																	input(9)		=> rf_wren_d,
																	input(8)  => counter_mux_d,
																	input(7)		=> mem_mux_d,
																	input(6 downto 4)=> rf_dataIn_sel_d,
																	input(3 downto 2)     => alu_crtl_d,
																	input(1 downto 0) 	     => op2in _d,
																	output(60 downto 45) => pcPlusOneOut_r,
																	output(44 downto 43)	 => pcMux_crtl_r,
																	output(42 downto 40)		 => A_sel_r,
																	output(39 downto 37)		 => B_sel_r,
																	output(36 downto 35)=> rf_dataIn_mux_r,
																	output(34)  => carryEnable_r,
																	output(33)   => zeroEnable_r,
																	output(32 downto 17)      => signExt_r,
																	output(16)=> alu_a_muxCrtl_r,
																	output(15 downto 14)=>alu_b_muxCrtl_r,
																	output(13)	=> r7_enable_r,
																	output(12)  => memWrite_en_r,
																	output(11)  => beq_pc_crtl_r,
																	output(10)  => rf_wren_mux _r,
																	output(9)		=> rf_wren_r,
																	output(8)  => counter_mux_r,
																	output(7)		=> mem_mux_r,
																	output(6 downto 4)=> rf_dataIn_sel_r,
																	output(3 downto 2)     => alu_crtl_r,
																	output(1 downto 0) 	     => op2in _r);
																	
	RF : registerRead port map(clock						=> clock,
										reset						=> reset,
										r7_enableTo_RF 		=> in std_logic;								-- From Write Back Stage
										pc_in			  			=> in std_logic_vector(15 downto 0);	-- From WB
										regWrite		  			=> in std_logic;								-- From WB
										dataIn			  		=> in std_logic_vector(15 downto 0);	-- From WB
										dataIn_sel_actual	  	=> in std_logic_vector(2 downto 0);		-- From WB
										pcPlusOnein 			=> pcPlusOneOut_r,
										pcMux_crtlin	 		=> pcMux_crtl_r,
										A_selin			 		=> A_sel_r,
										B_selin			 		=> B_sel_r,
										rf_dataIn_muxin		=> rf_dataIn_mux_r,
										carryEnablein  		=> carryEnable_r,
										zeroEnablein   		=> zeroEnable_r,
										signExtin      		=> signExt_r,
										alu_a_muxCrtlin		=> alu_a_muxCrtl_r,
										alu_b_muxCrtlin		=> alu_b_muxCrtl_r,
										r7_enablein	 			=> r7_enable_r,
										memWrite_enin  		=> memWrite_en_r,
										beq_pc_crtlin  		=> beq_pc_crtl_r,
										rf_wren_muxin  		=> rf_wren_mux _r,
										rf_wrenin		 		=> rf_wren_r,
										counter_muxin  		=> counter_mux_r,
										mem_muxin		 		=> mem_mux_r,
										rf_dataIn_selin		=> rf_dataIn_sel_r,
										alu_crtlin     		=> alu_crtl_r,
										op2inin			 		=> op2in _r,
										
										pcPlusOneOut 			=> pcPlusOneOut_e,
										pcMux_crtlout	 		=> pcMux_crtl_e,
										regA			 			=> regA,
										regB			 			=> regB,
										rf_dataIn_muxout		=> rf_dataIn_mux_e,
										carryEnableout  		=> carryEnable_e,
										zeroEnableout   		=> zeroEnable_e,
										signExtout      		=> signExt_e,
										alu_a_muxCrtlout		=> alu_a_muxCrtl_e,
										alu_b_muxCrtlout		=> alu_b_muxCrtl_e,
										r7_enableout	 		=> r7_enable_e,
										memWrite_enout  		=> memWrite_en_e,
										beq_pc_crtlout  		=> beq_pc_crtl_e,
										rf_wren_muxout  		=> rf_wren_mux_e,
										rf_wrenout		 		=> rf_wren_e,
										counter_muxout  		=> counter_mux_e,
										mem_muxout		 		=> mem_mux_e,
										rf_dataIn_selout		=> rf_dataIn_sel_e,
										alu_crtlout     		=> alu_crtl_e,
										op2inout			 		=> op2in_e);
	
	RR_EX : registers generic map(N => ) port map(clock => clock, reset =>,
																 input(86 downto 71) 			=> pcPlusOneOut_e,
																 input(70 downto 69)	 		=> pcMux_crtl_e,
																 input(68 downto 53)			 			=> regA,
																 input(52 downto 37)		=> regB,
																 input(36 downto 35)		=> rf_dataIn_mux_e,
																 input(34)  		=> carryEnable_e,
																 input(33)   		=> zeroEnable_e,
																 input(32 downto 17)   		=> signExt_e,
																 input(16)		=> alu_a_muxCrtl_e,
																 input(15 downto 14)		=> alu_b_muxCrtl_e,
																 input(13)	 		=> r7_enable_e,
																 input(12)  		=> memWrite_en_e,
																 input(11)  		=> beq_pc_crtl_e,
																 input(10)=> rf_wren_mux_e,
																 input(9)		 		=> rf_wren_e,
																 input(8)  		=> counter_mux_e,
																 input(7) 		=> mem_mux_e,
																 input(6 downto 4)			=> rf_dataIn_sel_e,
																 input(3 downto 2)   		=> alu_crtl_e,
																 input(1 downto 0)		 		=> op2in_e,
																 
																 output(downto) 			=> pcPlusOneOut_m,
																 output(downto)	 		=> pcMux_crtl_m,
																 output(downto)			 			=> regA,
																 output(downto)		=> regB,
																 output(downto)		=> rf_dataIn_mux_m,
																 output(downto)  		=> carryEnable_m,
																 output(downto)   		=> zeroEnable_m,
																 output(downto)   		=> signExt_m,
																 output(downto)		=> alu_a_muxCrtl_m,
																 output(downto)		=> alu_b_muxCrtl_m,
																 output(downto)	 		=> r7_enable_m,
																 output(downto)  		=> memWrite_en_m,
																 output(downto)  		=> beq_pc_crtl_m,
																 output(downto)=> rf_wren_mux_m,
																 output(downto)		 		=> rf_wren_m,
																 output(downto)  		=> counter_mux_m,
																 output(downto) 		=> mem_mux_m,
																 output(downto)=> rf_dataIn_sel_m,
																 output(downto)   		=> alu_crtl_m,
																 output(downto)		 		=> op2in_m);
end mic;
