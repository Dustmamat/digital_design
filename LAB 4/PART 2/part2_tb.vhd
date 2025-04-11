LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY part2_tb IS
END entity;

architecture bhv of part2_tb is
	component part2
	port(SW: in std_logic_vector (1 downto 0);
	KEY: in std_logic_vector (0 downto 0);
	HEX0, HEX1, HEX2, HEX3: out std_logic_vector (6 downto 0);
	Qout: out std_logic_vector(15 downto 0));
	end component;
	signal SW_tb: std_logic_vector(1 downto 0):="00";
	signal KEY0_tb: std_logic_vector (0 downto 0):="0";
	signal HEX0_tb, HEX1_tb, HEX2_tb, HEX3_tb: std_logic_vector (6 downto 0):="0000000";
	signal Qout_tb :  std_logic_vector(15 downto 0):="0000000000000000";
	begin
	uut: part2 port map (SW=>SW_tb, KEY=>KEY0_tb, HEX0=>HEX0_tb, HEX1=>HEX1_tb, HEX2=>HEX2_tb, HEX3=>HEX3_tb, Qout=>Qout_tb);
	process
	begin
	SW_tb(0)<='1';
	SW_tb(1)<='1';
	KEY0_tb<="0"; wait for 10ns; KEY0_tb<="1"; wait for 10ns;
	
end process;

end bhv;