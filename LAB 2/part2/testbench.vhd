library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end entity;


architecture behv of testbench is

component part2 
PORT ( SW : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
HEX0,HEX1,HEX2,HEX3,HEX4 : OUT STD_LOGIC_VECTOR(0 TO 6));
end component;

signal sel: std_logic_vector(1 downto 0);
signal rot: std_logic_vector(2 downto 0);
signal hex0_tb: std_logic_vector(0 to 6);
signal hex1_tb: std_logic_vector(0 to 6);
signal hex2_tb: std_logic_vector(0 to 6);
signal hex3_tb: std_logic_vector(0 to 6);
signal hex4_tb: std_logic_vector(0 to 6);

signal inputs: std_logic_vector(4 downto 0);
begin

process
begin
sel<="00";
rot<="000";
wait for 15 ns;
sel<="00";
rot<="001";
wait for 15 ns;
sel<="00";
rot<="010";
wait for 15 ns;
sel<="00";
rot<="011";
wait for 15 ns;
sel<="00";
rot<="100";
wait for 15 ns;
sel<="01";
rot<="000";
wait for 15 ns;
sel<="01";
rot<="001";
wait for 15 ns;
wait;

end process;

inputs<=rot & sel;
uut: part2 port map(inputs, hex0_tb,hex1_tb,hex2_tb,hex3_tb,hex4_tb);
end architecture;