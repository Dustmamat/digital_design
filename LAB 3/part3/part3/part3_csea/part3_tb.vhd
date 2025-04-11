LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY final_tb IS
END ENTITY;

ARCHITECTURE final_testbench OF final_tb IS

COMPONENT part3_cska
PORT( num1, num2: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	ck, rst: IN STD_LOGIC;
	sum: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	isovf: OUT STD_LOGIC);
END COMPONENT;

SIGNAL A, B, C: STD_LOGIC_VECTOR(15 DOWNTO 0); -- Extended to 16 bits
SIGNAL ck, rst, isovf: STD_LOGIC;

BEGIN

gen_clockG: PROCESS
BEGIN
    ck <= '0';
    WAIT FOR 1 ns;
    ck <= '1';
    WAIT FOR 1 ns;
END PROCESS;

test: PROCESS
BEGIN
    rst <= '0';
    rst <= '1';

    
    -- ALL THE FOLLOWING OPERATIONS ARE IN ADDITION MODE
    A <= "0000000000000000";
    B <= "0000000000000000";
    WAIT FOR 10 ns;
    
    A <= "0000000000000001";
    B <= "0000000000000001";
    WAIT FOR 10 ns;
    
    A <= "0000000000000100";
    B <= "0000000000000011";
    WAIT FOR 10 ns;
    
    A <= "0000000000000111";
    B <= "0000000000000001";
    WAIT FOR 10 ns;
    
    A <= "0000000000001000";
    B <= "0000000000001111";
    WAIT FOR 10 ns;
    
    A <= "0000000000001001";
    B <= "0000000000000111";
    WAIT FOR 10 ns;
    
    A <= "0000000000000101";
    B <= "0000000000000010";
    WAIT FOR 10 ns;
    
    A <= "0000000000001000";
    B <= "0000000000001111";
    WAIT FOR 10 ns;

    rst <= '0'; -- Activate reset
    WAIT FOR 10 ns;
    rst <= '1';

    A <= "0000000000000111";
    B <= "0000000000000001";
    WAIT FOR 10 ns;

    A <= "0000000000001000";
    B <= "0000000000001000";
    WAIT FOR 10 ns;
    
	A <= "1000000000000000";
	B <= "1111111111111111";
    WAIT;
END PROCESS;

p2: part3_cska PORT MAP(A, B, ck, rst, C, isovf);

END ARCHITECTURE;

