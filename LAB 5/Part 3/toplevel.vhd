LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY toplevel IS
PORT ( SW : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
KEY : IN STD_LOGIC_VECTOR(3 downto 0);
LEDR : OUT STD_LOGIC_VECTOR(9 downto 0));
END entity;

architecture bhv of toplevel is
	type state_type is (A, B, C, D, E, F, G, H, I);
	signal CS, FS: state_type;
	begin
	mem: process(KEY(0)) --KEY(0) == CLK
	begin
	if rising_edge (KEY(0)) then
		if SW(0)='0' then  --SW(0) == RST
			CS<=A;
		else
			CS<=FS;
		end if;
	end if;
	end process;
	cc1: process(SW(1), CS) --SW(1) == input
	begin
	case CS is
		when A=>
		if SW(1)='0' then 
			FS<=B;
		else
			FS<=F;
		end if;
		when B=>
		if SW(1)='0' then 
			FS<=C;
		else
			FS<=F;
		end if;
		when C=>
		if SW(1)='0' then 
			FS<=D;
		else
			FS<=F;
		end if;
		when D=>
		if SW(1)='0' then 
			FS<=E;
		else
			FS<=F;
		end if;
		when E=>
		if SW(1)='0' then 
			FS<=E;
		else
			FS<=F;
		end if;
		when F=>
		if SW(1)='0' then 
			FS<=B;
		else
			FS<=G;
		end if;
		when G=>
		if SW(1)='0' then 
			FS<=B;
		else
			FS<=H;
		end if;
		when H=>
		if SW(1)='0' then 
			FS<=B;
		else
			FS<=I;
		end if;
		when I=>
		if SW(1)='0' then 
			FS<=B;
		else
			FS<=I;
		end if;
		when others =>
		FS<=A;
		end case;
		end process;
	cc2: process(CS)
	begin
	case CS is
		when A=>
		LEDR(0)<='0';
		when B=>
		LEDR(0)<='0';
		when C=>
		LEDR(0)<='0';
		when D=>
		LEDR(0)<='0';
		when F=>
		LEDR(0)<='0';
		when G=>
		LEDR(0)<='0';
		when H=>
		LEDR(0)<='0';
		when E=>
		LEDR(0)<='1';
		when I=>
		LEDR(0)<='1';
		when others=>
		LEDR(0)<='0';
	end case;
	end process;
end bhv;
