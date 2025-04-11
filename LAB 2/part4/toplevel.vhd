LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity toplevel is
	port(
	SW: in std_logic_vector (5 downto 0);
	HEX0: out std_logic_vector(6 downto 0);
	HEX1: out std_logic_vector(6 downto 0)
	);
end entity;

architecture str of toplevel is
	component comparatormain
	port(
	A: in std_logic_vector(5 downto 0);
	TENS: out std_logic_vector(3 downto 0);
	ONES: out std_logic_vector(3 downto 0)
	);
	end component;
	component comparatorled
	port(
	A: in std_logic_vector (3 downto 0);
	U: out std_logic_vector (6 downto 0)
	);
	end component;
	signal TEN, ONE: std_logic_vector(3 downto 0);
	begin
	bintobcd :comparatormain port map (SW, TEN, ONE);
	tensdisplay: comparatorled port map (TEN, HEX1);
	onesdisplay: comparatorled port map (ONE, HEX0);
end str;