library ieee;
use ieee.std_logic_1164.all;
entity part1_tb is
end entity;
architecture bhv of part1_tb is
	component part1
	port( Clk, R, S : IN STD_LOGIC; 
	Q : OUT STD_LOGIC); 
	END component;
	signal R_g, S_g, ck: std_logic;
	signal Q   : std_logic;
	CONSTANT clk_period : time := 10 ns;
	begin
	clk_process :process
    	begin
        ck <= '0';
        wait for clk_period/2;
        ck <= '1';
        wait for clk_period/2;
	ck <= '0';
        wait for clk_period/2;
        ck <= '1';
        wait for clk_period/2;
	ck <= '0';
        wait for clk_period/2;
        ck <= '1';
        wait for clk_period/2;
	wait;
   	end process;

	process
	begin
	
	R_g<='0';
	S_g<='1';
	wait for clk_period;
	S_g<='0';
	wait for clk_period;
	R_g<='1';
	wait for clk_period;
	wait;
	end process;
	uut: part1 port map ( ck, R_g, S_g, Q);
end bhv;


