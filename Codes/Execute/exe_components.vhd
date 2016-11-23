library std ;
use std.standard.all ;

library ieee;
use ieee.std_logic_1164.all;

package exe_components is

	component execute is
	port	(	
				clock	:in STD_LOGIC;
		 		reset	:in STD_LOGIC;
				counter_reset : in std_logic;
				rr_ex_reg : in std_logic_vector(72 downto 0);
				ex_mem_reg : out std_logic_vector(95 downto 0);
				carry_flag,zero_flag : out std_logic;
				counter_ctrl : in std_logic;				
		);
	end component;

	component adder IS
	PORT
	(
		data0x		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		data1x		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (16 DOWNTO 0); 
		zero_flag	: OUT STD_LOGIC 
	);
	END component;
	
	component alu is
	port ( 	ra , rb : in std_logic_vector(15 downto 0);			 
		rc : out std_logic_vector(15 downto 0);					
		alu_ctrl : in std_logic_vector(1 downto 0);				
		op_2in 	 : in std_logic_vector(1 downto 0);				
		enable_carry : in std_logic;							
		enable_zero : in std_logic;								
		clock : in std_logic ;
		reset : in std_logic;						
		carry_flag : out std_logic;
		zero_flag : out std_logic 
		);
	end component;

	component counter IS
	PORT
	(
		aclr		: IN STD_LOGIC ;
		clock		: IN STD_LOGIC ;
		cnt_en		: IN STD_LOGIC ;
		q			: OUT STD_LOGIC_VECTOR (2 DOWNTO 0)
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
	
	component nand_logic is 
	port ( ra, rb : in std_logic_vector(15 downto 0);
	       rc : out std_logic_vector(15 downto 0);
	       zero_flag : out std_logic 
	     );
	end component;

	component register_1bit is
		port(dataIn: in std_logic;
			  enable: in std_logic;
			  dataOut: out std_logic;
			  clock: in std_logic;
			  reset: in std_logic);
	end component;

	component subtractor is
	port ( 	ra , rb : in std_logic_vector(15 downto 0);	
			rc : out std_logic_vector(15 downto 0);
		zero_flag : out std_logic 
		);
	end component;

end package;
