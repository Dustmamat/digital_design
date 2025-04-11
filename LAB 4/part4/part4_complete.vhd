library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity part4_complete is
port(CLOCK_50: in std_logic;
	HEX0: out std_logic_vector (0 to 6));
end entity;



architecture behv of part4_complete is 

component mod10
port( en, clock: in std_logic;
		Q: buffer integer  range 0 to (10-1));
end component;

component mod50m
port( clock: in std_logic;
		Q: buffer integer  range 0 to (50e6-1);
		enable: out std_logic);
end component;

component decoder
    port(
        hex_in : in std_logic_vector(3 downto 0); -- 4-bit Hexadecimal Input
        seg_out : out std_logic_vector(0 to 6) -- 7-Segment Outputs (Active Low)
    );
end component;

signal Q_50: integer range 0 to (50e6-1);
signal Q_10: integer range 0 to 9;
signal count: std_logic_vector(3 downto 0);
signal enable_intermediate: std_logic;
begin
mod50m_1: mod50m port map(CLOCK_50, Q_50, enable_intermediate);
mod10_1: mod10 port map(enable_intermediate, CLOCK_50, Q_10);
count<=std_logic_vector(to_unsigned(Q_10, 4));
dec1: decoder port map(count,HEX0);
end architecture;
