library ieee;
use ieee.std_logic_1164.all;

entity part4 is
port( SW: in std_logic_vector(7 downto 0);
	HEX0, HEX1, HEX2, HEX3: OUT std_logic_vector(0 to 6));
end entity;


architecture behv of part4 is

component multiplier is
	 PORT (
        A   : IN std_logic_vector( 3 DOWNTO 0);
	B   : IN std_logic_vector( 3 DOWNTO 0);
	P  : OUT std_logic_vector(7 DOWNTO 0)
    );
end component;

component decoder
    port(
        hex_in : in std_logic_vector(3 downto 0); 
        seg_out : out std_logic_vector(0 to 6) 
    );
end component;

signal product: std_logic_vector(7 downto 0);

BEGIN
whole_circuit: multiplier port map(SW(3 downto 0), SW(7 DOWNTO 4), product);
decoder1: decoder port map(SW(3 downto 0), HEX0);
decoder2: decoder port map(SW(7 downto 4), HEX1);
decoder3: decoder port map(product(3 downto 0),HEX2);
decoder4: decoder port map (product(7 downto 4), HEX3);
end architecture;
