library ieee;
use ieee.std_logic_1164.all;

entity mod10 is
port( en, clock: in std_logic;
		Q: buffer integer  range 0 to (10-1));
end entity;


architecture behv of mod10 is
begin
process(clock)
begin
	if(clock'event and clock = '1') then
		if(en = '1') then
			if(Q=(10-1))then
				Q<=0;
			else
				Q<=Q+1;
			end if;
	end if;
end if;
end process;
end architecture;
	
