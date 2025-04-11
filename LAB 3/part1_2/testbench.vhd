
LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY tb is
END ENTITY;


ARCHITECTURE testbench OF tb IS

COMPONENT part2
PORT( num1, num2: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	ck, rst, s: IN STD_LOGIC;
	sum: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	ovf: OUT STD_LOGIC);
END COMPONENT;


SIGNAL A,B,C: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL ck, rst, s, ovf: STD_LOGIC;


BEGIN

gen_clockG: PROCESS
BEGIN
ck<='0';
WAIT FOR 1 ns;
ck<='1';
WAIT FOR 1 ns;
END PROCESS;


test: PROCESS
BEGIN
rst<='0';
rst<='1';
-- ENABLE THE CIRCUIT
s<='0';
--ALL THE FOLLOWING OPERATIONS ARE IN ADDITION MODE

A<="0000";
B<="0000";
WAIT FOR 10 ns;
A<="0001";
B<="0001";
WAIT FOR 10 ns;
A<="0100";
B<="0011";
WAIT FOR 10 ns;
A<="0111";
B<="0001";
WAIT FOR 10 ns;
A<="1000";
B<="1111";
WAIT FOR 10 ns;
A<="1001";
B<="0111";
WAIT FOR 10 ns;
A<="0101";
B<="0010";
WAIT FOR 10 ns;
A<="1000";
B<="1111";
WAIT FOR 10 ns;

rst<='0'; --activate reset

WAIT FOR 10 ns;
rst<='1';
s<='1'; --now all the following operations are in subtraction mode

A<="0111";
B<="0001";
WAIT FOR 10 ns;

A<="1000";
B<="1000";
WAIT FOR 10 ns;
WAIT;

END PROCESS;

p2: part2 PORT MAP(A,B,ck,rst,s,C,ovf);
END ARCHITECTURE;