library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux4to1_10bit is
port( sel: in std_logic_vector(1 downto 0);
		X1, X2,X3, X4: in signed(9 downto 0);
		Xout: out signed(9 downto 0));
end entity;


architecture behv of mux4to1_10bit is
begin
process(sel,X1,X2,X3,X4)
begin
if(sel ="00") then
Xout<=X1;
elsif(sel="01") then
Xout<=X2;
elsif (sel="10") then
Xout<=X3;
else 
Xout<=X4;
end if;

end process;
end architecture; 
