LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
ENTITY ALU3 IS
PORT(
	Clock : IN STD_LOGIC; -- input clock signal
	A,B : IN UNSIGNED(7 DOWNTO 0); -- 8 bit inputs from latches A and B
	student_id : IN UNSIGNED (3 DOWNTO 0); --4 bit student id from FSM
	OP : IN UNSIGNED(15 DOWNTO 0); -- 16 bit selector for Operation from Decoder
	R : OUT UNSIGNED (3 DOWNTO 0)); -- higher 4 bits of 8-bit Result Output 
END ALU3;

ARCHITECTURE calculation OF ALU3 IS
SIGNAL Reg1, Reg2: UNSIGNED(7 DOWNTO 0):= (OTHERS =>'0');
SIGNAL Reg4 : UNSIGNED(0 TO 7);
SIGNAL Result, id : UNSIGNED (3 DOWNTO 0);
BEGIN 
Reg1 <= A; -- temporarily stores A in Reg1 local variable 
Reg2 <= B; -- temporarily stores B in Reg2 local variable
id <= student_id; 
PROCESS(Clock, OP, id)
BEGIN 
	IF(rising_edge(Clock)) THEN --Do the calculation @ positive edge of clock cycle 
		CASE OP IS
			WHEN "0000000000000001"=> -- Difference Between A and B
				if (Reg1 (7 DOWNTO 4) > id or Reg1 (3 DOWNTO 0) > id) then
				Result <= "0001";
				else
				Result <= "0010";
				end if;
			WHEN "0000000000000010"=> -- 2's Complement of B
				if (Reg1 (7 DOWNTO 4) > id or Reg1 (3 DOWNTO 0) > id) then
				Result <= "0001";
				else
				Result <= "0010";
				end if;
			WHEN "0000000000000100"=> -- Swap lower bits of A with lower bits of B
				if (Reg1 (7 DOWNTO 4) > id or Reg1 (3 DOWNTO 0) > id) then
				Result <= "0001";
				else
				Result <= "0010";
				end if;
			WHEN "0000000000001000"=> -- Null on output
				if (Reg1 (7 DOWNTO 4) > id or Reg1 (3 DOWNTO 0) > id) then
				Result <= "0001";
				else
				Result <= "0010";
				end if;
			WHEN "0000000000010000"=> -- Decrement B by 5
				if (Reg1 (7 DOWNTO 4) > id or Reg1 (3 DOWNTO 0) > id) then
				Result <= "0001";
				else
				Result <= "0010";
				end if;
			WHEN "0000000000100000"=> -- Invert bit-significance order of A 
				if (Reg1 (7 DOWNTO 4) > id or Reg1 (3 DOWNTO 0) > id) then
				Result <= "0001";
				else
				Result <= "0010";
				end if;
			WHEN "0000000001000000"=>-- Shift B to left by 3 bits, input bit = 1 (SHL) 
				if (Reg1 (7 DOWNTO 4) > id or Reg1 (3 DOWNTO 0) > id) then
				Result <= "0001";
				else
				Result <= "0010";
				end if;
			WHEN "0000000010000000"=> -- Increment A by 3
				if (Reg1 (7 DOWNTO 4) > id or Reg1 (3 DOWNTO 0) > id) then
				Result <= "0001";
				else
				Result <= "0010";
				end if;
			WHEN "0000000100000000"=> -- Invert All Bits of B
				if (Reg1 (7 DOWNTO 4) > id or Reg1 (3 DOWNTO 0) > id) then
				Result <= "0001";
				else
				Result <= "0010";
				end if;
			WHEN OTHERS =>
				Result <= "0000";
				
		END CASE;
	END IF;
END PROCESS;
R <= Result(3 DOWNTO 0);
END calculation;