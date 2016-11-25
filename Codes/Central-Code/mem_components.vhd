library std ;
use std.standard.all ;

library ieee;
use ieee.std_logic_1164.all;

package mem_components is

	COMPONENT data_memory IS
		PORT
		(
			address		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			clock		: IN STD_LOGIC  := '1';
			data		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			wren		: IN STD_LOGIC ;
			q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
		);
	END COMPONENT;

	component mux2 is 
	generic (n : integer);
	port( in0,in1 : in std_logic_vector(n downto 0); 
	      sel : in std_logic; 
	      output : out std_logic_vector(n downto 0));
	end component;

	component mux3 is 
	generic (n : integer);
	port( in0,in1,in2 : in std_logic_vector(n downto 0); 
	      sel : in std_logic_vector(1 downto 0); 
	      output: out std_logic_vector(n downto 0));
	end component;

end package;
