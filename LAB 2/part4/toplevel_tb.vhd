LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity toplevel_tb is
end entity;

architecture bhv of toplevel_tb is
	signal input: std_logic_vector(5 downto 0):="000000";
	signal out0, out1: std_logic_vector(6 downto 0);	
	component toplevel
	port(
	SW: in std_logic_vector (5 downto 0);
	HEX0: out std_logic_vector(6 downto 0);
	HEX1: out std_logic_vector(6 downto 0)
	);
	end component;
	
	begin
	displayout: toplevel port map (SW=>input , HEX0=>out0 , HEX1=>out1);
	process
	begin
	input<="000000";
	wait for 20 ns;
	input<="110000";
	wait for 20 ns;
	input<="111100";
	wait for 20 ns;
	input<="001100";
	wait for 20 ns;
	wait;
	end process;
end bhv;