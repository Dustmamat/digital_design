LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY multiplier_tb IS
END multiplier_tb;

ARCHITECTURE behavior OF multiplier_tb IS
    COMPONENT multiplier
        PORT (
            A : IN std_logic_vector(3 DOWNTO 0);
            B : IN std_logic_vector(3 DOWNTO 0);
            P : OUT std_logic_vector(7 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL A_tb, B_tb : std_logic_vector(3 DOWNTO 0);
    SIGNAL P_tb       : std_logic_vector(7 DOWNTO 0);

BEGIN
    
    uut: multiplier PORT MAP (
        A => A_tb,
        B => B_tb,
        P => P_tb
    );

    
    process
    begin
        -- Test Case 1: 0 * 0 = 00000000
        A_tb <= "0000"; B_tb <= "0000";
        wait for 20 ns;
        
        -- Test Case 2: 1 * 1 = 00000001
        A_tb <= "0001"; B_tb <= "0001";
        wait for 20 ns;
        
        -- Test Case 3: 3 * 2 = 00000110
        A_tb <= "0011"; B_tb <= "0010";
        wait for 20 ns;
        
        -- Test Case 4: 7 * 5 = 00101101
        A_tb <= "0111"; B_tb <= "0101";
        wait for 20 ns;
        
        -- Test Case 5: 15 * 15 = 11100001
        A_tb <= "1111"; B_tb <= "1111";
        wait for 20 ns;
        
        -- Test Case 6: 9 * 3 = 00011011
        A_tb <= "1001"; B_tb <= "0011";
        wait for 20 ns;

	-- Test Case 7: 12 * 11 = 10000100
        A_tb <= "1100"; B_tb <= "1011";
        wait for 20 ns;

        wait;
    end process;
END behavior;
