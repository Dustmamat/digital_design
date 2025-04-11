LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY lab2_3_circuitA IS
    PORT (
        V : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        A : OUT STD_LOGIC_VECTOR (2 DOWNTO 0)
    );
END lab2_3_circuitA;

ARCHITECTURE output OF lab2_3_circuitA IS
BEGIN
    PROCESS (V)
    BEGIN
        A <= std_logic_vector(unsigned(V) - 2); 
    END PROCESS;
END output;

