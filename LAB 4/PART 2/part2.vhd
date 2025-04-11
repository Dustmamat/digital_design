library ieee;
use ieee.std_logic_1164.ALL;

entity part2 is
	port(SW: in std_logic_vector (1 downto 0);
	KEY: in std_logic_vector(0 downto 0);
	HEX0, HEX1, HEX2, HEX3: out std_logic_vector (0 to 6);
	Qout: out std_logic_vector(15 downto 0));
end entity;

architecture str of part2 is
	
	component sixteentff
	port (E, ck, RST: in std_logic;
	Q: out std_logic_vector (15 downto 0)
	);
	end component;
	component decoder
	port (hex_in : in std_logic_vector(3 downto 0); 
        seg_out : out std_logic_vector(0 to 6) 
    	);
	end component;
	signal Q_tmp: std_logic_vector(15 downto 0):="0000000000000000";
	begin
	
	todisplay: sixteentff port map (SW(1), KEY(0),SW(0),  Q_tmp);
	display0: decoder port map(Q_tmp(3 downto 0), HEX0);
	display1: decoder port map(Q_tmp(7 downto 4), HEX1);
	display2: decoder port map(Q_tmp(11 downto 8), HEX2);
	display3: decoder port map(Q_tmp(15 downto 12), HEX3);
	Qout<=Q_tmp;
end str;
	
