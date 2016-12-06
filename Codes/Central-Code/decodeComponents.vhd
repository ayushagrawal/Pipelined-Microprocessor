library ieee;
use ieee.std_logic_1164.all;

package decodeComponents is

	component multiple is 
		port (counter_enable  : in std_logic;
				clock : in std_logic;
				bit8 : in std_logic_vector(7 downto 0);
				counter_out : out std_logic_vector(2 downto 0);
				mux_out : out std_logic);
	end component;
	
	component signExtender is 
		port (input  : in std_logic_vector(8 downto 0);
				opcode : in std_logic_vector(3 downto 0);
				output : out std_logic_vector(15 downto 0));
	end component;
	
	component counter IS
		PORT
		(
			clock		: IN STD_LOGIC ;
			aclr		: IN STD_LOGIC ;
			cnt_en		: IN STD_LOGIC ;
			q		: OUT STD_LOGIC_VECTOR (2 DOWNTO 0)
		);
	END component;
	
	component Decode is 
		port (instruction  : in std_logic_vector(15 downto 0);
				clock			 : in std_logic;
				pcPlusOneIn  : in std_logic_vector(15 downto 0);
				pcPlusOneOut : out std_logic_vector(15 downto 0);
				pcMux_crtl	 : out std_logic_vector(1 downto 0);
				A_sel			 : out std_logic_vector(2 downto 0);
				B_sel			 : out std_logic_vector(2 downto 0);
				rf_dataIn_mux: out std_logic_vector(1 downto 0);
				carryEnable  : out std_logic;
				zeroEnable   : out std_logic;
				signExt      : out std_logic_vector(15 downto 0);
				alu_a_muxCrtl: out std_logic;
				alu_b_muxCrtl: out std_logic_vector(1 downto 0);
				r7_enable	 : out std_logic;
				memWrite_en  : out std_logic;
				beq_pc_crtl  : out std_logic;
				rf_wren_mux  : out std_logic;
				rf_wren		 : out std_logic;
				counter_mux  : out std_logic;
				mem_mux		 : out std_logic;
				conditional	 : out std_logic;
				rf_dataIn_sel: out std_logic_vector(2 downto 0);
				alu_crtl     : out std_logic_vector(1 downto 0);
				op2in			 : out std_logic_vector(1 downto 0));
	end component;

end package;