library std ;
use std.standard.all ;

library ieee;
use ieee.std_logic_1164.all;

package mem_components is
		
	component mem_access is
		port	(	
				clock	:in STD_LOGIC;
		 		reset	:in STD_LOGIC;
				mem_wb_reg : out std_logic_vector(79 downto 0);
				ex_mem_reg2 : in std_logic_vector(100 downto 0)				
		);
	end component;

	component memory IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		rden		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
	END component;

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
