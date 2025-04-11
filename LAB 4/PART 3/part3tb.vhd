library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity tb is
end entity;


architecture str of tb is

component Part3toplvl is
port(SW: in std_logic_vector (1 downto 0);
	KEY: in std_logic_vector(0 downto 0);
	HEX0, HEX1, HEX2, HEX3: out std_logic_vector (6 downto 0);
	Qout: out std_logic_vector(15 downto 0));
end component;
signal r,t,ck: std_logic;
signal displ0,displ1,displ2,displ3: std_logic_vector(6 downto 0);
signal O: std_logic_vector(15 downto 0);
begin

porta: Part3toplvl  port map (SW(0)=>r,SW(1)=>t,KEY(0)=>ck,HEX0=>displ0,HEX1=>displ1,HEX2=>displ2,HEX3=>displ3,Qout=>O);
process
begin
ck<='0';
t<='1';
r<='1';
wait for 20 ns;
ck<='1';
t<='1';
r<='1';
wait for 20 ns;
ck<='0';
t<='1';
r<='1';
wait for 20 ns;
ck<='1';
t<='1';
r<='1';
wait for 20 ns;
ck<='0';
t<='1';
r<='1';
wait for 20 ns;
ck<='1';
t<='1';
r<='1';
wait for 20 ns;
wait ;
end process;
end architecture;
