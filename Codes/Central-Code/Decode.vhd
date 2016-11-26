library ieee;
use ieee.std_logic_1164.all;

library work;
use work.decodeComponents.all;

entity Decode is 
	port (instruction  : in std_logic_vector(15 downto 0);
			clock			 : in std_logic;
			pcPlusOneIn  : in std_logic_vector(15 downto 0);
			pcPlusOneOut : out std_logic_vector(15 downto 0);
			pcMux_crtl	 : out std_logic;
			pcRegMux_crtl: out std_logic;
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
end entity;

architecture arch of Decode is
		signal counter_enable : std_logic;
		signal counter_out    : std_logic_vector(2 downto 0);
begin
	signExtend : signExtender port map(input => instruction(8 downto 0),output => signExt, opcode => instruction(15 downto 12));
	count : multiple port map(counter_enable => counter_enable, clock => clock, bit8 => instruction(7 downto 0), counter_out => counter_out, mux_out => counter_mux);
process(instruction,pcPlusOneIn,counter_out)
	variable Nalu_crtl : std_logic_vector(1 downto 0);
	variable NzeroEnable : std_logic;
	variable NcarryEnable : std_logic;
	variable Nalu_a_mux_crtl : std_logic;
	variable Nalu_b_mux_crtl : std_logic_vector(1 downto 0);
	variable NmemWrite_en : std_logic;
	variable Nbeq_pc_crtl : std_logic;
	variable Nrf_wren_mux : std_logic;
	variable Nrf_dataIn_sel : std_logic_vector(2 downto 0);
	variable Nrf_wren			: std_logic;
	variable Nrf_dataIn_mux : std_logic_vector(1 downto 0);
	variable Nmem_mux			: std_logic;
	variable NpcMux_crtl		: std_logic;
	variable NB_sel			: std_logic_vector(2 downto 0);
	variable Nr7_enable		: std_logic;
	variable NpcRegMux_crtl	: std_logic;
begin
	Nalu_crtl := "00";
	NzeroEnable := '0';
	NcarryEnable := '0';
	Nalu_a_mux_crtl := '0';
	Nalu_b_mux_crtl := "00";
	NmemWrite_en := '0';
	Nbeq_pc_crtl := '0';
	Nrf_wren_mux := '0';
	Nrf_dataIn_sel := "000";
	Nrf_wren			:= '0';
	Nrf_dataIn_mux := "00";
	Nmem_mux			:= '0';
	NpcMux_crtl		:= '0';
	NB_sel			:= "000";
	Nr7_enable		:= '0';
	if(instruction(15 downto 12) = "0000") then						--	ADD
		Nalu_crtl 		 := "00";					-- Adding
		NzeroEnable 	 := '1';
		NcarryEnable 	 := '1';
		Nalu_a_mux_crtl := '0';
		Nalu_b_mux_crtl := "01";
		NmemWrite_en 	 := '0';
		Nbeq_pc_crtl	:= '0';
		Nrf_wren_mux		:= '0';					-- Default from writeEnable
		Nrf_wren			:= '1';						-- Writing back to the register file is enabled
		Nrf_dataIn_sel	:= instruction(5 downto 3);	-- From C
		Nrf_dataIn_mux := "10";						-- ALU_OUT
		Nmem_mux			:= '0';						-- Don't Care
		NpcMux_crtl    := '1';						-- Don't Care
		NpcRegMux_crtl := '0';
		NB_sel := instruction(8 downto 6);
		Nr7_enable := not(instruction(5) and instruction(4) and instruction(3));
		
	elsif(instruction(15 downto 12) = "0001") then					-- ADI
		Nalu_crtl 		 := "00";					-- Adding
		NzeroEnable 	 := '1';
		NcarryEnable 	 := '1';
		Nalu_a_mux_crtl := '0';
		Nalu_b_mux_crtl := "00";					-- Value from the Immediate data
		NmemWrite_en 	 := '0';
		Nbeq_pc_crtl	:= '0';
		Nrf_wren_mux		:= '0';					-- Default from writeEnable
		Nrf_wren			:= '1';						-- Writing back to the register file is enabled
		Nrf_dataIn_sel	:= instruction(8 downto 6);	-- From B
		Nrf_dataIn_mux := "10";						-- ALU_OUT
		Nmem_mux			:= '0';						-- Don't Care
		NpcMux_crtl    := '1';						-- Don't Care
		NpcRegMux_crtl := '0';
		NB_sel := instruction(8 downto 6);
		Nr7_enable := not(instruction(8) and instruction(7) and instruction(6));
		
	elsif(instruction(15 downto 12) = "0010") then					-- NDU
		Nalu_crtl 		 := "01";					-- Nand
		NzeroEnable 	 := '1';
		NcarryEnable 	 := '1';
		Nalu_a_mux_crtl := '0';
		Nalu_b_mux_crtl := "01";					-- Register B(from register file)
		NmemWrite_en 	 := '0';
		Nbeq_pc_crtl	:= '0';
		Nrf_wren_mux		:= '0';					-- Default from writeEnable
		Nrf_wren			:= '1';						-- Writing back to the register file is enabled
		Nrf_dataIn_sel	:= instruction(5 downto 3);	-- From C
		Nrf_dataIn_mux := "10";						-- ALU_OUT
		Nmem_mux			:= '0';						-- Don't Care
		NpcMux_crtl    := '1';						-- Don't Care
		NpcRegMux_crtl := '0';
		NB_sel := instruction(8 downto 6);
		Nr7_enable := not(instruction(5) and instruction(4) and instruction(3));
		
	elsif(instruction(15 downto 12) = "0011") then					-- LHI
		Nalu_crtl 		 := "01";					-- Don't Care
		NzeroEnable 	 := '0';
		NcarryEnable 	 := '0';
		Nalu_a_mux_crtl := '0';
		Nalu_b_mux_crtl := "01";					-- Don't Care
		NmemWrite_en 	 := '0';						
		Nbeq_pc_crtl	:= '0';
		Nrf_wren_mux		:= '0';					-- Default from writeEnable
		Nrf_wren			:= '1';						-- Writing back to the register file is enabled
		Nrf_dataIn_sel	:= instruction(11 downto 9);	-- From A
		Nrf_dataIn_mux := "11";						-- Immediate Out
		Nmem_mux			:= '0';						-- Don't Care
		NpcMux_crtl    := '1';						-- Don't Care
		NpcRegMux_crtl := '0';
		NB_sel := instruction(8 downto 6);
		Nr7_enable := not(instruction(11) and instruction(10) and instruction(9));
		
	elsif(instruction(15 downto 12) = "0100") then					-- LW
		Nalu_crtl 		 := "00";					-- Add
		NzeroEnable 	 := '0';
		NcarryEnable 	 := '0';
		Nalu_a_mux_crtl := '1';
		Nalu_b_mux_crtl := "01";					-- Register B
		NmemWrite_en 	 := '0';						
		Nbeq_pc_crtl	:= '0';
		Nrf_wren_mux		:= '0';					-- Default from writeEnable
		Nrf_wren			:= '1';						-- Writing back to the register file is enabled
		Nrf_dataIn_sel	:= instruction(11 downto 9);	-- From A
		Nrf_dataIn_mux := "01";						-- Immediate Out
		Nmem_mux			:= '0';						-- Don't Care
		NpcMux_crtl    := '1';						-- Don't Care
		NpcRegMux_crtl := '0';
		NB_sel := instruction(8 downto 6);
		Nr7_enable := not(instruction(11) and instruction(10) and instruction(9));
		
	elsif(instruction(15 downto 12) = "0101") then					-- SW
		Nalu_crtl 		 := "00";					-- Add
		NzeroEnable 	 := '0';
		NcarryEnable 	 := '0';
		Nalu_a_mux_crtl := '1';
		Nalu_b_mux_crtl := "01";					-- Register B
		NmemWrite_en 	 := '1';						-- Enabled Writing on memory
		Nbeq_pc_crtl	:= '0';
		Nrf_wren_mux		:= '0';					-- Default from writeEnable
		Nrf_wren			:= '0';						
		Nrf_dataIn_sel	:= instruction(11 downto 9);	-- Don't care
		Nrf_dataIn_mux := "01";						-- Don't care
		Nmem_mux			:= '0';						-- Register A
		NpcMux_crtl    := '1';						-- Don't Care
		NpcRegMux_crtl := '0';
		NB_sel := instruction(8 downto 6);
		Nr7_enable := '1';
		
	elsif(instruction(15 downto 12) = "1100") then					-- BEQ
		Nalu_crtl 		 := "10";					-- Compare
		NzeroEnable 	 := '0';
		NcarryEnable 	 := '0';
		Nalu_a_mux_crtl := '0';						-- Register A
		Nalu_b_mux_crtl := "01";					-- Register B
		NmemWrite_en 	 := '0';						
		Nbeq_pc_crtl	:= '1';
		Nrf_wren_mux		:= '0';					
		Nrf_wren			:= '0';						
		Nrf_dataIn_sel	:= instruction(11 downto 9);	-- Don't Care
		Nrf_dataIn_mux := "01";						-- Don't Care
		Nmem_mux			:= '0';						-- Don't Care
		NpcMux_crtl    := '1';						-- Don't Care
		NpcRegMux_crtl := '0';
		NB_sel := instruction(8 downto 6);
		Nr7_enable := '1';
		
	elsif(instruction(15 downto 12) = "1000") then					-- JAL
		Nalu_crtl 		 := "10";					-- Don't Care
		NzeroEnable 	 := '0';
		NcarryEnable 	 := '0';
		Nalu_a_mux_crtl := '0';						-- Register A
		Nalu_b_mux_crtl := "01";					-- Register B
		NmemWrite_en 	 := '0';						
		Nbeq_pc_crtl	:= '0';
		Nrf_wren_mux		:= '0';					
		Nrf_wren			:= '1';						
		Nrf_dataIn_sel	:= instruction(11 downto 9);	-- Register A
		Nrf_dataIn_mux := "00";						-- PC + 1
		Nmem_mux			:= '0';						-- Don't Care
		NpcMux_crtl    := '1';
		NpcRegMux_crtl := '1';
		NB_sel := instruction(8 downto 6);
		Nr7_enable := not(instruction(11) and instruction(10) and instruction(9));
		
	elsif(instruction(15 downto 12) = "1001") then					-- JLR
		Nalu_crtl 		 := "10";					-- Don't Care
		NzeroEnable 	 := '0';
		NcarryEnable 	 := '0';
		Nalu_a_mux_crtl := '0';						-- Don't Care
		Nalu_b_mux_crtl := "01";					-- Don't Care
		NmemWrite_en 	 := '0';						
		Nbeq_pc_crtl	:= '0';
		Nrf_wren_mux		:= '0';					
		Nrf_wren			:= '1';						
		Nrf_dataIn_sel	:= instruction(11 downto 9);	-- Register A
		Nrf_dataIn_mux := "00";						-- PC + 1
		Nmem_mux			:= '0';						-- Don't Care
		NpcMux_crtl    := '0';						-- Register B
		NpcRegMux_crtl := '1';
		NB_sel := instruction(8 downto 6);
		Nr7_enable := not(instruction(11) and instruction(10) and instruction(9));
		
	elsif(instruction(15 downto 12) = "0110") then					-- LM
		Nalu_crtl 		 := "01";					-- Add
		NzeroEnable 	 := '0';
		NcarryEnable 	 := '0';
		Nalu_a_mux_crtl := '0';						-- Register A
		Nalu_b_mux_crtl := "10";					-- Counter
		NmemWrite_en 	 := '0';
		Nbeq_pc_crtl	:= '0';
		Nrf_wren_mux		:= '1';					-- Enabling rf_wren by counter-mux
		Nrf_wren			:= '0';					
		Nrf_dataIn_sel	:= counter_out;			-- Counter out
		Nrf_dataIn_mux := "01";						-- M[Register A]
		Nmem_mux			:= '0';						-- Don't Care
		NpcMux_crtl    := '1';						-- Don't Care
		NpcRegMux_crtl := '0';
		NB_sel := instruction(8 downto 6);
		Nr7_enable := not(counter_out(2) and counter_out(1) and counter_out(0));
		
	elsif(instruction(15 downto 12) = "0111") then					-- SM
		Nalu_crtl 		 := "01";					-- Add
		NzeroEnable 	 := '0';
		NcarryEnable 	 := '0';
		Nalu_a_mux_crtl := '0';						-- Register A
		Nalu_b_mux_crtl := "10";					-- Counter
		NmemWrite_en 	 := '1';						-- Memory write enable
		Nbeq_pc_crtl	:= '0';
		Nrf_wren_mux		:= '0';					
		Nrf_wren			:= '0';						
		Nrf_dataIn_sel	:= instruction(11 downto 9);	-- Don't Care
		Nrf_dataIn_mux := "01";						-- Don't Care
		Nmem_mux			:= '1';						-- Register B
		NpcMux_crtl    := '1';						-- Don't Care
		NpcRegMux_crtl := '0';
		NB_sel			:= counter_out;
		Nr7_enable 		:= '1';
		
	end if;
	alu_crtl 		 	<= Nalu_crtl;
	zeroEnable 	 		<= NzeroEnable;
	carryEnable 	 	<= NcarryEnable;
	alu_a_muxCrtl 		<= Nalu_a_mux_crtl;
	alu_b_muxCrtl 		<= Nalu_b_mux_crtl;
	memWrite_en 	 	<= NmemWrite_en;
	beq_pc_crtl 	 	<= Nbeq_pc_crtl;
	rf_wren_mux 		<= Nrf_wren_mux;
	rf_dataIn_sel  	<= Nrf_dataIn_sel;
	rf_wren			 	<= Nrf_wren;
	rf_dataIn_mux  	<= Nrf_dataIn_mux;
	mem_mux			 	<= Nmem_mux;
	pcMux_crtl		 	<= NpcMux_crtl;
	B_sel			 		<= NB_sel;
	r7_enable			<= Nr7_enable;
	pcRegMux_crtl 	   <= NpcRegMux_crtl;
	
	A_sel <= instruction(11 downto 9);
	pcPlusOneOut <= pcPlusOneIn;
	op2in <= instruction(1 downto 0);
end process;
	
end arch;