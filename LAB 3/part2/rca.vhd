LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY rca IS
PORT(A, B: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	sub: IN STD_LOGIC;
	c4: OUT STD_LOGIC;
	sum: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END ENTITY;



ARCHITECTURE myrca OF rca IS

COMPONENT fa
PORT(a,b,c_in: IN STD_LOGIC;
	s,c_out: OUT STD_LOGIC);
END COMPONENT;

SIGNAL c0, c1, c2, c3: STD_LOGIC;
SIGNAL B_new: STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
c0<=sub;

B_new(0)<=B(0) xor sub;
B_new(1)<=B(1) xor sub;
B_new(2)<=B(2) xor sub;
B_new(3)<=B(3) xor sub;



fa1: fa PORT MAP(A(0), B_new(0),c0,sum(0),c1);
fa2: fa PORT MAP(A(1), B_new(1),c1,sum(1),c2);
fa3: fa PORT MAP(A(2), B_new(2), c2, sum(2), c3);
fa4: fa PORT MAP(A(3), B_new(3), c3, sum(3), c4);

END ARCHITECTURE;


