LIBRARY ieee;
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY lab2_3_mux IS
    PORT (
        z : IN STD_LOGIC;
        V : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        A : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        m : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
    );
END lab2_3_mux;

ARCHITECTURE output OF lab2_3_mux IS
BEGIN
    PROCESS(V, A, z)
    BEGIN
        IF z = '0' THEN
            m <= V;  
        ELSE
            m(3) <= '0';        
            m(2 DOWNTO 0) <= A;  
        END IF;
    END PROCESS;
END output;


