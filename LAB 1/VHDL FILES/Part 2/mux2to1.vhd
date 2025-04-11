LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux2to1 IS
    PORT(
        SW   : IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
        LEDR : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END ENTITY mux2to1;

ARCHITECTURE mux2 OF mux2to1 IS
    SIGNAL X: STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL Y: STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL S: STD_LOGIC;
BEGIN
    -- Extracting subvectors from SW
    X <= SW(3 DOWNTO 0);  -- Lower 4 bits
    Y <= SW(7 DOWNTO 4);  -- Upper 4 bits
    S <= SW(8);           -- Select line

    -- Mux Process
    PROCESS (X, Y, S)  -- Sensitivity list (X, Y, and S)
    BEGIN
        -- Implementing the 4-bit 2-to-1 multiplexer
        LEDR(0) <= (NOT S AND X(0)) OR (S AND Y(0));
        LEDR(1) <= (NOT S AND X(1)) OR (S AND Y(1));
        LEDR(2) <= (NOT S AND X(2)) OR (S AND Y(2));
        LEDR(3) <= (NOT S AND X(3)) OR (S AND Y(3));
    END PROCESS;

END ARCHITECTURE mux2;
