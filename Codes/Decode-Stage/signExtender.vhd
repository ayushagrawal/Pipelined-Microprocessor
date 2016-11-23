library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library std; 
use std.standard.all;

entity signExtender is 
	port (input  : in std_logic_vector(8 downto 0);
			opcode : in std_logic_vector(3 downto 0);
			output : out std_logic_vector(15 downto 0));
end entity;

architecture form of signExtender is
	
begin
process(input,opcode)
begin
	
	if(opcode = "0001" or opcode = "0100" or opcode = "0101" or opcode = "1100") then
		output(5 downto 0) <= input(5 downto 0);
		output(15 downto 6) <= (others => input(5));
	elsif(opcode = "0011") then
		output(8 downto 0)  <= input(8 downto 0);
		output(15 downto 9) <= "0000000";
	else
		output(8 downto 0)  <= input(8 downto 0);
		output(15 downto 9) <= (others => input(8));
	end if;
end process;
end form;