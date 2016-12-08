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
		  
		  dataHazardFlag : in std_logic;
		  
		  clock			: in std_logic;
		  reset			: in std_logic;
		  
		  regA			: out std_logic_vector(15 downto 0);
		  regB			: out std_logic_vector(15 downto 0);
		  bubble_en		: out std_logic);
	
end entity;

architecture FU of forwardingUnit is
	signal exe_data,mem_data : std_logic_vector(15 downto 0);
	signal stall_in,stall_out : std_logic;
begin

	mux_A	: mux4 generic map(n => 15) port map(in0 		=> regA_actual,
															 in1 		=> exe_data,
															 in2 		=> mem_data,
															 in3 		=> wb_data,
															 sel  		=> reg_A_mux,
															 output 		=> regA);
	
	mux_B	: mux4 generic map(n => 15) port map(in0 		=> regB_actual,
															 in1 		=> exe_data,
															 in2 		=> mem_data,
															 in3 		=> wb_data,
															 sel  		=> reg_B_mux,
															 output 		=> regB);
	
	stall	: registers generic map(N => 1) port map(clock => clock ,reset => reset, enable => '1', input(0) => stall_out, output(0) => stall_in);
	
	process(exe_alu,exe_pc1,exe_se,mem_alu,mem_pc1,mem_se,mem_mem,data_mux_ex,data_mux_mem,dataHazardFlag,stall_in)
	variable Nbubble_en: std_logic;
	begin
		-- Default Values
		Nbubble_en := '0';
		if(data_mux_ex = "00") then
			exe_data <= exe_pc1;
			stall_out <= '0';
		elsif(data_mux_ex = "10") then
			exe_data <= exe_alu;
			stall_out <= '0';
		elsif(data_mux_ex = "11") then
			exe_data <= exe_se;
			stall_out <= '0';
		else															--Elaboration needed later	
			if(dataHazardFlag = '1') then
				Nbubble_en := '1';
				stall_out <= '1';
				if(stall_in = '1') then							-- Indicates that the pipelin has stalled for 1 cycle
					Nbubble_en := '0';
					exe_data <= mem_mem;
				else
					exe_data <= exe_alu;
				end if;
			else
				exe_data <= exe_alu;
				stall_out <= '0';
				Nbubble_en := '0';
			end if;
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
		
		bubble_en <= Nbubble_en;
	end process;
	
end FU;