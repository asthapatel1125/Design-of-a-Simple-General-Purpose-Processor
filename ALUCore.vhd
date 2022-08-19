LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;
USE ieee.STD_LOGIC_UNSIGNED.all;
USE ieee.NUMERIC_STD.all;

ENTITY ALUcore IS
PORT(A,B 	   : IN UNSIGNED(7 DOWNTO 0);-- 8 bit inputs from latches A and B
	 Clock      : IN STD_LOGIC; -- input clock signal
	 student_id : IN UNSIGNED(3 DOWNTO 0);--4 bit student ID from FSM
	 OP         : IN UNSIGNED(15 DOWNTO 0); --16-bit selector for Operation from Decoder
	 Neg        : OUT STD_LOGIC; -- is the result negative? set -ve output
	 R1         : OUT UNSIGNED(3 DOWNTO 0);--lower 4-bits of 8-bit Result Outout
	 R2         : OUT UNSIGNED(3 DOWNTO 0)); --higher 4-bits of 8-bits Result Output

END ALUcore;

ARCHITECTURE calculation OF ALUcore IS -- temporary signal declarations

SIGNAL Reg1,Reg2,Result : UNSIGNED(7 DOWNTO 0) := (OTHERS => '0');
SIGNAL Reg4 :UNSIGNED(0 TO 7);

BEGIN

Reg1 <= A; --temporary store A in Reg1 local variable
Reg2 <= B; --temporary store B in Reg2 local variable

PROCESS(Clock,OP)
BEGIN
	IF(rising_edge(Clock)) THEN --Do calculation @ positive edge of clock cycle
		CASE OP IS
			
			WHEN "0000000000000001" =>
			--do addition for Reg1 and Reg2
				Result <= Reg1 + Reg2;
				
			WHEN "0000000000000010" =>
			--Do subtraction 
			-- neg bit set if required
				IF(Reg1 < Reg2) THEN 
					Result <= Reg1 - Reg2;
					Neg <= '1';
				ELSE
					Result <= Reg1 - Reg2;
					Neg <= '0';
				END IF;
			WHEN "0000000000000100" =>
			--Do inverse
				Result <= NOT Reg1;
				Neg <= '0';
				
			WHEN "0000000000001000" =>
			--Do boolean NAND
				Result <= Reg1 NAND Reg2;
			
			WHEN "0000000000010000" =>
			--Do boolean NOR
				Result <= Reg1 NOR Reg2;
			
			WHEN "0000000000100000" =>
			--Do boolean AND
				Result <= Reg1 AND Reg2;
			
			WHEN "0000000001000000" =>
			--Do boolean XOR
				Result <= Reg1 XOR Reg2;
			
			WHEN "0000000010000000" =>
				--Do boolean OR
				Result <= Reg1 OR Reg2;
			
			WHEN "0000000100000000" =>
			--Do boolean XNOR
				Result <= Reg1 XNOR Reg2;
			
			WHEN OTHERS =>
			--Don't care ,do nothing
			
		END CASE;
	END IF;
 END PROCESS;

 R1 <= Result(3 DOWNTO 0); --Since the output seven segment can
 R2 <= Result(7 DOWNTO 4); -- Only 4-bits, split the 8-bit two 4-bits

END calculation; 
