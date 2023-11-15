LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY ssegmodded IS

PORT ( 
    bcd : IN STD_LOGIC_VECTOR(3 downto 0);
    leds : OUT STD_LOGIC_VECTOR(0 to 6));
END ssegmodded;

ARCHITECTURE Behavior OF ssegmodded IS
    BEGIN
    PROCESS (bcd)
        BEGIN

        CASE bcd IS            -- abcdefg
            WHEN "0001" => leds <= ("0111011"); -- yes or y on 7 seg
            WHEN "0010" => leds <= ("1110110"); -- no or n on 7 seg
           
            WHEN OTHERS => leds <= "0000000";

            END CASE;
        END PROCESS;
END Behavior;