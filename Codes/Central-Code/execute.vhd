-- BEQ MUX CRTL LOGIC REMAINING -- rr_ex_reg(79)
-- rr_ex_Reg : 15 to 0 : pc+1 						*86
-- 				31 to 16 : alu_a_mux input 0
-- 				63 to 48 : alu_a_mx input 1 and alu_b_mux input 0
--   			47 to 32 : alu_b_mux input 1
--				65 to 64 : alu control signals
-- 				67 to 66 : opcode last 2 bits
--				68 : enable carry
-- 				69 : enable zero
-- 				70 : alu A sel
-- 				72 to 71 : alu B sel

-- ex_mem_reg : 15 to 0 : pc_alu_result
--				31 to 16 : pc+1
--				47 to 32 : alu_a_mux input 0
--				63 to 48 : ALU output
--				79 to 64 : alu_b_mux input 1
--				95 to 80 : sign_extend/LH output
				
library ieee;
use ieee.std_logic_1164.all;

library work;
use work.exe_components.all;

entity execute is
	port	(	
				clock	:in STD_LOGIC;
		 		reset	:in STD_LOGIC;
				counter_reset : in std_logic;
				beq_mux_ctrl : in std_logic;
				pcPlusOneIn : in std_logic_vector(15 downto 0);
				regA : in std_logic_vector(15 downto 0);
				regB : in std_logic_vector(15 downto 0);
				signExtend : in std_logic_vector(15 downto 0);
				counter_ctrl : in std_logic;
				A_mux_sel : in std_logic;
				B_mux_sel : in std_logic_vector(1 downto 0);
				alu_ctrl : in std_logic_vector(1 downto 0);
				op2in : in std_logic_vector(1 downto 0);
				carryEnable : in std_logic;			
				zeroEnable : in std_logic;
				rf_dataIn_mux : in std_logic_vector(1 downto 0);
				r7_enable : in std_logic;
				memWrite_en : in std_logic;
				rf_wren_mux : in std_logic;
				mem_mux : in std_logic;
				rf_dataIn_sel : in std_logic_vector(2 downto 0);
				pc_mux_ctrl : in std_logic;
				rf_wren_out : in std_logic;
				pcRegMux_crtl_in: in std_logic;
									
				pcPlusOneOut : out std_logic_vector(15 downto 0);
				regA_out : out std_logic_vector(15 downto 0);
				regB_out : out std_logic_vector(15 downto 0); 
				ALUresult_out : out std_logic_vector(15 downto 0);	
				signExtendOut : out std_logic_vector(15 downto 0);		
				rf_dataIn_mux_out : out std_logic_vector(1 downto 0);
				r7_enable_out : out std_logic;
				memWrite_en_out : out std_logic;
				rf_wren_mux_out : out std_logic;
				mem_mux_out : out std_logic;
				pc_mux_ctrl_out : out std_logic;
				rf_wren_out_out : out std_logic;
				rf_dataIn_sel_out : out std_logic_vector(2 downto 0);
				pcALUresult : out std_logic_vector(15 downto 0);
				counter_mux_out : out std_logic;
				pcRegMux_crtl: out std_logic);
end entity;

architecture Behave of execute is
	
	signal temp : std_logic_vector(16 downto 0);
	signal alu_a_in,alu_b_in : std_logic_vector(15 downto 0);
	signal cntr_16 : std_logic_vector(15 downto 0);	
	signal carry_signal,zero_signal_in,zero_signal_out : std_logic;

begin

	rf_wren_out_out <= rf_wren_out and ((not op2in(0) and op2in(1) and carry_signal) or ((not op2in(1)) and op2in(0) and zero_signal_in) or (not (op2in(0) xor op2in(1))));
	add2 : adder port map (data0x => pcPlusOneIn,data1x => signExtend,result => temp);
	pcPlusOneOut <= pcPlusOneIn;
	pcALUresult <= temp(15 downto 0);
	regA_out <= regA;
	regB_out <= regB;

counter2 : counter port map (aclr => counter_reset,clock => clock,cnt_en =>counter_ctrl,q => cntr_16(2 downto 0));
cntr_16(15 downto 3) <= (others => '0');

counter_mux_out <= counter_ctrl;

alu_a_mux : mux2 generic map (n => 15) port map ( 	in0 =>regA,
													in1 =>signExtend,
													sel =>A_mux_sel,
													output => alu_a_in);

alu_b_mux : mux3 generic map (n => 15) port map ( 	in0 =>signExtend,
													in1 =>regB,
													in2 =>cntr_16,
													sel =>B_mux_sel,
													output =>alu_b_in);

alu1 : alu port map ( ra => alu_a_in,
					  rb => alu_b_in,
					  rc => ALUresult_out,
					  alu_ctrl => alu_ctrl,
					  op_2in => op2in,
					  enable_carry =>	carryEnable,
					  enable_zero => zeroEnable,
					  clock => clock,
					  reset => reset,
					  carry_flag => carry_signal,
					  zero_flag_in => zero_signal_in,
					  zero_flag_out => zero_signal_out);

signExtendOut <= signExtend;
rf_dataIn_mux_out <=rf_dataIn_mux;
r7_enable_out <=r7_enable;
memWrite_en_out <= memWrite_en;
rf_wren_mux_out <= rf_wren_mux;
mem_mux_out <= mem_mux;
rf_dataIn_sel_out <= rf_dataIn_sel;

process(beq_mux_ctrl,pc_mux_ctrl,zero_signal_out,pcRegMux_crtl_in)
	variable var_pc_mux_ctrl_out, var_pcRegMux_crtl_in : std_logic;
	begin
		if (beq_mux_ctrl = '1') then
			if (zero_signal_out = '1') then
				var_pc_mux_ctrl_out := '1';
				var_pcRegMux_crtl_in := '1';
			else
				var_pc_mux_ctrl_out := '1';			-- Don't Care
				var_pcRegMux_crtl_in := '0';
			end if ;
		else
				var_pc_mux_ctrl_out := pc_mux_ctrl;
				var_pcRegMux_crtl_in := pcRegMux_crtl_in;
		end if;
	pc_mux_ctrl_out <= var_pc_mux_ctrl_out;
	pcRegMux_crtl <= var_pcRegMux_crtl_in;
	end process;
end Behave;

