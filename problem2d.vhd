LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;
USE ieee.STD_LOGIC_UNSIGNED.all;
USE ieee.NUMERIC_STD.all;

ENTITY Problem2d IS
PORT(A,B 	   : IN UNSIGNED(7 DOWNTO 0);-- 8 bit inputs from latches A and B
	 Clock      : IN STD_LOGIC; -- input clock signal
	 student_id : IN UNSIGNED(3 DOWNTO 0);--4 bit student ID from FSM
	 OP         : IN UNSIGNED(15 DOWNTO 0); --16-bit selector for Operation from Decoder
	 Neg        : OUT STD_LOGIC; -- is the result negative? set -ve output
	 R1         : OUT UNSIGNED(3 DOWNTO 0);--lower 4-bits of 8-bit Result Outout
	 R2         : OUT UNSIGNED(3 DOWNTO 0)); --higher 4-bits of 8-bits Result Output

END Problem2d;

ARCHITECTURE calculation OF Problem2d IS -- temporary signal declarations

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
			--Shift A to right by two bits, input bit =1 (SHR)
				Result <= Reg1 srl 2;
				
			WHEN "0000000000000010" =>
			--Produce the difference of A and B and then increment by 4
			IF(Reg1 < Reg2) THEN 
				Result <= (Reg1 - Reg2) + 4;
				Neg <= '1';
			ELSE 
				Result <= (Reg1 + Reg2 ) + 4;
				Neg <= '0';
			END IF;
			
			WHEN "0000000000000100" =>
			--Find the greater value of A and B and produce the results (Max(A,B))
				IF Reg1 > Reg2 THEN
				Result <= Reg1;
				ELSE Result <= Reg2;
				END IF;
				Neg <='0';
				
			WHEN "0000000000001000" =>
			--Swap the upper 4 bits of A by the lower 4 bits of B
				Result(7 DOWNTO 4) <= Reg2(3 DOWNTO 0);
				Result(3 DOWNTO 0) <= Reg1(3 DOWNTO 0);
	
			WHEN "0000000000010000" =>
			--Increment A by 1
					Result <= Reg1 + 1;
			
			WHEN "0000000000100000" =>
			--Produce the results of ANDing A and B
				Result <= Reg1 AND Reg2;
			
			WHEN "0000000001000000" =>
			--Invert the upper four bits of A
				Result(0) <= Reg1(0);
				Result(1) <= Reg1(1);
				Result(2) <= Reg1(2);
				Result(3) <= Reg1(3);
				Result(4) <= NOT Reg1(4);
				Result(5) <= NOT Reg2(5);
				Result(6) <= NOT Reg2(6);
				Result(7) <= NOT Reg2(7);
			
			WHEN "0000000010000000" =>
				--Rotate B to left by 3 bits (ROL)
				Result <= Reg2 ROL 3;
			
			WHEN "0000000100000000" =>
			--Show null on the output
				Result <= NULL;
			
			WHEN OTHERS =>
			--Don't care ,do nothing
			
		END CASE;
	END IF;
 END PROCESS;

 R1 <= Result(3 DOWNTO 0); --Since the output seven segment can
 R2 <= Result(7 DOWNTO 4); -- Only 4-bits, split the 8-bit two 4-bits

END calculation; 
