LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY multiplier IS
    PORT (
        A   : IN std_logic_vector( 3 DOWNTO 0);
	B   : IN std_logic_vector( 3 DOWNTO 0);
	P  : OUT std_logic_vector(7 DOWNTO 0)
    );
END multiplier;

ARCHITECTURE structure OF multiplier IS
    SIGNAL PP0: std_logic_vector(3 downto 0);
    SIGNAL PP1: std_logic_vector(3 downto 0);
    SIGNAL PP2: std_logic_vector(3 downto 0);
    SIGNAL PP3: std_logic_vector(3 downto 0);
    SIGNAL s0,s1, s2, s3 : std_logic_vector(4 DOWNTO 0);
    SIGNAL c1, c2, c3 : std_logic_vector(2 DOWNTO 0);

 
    COMPONENT  rca IS
    	PORT( 
        	X, Y : IN std_logic_vector(3 DOWNTO 0); -- 4-bit input vectors
        	C0   : IN std_logic;  -- Initial carry-in
        	S    : OUT std_logic_vector(3 DOWNTO 0); -- 4-bit sum output
        	Cout : OUT std_logic  -- Final carry-out 

    	);
    END COMPONENT;

    COMPONENT partial_product IS
    	PORT (
        	A : IN std_logic_vector(3 DOWNTO 0);
		B : IN std_logic;
        	PP   : OUT std_logic_vector(3 DOWNTO 0)
 	 );
    END COMPONENT;
BEGIN
    -- partial products
    pp_1: partial_product port map ( A, B(0),PP0);
    pp_2: partial_product port map ( A, B(1),PP1);
    pp_3: partial_product port map ( A, B(2),PP2);
    pp_4: partial_product port map ( A, B(3),PP3);
    s0(4) <= '0';
    s0(3 downto 0) <= PP0;

    -- First Reduction Stage (Using Full Adders)
    stage1: rca port map ( PP1, s0(4 downto 1), '0', s1(3 downto 0), s1(4));
    
    -- Second Reduction Stage (Using Full Adders)
    stage2: rca port map ( PP2, s1(4 downto 1), '0', s2(3 downto 0), s2(4));

    -- Third Reduction Stage (Using Full Adders)
    stage3: rca port map ( PP3, s2(4 downto 1), '0', s3(3 downto 0), s3(4));
    P(0) <= s0(0);
    P(1) <= s1(0);
    P(2) <= s2(0);
    P(7 DOWNTO 3) <= s3(4 DOWNTO 0);
    
END structure;
