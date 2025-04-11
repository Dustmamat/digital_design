LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY led_tb IS
END ENTITY led_tb;

ARCHITECTURE testbench OF led_tb IS
    -- Declare the component (DUT)
    COMPONENT led
        PORT ( SW   : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
               LEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
    END COMPONENT;

    -- Signals for testbench
    SIGNAL SW_tb   : STD_LOGIC_VECTOR(9 DOWNTO 0);
    SIGNAL LEDR_tb : STD_LOGIC_VECTOR(9 DOWNTO 0);

BEGIN 
    -- Instantiate the DUT
    UUT: led PORT MAP(SW => SW_tb, LEDR => LEDR_tb);

    -- Test process
    stim_proc: PROCESS
    BEGIN
        -- Apply test vectors
        SW_tb <= "0000000000";  -- All OFF
        WAIT FOR 10 ns;
        
        SW_tb <= "0000000001";  -- Bit 0 ON
        WAIT FOR 10 ns;
        
        SW_tb <= "0000000010";  -- Bit 1 ON
        WAIT FOR 10 ns;
        
        SW_tb <= "0000000100";  -- Bit 2 ON
        WAIT FOR 10 ns;

        SW_tb <= "0000001000";  -- Bit 3 ON
        WAIT FOR 10 ns;

        SW_tb <= "0000010000";  -- Bit 4 ON
        WAIT FOR 10 ns;

        SW_tb <= "0000100000";  -- Bit 5 ON
        WAIT FOR 10 ns;

        SW_tb <= "0001000000";  -- Bit 6 ON
        WAIT FOR 10 ns;

        SW_tb <= "0010000000";  -- Bit 7 ON
        WAIT FOR 10 ns;

        SW_tb <= "0100000000";  -- Bit 8 ON
        WAIT FOR 10 ns;

        SW_tb <= "1000000000";  -- Bit 9 ON
        WAIT FOR 10 ns;

        SW_tb <= "1111111111";  -- All ON
        WAIT;

    END PROCESS stim_proc;

END ARCHITECTURE testbench;

