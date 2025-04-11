library ieee;
use ieee.std_logic_1164.ALL;

entity fourtff is
	port(
	E, ck, RST: in std_logic;
	Q: out std_logic_vector(3 downto 0);
	Tout: out std_logic
	);
end entity;

architecture str of fourtff is
	signal Q_tmp: std_logic_vector (3 downto 0):="0000";
	signal T_tmp: std_logic_vector (3 downto 0):="0000";
	component tff1
	port( T, ck, RST: in std_logic;
	Q: out std_logic
	);
	end component;
	begin
	dig0: tff1 port map(E, ck, RST, Q_tmp(0));
	T_tmp(0)<=Q_tmp(0) and E;
	dig1: tff1 port map(T_tmp(0), ck, RST, Q_tmp(1));
	T_tmp(1)<=Q_tmp(1) and T_tmp(0);
	dig2: tff1 port map(T_tmp(1), ck, RST, Q_tmp(2));
	T_tmp(2)<=Q_tmp(2) and T_tmp(1);
	dig3: tff1 port map(T_tmp(2), ck, RST, Q_tmp(3));
	T_tmp(3)<=Q_tmp(3) and T_tmp(2);
	Q<=Q_tmp;
	Tout<=T_tmp(3);
end str;
