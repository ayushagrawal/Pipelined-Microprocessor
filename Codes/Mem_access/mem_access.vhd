-- ex_mem_reg2 : 15 to 0 : pc_alu_result
--					31 to 16 : pc+1
--					47 to 32 : reg_file_A
--					63 to 48 : ALU_result
--					79 to 64 : reg_file_B
--					95 to 80 : sign_extend/LH output
--					97 to 96 : pc_mux_sel
-- 					98 		 : data_mem_mux_sel
--					99		 : mem_wr_en
--					100 	 : mem_rd_en
-- mem_wb_reg : 15 to 0 : pc_mux_out
-- 				31 to 16 : pc+1
--				47 to 32 : data_mem_out
--				63 to 48 : mem_addr
--				79 to 64 : sign_extend/LH output

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.mem_components.all;

entity mem_access is
	port	(	
				clock	:in STD_LOGIC;
		 		reset	:in STD_LOGIC;
				mem_wb_reg : out std_logic_vector(79 downto 0);
				ex_mem_reg2 : in std_logic_vector(100 downto 0)				
		);
end entity;

architecture Behave of mem_access is

signal pc_mux_out : std_logic_vector(15 downto 0);
signal data_mem_mux_out : std_logic_vector(15 downto 0);
signal mem_data_out : std_logic_vector(15 downto 0);

begin 

pc_mux : mux3 generic map (n => 15) port map (	in0 =>ex_mem_reg2(79 downto 64),
												in1 =>ex_mem_reg2(15 downto 0),
												in2 =>ex_mem_reg2(31 downto 16),
												sel =>ex_mem_reg2(97 downto 96),
												output => pc_mux_out);
						
mem_wb_reg(15 downto 0) <= pc_mux_out;
mem_wb_reg(31 downto 16) <= ex_mem_reg2(31 downto 16);

data_mem_mux : mux2 generic map(n => 15) port map ( in0 => ex_mem_reg2(47 downto 32),
													in1 => ex_mem_reg2(79 downto 64),
													sel => ex_mem_reg2(98),
													output => data_mem_mux_out);

data_mem : memory port map(	address => ex_mem_reg2(63 downto 48),
								 data => data_mem_mux_out, 
								 wren => ex_mem_reg2(99), 
								 rden => ex_mem_reg2(100),
								 q => mem_data_out,
								 clock => clock);
mem_wb_reg(47 downto 32) <= mem_data_out;
mem_wb_reg(63 downto 48) <= ex_mem_reg2(63 downto 48);
mem_wb_reg(79 downto 64) <= ex_mem_reg2(95 downto 80);

end Behave;
