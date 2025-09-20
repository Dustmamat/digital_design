library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity adder is
port(A, B: in signed(9 downto 0);
		C: out signed(9 downto 0));
end entity;


architecture behv of adder is
begin
C<=A+B;
end architecture;