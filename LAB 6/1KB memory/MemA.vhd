LIBRARY ieee;
USE ieee.std_logic_1164.all; 
use ieee.numeric_std.all;


entity MemA is
port(data_in: in std_logic_vector(7 downto 0);
	data_out0,data_out1,data_out2,data_out3:out std_logic_vector(7 downto 0);
	address: in integer range 0 to 1023;
	WRA,ck,CS,RDA: in std_logic);
end entity;


architecture arch of MemA is

type mem_array is array(0 to 1023) of std_logic_vector (7 downto 0);
signal memory: mem_array;

begin 
process


begin
if rising_edge(ck) then
	if WRA='1' and CS='1' then
	
		memory(address)<= data_in;
	elsif CS='1' and RDA='1' then
		if address>0 then
			data_out0<=memory(address);
		else
			data_out0<="00000000";
		end if;

		if (address-1)>0 then		
			data_out1<=memory(address-1);
		else
			data_out1<="00000000";
		end if;

		if (address-2)>0 then
			data_out2<=memory(address-2);
		else
			data_out2<="00000000";
		end if;

		if (address-3)>0 then
			data_out3<=memory(address-3);
		else
			data_out3<="00000000";
		end if;
end if;
end if;

end process;

end architecture;
	
	