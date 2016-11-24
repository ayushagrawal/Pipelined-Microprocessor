library ieee;
use ieee.std_logic_1164.all;

library work; 
use work.decodeComponents.all;

entity multiple is 
	port (counter_enable  : in std_logic;
			clock : in std_logic;
			bit8 : in std_logic_vector(7 downto 0);
			counter_out : out std_logic_vector(2 downto 0);
			mux_out : out std_logic);
end entity;

architecture form of multiple is
		signal count_out : std_logic_vector(2 downto 0);
begin

	counter_init : counter port map(clock => clock, cnt_en => counter_enable, q => count_out);
	counter_out <= count_out;
	process(count_out,bit8)
	variable Nmux_out : std_logic;
	begin
		Nmux_out := '0';
		if(count_out = "000") then
			Nmux_out := bit8(0);
		elsif(count_out = "001") then
			Nmux_out := bit8(1);
		elsif(count_out = "010") then
			Nmux_out := bit8(2);
		elsif(count_out = "011") then
			Nmux_out := bit8(3);
		elsif(count_out = "100") then
			Nmux_out := bit8(4);
		elsif(count_out = "101") then
			Nmux_out := bit8(5);
		elsif(count_out = "110") then
			Nmux_out := bit8(6);
		elsif(count_out = "111") then
			Nmux_out := bit8(7);
		end if;
		mux_out <= Nmux_out;
	end process;
end form;