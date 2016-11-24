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
				rr_ex_reg : in std_logic_vector(85 downto 0);
				ex_mem_reg : out std_logic_vector(107 downto 0);
				carry_flag,zero_flag : out std_logic;
				counter_ctrl : in std_logic;				
		);
end entity;

architecture Behave of execute is
	
	signal temp : std_logic_vector(16 downto 0);
	signal alu_a_in,alu_b_in,alu_output : std_logic_vector(15 downto 0);
	signal cntr_16 : std_logic_vector(15 downto 0);	

begin
	
add2 : adder port map (data0x => rr_ex_reg(15 downto 0),data1x => ex_mem_reg(15 downto 0),result => temp);
ex_mem_reg(15 downto 0) <= temp(15 downto 0);
ex_mem_reg(31 downto 16) <= rr_ex_reg(15 downto 0);
ex_mem_reg(47 downto 32) <= rr_ex_reg(31 downto 16);

counter2 : counter_2 port map (aclr => counter_reset,clock => clock,cnt_en =>counter_ctrl,q => cntr_16(2 downto 0));
cntr_16(15 downto 3) <= (others => '0');

alu_a_mux : mux2 generic map (n => 15) port map ( 	in0 =>rr_ex_reg(31 downto 16),
													in1 =>rr_ex_reg(63 downto 48),
													sel =>rr_ex_reg(70),
													output => alu_a_in )

alu_b_mux : mux3 generic map (n => 15) port map ( 	in0 =>rr_ex_reg(63 downto 48),
													in1 =>rr_ex_reg(47 downto 32),
													in2 =>cntr_16,
													sel =>rr_ex_reg(72 downto 71),
													output =>alu_b_in)

alu1 : alu port map ( ra => alu_a_in,
					  rb => alu_b_in,
					  rc => ex_mem_reg(63 downto 48),
					  alu_ctrl => rr_ex_reg(65 downto 64),
					  op_2in => rr_ex_reg(67 downto 66),
					  enable_carry =>	rr_ex_reg(68),
					  enable_zero => rr_ex_reg(69)
					  clock => clock,
					  reset => reset,
					  carry_flag => carry_flag,
					  zero_flag => zero_flag)

ex_mem_reg(79 downto 64) <= rr_ex_reg(47 downto 32);
ex_mem_reg(95 downto 80) <= rr_ex_reg(63 downto 48);
ex_mem_reg(97 downto 96) <= rr_ex_reg(74 downto 73);
ex_mem_reg(99 downto 98) <= rr_ex_reg(76 downto 75);
ex_mem_reg(100)			<= rr_ex_reg(77);
ex_mem_reg(101) 		<= rr_ex_reg(78);
ex_mem_reg(102)			<=	rr_ex_reg(80) ;
ex_mem_reg(103)			<= rr_ex_reg(81) ;
ex_mem_reg(104)			<= rr_ex_reg(82) ;
ex_mem_reg(107 downto 105)	<= rr_ex_reg(85 downto 83);											
end Behave;

