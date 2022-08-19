LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sseg1 IS
	PORT ( bcd :IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			 leds :OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			 neg  : IN STD_LOGIC;
			 neg_leds : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
			);
			
end sseg1;

ARCHITECTURE Behavior OF sseg1 IS
BEGIN
	PROCESS (bcd,neg) 
	BEGIN
	IF (neg = '0') THEN
		neg_leds <= "0000000";
		CASE bcd IS              --abcdefg
			WHEN "0000" => leds <= "1111110";--0
			WHEN "0001" => leds <= "0110000";--1
			WHEN "0010" => leds <= "1101101";--2
			WHEN "0011" => leds <= "1111001";--3
			WHEN "0100" => leds <= "0110011";--4
			WHEN "0101" => leds <= "1011011";--5
			WHEN "0110" => leds <= "1011111";--6
			WHEN "0111" => leds <= "1110000";--7
			WHEN "1000" => leds <= "1111111";--8
			WHEN "1001" => leds <= "1111011";--9
			WHEN "1010" => leds <= "1110111";--A
			WHEN "1011" => leds <= "0011111";--B
			WHEN "1100" => leds <= "1001110";--C
			WHEN "1101" => leds <= "0111101";--D
			WHEN "1110" => leds <= "1001111";--E
			WHEN "1111" => leds <= "1000111";--F
			WHEN OTHERS => leds <= "-------";
		END CASE;
		
	ELSE 
						  neg_leds <= "0000001";
		CASE bcd IS
			WHEN "0000" => leds <= "1111110";--0
			WHEN "0001" => leds <= "0110000";--1
			WHEN "0010" => leds <= "1101101";--2
			WHEN "0011" => leds <= "1111001";--3
			WHEN "0100" => leds <= "0110011";--4
			WHEN "0101" => leds <= "1001011";--5
			WHEN "0110" => leds <= "1011111";--6
			WHEN "0111" => leds <= "1110000";--7
			WHEN "1000" => leds <= "1111111";--8
			WHEN "1001" => leds <= "1111011";--9
			WHEN "1010" => leds <= "1110111";--A
			WHEN "1011" => leds <= "0011111";--B
			WHEN "1100" => leds <= "1001110";--C
			WHEN "1101" => leds <= "0111101";--D
			WHEN "1110" => leds <= "1001111";--E
			WHEN "1111" => leds <= "1000111";--F	
			WHEN OTHERS => leds <= "-------";
			END CASE;
	END IF;
 END PROCESS;
END Behavior;
