library ieee;
use ieee.std_logic_1164.all;

library work;
use work.components.all;

entity microprocessor is
	port(clock : in std_logic;
		  reset : in std_logic);
end entity;
		  
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
	signal alu_b_muxCrtl_d : std_logic_vector(1 downto 0);	
	signal r7_enable_d : std_logic;
	signal memWrite_en_d : std_logic;
	signal beq_pc_crtl_d : std_logic;
	signal rf_wren_mux_d : std_logic;
	signal rf_wren_d : std_logic;
	signal counter_mux_d : std_logic;
	signal mem_mux_d : std_logic;
	signal rf_dataIn_sel_d : std_logic_vector(2 downto 0);	
	signal alu_crtl_d : std_logic_vector(1 downto 0);	
	signal op2in_d : std_logic_vector(1 downto 0);	
	
	signal pcPlusOneOut_r: std_logic_vector(15 downto 0);
	signal pcMux_crtl_r : std_logic_vector(1 downto 0);	
	signal A_sel_r : std_logic_vector(2 downto 0);	
	signal B_sel_r : std_logic_vector(2 downto 0);	
	signal rf_dataIn_mux_r : std_logic_vector(1 downto 0);	
	signal carryEnable_r : std_logic;
	signal zeroEnable_r : std_logic;
	signal signExt_r: std_logic_vector(15 downto 0);
	signal alu_a_muxCrtl_r : std_logic;
	signal alu_b_muxCrtl_r : std_logic_vector(1 downto 0);	
	signal r7_enable_r : std_logic;
	signal memWrite_en_r : std_logic;
	signal beq_pc_crtl_r : std_logic;
	signal rf_wren_mux_r : std_logic;
	signal rf_wren_r : std_logic;
	signal counter_mux_r : std_logic;
	signal mem_mux_r : std_logic;
	signal rf_dataIn_sel_r : std_logic_vector(2 downto 0);	
	signal alu_crtl_r : std_logic_vector(1 downto 0);	
	signal op2in_r : std_logic_vector(1 downto 0);	
	
	signal pcPlusOneOut_e: std_logic_vector(15 downto 0);
	signal pcMux_crtl_e : std_logic_vector(1 downto 0);	
	signal A_sel_e : std_logic_vector(2 downto 0);	
	signal B_sel_e : std_logic_vector(2 downto 0);	
	signal rf_dataIn_mux_e : std_logic_vector(1 downto 0);	
	signal carryEnable_e : std_logic;
	signal zeroEnable_e : std_logic;
	signal signExt_e: std_logic_vector(15 downto 0);
	signal alu_a_muxCrtl_e : std_logic;
	signal alu_b_muxCrtl_e : std_logic_vector(1 downto 0);	
	signal r7_enable_e : std_logic;
	signal memWrite_en_e : std_logic;
	signal beq_pc_crtl_e : std_logic;
	signal rf_wren_mux_e : std_logic;
	signal rf_wren_e : std_logic;
	signal counter_mux_e : std_logic;
	signal mem_mux_e : std_logic;
	signal rf_dataIn_sel_e : std_logic_vector(2 downto 0);	
	signal alu_crtl_e : std_logic_vector(1 downto 0);	
	signal op2in_e : std_logic_vector(1 downto 0);
	
	signal pcPlusOneOut_m: std_logic_vector(15 downto 0);
	signal pcMux_crtl_m : std_logic_vector(1 downto 0);	
	signal A_sel_m : std_logic_vector(2 downto 0);	
	signal B_sel_m : std_logic_vector(2 downto 0);	
	signal rf_dataIn_mux_m : std_logic_vector(1 downto 0);	
	signal carryEnable_m : std_logic;
	signal zeroEnable_m : std_logic;
	signal signExt_m: std_logic_vector(15 downto 0);
	signal alu_a_muxCrtl_m : std_logic;
	signal alu_b_muxCrtl_m : std_logic_vector(1 downto 0);	
	signal r7_enable_m : std_logic;
	signal memWrite_en_m : std_logic;
	signal beq_pc_crtl_m : std_logic;
	signal rf_wren_mux_m : std_logic;
	signal rf_wren_m : std_logic;
	signal counter_mux_m : std_logic;
	signal mem_mux_m : std_logic;
	signal rf_dataIn_sel_m : std_logic_vector(2 downto 0);	
	signal alu_crtl_m : std_logic_vector(1 downto 0);	
	signal op2in_m : std_logic_vector(1 downto 0);	
	
	signal ex_reg_out,exe_out : std_logic_vector(108 downto 0) ;
	signal mem_wb_out,mem_wb_in : std_logic_vector(88 downto 0);
	signal rfDataInsel_out_w : std_logic_vector(2 downto 0);
	signal r7_enable_out_w : std_logic;
	signal regWrite_w : std_logic;
	signal DataIn_w : std_logic_vector(15 downto 0);  
	signal pcIn_w : std_logic_vector(15 downto 0);
	signal enable_if,enable_id,enable_rr,enable_ex,enable_mem,counter_reset: std_logic;
	signal regA,regB : std_logic_vector(15 downto 0);

begin

	IFetch : inst_fetch port map(clock => clock, reset => reset, pcIn => pcIn, pc_reg => '1',if_id_reg(15 downto 0) => pcPlusOne, if_id_reg(31 downto 16) => instruction);
	IF_ID  : registers generic map(N => 32) port map(input(31 downto 16) => instruction, input(15 downto 0) => pcPlusOne,clock => clock, reset => reset, enable => enable_IF, output(31 downto 16) => instructionR, output(15 downto 0) => pcPlusOneR);
	
	
	
	enable_id <= '1';
	enable_if <= '1';
	
	
	
	
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
				rf_wren_mux  => rf_wren_mux_d,
				rf_wren		=> rf_wren_d,
				counter_mux  => counter_mux_d,
				mem_mux		=> mem_mux_d,
				rf_dataIn_sel=> rf_dataIn_sel_d,
				alu_crtl     => alu_crtl_d,
				op2in 	     => op2in_d);
	
	ID_RR : registers generic map(N => 61) port map(clock	     => clock,
																	reset      => reset,
																	enable		  => enable_id,
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
																	input(10)  => rf_wren_mux_d,
																	input(9)		=> rf_wren_d,
																	input(8)  => counter_mux_d,
																	input(7)		=> mem_mux_d,
																	input(6 downto 4)=> rf_dataIn_sel_d,
																	input(3 downto 2)     => alu_crtl_d,
																	input(1 downto 0) 	     => op2in_d,
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
																	output(10)  => rf_wren_mux_r,
																	output(9)		=> rf_wren_r,
																	output(8)  => counter_mux_r,
																	output(7)		=> mem_mux_r,
																	output(6 downto 4)=> rf_dataIn_sel_r,
																	output(3 downto 2)     => alu_crtl_r,
																	output(1 downto 0) 	     => op2in_r);
																	
	RF : registerRead port map(clock						=> clock,
										reset				=> reset,
										r7_enableTo_RF 		=> r7_enable_out_w,						-- From Write Back Stage
										pc_in				=> pcIn_w,								-- From WB
										regWrite			=> regWrite_w,							-- From WB
										dataIn				=> DataIn_w,							-- From WB
										dataIn_sel_actual  	=> rfDataInsel_out_w,					-- From WB
										pcPlusOnein 		=> pcPlusOneOut_r,
										pcMux_crtlin		=> pcMux_crtl_r,
										A_selin				=> A_sel_r,
										B_selin				=> B_sel_r,
										rf_dataIn_muxin		=> rf_dataIn_mux_r,
										carryEnablein  		=> carryEnable_r,
										zeroEnablein   		=> zeroEnable_r,
										signExtin      		=> signExt_r,
										alu_a_muxCrtlin		=> alu_a_muxCrtl_r,
										alu_b_muxCrtlin		=> alu_b_muxCrtl_r,
										r7_enablein	 			=> r7_enable_r,
										memWrite_enin  		=> memWrite_en_r,
										beq_pc_crtlin  		=> beq_pc_crtl_r,
										rf_wren_muxin  		=> rf_wren_mux_r,
										rf_wrenin		 		=> rf_wren_r,
										counter_muxin  		=> counter_mux_r,
										mem_muxin		 		=> mem_mux_r,
										rf_dataIn_selin		=> rf_dataIn_sel_r,
										alu_crtlin     		=> alu_crtl_r,
										op2inin			 		=> op2in_r,
										
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
	
	RR_EX : registers generic map(N => 87) port map(clock => clock,
																	reset => reset,
																	enable => enable_rr,
																 input(86 downto 71) => pcPlusOneOut_e,
																 input(70 downto 69) => pcMux_crtl_e,
																 input(68 downto 53)	=> regA,
																 input(52 downto 37)	=> regB,
																 input(36 downto 35)	=> rf_dataIn_mux_e,
																 input(34)  			=> carryEnable_e,
																 input(33)   			=> zeroEnable_e,
																 input(32 downto 17)	=> signExt_e,
																 input(16)				=> alu_a_muxCrtl_e,
																 input(15 downto 14)	=> alu_b_muxCrtl_e,
																 input(13)	 			=> r7_enable_e,
																 input(12)  			=> memWrite_en_e,
																 input(11)  			=> beq_pc_crtl_e,
																 input(10)				=> rf_wren_mux_e,
																 input(9)		 		=> rf_wren_e,
																 input(8)  				=> counter_mux_e,
																 input(7) 				=> mem_mux_e,
																 input(6 downto 4)		=> rf_dataIn_sel_e,
																 input(3 downto 2)   	=> alu_crtl_e,
																 input(1 downto 0)		=> op2in_e, 
																 output(86 downto 71) 	=> pcPlusOneOut_m,
																 output(70 downto 69)	=> pcMux_crtl_m,
																 output(68 downto 53)	=> regA,
																 output(52 downto 37)	=> regB,
																 output(36 downto 35)	=> rf_dataIn_mux_m,
																 output(34)  			=> carryEnable_m,
																 output(33)   			=> zeroEnable_m,
																 output(32 downto 17)   => signExt_m,
																 output(16)				=> alu_a_muxCrtl_m,
																 output(15 downto 14)	=> alu_b_muxCrtl_m,
																 output(13)	 			=> r7_enable_m,
																 output(12)  			=> memWrite_en_m,
																 output(11)  			=> beq_pc_crtl_m,
																 output(10)				=> rf_wren_mux_m,
																 output(9)		 		=> rf_wren_m,
																 output(8)  			=> counter_mux_m,
																 output(7) 				=> mem_mux_m,
																 output(6 downto 4)			=> rf_dataIn_sel_m,
																 output(3 downto 2)   		=> alu_crtl_m,
																 output(1 downto 0)		 	=> op2in_m);

counter_reset <= (not (rf_dataIn_sel_m(0)) ) and (not (rf_dataIn_sel_m(1)) ) and (not (rf_dataIn_sel_m(2)));
																 
executed : execute port map ( clock => clock,
							 reset => reset,
							counter_reset => counter_reset,
							counter_ctrl => counter_mux_m,
							rr_ex_reg(15 downto 0) => pcPlusOneOut_m,
							rr_ex_reg(31 downto 16) => regA,
							rr_ex_reg(63 downto 48) => signExt_m,
							rr_ex_reg(47 downto 32) => regB,
							rr_ex_reg(65 downto 64) => alu_crtl_m,
							rr_ex_reg(67 downto 66) => op2in_m,
							rr_ex_reg(68) => carryEnable_m,
							rr_ex_reg(69) => zeroEnable_m,
							rr_ex_reg(70) => alu_a_muxCrtl_m,
							rr_ex_reg(72 downto 71) => alu_b_muxCrtl_m,
							rr_ex_reg(74 downto 73) => pcMux_crtl_m,
							rr_ex_reg(76 downto 75) => rf_dataIn_mux_m,
							rr_ex_reg(77) => r7_enable_m,
							rr_ex_reg(78) => memWrite_en_m,
							rr_ex_reg(79) => beq_pc_crtl_m,--
							rr_ex_reg(80) => rf_wren_mux_m,
							rr_ex_reg(81) => rf_wren_m,
							rr_ex_reg(82) => mem_mux_m,
							rr_ex_reg(85 downto 83) => rf_dataIn_sel_m,
							rr_ex_reg(86) => counter_mux_m,---
							ex_mem_reg => exe_out); 

EX_MEM : registers generic map(N => 109) port map (clock => clock , reset => reset , enable => enable_ex,
											input => exe_out ,
											output => ex_reg_out);

memory : mem_access port map (	clock => clock,
							  	reset => reset,
							  	ex_mem_reg2(15 downto 0) => ex_reg_out(15 downto 0),
							  	ex_mem_reg2(31 downto 16) => ex_reg_out(31 downto 16),
								ex_mem_reg2(47 downto 32) => ex_reg_out(47 downto 32),
								ex_mem_reg2(63 downto 48) => ex_reg_out(63 downto 48),
								ex_mem_reg2(79 downto 64) => ex_reg_out(79 downto 64),
								ex_mem_reg2(95 downto 80) => ex_reg_out(95 downto 80),
								ex_mem_reg2(97 downto 96) => ex_reg_out(97 downto 96),
								ex_mem_reg2(98) => ex_reg_out(104),--data_mem_mux
								ex_mem_reg2(99) => ex_reg_out(101),-- memWrite_en
								ex_mem_reg2(100) => ex_reg_out(100),--r7_enable 
								ex_mem_reg2(101) => ex_reg_out(102), -- rf_wren_mux
								ex_mem_reg2(102) => ex_reg_out(103),--rf_wren
								ex_mem_reg2(105 downto 103) => ex_reg_out(107 downto 105), -- rf_dataIn_sel
								ex_mem_reg2(107 downto 106) => ex_reg_out(99 downto 98),--rf_dataIn_mux
								ex_mem_reg2(108) => ex_reg_out(108),
								mem_wb_reg => mem_wb_in);

MEM_WB : registers generic map(N => 89) port map (	clock => clock, reset => reset,enable => enable_mem,
											input => mem_wb_in,
											output => mem_wb_out);

writes : writeBack port map (pc_mux_out => mem_wb_out(15 downto 0),
								alu_out => mem_wb_out(63 downto 48),
								rf_dataIn_mux_crtl => mem_wb_out(81 downto 80),
								signExtender =>	mem_wb_out(79 downto 64),
								pcPlusOne => mem_wb_out(31 downto 16),
								rfDataInSel => mem_wb_out(84 downto 82),
								rfDataInsel_out => rfDataInsel_out_w,
								counterMuxOut => mem_wb_out(85),
								rf_wren_mux_crtl => mem_wb_out(86),
								rf_wren => mem_wb_out(87),
								r7_enable => mem_wb_out(88),
								r7_enable_out => r7_enable_out_w,
								regWrite => regWrite_w,
								DataIn => DataIn_w,
								pcIn => pcIn_w,
								memData_Out => mem_wb_out(47 downto 32));

end mic;
