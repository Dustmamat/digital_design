library ieee;
use ieee.std_logic_1164.all;

entity part2_complete is
port( SW: in std_logic_vector(8 downto 0);
		KEY: IN std_logic_vector(1 downto 0);
		LEDR: OUT std_logic_vector(9 downto 9);
	HEX0, HEX1, HEX2: OUT std_logic_vector(0 to 6));
end entity;


architecture behv of part2_complete is

component part1
PORT( num1, num2: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	ck, rst, s: IN STD_LOGIC;
	sum: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	ovf: OUT STD_LOGIC);
end component;

component decoder
    port(
        hex_in : in std_logic_vector(3 downto 0); -- 4-bit Hexadecimal Input
        seg_out : out std_logic_vector(0 to 6) -- 7-Segment Outputs (Active Low)
    );
end component;

signal sum_output: std_logic_vector(3 downto 0);

BEGIN
whole_circuit: part1 port map(SW(3 downto 0), SW(7 DOWNTO 4), KEY(1), KEY(0),SW(8),sum_output, LEDR(9));
decoder1: decoder port map(SW(3 downto 0), HEX2);
decoder2: decoder port map(SW(7 downto 4), HEX1);
decoder3: decoder port map(sum_output,HEX0);

end architecture;
		
