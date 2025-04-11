
library ieee;
use ieee.std_logic_1164.ALL;

entity sixteentff is
	port(E, ck, RST: in std_logic;
	Q: out std_logic_vector (15 downto 0)
	);
end entity;

architecture str of sixteentff is
	signal Q_tmp:std_logic_vector(15 downto 0):="0000000000000000";
	signal T_tmp: std_logic_vector(3 downto 0):="0000";
	component fourtff
	port( E, ck, RST: in std_logic;
	Q: out std_logic_vector (3 downto 0);
	Tout: out std_logic
	);
	end component;
	begin
	num0: fourtff port map (E, ck, RST, Q_tmp(3 downto 0), T_tmp(0));
	num1: fourtff port map (T_tmp(0), ck, RST, Q_tmp(7 downto 4), T_tmp(1));
	num2: fourtff port map (T_tmp(1), ck, RST, Q_tmp(11 downto 8), T_tmp(2));
	num3: fourtff port map (T_tmp(2), ck, RST, Q_tmp(15 downto 12), T_tmp(3));
	Q<=Q_tmp;
end str;
 