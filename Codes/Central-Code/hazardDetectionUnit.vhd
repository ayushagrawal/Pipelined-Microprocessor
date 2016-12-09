library ieee;
use ieee.std_logic_1164.all;

entity hazardDetectionUnit is
	port(regSel_ex_in			: in  std_logic_vector(2 downto 0);
		  regSel_mem_in		: in  std_logic_vector(2 downto 0);
		  regSel_wb_in			: in  std_logic_vector(2 downto 0);
		  regSel_A				: in  std_logic_vector(2 downto 0);
		  regSel_B				: in  std_logic_vector(2 downto 0);
		  NOP_ex					: in 	std_logic;
		  NOP_mem				: in  std_logic;
		  NOP_wb					: in  std_logic;
		  use_B					: in  std_logic;
		  counter_en			: in  std_logic;
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
	
	process(regSel_A,regSel_B,regSel_wb_in,regSel_mem_in,regSel_ex_in,NOP_ex,NOP_mem,NOP_wb,use_B,counter_en)
		variable dataHazardFlag1,dataHazardFlag2 : std_logic;
	begin														--
		if((regSel_A = regSel_ex_in) and NOP_ex = '1' and counter_en = '0') then				--
			RR_A_mux_sel <= "01";												-- Priority is taken into consideration
			dataHazardFlag1 := '1';												--
		elsif((regSel_A = regSel_mem_in) and NOP_mem = '1' and counter_en = '0') then								--
			RR_A_mux_sel <= "10";
			dataHazardFlag1 := '1';
		elsif((regSel_A = regSel_wb_in) and NOP_wb = '1' and counter_en = '0') then
			RR_A_mux_sel <= "11";
			dataHazardFlag1 := '1';
		else
			RR_A_mux_sel <= "00";
			dataHazardFlag1 := '0';
		end if;
		
		if(use_B = '1') then
			if((regSel_B = regSel_ex_in) and NOP_ex = '1') then
				RR_B_mux_sel <= "01";
				dataHazardFlag2 := '1';
			elsif((regSel_B = regSel_mem_in) and NOP_mem = '1') then
				RR_B_mux_sel <= "10";
				dataHazardFlag2 := '1';
			elsif((regSel_B = regSel_wb_in) and NOP_wb = '1') then
				RR_B_mux_sel <= "11";
				dataHazardFlag2 := '1';
			else
				RR_B_mux_sel <= "00";
				dataHazardFlag2 := '0';
			end if;
		else
			RR_B_mux_sel <= "00";
			dataHazardFlag2 := '0';
		end if;
		if((dataHazardFlag1 = '1') or (dataHazardFlag2 = '1')) then
			dataHazardFlag <= '1';
		else
			dataHazardFlag <= '0';
		end if;
	end process;
	
end HDU;