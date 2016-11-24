library ieee;
use ieee.std_logic_1164.all;

library work;
use work.components.all;

entity microprocessor is
	port(clock : in std_logic;
		  reset : in std_logic);
end entity;
		  
architecture mic of microprocessor is
	signal input_of,  output_if  : std_logic_vector(31 downto 0);
	signal input_id,  output_id  : std_logic_vector(downto 0);
	signal input_rr,  output_rr  : std_logic_vector(downto 0);
	signal input_ex,  output_ex  : std_logic_vector(downto 0);
	signal input_mem, output_mem : std_logic_vector(downto 0);
	signal pcIn : std_logic_vector(15 downto 0);
		
	
	signal ex_reg_out,exe_out : std_logic_vector(108 downto 0) ;
	signal mem_wb_out,mem_wb_in : std_logic_vector(88 downto 0);
	signal rfDataInsel_out_w : std_logic_vector(2 downto 0);
	signal r7_enable_out_w : std_logic;
	signal regWrite_w : std_logic;
	signal DataIn_w : std_logic_vector(15 downto 0);  
	signal pcIn_w : std_logic_vector(15 downto 0);
	signal enable_if,enable_id,enable_rr,enable_ex,enable_mem,counter_reset: std_logic;

begin

	IFetch : inst_fetch port map(clock => clock, reset => reset, pcIn => pcIn, pc_reg => '1',if_id_reg => input_ir);
	
	IF_ID  : registers generic map(N => 32)  port map(clock => clock, reset => reset, enable => enable_IF,  input => input_ir,  output => output_ir);
	ID_RR  : registers generic map(N => 61)  port map(clock => clock, reset => reset, enable => enable_id,  input => input_id,  output => output_id);
	RR_EX  : registers generic map(N => 87)  port map(clock => clock, reset => reset, enable => enable_rr,  input => input_rr,  output => output_rr);
	EX_MEM : registers generic map(N => 109) port map(clock => clock, reset => reset, enable => enable_ex,  input => input_ex,  output => output_ex);
	MEM_WB : registers generic map(N => 89)  port map(clock => clock, reset => reset, enable => enable_mem, input => input_mem, output => outptu_mem);

	
	enable_id <= '1';
	enable_if <= '1';
	
	
	
	
	Decoded: decode port map(	clock	     		=> clock,
										instruction  	=> output_ir(31 downto 16),
   									pcPlusOneIn  	=> output_ir(15 downto 0),
										signExt      	=> input_id(60 downto 45),
										pcPlusOneOut 	=> input_id(44 downto 29),
										A_sel		 		=> input_id(28 downto 26),
										B_sel		 		=> input_id(25 downto 23),
										rf_dataIn_sel	=> input_id(22 downto 20),
										alu_b_muxCrtl	=> input_id(19 downto 18),
										alu_crtl     	=> input_id(17 downto 16),
										pcMux_crtl	 	=> input_id(15 downto 14),
										op2in 	     	=> input_id(13 downto 12),
										rf_dataIn_mux	=> input_id(11 downto 10),
										carryEnable  	=> input_id(9),
										zeroEnable   	=> input_id(8),
										r7_enable		=> input_id(7),
										rf_wren			=> input_id(6),
										beq_pc_crtl  	=> input_id(5),
										rf_wren_mux  	=> input_id(4),
										memWrite_en  	=> input_id(3),
										mem_mux			=> input_id(2),
										counter_mux  	=> input_id(1),
										alu_a_muxCrtl	=> input_id(0));
	
	
																	
	RF : registerRead port map(clock						=> clock,
										reset						=> reset,
										r7_enableTo_RF 		=> r7_enable_out_w,						-- From Write Back Stage
										pc_in						=> pcIn_w,								-- From WB
										regWrite					=> regWrite_w,							-- From WB
										dataIn					=> DataIn_w,							-- From WB
										dataIn_sel_actual  	=> rfDataInsel_out_w,					-- From WB
										pcPlusOnein 			=> output_id(44 downto 29),
										pcMux_crtlin			=> output_id(15 downto 14),
										A_selin					=> output_id(28 downto 26),
										B_selin					=> output_id(25 downto 23),
										rf_dataIn_muxin		=> output_id(11 downto 10),
										carryEnablein  		=> output_id(9),
										zeroEnablein   		=> output_id(8),
										signExtin      		=> output_id(60 downto 45),
										alu_a_muxCrtlin		=> output_id(0),
										alu_b_muxCrtlin		=> output_id(19 downto 18),
										r7_enablein	 			=> output_id(7),
										memWrite_enin  		=> output_id(3),
										beq_pc_crtlin  		=> output_id(5),
										rf_wren_muxin  		=> output_id(4),
										rf_wrenin		 		=> output_id(6),
										counter_muxin  		=> output_id(1),
										mem_muxin		 		=> output_id(2),
										rf_dataIn_selin		=> output_id(22 downto 20),
										alu_crtlin     		=> output_id(17 downto 16),
										op2inin			 		=> output_id(13 downto 12),
										
										pcPlusOneOut 			=> input_rr(86 downto 71),
										pcMux_crtlout	 		=> input_rr(11 downto 10),
										regA			 			=> input_rr(54 downto 39),
										regB			 			=> input_rr(38 downto 23),
										rf_dataIn_muxout		=> input_rr(13 downto 12),
										carryEnableout  		=> input_rr(0),
										zeroEnableout   		=> input_rr(1),
										signExtout      		=> input_rr(70 downto 55),
										alu_a_muxCrtlout		=> input_rr(9),
										alu_b_muxCrtlout		=> input_rr(19 downto 18),
										r7_enableout	 		=> input_rr(2),
										memWrite_enout  		=> input_rr(6),
										beq_pc_crtlout  		=> input_rr(8),
										rf_wren_muxout  		=> input_rr(4),
										rf_wrenout		 		=> input_rr(3),
										counter_muxout  		=> input_rr(7),
										mem_muxout		 		=> input_rr(5),
										rf_dataIn_selout		=> input_rr(22 downto 20),
										alu_crtlout     		=> input_rr(17 downto 16),
										op2inout			 		=> input_rr(15 downto 14));
	

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
