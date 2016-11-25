-- if_id_reg : 15 to 0 : pc +1
--				31 to 16 :  inst_mem output

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.if_components.all;

entity inst_fetch is
	port(	
			clock	:in std_logic;
		 	reset	:in std_logic;
			pcIn : in std_logic_vector(15 downto 0);
			pc_reg : in std_logic;
			if_id_reg : out std_logic_vector(31 downto 0)				
		);
end entity;	

architecture Behave of inst_fetch is 

	signal pc_out : std_logic_vector(15 downto 0);
	signal mem_out : std_logic_vector(15 downto 0);
	signal temp : std_logic_vector(16 downto 0);
	signal mem_address : std_logic_vector(15 downto 0);
	
begin

PC : register16 port map(dataIn => pcIn,
					enable => pc_reg,
				 	dataOut => pc_out ,
				 	clock => clock,
				 	reset => reset);

mem_address <= pc_out;
inst_memory : instruction_memory port map(	address => mem_address,
								 data => x"0000", 
								 wren => '0', 
								 q => mem_out,
								 clock => clock);

add3 : adder port map (data0x => pc_out,data1x => (0 => '1' , 1 => '0' , 2 => '1' , others => '0'),result => temp);
if_id_reg(31 downto 16) <= mem_out;
if_id_reg(15 downto 0) <= temp(15 downto 0);

end Behave;
	
