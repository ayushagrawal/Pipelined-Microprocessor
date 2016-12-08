library ieee;
use ieee.std_logic_1164.all;

package components is
	
	component CLOCK_DIVIDER is
	    port(
		reset   :   in std_logic;
		clk :   in std_logic;
		half_clk    :   out std_logic
		);
	end component;

	component Decode is 
		port (instruction  : in std_logic_vector(15 downto 0);
				clock			 : in std_logic;
				NOP_in		 : in std_logic;
				pc_in			 : in std_logic_vector(15 downto 0);
				pc_out		 : out std_logic_vector(15 downto 0);
				pcPlusOneIn  : in std_logic_vector(15 downto 0);
				pcPlusOneOut : out std_logic_vector(15 downto 0);
				pcMux_crtl	 : out std_logic;
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
				NOP			 : out std_logic;
				use_B			 : out std_logic;
				rf_dataIn_sel: out std_logic_vector(2 downto 0);
				alu_crtl     : out std_logic_vector(1 downto 0);
				op2in			 : out std_logic_vector(1 downto 0);
				pcRegMux_crtl: out std_logic);
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
				pcRegMux_crtl    : out std_logic;
				pcRegMux_crtl_in : in std_logic;
				rf_wren_mux_crtl : in std_logic;
				rf_wren			: in std_logic;
				r7_enable		: in std_logic;
				NOP_in			: in std_logic;
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
				pcMux_crtlin	 		: in std_logic;
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
				pcRegMux_crtl_in		: in std_logic;
				conditional_in			: in std_logic;
				NOP_in					: in std_logic;
				pcPlusOneOut 			: out std_logic_vector(15 downto 0);
				pcMux_crtlout	 		: out std_logic;
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
				op2inout			 		: out std_logic_vector(1 downto 0);
				pcRegMux_crtl        : out std_logic;
				conditional_out		: out std_logic;
				NOP_out					: out std_logic);
				
	end component;
	
	component inst_fetch is
		port(	
				clock	:in std_logic;
				clock_mem : in std_logic;
				reset	:in std_logic;
				pcIn : in std_logic_vector(15 downto 0);
				pc : out std_logic_vector(15 downto 0);
				pc_reg : in std_logic;
				pcRegMux_crtl : in std_logic;
				NOP_in	 : in std_logic;
				if_id_reg : out std_logic_vector(32 downto 0)				
			);
	end component;
	
	component execute is
		port	(	
					clock	:in STD_LOGIC;
					reset	:in STD_LOGIC;
					counter_reset : in std_logic;
					beq_mux_ctrl : in std_logic;
					pcPlusOneIn : in std_logic_vector(15 downto 0);
					regA : in std_logic_vector(15 downto 0);
					regB : in std_logic_vector(15 downto 0);
					signExtend : in std_logic_vector(15 downto 0);
					counter_ctrl : in std_logic;
					A_mux_sel : in std_logic;
					B_mux_sel : in std_logic_vector(1 downto 0);
					alu_ctrl : in std_logic_vector(1 downto 0);
					op2in : in std_logic_vector(1 downto 0);
					carryEnable : in std_logic;			
					zeroEnable : in std_logic;
					rf_dataIn_mux : in std_logic_vector(1 downto 0);
					r7_enable : in std_logic;
					memWrite_en : in std_logic;
					rf_wren_mux : in std_logic;
					mem_mux : in std_logic;
					rf_dataIn_sel : in std_logic_vector(2 downto 0);
					pc_mux_ctrl : in std_logic;
					rf_wren_out : in std_logic;
					pcRegMux_crtl_in: in std_logic;
					conditional	: in std_logic;
					NOP_in			: in std_logic;
										
					pcPlusOneOut : out std_logic_vector(15 downto 0);
					regA_out : out std_logic_vector(15 downto 0);
					regB_out : out std_logic_vector(15 downto 0); 
					ALUresult_out : out std_logic_vector(15 downto 0);	
					signExtendOut : out std_logic_vector(15 downto 0);		
					rf_dataIn_mux_out : out std_logic_vector(1 downto 0);
					r7_enable_out : out std_logic;
					memWrite_en_out : out std_logic;
					rf_wren_mux_out : out std_logic;
					mem_mux_out : out std_logic;
					pc_mux_ctrl_out : out std_logic;
					rf_wren_out_out : out std_logic;
					rf_dataIn_sel_out : out std_logic_vector(2 downto 0);
					pcALUresult : out std_logic_vector(15 downto 0);
					counter_mux_out : out std_logic;
					pcRegMux_crtl: out std_logic;
					NOP_out			: out std_logic);
	end component;
	
	component mem_access is
		port	(	
					clock	:in STD_LOGIC;
					clock_mem : in std_logic;
					reset	:in STD_LOGIC;
					pcAlu_result : in std_logic_vector(15 downto 0);	
					pcPlusOne : in std_logic_vector(15 downto 0);
					regA : in std_logic_vector(15 downto 0);
					ALUresult : in std_logic_vector(15 downto 0);	
					regB : in std_logic_vector(15 downto 0);
					signExtend : in std_logic_vector(15 downto 0);	
					pcMux_ctrl : in std_logic;
					mem_mux_ctrl : in std_logic;
					memWrite_en : in std_logic;
					rf_dataIn_mux_ctrl : in std_logic_vector(1 downto 0);
					rfDataInSel : in std_logic_vector(2 downto 0);	
					counterMuxIn : in std_logic;
					rf_wren_mux_ctrl : in std_logic;
					rf_wren : in std_logic;
					r7_enable : in std_logic;
					pcRegMux_crtl_in : in std_logic;
					NOP_in		: in std_logic;
		
					pc_mux_out : out std_logic_vector(15 downto 0);	
					pcPlusOne_out : out std_logic_vector(15 downto 0);		
					mem_data_out : out std_logic_vector(15 downto 0);	
					ALUresult_out : out std_logic_vector(15 downto 0);
					signExtend_out : out std_logic_vector(15 downto 0);
					rf_dataIn_mux_ctrl_out : out std_logic_vector(1 downto 0);
					rfDataInSel_out : out std_logic_vector(2 downto 0);
					counterMuxOut : out std_logic;
					rf_wren_mux_ctrl_out : out std_logic;
					rf_wren_out : out std_logic;
					r7_enable_out : out std_logic;
					pcRegMux_crtl : out std_logic;
					NOP_out		: out std_logic);
	end component;
	
	component registers is
		generic(N : integer);
		port(input: in std_logic_vector((N-1) downto 0);
			  enable: in std_logic;
			  output: out std_logic_vector((N-1) downto 0);
			  clock: in std_logic;
			  reset: in std_logic);
	end component;
	
	component mux4 is 
		generic (n : integer);
		port( in0,in1,in2,in3 : in std_logic_vector(n downto 0); 
				sel : in std_logic_vector(1 downto 0); 
				output: out std_logic_vector(n downto 0));
	end component;
	
	component forwardingUnit is
		port(exe_alu		: in std_logic_vector(15 downto 0);
			  exe_pc1		: in std_logic_vector(15 downto 0);
			  exe_se			: in std_logic_vector(15 downto 0);
			  
			  mem_alu		: in std_logic_vector(15 downto 0);
			  mem_pc1		: in std_logic_vector(15 downto 0);
			  mem_se			: in std_logic_vector(15 downto 0);
			  mem_mem		: in std_logic_vector(15 downto 0);
			  
			  wb_data		: in std_logic_vector(15 downto 0);
			  
			  data_mux_ex	: in std_logic_vector(1 downto 0);
			  data_mux_mem	: in std_logic_vector(1 downto 0);
			  
			  reg_A_mux		: in std_logic_vector(1 downto 0);
			  reg_B_mux		: in std_logic_vector(1 downto 0);
			  
			  regA_actual	: in std_logic_vector(15 downto 0);
			  regB_actual	: in std_logic_vector(15 downto 0);
			  
			  dataHazardFlag : in std_logic;
			  
			  stall_in		: in std_logic;
			  stall_out		: out std_logic;
		  
			  regA			: out std_logic_vector(15 downto 0);
			  regB			: out std_logic_vector(15 downto 0);
			  bubble_en		: out std_logic);
		
	end component;

	component hazardDetectionUnit is
		port(regSel_ex_in			: in  std_logic_vector(2 downto 0);
			  regSel_mem_in		: in  std_logic_vector(2 downto 0);
			  regSel_wb_in			: in  std_logic_vector(2 downto 0);
			  regSel_A				: in  std_logic_vector(2 downto 0);
			  regSel_B				: in  std_logic_vector(2 downto 0);
			  NOP_ex					: in 	std_logic;
			  NOP_mem				: in  std_logic;
		     NOP_wb					: in  std_logic;
			  use_B					: in  std_logic;
		     dataHazardFlag		: out std_logic;
			  RR_A_mux_sel			: out std_logic_vector(1 downto 0);
			  RR_B_mux_sel			: out std_logic_vector(1 downto 0));
		
	end component;
	
	component mux2 is 
		generic (n : integer);
		port( in0,in1 : in std_logic_vector(n downto 0); 
				sel : in std_logic; 
				output : out std_logic_vector(n downto 0));
	end component;
	
end package;
