LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY partial_product IS
    PORT (
        A : IN std_logic_vector(3 DOWNTO 0);
	b : IN std_logic;
        PP   : OUT std_logic_vector(3 DOWNTO 0)
    );
END partial_product;

ARCHITECTURE behavior OF partial_product IS
BEGIN
    PP(0)  <= (A(0) AND b);
    PP(1)  <= (A(1) AND b);
    PP(2)  <= (A(2) AND b);
    PP(3)  <= (A(3) AND b);
    
END behavior;
