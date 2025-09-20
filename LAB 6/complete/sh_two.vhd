library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sh_two is
port(Xin: in signed(7 downto 0);
	Xout: out signed(9 downto 0));
end entity;


architecture behv of sh_two is
begin
Xout<=-shift_left(resize(Xin,10),1);
end architecture;
