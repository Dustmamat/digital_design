LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fa is
PORT(a,b,c_in: IN STD_LOGIC;
	s,c_out: OUT STD_LOGIC);
END ENTITY;


ARCHITECTURE behv of fa IS
BEGIN

s<=a xor b xor c_in;
c_out<= (a and b) or (a and c_in) or (b and c_in);

END ARCHITECTURE;