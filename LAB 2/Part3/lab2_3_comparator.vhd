LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY lab2_3_comparator IS
    PORT (
        V : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        z : OUT STD_LOGIC
    );
END lab2_3_comparator;

ARCHITECTURE behavior OF lab2_3_comparator IS
BEGIN
    PROCESS (V)
    BEGIN
        IF V > "1001" THEN  -- If V > 9
            z <= '1';
        ELSE
            z <= '0';
        END IF;
    END PROCESS;
END behavior;

