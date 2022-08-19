LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sseg_prob3b IS
	PORT ( bcd :IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			 leds :OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
			);
			
end sseg_prob3b;

ARCHITECTURE Behavior OF sseg_prob3b IS
BEGIN
	PROCESS (bcd) 
	BEGIN

		CASE bcd IS              --abcdefg
			WHEN "0000" => leds <= "0111011"; --y
			WHEN "0001" => leds <= "1110110"; --N
			WHEN OTHERS => leds <= "-------"; -- 
	END CASE;
 END PROCESS;
END Behavior;
