library ieee;
use ieee.std_logic_1164.all;

library work;
use work.components.all;

entity forwardingUnit is
	port(exe_alu		: in std_logic_vector(15 downto 0);
		  exe_pc1		: in std_logic_vector(15 downto 0);
		  exe_se			: in std_logic_vector(15 downto 0);
		  
		  mem_alu		: in std_logic_vector(15 downto 0);
		  mem_pc1		: in std_logic_vector(15 downto 0);
		  mem_se			: in std_logic_vector(15 downto 0);
		  mem_mem		: in std_logic_vector(15 downto 0);
		  
		  wb_data		: in std_logic_vector(15 downto 0);
		  
		  data_mux_ex	: in std_logic_vector(1 downto 0);
		  data_mux_mem	: in std_logic_vector(1 downto 0);
		  
		  reg_A_mux		: in std_logic_vector(1 downto 0);
		  reg_B_mux		: in std_logic_vector(1 downto 0);
		  
		  regA_actual	: in std_logic_vector(15 downto 0);
		  regB_actual	: in std_logic_vector(15 downto 0);
		  
		  regA			: out std_logic_vector(15 downto 0);
		  regB			: out std_logic_vector(15 downto 0));
	
end entity;

architecture FU of forwardingUnit is
	signal exe_data,mem_data : std_logic_vector(15 downto 0);
begin

	mux_A	: mux4 generic map(n => 16) port map(in0 		=> regA_actual,
															 in1 		=> exe_data,
															 in2 		=> mem_data,
															 in3 		=> wb_data,
															 sel  		=> reg_A_mux,
															 output 		=> regA);
	
	mux_B	: mux4 generic map(n => 16) port map(in0 		=> regB_actual,
															 in1 		=> exe_data,
															 in2 		=> mem_data,
															 in3 		=> wb_data,
															 sel  		=> reg_B_mux,
															 output 		=> regB);
	
	process(exe_alu,exe_pc1,exe_se,mem_alu,mem_pc1,mem_se,mem_mem,data_mux_ex,data_mux_mem)
	begin
		if(data_mux_ex = "00") then
			exe_data <= exe_pc1;
		elsif(data_mux_ex = "10") then
			exe_data <= exe_alu;
		elsif(data_mux_ex = "11") then
			exe_data <= exe_se;
--		else															Elaboration needed later	
--			exe_data <= ;
		end if;
		
		if(data_mux_mem = "00") then
			mem_data <= mem_pc1;
		elsif(data_mux_mem = "10") then
			mem_data <= mem_alu;
		elsif(data_mux_mem = "11") then
			mem_data <= mem_se;
		else															
			mem_data <= mem_mem;
		end if;
	end process;
	
end FU;