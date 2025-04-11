LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY segmentdecoder7 IS
    PORT (
        C0, C1, C2: IN STD_LOGIC;
        DECOUT: OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
    );
END segmentdecoder7;

ARCHITECTURE Behavioral OF segmentdecoder7 IS
BEGIN
    PROCESS (C0, C1, C2)
    BEGIN
        IF (C0 = '0' AND C1 = '0' AND C2 = '0') THEN
            DECOUT <= "0001001"; -- H 
        ELSIF (C0 = '0' AND C1 = '0' AND C2 = '1') THEN
            DECOUT <= "0000110"; -- E 
        ELSIF (C0 = '0' AND C1 = '1' AND C2 = '0') THEN
            DECOUT <= "1000111"; -- L 
        ELSIF (C0 = '0' AND C1 = '1' AND C2 = '1') THEN
            DECOUT <= "1000000"; -- O 
        ELSE
            DECOUT <= "1111111"; -- Blank
        END IF;
    END PROCESS;
END Behavioral;
