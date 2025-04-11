LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY part3_tb IS
END part3_tb;

ARCHITECTURE behavior OF part3_tb IS

    COMPONENT part3
        PORT(
            SW : IN std_logic_vector(3 DOWNTO 0);
            hex1, hex0 : OUT std_logic_vector(6 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL SW_tb : std_logic_vector(3 DOWNTO 0);
    SIGNAL hex1_tb, hex0_tb : std_logic_vector(6 DOWNTO 0);

BEGIN

    uut : part3 PORT MAP (
            SW => SW_tb,
            hex1 => hex1_tb,
            hex0 => hex0_tb
        );

    PROCESS
    BEGIN

        SW_tb <= "0000"; WAIT FOR 20 ns; -- Input: 0
        SW_tb <= "0001"; WAIT FOR 20 ns; -- Input: 1
        SW_tb <= "0010"; WAIT FOR 20 ns; -- Input: 2
        SW_tb <= "0011"; WAIT FOR 20 ns; -- Input: 3
        SW_tb <= "0100"; WAIT FOR 20 ns; -- Input: 4
        SW_tb <= "0101"; WAIT FOR 20 ns; -- Input: 5
        SW_tb <= "0110"; WAIT FOR 20 ns; -- Input: 6
        SW_tb <= "0111"; WAIT FOR 20 ns; -- Input: 7
        SW_tb <= "1000"; WAIT FOR 20 ns; -- Input: 8
        SW_tb <= "1001"; WAIT FOR 20 ns; -- Input: 9
        SW_tb <= "1010"; WAIT FOR 20 ns; -- Input: 10
        SW_tb <= "1011"; WAIT FOR 20 ns; -- Input: 11
        SW_tb <= "1100"; WAIT FOR 20 ns; -- Input: 12
        SW_tb <= "1101"; WAIT FOR 20 ns; -- Input: 13
        SW_tb <= "1110"; WAIT FOR 20 ns; -- Input: 14
        SW_tb <= "1111"; WAIT FOR 20 ns; -- Input: 15
        
        WAIT;
    END PROCESS;

END behavior;

