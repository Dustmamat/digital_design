LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY rca4 IS
port(a,b: in std_logic_vector(3 downto 0);
	c_in: in std_logic;
	c_out: out std_logic;
	sum: out std_logic_vector(3 downto 0));
END ENTITY;


architecture behv of rca4 IS

component fa
PORT(X,Y,c_in: IN STD_LOGIC;
	s,c_out: OUT STD_LOGIC);
end component;

signal c1,c2,c3: std_logic;
begin
fa0: fa port map(a(0),b(0),c_in,sum(0),c1);
fa1: fa port map(a(1),b(1),c1,sum(1),c2);
fa2: fa port map(a(2),b(2),c2,sum(2),c3);
fa3: fa port map(a(3),b(3),c3,sum(3),c_out);

end architecture;