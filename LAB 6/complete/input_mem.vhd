library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity input_mem is
    port (
        ADDR : in std_logic_vector(2 downto 0);
        DATA_OUT : out signed(7 downto 0)
    );
end entity;

architecture rtl of input_mem is
    type mem_array is array (0 to 7) of signed(7 downto 0);
    constant MEM : mem_array := (
        to_signed(10, 8), to_signed(20, 8),
        to_signed(-15, 8), to_signed(25, 8),
        to_signed(30, 8), to_signed(-10, 8),
        to_signed(5, 8), to_signed(0, 8)
    );
begin
    DATA_OUT <= MEM(to_integer(unsigned(ADDR)));
end architecture;
