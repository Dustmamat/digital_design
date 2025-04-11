LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY decoder7 IS
PORT ( C : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
Display : OUT STD_LOGIC_VECTOR(0 TO 6));
END decoder7;
ARCHITECTURE Behavior OF decoder7 IS
BEGIN
    PROCESS(C)
    BEGIN
        if (C="000") then
            Display <="1001000";
        elsif(C="001") then
            Display<="0110000";
        elsif(C="010") then
            Display<="1110001";
        elsif(C="011") then
            Display<="0000001";
        elsif(C="100") then
            Display<="0110001";
        elsif(C="101") then
            Display<="0111000";
        elsif(C="110") then
            Display<="0011000";
        else
				Display<="1111111";
        end if;
    end PROCESS;
END Behavior;

