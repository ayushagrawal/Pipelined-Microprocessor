-- ex_mem_reg2 : 				*108
--			
--				
--				
--					99		 : mem_wr_en
-- mem_wb_reg : 15 to 0 : pc_mux_out
-- 				31 to 16 : pc+1
--				47 to 32 : data_mem_out
--				63 to 48 : mem_addr
--				79 to 64 : sign_extend/LH output

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.mem_components.all;

entity mem_access is
	port	(	
				clock	:in STD_LOGIC;
		 		reset	:in STD_LOGIC;
				pcAlu_result : in std_logic_vector(15 downto 0);	
				pcPlusOne : in std_logic_vector(15 downto 0);
				regA : in std_logic_vector(15 downto 0);
				ALUresult : in std_logic_vector(15 downto 0);	
				regB : in std_logic_vector(15 downto 0);
				signExtend : in std_logic_vector(15 downto 0);	
				pcMux_ctrl : in std_logic_vector(1 downto 0);
				mem_mux_ctrl : in std_logic;
				memWrite_en : in std_logic;
				rf_dataIn_mux_ctrl : in std_logic;
				rfDataInSel : in std_logic_vector(1 downto 0);	
				counterMuxIn : in std_logic;
				rf_wren_mux_ctrl : in std_logic;
				rf_wren : in std_logic;
				r7_enable : in std_logic;
	
				pc_mux_out : out std_logic_vector(15 downto 0);	
				pcPlusOne_out : out std_logic_vector(15 downto 0);		
				mem_data_out : out std_logic_vector(15 downto 0);	
				mem_addr : out std_logic_vector(15 downto 0);
				signExtend_out : out std_logic_vector(15 downto 0);
				rf_dataIn_mux_ctrl_out : out std_logic;
				rfDataInSel_out : out std_logic_vector(1 downto 0);
				counterMuxOut : out std_logic;
				rf_wren_mux_ctrl_out : out std_logic;
				rf_wren_out : out std_logic;
				r7_enable_out : out std_logic
		);
end entity;

architecture Behave of mem_access is

signal pc_out : std_logic_vector(15 downto 0);
signal mem_mux_out : std_logic_vector(15 downto 0);
signal mem_out : std_logic_vector(15 downto 0);

begin 

pc_mux : mux3 generic map (n => 15) port map (	in0 => regB,
												in1 => pcAlu_result,
												in2 => pcPlusOne,
												sel => pcMux_ctrl,
												output => pc_out);
						
pc_mux_out <= pc_out;
pcPlusOne_out <= pcPlusOne;

data_mem_mux : mux2 generic map(n => 15) port map ( in0 => regA,
													in1 => regB,
													sel => mem_mux_ctrl,
													output => mem_mux_out);

data_mem : memory port map(	address => ALUresult,
								 data =>  mem_mux_out, 
								 wren => memWrite_en, 
								 rden => '1',
								 q => mem_out,
								 clock => clock);

mem_data_out <= mem_out;
mem_addr <= ALUresult;
signExtend_out <= signExtend;
rf_dataIn_mux_ctrl_out <= rf_dataIn_mux_ctrl;
rfDataInSel_out <= rfDataInSel;
counterMuxOut <= counterMuxIn ;
rf_wren_mux_ctrl_out <= rf_wren_mux_ctrl;
rf_wren_out <= rf_wren;
r7_enable_out <= r7_enable;
					 
end Behave;
