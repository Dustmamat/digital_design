library ieee;
use ieee.std_logic_1164.all;


entity ovf is
port(a, b, sum: in std_logic_vector(15 downto 0);
	c_out: in std_logic;
	 isovf: out std_logic);
	
end entity;

architecture behv of ovf is
begin
process(a,b,sum,c_out)


variable msb_carry: std_logic;


begin
msb_carry := a(15) xor b(15) xor sum(15);

isovf<= msb_carry xor c_out;
end process;
end architecture;
