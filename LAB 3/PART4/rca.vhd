LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY rca IS
    PORT( 
        X, Y : IN std_logic_vector(3 DOWNTO 0); -- 4-bit input vectors
        C0   : IN std_logic;  -- Initial carry-in
        S    : OUT std_logic_vector(3 DOWNTO 0); -- 4-bit sum output
        Cout : OUT std_logic  -- Final carry-out 

    );
END rca;

ARCHITECTURE structure OF rca IS
    SIGNAL c1, c2, c3, C4: std_logic; -- C4 is the lastest carry to check overflow

    COMPONENT fulladder
        PORT ( 
            x, y, Cin : IN std_logic;
            s, Cout   : OUT std_logic
        );
    END COMPONENT;

BEGIN
    stage0: fulladder PORT MAP (X(0), Y(0), C0, S(0), C1);
    stage1: fulladder PORT MAP (X(1), Y(1), C1, S(1), C2);
    stage2: fulladder PORT MAP (X(2), Y(2), C2, S(2), C3);
    stage3: fulladder PORT MAP (X(3), Y(3), C3, S(3), C4);
    Cout <= C4;

END architecture;
