library ieee;
use ieee.std_logic_1164.all;


ENTITY mux2to1_4bit is
port(x,y: in std_logic_vector(3 downto 0);
	sel: in std_logic;
	z: out std_logic_vector(3 downto 0));
end entity;


architecture behv of mux2to1_4bit is
begin
process(x,y,sel)
begin
if(sel='0') then
	z<=x;
elsif(sel ='1') then
	z<=y;
	
end if;

end process;

end architecture;
