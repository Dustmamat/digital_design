LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY overflow IS
PORT(s, c4: IN STD_LOGIC;
	in1,in2, out1: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	ovf: OUT STD_LOGIC);
END ENTITY;


ARCHITECTURE ovf_circuit OF overflow IS
BEGIN

PROCESS(c4, in1,in2, out1)
variable msb_carry : STD_LOGIC;
BEGIN
msb_carry:= in1(3) xor (in2(3) xor s) xor out1(3);
ovf<=msb_carry xor c4;
END PROCESS;

END ARCHITECTURE;

