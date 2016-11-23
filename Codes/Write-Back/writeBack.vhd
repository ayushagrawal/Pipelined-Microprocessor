library ieee;
use ieee.std_logic_1164.all;

entity writeBack is
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
	
end entity;

architecture WB of writeBack is
begin

	process(rf_dataIn_mux_crtl,rf_wren_mux_crtl,pcPlusOne,memData_out,alu_out,counterMuxOut,rf_wren,pc_mux_out,rfDataInsel,r7_enable,signExtender)
	begin
		if(rf_dataIn_mux_crtl = "00") then
			DataIn <= pcPlusOne;
		elsif(rf_dataIn_mux_crtl = "01") then
			DataIn <= memData_out;
		elsif(rf_dataIn_mux_crtl = "10") then
			DataIn <= alu_out;
		else
			DataIn <= signExtender;
		end if;
		pcIn <= pc_mux_out;
		rfDataInsel_out <= rfDataInsel;
		r7_enable_out <= r7_enable;
		if(rf_wren_mux_crtl = '1') then
			regWrite <= counterMuxOut;
		else
			regWrite <= rf_wren;
		end if;
	end process;

end WB;