library ieee;
use ieee.std_logic_1164.all;

entity hazardDetectionUnit is
	port(regSel_ex_in			: in  std_logic_vector(2 downto 0);
		  regSel_mem_in		: in  std_logic_vector(2 downto 0);
		  regSel_wb_in			: in  std_logic_vector(2 downto 0);
		  regSel_A				: in  std_logic_vector(2 downto 0);
		  regSel_B				: in  std_logic_vector(2 downto 0);
		  dataHazardFlag		: out std_logic;
		  RR_A_mux_sel			: out std_logic_vector(1 downto 0);
		  RR_B_mux_sel			: out std_logic_vector(1 downto 0));
	
end entity;

-- A/B MUX SPECS:
-- 00 = From Register File
-- 01 = From Execute
-- 10 = From Memory
-- 11 = From Write Back

architecture HDU of hazardDetectionUnit is
begin
	
	process(regSel_A,regSel_B,regSel_wb_in,regSel_mem_in,regSel_ex_in)
	begin														--
		if(regSel_A = regSel_ex_in) then				--
			RR_A_mux_sel <= "01";						-- Priority is taken into consideration
			dataHazardFlag <= '1';						--
		elsif(regSel_A = regSel_mem_in) then		--
			RR_A_mux_sel <= "10";
			dataHazardFlag <= '1';
		elsif(regSel_A = regSel_wb_in) then
			RR_A_mux_sel <= "11";
			dataHazardFlag <= '1';
		else
			RR_A_mux_sel <= "00";
			dataHazardFlag <= '0';
		end if;
		
		if(regSel_B = regSel_ex_in) then
			RR_B_mux_sel <= "01";
			dataHazardFlag <= '1';
		elsif(regSel_B = regSel_mem_in) then
			RR_B_mux_sel <= "10";
			dataHazardFlag <= '1';
		elsif(regSel_B = regSel_wb_in) then
			RR_B_mux_sel <= "11";
			dataHazardFlag <= '1';
		else
			RR_B_mux_sel <= "00";
			dataHazardFlag <= '0';
		end if;
	end process;
	
end HDU;