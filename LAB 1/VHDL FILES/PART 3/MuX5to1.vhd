LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MUX5TO1 IS
	PORT (
	SW: IN STD_LOGIC_VECTOR (8 DOWNTO 0);
	LEDR: OUT STD_LOGIC_VECTOR (2 DOWNTO 0));
END ENTITY;


ARCHITECTURE STR OF MUX5TO1 IS
	COMPONENT MUX2TO1
	PORT(
	X: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
	Y: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
	S: IN STD_LOGIC;
	M: OUT STD_LOGIC_VECTOR (2 DOWNTO 0));
	END COMPONENT;
	
	SIGNAL M1 : STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL M2 : STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL M3 : STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL U : STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL V : STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL W : STD_LOGIC_VECTOR (2 DOWNTO 0);

	BEGIN
	U<="101";
	V<="010";
	W<="111";
	MUX1: MUX2TO1 PORT MAP (X=>W, Y=> SW (2 DOWNTO 0), S=> SW(6), M=>M1);
	MUX2: MUX2TO1 PORT MAP (X=>U, Y=>V, S=>SW(6), M=>M2);
	MUX3: MUX2TO1 PORT MAP(X=>M2, Y=>M1, S=>SW(7), M=>M3);
	MUX4: MUX2TO1 PORT MAP( X=>M3, Y=> SW(5 DOWNTO 3), S=>SW(8), M=>LEDR);

END STR;












































































































































































































































































