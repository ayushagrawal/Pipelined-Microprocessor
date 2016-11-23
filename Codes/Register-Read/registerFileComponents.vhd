library std ;
use std.standard.all ;

library ieee;
use ieee.std_logic_1164.all;

package registerFileComponents is

	component mux2 is 
		generic (n : integer);
		port( in0,in1 : in std_logic_vector(n downto 0); 
				sel : in std_logic; 
				output : out std_logic_vector(n downto 0));
	end component;
	
	component mux8 is 
		generic (n : integer);
		port( in1,in2,in3,in4,in5,in6,in7,in0 : in std_logic_vector(n downto 0); 
				sel : in std_logic_vector(2 downto 0); 
				output : out std_logic_vector(n downto 0));
	end component;
	
	component register16 is
		port(	dataIn: in std_logic_vector(15 downto 0);
			  enable: in std_logic;
			  dataOut: out std_logic_vector(15 downto 0);
			  clock: in std_logic;
			  reset: in std_logic);
	end component;
	
	component registerFile is
	port(dataOut_A: out std_logic_vector(15 downto 0);
		  dataOut_B: out std_logic_vector(15 downto 0);
		  clock_rb : in std_logic;
		  regSel_A : in std_logic_vector(2 downto 0);
		  regSel_B : in std_logic_vector(2 downto 0);
		  dataIn	  : in std_logic_vector(15 downto 0);
		  dataInsel: in std_logic_vector(2 downto 0);
		  reset	  : in std_logic;
		  regWrite : in std_logic;
		  pc_in    : in std_logic_vector(15 downto 0);
		  r7_select: in std_logic);
	end component;
	
	component decoderRF is
		port(input: in std_logic_vector(2 downto 0);
			  output: out std_logic_vector(7 downto 0));
	end component;
	
end registerFileComponents;
