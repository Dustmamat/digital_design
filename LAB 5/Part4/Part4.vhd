LIBRARY ieee;
USE ieee.std_logic_1164.all; 
use ieee.numeric_std.all;


entity Part4 is
port(CLOCK_50: IN std_logic;
	Q: buffer integer  range 0 to (50e6-1);
	KEY: in std_logic_vector(0 downto 0);
	HEX0,HEX1,HEX2,HEX3,HEX4,HEX5: out std_logic_vector(0 to 6));
	
end entity Part4;

architecture arch of Part4 is

component Clock1s is
port( clock: in std_logic;
		Q: buffer integer  range 0 to (50e6-1);
		enable: out std_logic);
end component;

TYPE State_type IS (A, B, C, D, E, F, X);
SIGNAL cs, fs : State_type;
signal en: std_logic;

signal count: integer range 0 to 6;
begin 
ck: Clock1s port map (CLOCK_50,Q,en);




process(CLOCK_50,KEY(0))

BEGIN 
	if (KEY(0))='0' then
		cs<=A;
		count<=0;
elsif(rising_edge(CLOCK_50)) then
if (en='1') then
	if (count < 6) then
		cs<=A;
		count<=count+1;
	elsif(count=6) then
		cs<=fs;
	end if;
end if;
end if;
end process;

process (cs)
begin 

case cs is
	when A=>
	fs<=X;
	when X=>
	fs<=B;
	when B=>
	fs<=C;
	when c=>
	fs<=D;
	when D=>
	fs<=E;
	when E=>
	fs<=F;
	when F=>
	fs<=X;	
	when others=>
	fs<=A;
end case;
end process;

process (cs)
variable H, Edisp, L, O, space : std_logic_vector(0 to 6);
begin 
H:="1001000";
Edisp:="0110000";
L:="1110001";
O:="0000001";
space:="1111111";
case cs is
	when A=>
	HEX5<=H;
	HEX4<=Edisp;
	HEX3<=L;
	HEX2<=L;
	HEX1<=O;
	HEX0<=space;
	when B=>
	HEX5<=Edisp;
	HEX4<=L;
	HEX3<=L;
	HEX2<=O;
	HEX1<=space;
	HEX0<=H;
	when C=>
	HEX5<=L;
	HEX4<=L;
	HEX3<=O;
	HEX2<=space;
	HEX1<=H;
	HEX0<=Edisp;
	when D=>
	HEX5<=L;
	HEX4<=O;
	HEX3<=space;
	HEX2<=H;
	HEX1<=Edisp;
	HEX0<=L;
	when E=>
	HEX5<=O;
	HEX4<=space;
	HEX3<=H;
	HEX2<=Edisp;
	HEX1<=L;
	HEX0<=L;
	when F=>
	HEX5<=space;
	HEX4<=H;
	HEX3<=Edisp;
	HEX2<=L;
	HEX1<=L;
	HEX0<=O;
	when X=>
	HEX5<=H;
	HEX4<=Edisp;
	HEX3<=L;
	HEX2<=L;
	HEX1<=O;
	HEX0<=space;
end case;
end process;
end architecture;