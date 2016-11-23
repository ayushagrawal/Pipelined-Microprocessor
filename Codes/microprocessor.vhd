









library ieee;
use ieee.std_logic_1164.all;

library work;
use work.components.all;

entity microprocessor is
	port(clock : in std_logic;
		  reset : in std_logic);
		  
architecture mic of microprocessor is
	signal pcIn;
	
begin

	IFetch : inst_fetch port map(clock => clock, reset => reset, pcIn => pcIn, pc_reg => '1',if_id_reg(15 downto 0) => pcPlusOne, if_id_reg(31 downto 16) => instruction);
	IF_ID  : registers generic map() port map(input(31 downto 16) => instruction, input(15 downto 0) => pcPlusOne,clock => clock, reset => reset, enable =>, output(31 downto 16) => instructionR, output(15 downto 0) => pcPlusOneR);
	
	Decoded: decode port map(instruction  => instructionR,
									clock			 => clock,
									pcPlusOneIn  => pcPlusOneR,
									pcPlusOneOut => pcPlusOneOut_d,
									pcMux_crtl	 => pcMux_crtl_d,
									A_sel			 => A_sel_d,
									B_sel			 => B_sel_d,
									rf_dataIn_mux=> rf_dataIn_mux_d,
									carryEnable  =>
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
									rf_dataIn_sel: out std_logic_vector(2 downto 0);
									alu_crtl     : out std_logic_vector(1 downto 0);
									op2in			 : out std_logic_vector(1 downto 0));
end mic;