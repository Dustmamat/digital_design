LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity comparatormain is
    port(
        A: in std_logic_vector(5 downto 0);
        TENS: out std_logic_vector(3 downto 0);
        ONES: out std_logic_vector(3 downto 0)
    );
end entity;

architecture bhv of comparatormain is
    
begin
    process(A)
	variable unsigned_A : unsigned(5 downto 0); 
    begin
        unsigned_A := unsigned(A); 

        if unsigned_A < 10 then
            TENS <= "0000";
            ONES <= std_logic_vector(unsigned_A(3 downto 0)); 
        elsif unsigned_A < 20 then
            TENS <= "0001";
            ONES <= std_logic_vector(resize(unsigned_A - 10, 4));
        elsif unsigned_A < 30 then
            TENS <= "0010";
            ONES <= std_logic_vector(resize(unsigned_A - 20, 4)); 
        elsif unsigned_A < 40 then
            TENS <= "0011";
            ONES <= std_logic_vector(resize(unsigned_A - 30, 4)); 
        elsif unsigned_A < 50 then
            TENS <= "0100";
            ONES <= std_logic_vector(resize(unsigned_A - 40, 4)); 
        elsif unsigned_A < 60 then
            TENS <= "0101";
            ONES <= std_logic_vector(resize(unsigned_A - 50, 4)); 
        elsif unsigned_A < 70 then
            TENS <= "0110";
            ONES <= std_logic_vector(resize(unsigned_A - 60, 4)); 
        end if;
    end process;
end architecture bhv;