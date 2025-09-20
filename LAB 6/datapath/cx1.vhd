library ieee;
use ieee.std_logic_1164.all;

entity cx1 is
port(X1: in integer range 0 to 1024;
		eq: out std_logic);
end entity;

architecture behv of cx1 is 
begin
process(X1)
begin
if(X1 = 1024) then
	eq <='1';
else 
	eq<='0';
end if;
end process;

end architecture;