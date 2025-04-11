LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY part3 IS
PORT(
    SW: IN std_logic_vector(3 DOWNTO 0);
    hex1, hex0 : OUT std_logic_vector (6 DOWNTO 0)
);
END ENTITY;

ARCHITECTURE structure OF part3 IS 

SIGNAL m : std_logic_vector(3 DOWNTO 0);
SIGNAL z : std_logic;
SIGNAL Aout : std_logic_vector(2 DOWNTO 0);

COMPONENT lab2_3_mux IS
    PORT (
        z : IN STD_LOGIC;
        V : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        A : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        m : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
    );
END COMPONENT;

COMPONENT lab2_3_comparator IS
PORT (
        V : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        z : OUT STD_LOGIC
    );
END COMPONENT;

COMPONENT lab2_3_circuitA IS
    PORT (
        V : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        A : OUT STD_LOGIC_VECTOR (2 DOWNTO 0)
    );
END COMPONENT;

COMPONENT lab2_3_circuitB IS
    PORT (
        z : IN STD_LOGIC;
        d1 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)  
    );
END COMPONENT;

COMPONENT lab2_3_decoder0 IS
    PORT (
        num : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        seg : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
    );
END COMPONENT;

BEGIN 


com: lab2_3_comparator PORT MAP (SW, z);
cirA: lab2_3_circuitA PORT MAP (SW(2 DOWNTO 0), Aout); 
mux: lab2_3_mux PORT MAP (z, SW, Aout, m);
cirB: lab2_3_circuitB PORT MAP (z, hex1);
dec0: lab2_3_decoder0 PORT MAP (m, hex0); 

END structure;

