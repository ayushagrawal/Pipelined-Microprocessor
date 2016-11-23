library std ;
use std.standard.all ;

library ieee;
use ieee.std_logic_1164.all;

package if_components is

	component inst_fetch is
	port(	
			clock	:in std_logic;
		 	reset	:in std_logic;
			pcIn : in std_logic_vector(15 downto 0);
			pc_reg : in std_logic;
			if_id_reg : out std_logic_vector(31 downto 0)					
		);
	end component;

	component register16 is
		port(dataIn: in std_logic_vector(15 downto 0);
			  enable: in std_logic;
			  dataOut: out std_logic_vector(15 downto 0);
			  clock: in std_logic;
			  reset: in std_logic);
	end component;

	component adder IS
	PORT
	(
		data0x		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		data1x		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (16 DOWNTO 0); -- 16th bit = carry_flag
		zero_flag	: OUT STD_LOGIC 
	);
	END component;

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

end package;
