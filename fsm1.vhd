LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;

ENTITY fsm1 IS
PORT
	(
		clk 		     : IN STD_LOGIC;
		data_in       : IN STD_LOGIC;
		reset         : IN STD_LOGIC;
		student_id    : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		current_state : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
		
	);
	END fsm1;
ARCHITECTURE fsm OF fsm1 IS

--Build an enumerated type with 9 states for the state machine (9 states 
--for parsing 9 digits of student ID)
	TYPE state_type IS (s0,s1,s2,s3,s4,s5,s6,s7,s8);
	
--register to hold the current state
SIGNAL yfsm : state_type;

BEGIN 
	PROCESS(clk,reset)
	BEGIN 
		IF reset = '1' THEN
			yfsm <= s0;
		ELSE IF (clk 'EVENT AND clk ='1') THEN
--Determine the next state synchronously,based on
--the current state and input.
			CASE yfsm IS
				
				WHEN s0 => 
					IF data_in = '0' THEN 
						current_state <= "0000";
						yfsm <= s0;
					ELSE   
						current_state <= "0001";
						yfsm <= s1;
					END IF;
				WHEN s1 =>
				   IF data_in = '0' THEN 
					current_state <= "0001";
						yfsm <= s1;
					ELSE     
						current_state <= "0010";
						yfsm <= s2;
					END IF;
				WHEN s2 =>
				   IF data_in = '0' THEN 
					   current_state <= "0010";
						yfsm <= s2;
					ELSE          
						current_state <= "0011";
						yfsm <= s3;
					END IF;
				WHEN s3 =>
				   IF data_in = '0' THEN 
					   current_state <= "0011";
						yfsm <= s3;
					ELSE      
						current_state <= "0100";
						yfsm <= s4;
					END IF;
				WHEN s4 =>
				   IF data_in = '0' THEN 
					   current_state <= "0100";
						yfsm <= s4;
					ELSE          
						current_state <= "0101";
						yfsm <= s5;
					END IF;
				WHEN s5 =>
				   IF data_in = '0' THEN 
					   current_state <= "0101";
						yfsm <= s5;
					ELSE        
						current_state <= "0110";
						yfsm <= s6;
					END IF;
				WHEN s6 =>
				   IF data_in = '0' THEN 
					   current_state <= "0110";
						yfsm <= s6;
					ELSE       
						current_state <= "0111";
						yfsm <= s7;
					END IF;
				WHEN s7 =>
				   IF data_in = '0' THEN 
					   current_state <= "0111";
						yfsm <= s7;
					ELSE          
						current_state <= "1000";
						yfsm <= s8;
					END IF;
				WHEN s8 =>
				   IF data_in = '0' THEN 
					   current_state <= "1000";
						yfsm <= s1;
					ELSE          
						current_state <= "0000";
						yfsm <= s0;
					END IF;
					
			END CASE;
		END IF;
		END IF;
	END PROCESS;
	
--implement the moore or mealy logic here
	
	PROCESS (yfsm,data_in)--IF REQUIRED
	 BEGIN
	
		 CASE yfsm IS
		 
			WHEN s0 =>
				IF    data_in = '0' THEN 
						student_id <= "0101";
				ELSE                     
						student_id <= "0000";
				END IF;
			WHEN s1 =>
			   IF    data_in = '0' THEN 
						student_id <= "0000";
				ELSE                     
						student_id <= "0001";
				END IF;
			WHEN s2 =>
			   IF     data_in = '0' THEN 
						student_id <= "0001";
				ELSE                     
						student_id <= "0000";
				END IF;
			WHEN s3 =>
			   IF    data_in = '0' THEN 
						student_id <= "0000";
				ELSE                     
						student_id <= "0100";
				END IF;
			WHEN s4 =>
			   IF    data_in = '0' THEN 
						student_id <= "0100";
				ELSE                     
						student_id <= "0000";
			   END IF;
			WHEN s5 =>
			   IF    data_in = '0' THEN 
						student_id <= "0000";
				ELSE                     
						student_id <= "0010";
				END IF;
			WHEN s6 =>
			   IF    data_in = '0' THEN 
						student_id <= "0010";
				ELSE                     
						student_id <= "0000";
				END IF;
			WHEN s7 =>
			   IF    data_in = '0' THEN 
						student_id <= "0000";
				ELSE                     
						student_id <= "1001";
				END IF;
			WHEN s8 =>
			   IF    data_in = '0' THEN 
						student_id <= "1001";
				ELSE                     
						student_id <= "0101";
				END IF;
		END CASE;
	END PROCESS;
END fsm;
