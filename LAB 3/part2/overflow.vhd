LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY overflow IS
PORT(c3, c4: IN STD_LOGIC;
	ovf: OUT STD_LOGIC);
END ENTITY;


ARCHITECTURE ovf_circuit OF overflow IS
BEGIN
ovf<=c3 xor c4;
END ARCHITECTURE;

