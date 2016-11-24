library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library std; 
use std.standard.all;

entity alu is
	port ( 	ra , rb : in std_logic_vector(15 downto 0);			-- input 
		rc : out std_logic_vector(15 downto 0);					-- output
		alu_ctrl : in std_logic_vector(1 downto 0);				-- operation to be performed
		op_2in 	 : in std_logic_vector(1 downto 0);				-- last two bits of opcode
		enable_carry : in std_logic;							-- enable carry register
		enable_zero : in std_logic;								-- enable zero register
		clock : in std_logic ;
		reset : in std_logic;						
		carry_flag : out std_logic;
		zero_flag : out std_logic 
		);
end entity;

architecture formulas of alu is
	
	component register_1bit is 
		port	( dataIn: in std_logic;
			  enable: in std_logic;
			  dataOut: out std_logic;
			  clock: in std_logic;
			  reset: in std_logic);
		end component;

	component adder IS
		PORT
			(
			data0x		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			data1x		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			result		: OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
			zero_flag	: OUT STD_LOGIC 
			);
	END component;
	
	component subtractor_16bit is
		port ( 	ra , rb : in std_logic_vector(15 downto 0);
			rc : out std_logic_vector(15 downto 0);	
			zero_flag : out std_logic 
			);
	end component;

	component nand_logic is
	       port ( ra, rb : in std_logic_vector(15 downto 0);
	       rc : out std_logic_vector(15 downto 0);
	       zero_flag : out std_logic 
	     );
	end component;
		
	signal add_out,sub_out,nand_out : std_logic_vector(16 downto 0);
	signal addc,addz,subz,nandz : std_logic;

	signal rc1 : std_logic_vector(15 downto 0);	
	signal carry_temp,zero_temp : std_logic;
	signal zero_flag1,carry_flag1  : std_logic;

begin
    add1 : adder port map (data0x =>ra,data1x => rb, result =>add_out, zero_flag =>addz);
    sub1 : subtractor_16bit port map (ra => ra, rb => rb, rc => sub_out, zero_flag => subz);
    nnd1 : nand_logic port map (ra => ra, rb => rb, rc => nand_out, zero_flag => nandz);
	
	zero_temp <= (addz and(not alu_ctrl(0))and(not alu_ctrl(1))) or (subz and(not alu_ctrl(1))and(alu_ctrl(0))) or (nandz and(not alu_ctrl(0))and(alu_ctrl(1)));

	carry_temp <= (adder_output(16))and(not alu_ctrl(0))and(not alu_ctrl(1));

	carry_flag <= carry_flag1;
	zero_flag <= zero_flag1;
	
	temp_carry_en <= enable_carry and((op2in(1) and (not op2in(0)) and carry_flag1) or ((not op2in(1)) and op2in(0) and zero_flag1) or (not(op2in(1) xor op2in(0))));
	
	temp_zero_en <= enable_zero and ((op2in(1) and (not op2in(0)) and carry_flag1) or ((not op2in(1)) and op2in(0) and zero_flag1) or (not(op2in(1) xor op2in(0)))); 
	
	reg1 : register_1bit port map (dataIn => carry_temp,enable => temp_carry_en ,dataOut => carry_flag1,clock => clock ,reset => reset);	
	reg2 : register_1bit port map (dataIn => zero_temp,enable => temp_zero_en, dataOut => zero_flag1,clock => clock, reset => reset);
	
	process(add_out,nand_out,alu_ctrl,op_2in)
	variable zero_var 	 : 	std_logic;
	variable output_var  : 	std_logic_vector(15 downto 0);

	begin
	output_var := x"0000";

	if (alu_ctrl = "00") then							  	-- add operations
		if ((op_2in = "00")or(op_2in = "01")or(op_2in = "10") then 
			output_var := add_out(15 downto 0) ;
		end if;
		
	elsif (alu_ctrl = "01") then							  -- NAND operations
		if ((op_2in = "00")or(op_2in = "01")or(op_2in = "10") then
			output_var := nand_out ;
		end if;	
	
	elsif (alu_ctrl = "10") then							  -- BEQ	
	end if;

	rc <= output_var ;
end process ;
end formulas ;
