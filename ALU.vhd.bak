LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
ENTITY ALU IS
PORT(
	Clock : IN STD_LOGIC; -- input clock signal
	A,B : IN UNSIGNED(7 DOWNTO 0); -- 8 bit inputs from the two latches  
	OP : IN UNSIGNED(15 DOWNTO 0); -- 16 bit selector for decoder operations
	Neg : OUT STD_LOGIC; -- result from the negative
	R1 : OUT UNSIGNED (3 DOWNTO 0); -- lower 4 bits of 8 bit result output 
	R2 : OUT UNSIGNED (3 DOWNTO 0)); -- higher 4 bits of 9 bit result output 
END ALU;

ARCHITECTURE calculation OF ALU IS
SIGNAL reg1, reg2, result : UNSIGNED(7 DOWNTO 0):= (OTHERS =>'0');
SIGNAL reg4 : UNSIGNED(0 TO 7);
BEGIN 
reg1 <= A; -- temporarily stores A in Reg1 local variable 
reg2 <= B; -- temporarily stores B in Reg2 local variable 
PROCESS(Clock, OP)
BEGIN 
	IF(rising_edge(Clock)) THEN 
		CASE OP IS
			WHEN "0000000000000001"=> -- Addition for Reg1 and Reg2
				result <= reg1 + reg2;
				Neg <= '0';
			WHEN "0000000000000010"=> -- substraction 
				IF(reg1 >= reg2) THEN
					result <= not(reg1 - reg2) +1;
					neg <= '0';
				ELSE
					result <= not(reg1 - reg2) +1;
					neg <= '1';
				END IF;
			WHEN "0000000000000100"=> -- inverse
				result <= not(reg1);
				neg <= '0';
			WHEN "0000000000001000"=> -- NAND
				result <= reg1 nand reg2;
				neg <= '0';
			WHEN "0000000000010000"=> -- NOR
				result <= reg1 nor reg2;
				neg <= '0';
			WHEN "0000000000100000"=> -- and
				result <= reg1 and reg2;
				neg<= '0';
			WHEN "0000000001000000"=>-- xor
				result <= reg1 xor reg2;
				neg <= '0';
			WHEN "0000000010000000"=> -- OR
				result <= reg1 or reg2;
				neg <= '0';
			WHEN "0000000100000000"=> -- XNOR
				result <= reg1 xnor reg2;
				neg <= '0';
			WHEN OTHERS =>
				result <= "00000000";
				neg <= '0';
		END CASE;
	END IF;
END PROCESS;
R1 <= result(3 DOWNTO 0);
R2 <= result(7 DOWNTO 4);
END calculation;