library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity output_mem is
    port (
        CLK      : in std_logic;
        WE       : in std_logic;
        ADDR     : in std_logic_vector(2 downto 0);
        DATA_IN  : in signed(7 downto 0);
        DATA_OUT : out signed(7 downto 0)
    );
end entity;

architecture rtl of output_mem is
    type mem_array is array (0 to 7) of signed(7 downto 0);
    signal mem : mem_array := (others => (others => '0'));
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            if WE = '1' then
                mem(to_integer(unsigned(ADDR))) <= DATA_IN;
            end if;
        end if;
    end process;

    DATA_OUT <= mem(to_integer(unsigned(ADDR)));
end architecture;

