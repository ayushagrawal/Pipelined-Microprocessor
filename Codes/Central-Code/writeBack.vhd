library ieee;
use ieee.std_logic_1164.all;

library work;
use work.components.all;

entity writeBack is
	port (pc_mux_out 				: in std_logic_vector(15 downto 0);
			alu_out	  				: in std_logic_vector(15 downto 0);
			memData_out		 		: in std_logic_vector(15 downto 0);
			rf_dataIn_mux_crtl 	: in std_logic_vector(1 downto 0);
			signExtender	 		: in std_logic_vector(15 downto 0);
			pcPlusOne	 	 		: in std_logic_vector(15 downto 0);
			rfDataInsel		 		: in std_logic_vector(2 downto 0);
			pcRegMux_crtl_in		: in std_logic;
			counterMuxOut	 		: in std_logic;
			rf_wren_mux_crtl		: in std_logic;
			rf_wren			 		: in std_logic;
			r7_enable		 		: in std_logic;
			NOP_in					: in std_logic;
			
			pcRegMux_crtl   		: out std_logic;
			r7_enable_out   		: out std_logic;
			regWrite			 		: out std_logic;
			DataIn			 		: out std_logic_vector(15 downto 0);
			pcIn				 		: out std_logic_vector(15 downto 0);
			rfDataInsel_out 		: out std_logic_vector(2 downto 0));
	 
end entity;

architecture WB of writeBack is
	signal dataOut : std_logic_vector(15 downto 0);
	signal pcMuxSel : std_logic;
	signal writeEn	 : std_logic;
begin
	
	pcMuxSel <= rfDataInsel(0) and rfDataInsel(1) and rfDataInsel(2);
	
	mux : mux2 generic map(n => 15) port map(in0 	=> pc_mux_out,
														  in1 	=> dataOut,
														  sel 	=> pcMuxSel,
														  output => pcIn);
														  
	dataMux : mux4 generic map(n => 15) port map(in0	 => pcPlusOne,
																in1 	 => memData_out,
																in2	 => alu_out,
																in3	 => signExtender,
																sel	 => rf_dataIn_mux_crtl,
																output => dataOut);
	DataIn <= dataOut;
	rfDataInsel_out <= rfDataInsel;	
	r7_enable_out <= r7_enable and NOP_in;
	pcRegMux_crtl <= (pcRegMux_crtl_in or pcMuxSel) and NOP_in;
	
	writeMux : mux2 generic map(n => 0) port map(in0(0)	 => rf_wren,
																in1(0)	 => counterMuxOut,
																sel		 => rf_wren_mux_crtl,
																output(0) => writeEn);
	regWrite <= writeEn and NOP_in;

end WB;