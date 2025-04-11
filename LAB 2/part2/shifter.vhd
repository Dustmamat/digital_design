LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
ENTITY shifter IS
PORT ( input : IN STD_LOGIC_VECTOR(14 downto 0);
sel: IN STD_LOGIC_VECTOR(2 downto 0);
output : OUT STD_LOGIC_VECTOR(14 downto 0));
END shifter;
ARCHITECTURE Behavior OF shifter IS
BEGIN
PROCESS(sel,input)
BEGIN
if(sel ="000") then output<=input;
elsif(sel="001") then output<=std_logic_vector(rotate_left(unsigned(input), 3));
elsif(sel="010") then output<=std_logic_vector(rotate_left(unsigned(input), 6));
elsif(sel="011") then output<=std_logic_vector(rotate_left(unsigned(input), 9));
elsif(sel="100") then output<=std_logic_vector(rotate_left(unsigned(input), 12));
else output<="111111111111111";
END IF;
END PROCESS;


END Behavior;
