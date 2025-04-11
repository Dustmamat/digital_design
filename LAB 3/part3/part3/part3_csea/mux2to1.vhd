library ieee;
use ieee.std_logic_1164.all;

entity mux2to1 is
port(x,y,sel: in std_logic;
	z: out std_logic);
end entity;


architecture behv of mux2to1 is
begin
process(x,y,sel)
begin
if(sel='0') then
	z<=x;
elsif(sel='1') then
	z<=y;
end if;
end process;
end architecture;