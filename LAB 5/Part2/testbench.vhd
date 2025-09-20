library ieee;
use ieee.std_logic_1164.all;


entity testbench is
end entity;

architecture tb of testbench is

component part2
port(rst, w, ck: in std_logic;
		y: buffer std_logic_vector(8 downto 0);
		x: buffer std_logic_vector (8 downto 0);
	 z: out std_logic);
end component;

signal rst, w, ck, z: std_logic;
signal x, y: std_logic_vector(8 downto 0);

begin
process
begin
ck<='0';
wait for 1 ns;
ck<='1';
wait for 1 ns;
end process;

process
begin
rst<='0';
wait for 3 ns;
rst<='1';
w<='1';
wait for 12 ns;
w<='0';
wait;
end process;

p2: part2 port map(rst,w,ck,y,x,z);

end architecture;
