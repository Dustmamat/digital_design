library ieee;
use ieee.std_logic_1164.all;

entity Clock1s is
port( clock: in std_logic;
		Q: buffer integer  range 0 to (50e6-1);
		enable: out std_logic);
end entity;


architecture behv of Clock1s is
begin
process(clock)
begin
	if(clock'event and clock = '1') then
		if(Q=(50e6-1))then
			enable<='1';
			Q<=0;
		else
			Q<=Q+1;
			enable<='0';
		end if;
	end if;
end process;
end architecture;
	

