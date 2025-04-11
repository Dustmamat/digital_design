LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY mux IS
PORT ( sel: IN STD_LOGIC_VECTOR(1 downto 0);
output : OUT STD_LOGIC_VECTOR(14 downto 0));
END mux;
ARCHITECTURE Behavior OF mux IS

BEGIN
PROCESS(sel)
BEGIN
    if (sel = "00") then 
        output <= "000001010010011";
    elsif (sel = "01") then 
        output <= "100001110110011";
    elsif (sel = "10") then 
        output <= "100001010010011";
    elsif (sel = "11") then 
        output <= "101001110110011";
		else
			output<="111111111111111";
    end if;
END PROCESS;


END Behavior;
