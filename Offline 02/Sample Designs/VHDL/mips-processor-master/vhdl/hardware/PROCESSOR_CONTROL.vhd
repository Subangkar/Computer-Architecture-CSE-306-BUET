----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:06:27 09/30/2012 
-- Design Name: 
-- Module Name:    processor_control - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- "WORK" is the current library
library WORK;
use WORK.MIPS_CONSTANT_PKG.ALL;

entity PROCESSOR_CONTROL is
	Port ( 
		OPCode 			: in  STD_LOGIC_VECTOR (5 downto 0) := "111111";
		RegDst 			: out STD_LOGIC := '0';
		Jump 				: out STD_LOGIC := '0';
		Branch			: out STD_LOGIC := '0';
		MemRead 			: out STD_LOGIC := '0';
		MemtoReg 		: out STD_LOGIC := '0';
		ALUOp 			: out STD_LOGIC_VECTOR (1 downto 0):= "10";
		MemWrite 		: out STD_LOGIC := '0';
		ALUSrc 			: out STD_LOGIC := '0';
		RegWrite 		: out STD_LOGIC := '0'
	);
end PROCESSOR_CONTROL;

architecture Behavioral of processor_control is

begin

	PROCESSOR_CONTROL: process(OPCode) begin
		
			case OPCode is
				-- R-format instructions
				when OP_R =>
					RegDst 			<= '1';
					Jump 				<= '0';
					Branch 			<= '0';
					MemRead 			<= '0';
					MemtoReg 		<= '0';
					ALUOp 			<= ALU_OP_R;
					MemWrite 		<= '0';
					ALUSrc 			<= '0';
					RegWrite 		<= '1';
				
				-- J-format instructions
				when OP_J => 
					RegDst 			<= '0';
					Jump 				<= '1';
					Branch 			<= '0';
					MemRead 			<= '0';
					MemtoReg 		<= '0';
					ALUOp 			<= ALU_OP_R;
					MemWrite 		<= '0';
					ALUSrc 			<= '0';
					RegWrite 		<= '0';
				
				-- I-format load from memory
				when OP_I_LOAD =>
					RegDst 			<= '0';
					Jump 				<= '0';
					Branch 			<= '0';
					MemRead 			<= '1';
					MemtoReg 		<= '1';
					ALUOp 			<= ALU_OP_LS;
					MemWrite 		<= '0';
					ALUSrc 			<= '1';
					RegWrite 		<= '1';
				
				-- I-format store to memory
				when OP_I_STORE =>
					RegDst 			<= '0';
					Jump 				<= '0';
					Branch 			<= '0';
					MemRead 			<= '1';
					MemtoReg 		<= '0';
					ALUOp 			<= ALU_OP_LS;
					MemWrite 		<= '1';
					ALUSrc 			<= '1';
					RegWrite 		<= '0';
				
				-- I-format load imediate
				when OP_I_LI =>
					RegDst 			<= '0';
					Jump 				<= '0';
					Branch 			<= '0';
					MemRead 			<= '0';
					MemtoReg 		<= '0';
					ALUOp 			<= ALU_OP_LS;
					MemWrite 		<= '0';
					ALUSrc 			<= '1';
					RegWrite 		<= '1';
				
				-- I-format load imediate
				when OP_I_BEQ =>
					RegDst 			<= '0';
					Jump 				<= '0';
					Branch 			<= '1';
					MemRead 			<= '0';
					MemtoReg 		<= '0';
					ALUOp 			<= ALU_OP_BEQ;
					MemWrite 		<= '0';
					ALUSrc 			<= '0';
					RegWrite 		<= '0';
				
				when OP_I_NOP =>
					RegDst 			<= '0';
					Jump 				<= '0';
					Branch 			<= '0';
					MemRead 			<= '0';
					MemtoReg 		<= '0';
					ALUOp 			<= ALU_OP_LS;
					MemWrite 		<= '0';
					ALUSrc 			<= '0';
					RegWrite 		<= '0';
					
				when others =>
				RegDst 			<= '1';
					Jump 				<= '0';
					Branch 			<= '0';
					MemRead 			<= '0';
					MemtoReg 		<= '0';
					ALUOp 			<= ALU_OP_R;
					MemWrite 		<= '0';
					ALUSrc 			<= '0';
					RegWrite 		<= '0';
			end case;
	end process  processor_control;

end Behavioral;