LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY fulladder is 
Port ( x, y, Cin: IN std_logic;
	s, Cout: OUT std_logic
	);
end fulladder;

Architecture behaviour of fulladder is
begin 
s <= x XOR y xor Cin;
Cout <= (x and y) or (x and Cin) or (y and Cin);
end behaviour;


