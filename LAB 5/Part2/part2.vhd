library ieee;
use ieee.std_logic_1164.all;

entity part2 is
port(rst, w, ck: in std_logic;
		y: buffer std_logic_vector(8 downto 0);
		x: buffer std_logic_vector (8 downto 0);
	 z: out std_logic);
end entity;


architecture one_hot_fsm of part2 is

component ff
port(ck, D: in std_logic;
	 Q: out std_logic);
end component;



begin
y1: ff port map(ck, y(0), x(0));
y2: ff port map(ck, y(1), x(1));
y3: ff port map (ck, y(2), x(2));
y4: ff port map(ck, y(3), x(3));
y5: ff port map(ck, y(4), x(4));
y6: ff port map(ck, y(5), x(5));
y7: ff port map(ck, y(6), x(6));
y8: ff port map(ck, y(7), x(7));
y9: ff port map(ck, y(8), x(8));

y(0)<= rst;

y(1)<= rst and ((not(w) and not(x(0))) or (not(w) and x(5)) or (not(w) and x(6)) or (not(w) and x(7)) or (not(w) and x(8)));
y(2) <= rst and (not(w) and x(1));
y(3) <= rst and (not(w) and x(2));
y(4) <= rst and ((not(w) and x(3)) or (not(w) and x(4)));


y(5) <= rst and ((w and not(x(0))) or (w and x(1)) or (w and x(2)) or (w and x(3)) or (w and x(4)));

y(6) <= rst and (w and x(5));

y(7) <= rst and (w and x(6));

y(8) <= rst and( (w and x(7)) or (w and x(8)));

z<= x(4) or x(8);
end architecture;