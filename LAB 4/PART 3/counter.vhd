library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity counter is
	port(t,ck,rst: in std_logic;
		Q:out std_logic_vector(15 downto 0));
end entity counter;


architecture bhv of counter is
	signal t_tmp: std_logic_vector(15 downto 0):="0000000000000000";
	begin
	process(ck)
	begin
	if rising_edge(ck) then
		if t='1' then
	
			if RST='0' then
				t_tmp<="0000000000000000";
			else
				t_tmp<=std_logic_vector(unsigned(t_tmp)+1);
			end if;
		end if;
			
	end if;
	end process;
	Q<=t_tmp;
end bhv;
