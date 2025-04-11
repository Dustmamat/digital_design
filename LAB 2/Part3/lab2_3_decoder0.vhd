LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY lab2_3_decoder0 IS
    PORT (
        num : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        seg : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
    );
END lab2_3_decoder0;

ARCHITECTURE Behavior OF lab2_3_decoder0 IS
BEGIN
    PROCESS (num)
    BEGIN
        IF num = "0000" THEN
            seg <= "1000000"; -- 0
        ELSIF num = "0001" THEN
            seg <= "1111001"; -- 1
        ELSIF num = "0010" THEN
            seg <= "0100100"; -- 2
        ELSIF num = "0011" THEN
            seg <= "0110000"; -- 3
        ELSIF num = "0100" THEN
            seg <= "0011001"; -- 4
        ELSIF num = "0101" THEN
            seg <= "0010010"; -- 5
        ELSIF num = "0110" THEN
            seg <= "0000010"; -- 6
        ELSIF num = "0111" THEN
            seg <= "1111000"; -- 7
        ELSIF num = "1000" THEN
            seg <= "0000000"; -- 8
        ELSIF num = "1001" THEN
            seg <= "0010000"; -- 9
        ELSE
            seg <= "1111111"; -- All segments OFF (Invalid Input)
        END IF;
    END PROCESS;
END Behavior;

