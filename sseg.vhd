LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY sseg IS

PORT ( 
    bcd : IN STD_LOGIC_VECTOR(3 downto 0);
    leds : OUT STD_LOGIC_VECTOR(0 to 6);
    negled : OUT STD_LOGIC_VECTOR (0 to 6);
    neg1 : IN STD_LOGIC);
        END sseg;

ARCHITECTURE Behavior OF sseg IS
    BEGIN
    PROCESS (bcd, neg1)
        BEGIN

        CASE bcd IS            -- abcdefg
            WHEN "0000" => leds <= ("1111110");
            WHEN "0001" => leds <= ("0110000");
            WHEN "0010" => leds <= ("1101101");
            WHEN "0011" => leds <= ("1111001");
            WHEN "0100" => leds <= ("0110011");
            WHEN "0101" => leds <= ("1011011");
            WHEN "0110" => leds <= ("1011111");
            WHEN "0111" => leds <= ("1110000");
            WHEN "1000" => leds <= ("1111111");
            WHEN "1001" => leds <= ("1110011");


            WHEN "1010" => leds <= "1110111";
            WHEN "1011" => leds <= "0011111";
            WHEN "1100" => leds <= "1001110";
            WHEN "1101" => leds <= "0111101";
            WHEN "1110" => leds <= "1001111";
            WHEN "1111" => leds <= "1000111";
            WHEN OTHERS => leds <= "-------";

            END CASE;

        CASE neg1 IS
            WHEN '1' => negled <= "0000001";
            WHEN OTHERS => negled <= "0000000";
        END CASE;

        END PROCESS;
END Behavior;