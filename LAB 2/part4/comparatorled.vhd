LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
entity comparatorled is 
	port( 
	A: in std_logic_vector (3 downto 0);
	U: out std_logic_vector (6 downto 0)
	);
end entity;
architecture bhv of comparatorled is
	begin
	process(A)
	begin
		if A(3 downto 0)= "1001" then --9
		U <= "0010000";
		elsif A(3 downto 0)= "1000" then --8
		U <= "0000000";
		elsif A(3 downto 0)= "0111" then --7
		U <= "1111000";
		elsif A(3 downto 0)= "0110" then --6
		U <= "0000010";
		elsif A(3 downto 0)= "0101" then --5
		U <= "0010010";
		elsif A(3 downto 0)= "0100" then --4
		U <= "0011001";
		elsif A(3 downto 0)= "0011" then --3
		U <= "0110000";
		elsif A(3 downto 0)= "0010" then --2
		U <= "0100100";
		elsif A(3 downto 0)= "0001" then --1
		U <= "1001111";
		elsif A(3 downto 0)= "0000" then --0
		U <= "1000000";
		end if;
	end process;
end bhv;

