LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY lab2_3_circuitB IS
    PORT (
        z : IN STD_LOGIC;
        d1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
END lab2_3_circuitB;

ARCHITECTURE Behavior OF lab2_3_circuitB IS
BEGIN
    PROCESS(z)
    BEGIN
        IF (z = '1') THEN
            d1 <= "1111001";
        ELSE 
            d1 <= "1111111"; 
        END IF;
    END PROCESS;
END Behavior;

