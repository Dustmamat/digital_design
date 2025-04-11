library ieee;
use ieee.std_logic_1164.all;

entity cska is
port(a, b: in std_logic_vector(15 downto 0);
	c_out: out std_logic;
	sum: out std_logic_vector(15 downto 0));
end entity;


architecture adder of cska is 

component rca4
port(a,b: in std_logic_vector(3 downto 0);
	c_in: in std_logic;
	c_out: out std_logic;
	sum: out std_logic_vector(3 downto 0));
end component;

component mux2to1
port(x,y,sel: in std_logic;
	z: out std_logic);
end component;



signal p: std_logic_vector(15 downto 0);
signal c4, c8, c12: std_logic;
signal c4_0, c8_0, c12_0, c16_0: std_logic;
signal prop0, prop1, prop2, prop3: std_logic;
begin
process(a,b)
begin
p<=a xor b;
end process;

prop0 <= p(0) and p(1) and p(2) and p(3);
prop1 <= p(4) and p(5) and p(6) and p(7);
prop2 <= p(8) and p(9) and p(10) and p(11);
prop3 <= p(12) and p(13) and p(14) and p(15);

rca1_0: rca4 port map(a(3 downto 0), b(3 downto 0), '0',c4_0,sum(3 downto 0));

mux1: mux2to1 port map(c4_0, '0', prop0, c4);

rca1_1: rca4 port map(a(7 downto 4), b(7 downto 4), c4, c8_0, sum(7 downto 4));

mux2: mux2to1 port map(c8_0,c4,prop1,c8);

rca1_2: rca4 port map(a(11 downto 8), b(11 downto 8), c8, c12_0, sum(11 downto 8));

mux3: mux2to1 port map(c12_0, c8,prop2, c12);

rca1_3: rca4 port map(a(15 downto 12), b(15 downto 12), c12, c16_0, sum(15 downto 12));

mux4: mux2to1 port map(c16_0, c12, prop3, c_out);






end architecture;