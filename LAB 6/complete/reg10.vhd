library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity reg10 is
port( ck, ld, rst: in std_logic;
	D: in signed(9 downto 0);
	Q: out signed(9 downto 0));
	
end entity;



architecture behv of reg10 is 
begin
process(ck, rst)
begin
if(rst ='1') then
	Q<=(OTHERS=>'0');
elsif(rising_edge(ck))then
	if(ld='1') then
		Q<=D;
	end if;
end if;

end process;
end architecture;
