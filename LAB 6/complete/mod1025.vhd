library ieee;
use ieee.std_logic_1164.all;

entity mod1025 is
port(ck, inc, rst: in std_logic;
		Q: buffer integer range 0 to 8);
		
end entity;

architecture behv of mod1025 is
begin
process(ck,rst)
begin
if(rst ='1') then 
Q<=0;
elsif(rising_edge(ck)) then
	if(inc = '1') then
		Q<=Q+1;
	end if;
end if;

end process;
end architecture;