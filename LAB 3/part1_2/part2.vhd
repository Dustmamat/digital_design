LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
ENTITY part1 IS
PORT( num1, num2: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	ck, rst, s: IN STD_LOGIC;
	sum: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	ovf: OUT STD_LOGIC);
END ENTITY;

ARCHITECTURE p2 OF part1 IS
SIGNAL A,B: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL sum_intermediate: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL ovf_intermediate: STD_LOGIC;
SIGNAL cout_intermediate: STD_LOGIC;


COMPONENT regn
GENERIC ( N : integer:=4);
PORT (R : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
Clock, Resetn : IN STD_LOGIC;
Q : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0));
END COMPONENT;


COMPONENT flipflop
PORT (D, Clock, Resetn : IN STD_LOGIC;
Q : OUT STD_LOGIC);
END COMPONENT;

COMPONENT rca
PORT(A, B: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	sub: IN STD_LOGIC;
	c4: OUT STD_LOGIC;
	sum: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END COMPONENT;

COMPONENT overflow
PORT(s, c4: IN STD_LOGIC;
	in1,in2, out1: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	ovf: OUT STD_LOGIC);
END COMPONENT;

BEGIN

reg1: regn PORT MAP(num1, ck, rst,A);
reg2: regn PORT MAP(num2,ck,rst,B);
rca1: rca PORT MAP(A,B,s,cout_intermediate,sum_intermediate);
reg3: regn PORT MAP(sum_intermediate,ck,rst,sum);
overflow1: overflow PORT MAP(s,cout_intermediate,A,B,sum_intermediate,ovf_intermediate);
ff1: flipflop PORT MAP(ovf_intermediate,ck,rst,ovf);
END ARCHITECTURE;