library ieee;
use ieee.std_logic_1164.all;

package components is
	
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
				rf_dataIn_sel: out std_logic_vector(2 downto 0);
				alu_crtl     : out std_logic_vector(1 downto 0);
				op2in			 : out std_logic_vector(1 downto 0));
	end component;

	component writeBack is
		port (pc_mux_out : in std_logic_vector(15 downto 0);
				alu_out	  : in std_logic_vector(15 downto 0);
				rf_dataIn_mux_crtl : in std_logic_vector(1 downto 0);
				signExtender	: in std_logic_vector(15 downto 0);
				pcPlusOne		: in std_logic_vector(15 downto 0);
				rfDataInsel		: in std_logic_vector(2 downto 0);
				rfDataInsel_out: out std_logic_vector(2 downto 0);
				counterMuxOut	: in std_logic;
				rf_wren_mux_crtl : in std_logic;
				rf_wren			: in std_logic;
				r7_enable		: in std_logic;
				r7_enable_out  : out std_logic;
				regWrite			: out std_logic;
				DataIn			: out std_logic_vector(15 downto 0);
				pcIn				: out std_logic_vector(15 downto 0);
				memData_out		: in std_logic_vector(15 downto 0));
		
	end component;
	
	component registerRead is
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
				
	end component;
	
end package;