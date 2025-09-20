



LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY toplevel_tb IS
END entity;
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY toplevel_tb IS
END entity;


architecture bhv of toplevel_tb is
	component toplevel
	PORT ( SW : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
	KEY : IN STD_LOGIC_VECTOR(3 downto 0);
	LEDR : OUT STD_LOGIC_VECTOR(9 downto 0));
	end component;
	signal RST, input: std_logic;
	signal output: std_logic_vector(9 downto 0);
	signal CK: std_logic_vector(3 downto 0);
	signal SW_tb: std_logic_vector(1 downto 0);
	begin
	
	process
	begin
	
	SW_tb<="00";
	CK(0)<='0'; wait for 10ns; CK(0)<='1'; wait for 10ns;
	CK(0)<='0'; wait for 10ns; CK(0)<='1'; wait for 10ns;
	CK(0)<='0'; wait for 10ns; CK(0)<='1'; wait for 10ns;
	SW_tb<="01";
	CK(0)<='0'; wait for 10ns; CK(0)<='1'; wait for 10ns;
	CK(0)<='0'; wait for 10ns; CK(0)<='1'; wait for 10ns;
	CK(0)<='0'; wait for 10ns; CK(0)<='1'; wait for 10ns;
	CK(0)<='0'; wait for 10ns; CK(0)<='1'; wait for 10ns;
	CK(0)<='0'; wait for 10ns; CK(0)<='1'; wait for 10ns;
	CK(0)<='0'; wait for 10ns; CK(0)<='1'; wait for 10ns;
	SW_tb<="11";
	CK(0)<='0'; wait for 10ns; CK(0)<='1'; wait for 10ns;
	CK(0)<='0'; wait for 10ns; CK(0)<='1'; wait for 10ns;
	CK(0)<='0'; wait for 10ns; CK(0)<='1'; wait for 10ns;
	CK(0)<='0'; wait for 10ns; CK(0)<='1'; wait for 10ns;
	CK(0)<='0'; wait for 10ns; CK(0)<='1'; wait for 10ns;
	CK(0)<='0'; wait for 10ns; CK(0)<='1'; wait for 10ns;
	CK(0)<='0'; wait for 10ns; CK(0)<='1'; wait for 10ns;
	wait;
	end process;
	uut: toplevel port map (SW=>SW_tb, KEY=>CK, LEDR=>output);
end bhv;
	

