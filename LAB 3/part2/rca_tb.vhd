LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY rca_tb IS
END ENTITY;



ARCHITECTURE testbench of rca_tb IS

COMPONENT rca
PORT(A, B: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	sub: IN STD_LOGIC;
	c4: OUT STD_LOGIC;
	sum: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END COMPONENT;

COMPONENT overflow
PORT(c3, c4: IN STD_LOGIC;
	ovf: OUT STD_LOGIC);
end COMPONENT;

SIGNAL A, B: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL sub: STD_LOGIC;
SIGNAL S: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL c_out: STD_LOGIC; 


SIGNAL prev_carry: STD_LOGIC;
SIGNAL isovf: STD_LOGIC;

BEGIN

PROCESS

BEGIN

A<="0000";
B<="0000";
sub<='0';
--expect 0000 output + no overflow
WAIT FOR 10 ns;

A<="0001";
B<="0100";
sub<='0';
--expect 0101 output + no overflow
WAIT FOR 10 ns;

A<="0101";
B<="0010";
sub<='0';
--expect 0111 output + no overflow

WAIT FOR 10 ns;

A<="0111";
B<="0001";
sub<='0';
-- expect overflow

WAIT FOR 10 ns;

A <="0111";
B <="0001";
sub<='1';
-- expect 0110 output + no overflow

WAIT FOR 10 ns;

A <="0101";
B <="0011";
sub<='1';

WAIT FOR 10 ns;

A <="1111";
B <="0001";
sub<='1';


WAIT FOR 10 ns;


A <="1000";
B <="0001";
sub<='1';
-- overflow

WAIT FOR 10 ns;

A <="1000";
B <="1000";
sub<='0';
-- overflow

WAIT FOR 10 ns;
WAIT;
END PROCESS;

prev_carry<=S(3) xor A(3) xor (B(3) xor sub);
tb1: rca PORT MAP(A,B,sub,c_out,S);
tb2: overflow PORT MAP(prev_carry, c_out, isovf);
END ARCHITECTURE;

