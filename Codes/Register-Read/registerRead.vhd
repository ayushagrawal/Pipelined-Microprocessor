library ieee;
use ieee.std_logic_1164.all;

library work;
use work.registerFileComponents.all;

entity registerRead is
	port (clock						: in std_logic;
			reset						: in std_logic;
			r7_enableTo_RF 		: in std_logic;
			pc_in			  			: in std_logic_vector(15 downto 0);
			regWrite		  			: in std_logic;
			dataIn			  		: in std_logic_vector(15 downto 0);
			dataIn_sel_actual	  	: in std_logic_vector(2 downto 0);
			pcPlusOnein 			: in std_logic_vector(15 downto 0);
			pcMux_crtlin	 		: in std_logic_vector(1 downto 0);
			A_selin			 		: in std_logic_vector(2 downto 0);
			B_selin			 		: in std_logic_vector(2 downto 0);
			rf_dataIn_muxin		: in std_logic_vector(1 downto 0);
			carryEnablein  		: in std_logic;
			zeroEnablein   		: in std_logic;
			signExtin      		: in std_logic_vector(15 downto 0);
			alu_a_muxCrtlin		: in std_logic;
			alu_b_muxCrtlin		: in std_logic_vector(1 downto 0);
			r7_enablein	 			: in std_logic;
			memWrite_enin  		: in std_logic;
			beq_pc_crtlin  		: in std_logic;
			rf_wren_muxin  		: in std_logic;
			rf_wrenin		 		: in std_logic;
			counter_muxin  		: in std_logic;
			mem_muxin		 		: in std_logic;
			rf_dataIn_selin		: in std_logic_vector(2 downto 0);
			alu_crtlin     		: in std_logic_vector(1 downto 0);
			op2inin			 		: in std_logic_vector(1 downto 0);
			pcPlusOneOut 			: out std_logic_vector(15 downto 0);
			pcMux_crtlout	 		: out std_logic_vector(1 downto 0);
			regA			 			: out std_logic_vector(15 downto 0);
			regB			 			: out std_logic_vector(15 downto 0);
			rf_dataIn_muxout		: out std_logic_vector(1 downto 0);
			carryEnableout  		: out std_logic;
			zeroEnableout   		: out std_logic;
			signExtout      		: out std_logic_vector(15 downto 0);
			alu_a_muxCrtlout		: out std_logic;
			alu_b_muxCrtlout		: out std_logic_vector(1 downto 0);
			r7_enableout	 		: out std_logic;
			memWrite_enout  		: out std_logic;
			beq_pc_crtlout  		: out std_logic;
			rf_wren_muxout  		: out std_logic;
			rf_wrenout		 		: out std_logic;
			counter_muxout  		: out std_logic;
			mem_muxout		 		: out std_logic;
			rf_dataIn_selout		: out std_logic_vector(2 downto 0);
			alu_crtlout     		: out std_logic_vector(1 downto 0);
			op2inout			 		: out std_logic_vector(1 downto 0));
			
end entity;

architecture RR of registerRead is

begin

	pcPlusOneOut <= pcPlusOnein;
	op2inout <= op2inin;
	alu_crtlout <= alu_crtlin;
	rf_dataIn_selout <= rf_dataIn_selin;
	mem_muxout <= mem_muxin;
	counter_muxout <= counter_muxin;		-- Used in write back stage
	rf_wrenout <= rf_wrenin;
	rf_wren_muxout <= rf_wren_muxin;
	beq_pc_crtlout <= beq_pc_crtlin;
	r7_enableout <=r7_enablein;
	alu_a_muxCrtlout <= alu_a_muxCrtlin;
	alu_b_muxCrtlout <= alu_b_muxCrtlin;
	signExtout <= signExtin;
	zeroEnableout <= zeroEnablein;
	carryEnableout <= carryEnablein;
	rf_dataIn_muxout <= rf_dataIn_muxin;
	pcMux_crtlout <= pcMux_crtlin;
	memWrite_enout <= memWrite_enin;
	
	RF : registerFile port map(dataOut_A => regA,
							  dataOut_B => regB,
							  clock_rb => clock,
							  regSel_A => A_selin,
							  regSel_B => B_selin,
							  dataIn  => dataIn,
							  dataInsel => dataIn_sel_actual,
							  reset	  => reset,
							  regWrite => regWrite,
							  pc_in    => pc_in,
							  r7_select => r7_enableTo_RF);

end RR;