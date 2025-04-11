library ieee;
use ieee.std_logic_1164.all;


entity part4_tb is
end entity;



architecture tb of part4_tb is

component part4
port(ck: in std_logic;
	count: out std_logic_vector(3 downto 0));
end component;

signal ck: std_logic;
signal output: std_logic_vector(3 downto 0);

begin 
process
begin 
ck<='1';
wait for 10 ns;
ck<='0';
wait for 10 ns;
end process;

uut: part4 port map(ck,output);
end architecture;
