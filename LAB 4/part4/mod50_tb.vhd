library ieee;
use ieee.std_logic_1164.all;

entity mod50_tb is
end entity;

architecture behv of mod50_tb is

component mod50m
port( clock: in std_logic;
		Q: buffer integer  range 0 to (50);
		enable: out std_logic);
end component;

signal ck: std_logic;
signal count: integer range 0 to (50);
signal output: std_logic;
begin
process
begin
ck<='0';
wait for 1 ns;
ck<='1';
wait for 1 ns;
end process;

uut: mod50m port map(ck,count,output);
end architecture;