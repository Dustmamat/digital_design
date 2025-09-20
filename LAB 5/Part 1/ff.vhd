library ieee;
use ieee.std_logic_1164.all;

--This is a D-type flip flop

entity ff is
port(ck, D: in std_logic;
	 Q: out std_logic);
end entity;


architecture behv of ff is
begin
process(ck)
begin
if(falling_edge(ck)) then
	Q<=D;
end if;
end process;

end architecture;
