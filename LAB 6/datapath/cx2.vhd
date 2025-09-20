library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity cx2 is 
port(Xin: in signed(9 downto 0);
	 Xout: out signed(7 downto 0));
	 
end entity;


architecture behv of cx2 is 
begin
process(Xin)
begin
if (Xin >= to_signed(-128, 10) and Xin <= to_signed(127, 10)) then
	Xout <= resize(Xin,8);
elsif(Xin<to_signed(-128,10)) then
	Xout<=to_signed(-128,8);
else	
	Xout<=to_signed(127,8);

end if;
end process;
end architecture;