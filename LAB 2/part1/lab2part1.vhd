
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY lab2part1 IS
    PORT (
        SW: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        HEX0: OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
    );
END lab2part1;

ARCHITECTURE STR OF lab2part1 IS
COMPONENT segmentdecoder7
        PORT (
            C0, C1, C2: IN STD_LOGIC;
            DECOUT: OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
    END COMPONENT;
SIGNAL C0, C1, C2: STD_LOGIC;
SIGNAL DECOUT: STD_LOGIC_VECTOR(6 DOWNTO 0);

BEGIN
    C0 <= SW(0);
    C1 <= SW(1);
    C2 <= SW(2);
    DECO: segmentdecoder7 PORT MAP (C0 , C1 , C2, DECOUT=>HEX0);

END STR;