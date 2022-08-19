LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;
USE ieee.STD_LOGIC_UNSIGNED.all;
USE ieee.NUMERIC_STD.all;

ENTITY Problem3b IS
PORT(A,B 	   : IN UNSIGNED(7 DOWNTO 0);-- 8 bit inputs from latches A and B
	 Clock      : IN STD_LOGIC; -- input clock signal
	 student_id : IN UNSIGNED(3 DOWNTO 0);--4 bit student ID from FSM
	 OP         : IN UNSIGNED(15 DOWNTO 0); --16-bit selector for Operation from Decoder
	 R1         : OUT UNSIGNED(3 DOWNTO 0));--lower 4-bits of 8-bit Result Outout
	 

END Problem3b;

ARCHITECTURE calculation OF Problem3b IS -- temporary signal declarations

SIGNAL Reg1,Reg2,Result : UNSIGNED(7 DOWNTO 0) := (OTHERS => '0');
SIGNAL Reg4 :UNSIGNED(0 TO 7);

BEGIN

PROCESS(Clock,OP)
BEGIN
	IF(rising_edge(Clock)) THEN --Do calculation @ positive edge of clock cycle
		CASE OP IS
			
			WHEN "0000000000000001" =>
				IF (student_id MOD 2) = 0 THEN
					Result <= "00000000"; --Y
					
				ELSE 
					Result <= "00000001"; --N
				END IF;
				
			WHEN "0000000000000010" =>
				IF (student_id MOD 2) = 0 THEN
					Result <= "00000000"; --Y
					
				ELSE 
					Result <= "00000001"; --N
				END IF;
				
			WHEN "0000000000000100" =>
				IF (student_id MOD 2) = 0 THEN
					Result <= "00000000"; --Y
					
				ELSE 
					Result <= "00000001"; --N
				END IF;
				
			WHEN "0000000000001000" =>
				IF (student_id MOD 2) = 0 THEN
					Result <= "00000000"; --Y
					
				ELSE 
					Result <= "00000001"; --N
				END IF;
			
			WHEN "0000000000010000" =>
				IF (student_id MOD 2) = 0 THEN
					Result <= "00000000"; --Y
					
				ELSE 
					Result <= "00000001"; --N
				END IF;
			
			WHEN "0000000000100000" =>
				IF (student_id MOD 2) = 0 THEN
					Result <= "00000000"; --Y
					
				ELSE 
					Result <= "00000001"; --N
				END IF;
			
			WHEN "0000000001000000" =>
				IF (student_id MOD 2) = 0 THEN
					Result <= "00000000"; --Y
					
				ELSE 
					Result <= "00000001"; --N
				END IF;
			
			WHEN "0000000010000000" =>
				IF (student_id MOD 2) = 0 THEN
					Result <= "00000000"; --Y
					
				ELSE 
					Result <= "00000001"; --N
				END IF;
			
			WHEN "0000000100000000" =>
				IF (student_id MOD 2) = 0 THEN
					Result <= "00000000"; --Y
					
				ELSE 
					Result <= "00000001"; --N
				END IF;
			
			WHEN OTHERS =>
			--Don't care ,do nothing
			
		END CASE;
	END IF;
 END PROCESS;

 R1 <= Result(3 DOWNTO 0); 


END calculation; 
