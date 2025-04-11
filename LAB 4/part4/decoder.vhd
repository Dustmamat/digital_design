library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder is
    port(
        hex_in : in unsigned(3 downto 0); -- 4-bit Hexadecimal Input
        seg_out : out std_logic_vector(0 to 6) -- 7-Segment Outputs (Active Low)
    );
end entity;

architecture behavior of decoder is
begin
    process(hex_in)
    begin
        case hex_in is
            when "0000" => seg_out <= "0000001"; -- 0
            when "0001" => seg_out <= "1001111"; -- 1
            when "0010" => seg_out <= "0010010"; -- 2
            when "0011" => seg_out <= "0000110"; -- 3
            when "0100" => seg_out <= "1001100"; -- 4
            when "0101" => seg_out <= "0100100"; -- 5
            when "0110" => seg_out <= "0100000"; -- 6
            when "0111" => seg_out <= "0001111"; -- 7
            when "1000" => seg_out <= "0000000"; -- 8
            when "1001" => seg_out <= "0000100"; -- 9
            when "1010" => seg_out <= "0001000"; -- A
            when "1011" => seg_out <= "1100000"; -- B
            when "1100" => seg_out <= "0110001"; -- C
            when "1101" => seg_out <= "1000010"; -- D
            when "1110" => seg_out <= "0110000"; -- E
            when "1111" => seg_out <= "0111000"; -- F
            when others => seg_out <= "1111111"; -- Default (All Off)
        end case;
    end process;
end architecture;

