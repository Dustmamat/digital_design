library ieee;
use ieee.std_logic_1164.all;

entity csea is
port(a, b: in std_logic_vector(15 downto 0);
	c_out: out std_logic;
	sum: out std_logic_vector(15 downto 0));
end entity;


architecture adder of csea is 

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

component mux2to1_4bit
port(x,y: in std_logic_vector(3 downto 0);
	sel: in std_logic;
	z: out std_logic_vector(3 downto 0));
end component;


signal c4, c8, c12: std_logic;

signal c8_0, c8_1, c12_0, c12_1, c16_0, c16_1 : std_logic;

signal s1_0, s1_1, s2_0, s2_1, s3_0, s3_1: std_logic_vector(3 downto 0);

begin

rca0: rca4 port map(a(3 downto 0), b(3 downto 0),'0',c4,sum(3 downto 0));

rca1_0: rca4 port map(a(7 downto 4),b(7 downto 4),'0',c8_0,s1_0);
rca1_1: rca4 port map(a(7 downto 4),b(7 downto 4),'1',c8_1,s1_1);

mux4_1: mux2to1_4bit port map(s1_0,s1_1,c4,sum(7 downto 4));
mux1: mux2to1 port map(c8_0,c8_1,c4,c8);

rca1_2: rca4 port map(a(11 downto 8),b(11 downto 8),'0',c12_0,s2_0);
rca1_3: rca4 port map(a(11 downto 8),b(11 downto 8),'1',c12_1,s2_1);

mux4_2: mux2to1_4bit port map(s2_0,s2_1,c8,sum(11 downto 8));
mux2: mux2to1 port map(c12_0,c12_1,c8,c12);

rca1_4: rca4 port map(a(15 downto 12),b(15 downto 12),'0',c16_0,s3_0);
rca1_5: rca4 port map(a(15 downto 12),b(15 downto 12),'1',c16_1,s3_1);

mux4_3: mux2to1_4bit port map(s3_0,s3_1,c12,sum(15 downto 12));
mux3: mux2to1 port map(c16_0,c16_1,c12,c_out);

end architecture;