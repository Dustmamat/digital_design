library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity part4 is
port(ck: in std_logic;
	count: out std_logic_vector (3 downto 0));
end entity;



architecture behv of part4 is 

component mod10
port( en, clock: in std_logic;
		Q: buffer integer  range 0 to (10-1));
end component;

component mod50m
port( clock: in std_logic;
		Q: buffer integer  range 0 to (50e6-1);
		enable: out std_logic);
end component;

signal Q_50: integer range 0 to (50e6-1);
signal Q_10: integer range 0 to 9;
signal enable_intermediate: std_logic;
begin
mod50m_1: mod50m port map(ck, Q_50, enable_intermediate);
mod10_1: mod10 port map(enable_intermediate, ck, Q_10);
count<=std_logic_vector(to_unsigned(Q_10, count'length));
end architecture;