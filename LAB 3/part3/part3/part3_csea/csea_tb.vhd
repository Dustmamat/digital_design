library ieee;
use ieee.std_logic_1164.all;


entity tb is
end entity;


architecture testbench of tb is 

component csea 
port(a, b: in std_logic_vector(15 downto 0);
	c_out: out std_logic;
	sum: out std_logic_vector(15 downto 0));
end component;


signal num1, num2, result: std_logic_vector(15 downto 0);
signal c_out: std_logic;


begin
process
begin

num1<="0000000000000000";
num2<="0000000000000000";

wait for 10 ns;

num1<="0000000000000001";
num2<="0000000000000001";
wait for 10 ns;

num1<="0000000000000011";
num2<="0000000000000011";
wait for 10 ns;
wait;
end process;

tb: csea port map(num1,num2,c_out,result);
end architecture;