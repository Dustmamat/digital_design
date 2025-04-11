library ieee;
use ieee.std_logic_1164.ALL;

entity tff1 is
	port( T, ck, RST: in std_logic;
	Q: out std_logic
	);
end entity;

architecture bhv of tff1 is
	signal t_tmp: std_logic:='0';
	begin
	process(ck)
	begin
	if rising_edge(ck) then
		if RST='0' then
			t_tmp<='0';
		else
			t_tmp<=T xor t_tmp;
		end if;
	end if;
	end process;
	Q<=t_tmp;
end bhv;
			