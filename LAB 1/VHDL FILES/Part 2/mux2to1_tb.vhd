LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY testbench IS
END ENTITY testbench;

ARCHITECTURE behaviour OF testbench IS
    -- Component Declaration for the Unit Under Test (UUT
    COMPONENT mux2to1
        PORT(
            SW   : IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
            LEDR : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;

    -- Signals for testbench
    SIGNAL SW_tb  : STD_LOGIC_VECTOR(9 DOWNTO 0);
    SIGNAL LEDR_tb : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL X_tb: STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL Y_tb: STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL S_tb: STD_LOGIC;

BEGIN
    -- Instantiate the mux2to1 component
    UUT: mux2to1 
        PORT MAP(
            SW   => SW_tb,
            LEDR => LEDR_tb
        );

    -- Construct SW_tb from X_tb, Y_tb, and S_tb outside the process
SW_tb <= '0'&S_tb&Y_tb&X_tb;

    -- Test process
    stim_proc: PROCESS
    BEGIN
        -- Test Case 1: X = 0000, Y = 1111, S = 0 ? Expect LEDR = X = 0000
        X_tb <= "0000";  -- X = 0000
        Y_tb <= "1111";  -- Y = 1111
        S_tb <= '0';     -- S = 0
        WAIT FOR 10 ns;

        -- Test Case 2: X = 1111, Y = 0000, S = 1 ? Expect LEDR = Y = 0000
        X_tb <= "1111";  -- X = 1111
        Y_tb <= "0000";  -- Y = 0000
        S_tb <= '1';     -- S = 1
        WAIT FOR 10 ns;

        -- Test Case 3: X = 1010, Y = 1101, S = 0 ? Expect LEDR = X = 1010
        X_tb <= "1010";  -- X = 1010
        Y_tb <= "1101";  -- Y = 1101
        S_tb <= '0';     -- S = 0
        WAIT FOR 10 ns;

        -- Test Case 4: X = 1010, Y = 1101, S = 1 ? Expect LEDR = Y = 1101
        X_tb <= "1010";  -- X = 1010
        Y_tb <= "1101";  -- Y = 1101
        S_tb <= '1';     -- S = 1
        WAIT FOR 10 ns;

        -- Test Case 5: X = 1111, Y = 0000, S = 0 ? Expect LEDR = X = 1111
        X_tb <= "1111";  -- X = 1111
        Y_tb <= "0000";  -- Y = 0000
        S_tb <= '0';     -- S = 0
        WAIT FOR 10 ns;

        -- Test Case 6: X = 0000, Y = 1111, S = 1 ? Expect LEDR = Y = 1111
        X_tb <= "0000";  -- X = 0000
        Y_tb <= "1111";  -- Y = 1111
        S_tb <= '1';     -- S = 1
        WAIT FOR 10 ns;

        -- End Simulation
        WAIT;
    END PROCESS;

END ARCHITECTURE behaviour;

