LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity CU is
port( START, DONE, CLK: in std_logic;
	RSTM,RSTRES, LDM,LDRES, WRB, INC, IDLE, CSA, CSB, RDA: out std_logic;
	SEL: out std_logic_vector(1 downto 0));
end entity;

architecture bhv of CU is 
	type state_type is (A, B, C, D, E, F, G, H, I);
	signal CS, FS: state_type;
	 begin	
	mem:process(CLK)
	begin
	if rising_edge(CLK) then
		if START='0' then
		CS<=A;
		else
		CS<=FS;
		end if;
	end if;
	end process;
	cc1: process(START, DONE, CS)
	begin
	case CS is 
		when A=>
		if START='0' then
			FS<=A;
		else
			FS<=B;
		end if;
		when B=>
		if START='1' then
			FS<=C;
		else
			FS<=A;
		end if;
		when C=>
		if START='1' then
			FS<=D;
		else
			FS<=A;	
		end if;
		when D=>
		if START='1' then
			FS<=E;
		else
			FS<=A;	
		end if;
		when E=>
		if START='1' then
			FS<=F;
		else
			FS<=A;	
		end if;
		when F=>
		if START='1' then
			FS<=G;
		else
			FS<=A;	
		end if;
		when G=>
		if START='1' then
			FS<=H;
		else
			FS<=A;	
		end if;
		when H=>
		if START='1' AND DONE='1' THEN
			FS<=I;
		ELSIF START='1' AND DONE='0' THEN
			FS<=B;
		ELSE
			FS<=A;
		END IF;
		when I=>
		if START='1' THEN
			FS<=I;
		ELSE
			FS<=A;
		END IF;
		
		when others =>
			FS<=A;
		end case;
		end process;
	cc2: process(CS)
	begin
	case CS is
		when A=>
			RSTM<='1';  --RSTM,RSTRES, LDM,LDRES, WRB, INC, IDLE, CSA, CSB, SEL
			RSTRES<='1';
			LDM<='0';
			LDRES<='0';
			WRB<='0';
			INC<='0';
			IDLE<='0';
			CSA<='0';
			CSB<='0';
			SEL<="00";
			RDA<='0';

		when B=>
			RSTM<='0';  --RSTM,RSTRES, LDM,LDRES, WRB, INC, IDLE, CSA, CSB, SEL
			RSTRES<='0';
			LDM<='1';
			LDRES<='0';
			WRB<='0';
			INC<='0';
			IDLE<='0';
			CSA<='1';
			CSB<='0';
			SEL<="00";
			RDA<='1';
		when C=>
			RSTM<='0';  --RSTM,RSTRES, LDM,LDRES, WRB, INC, IDLE, CSA, CSB, SEL
			RSTRES<='1';
			LDM<='0';
			LDRES<='0';
			WRB<='0';
			INC<='0';
			IDLE<='0';
			CSA<='0';
			CSB<='0';
			SEL<="00";
			RDA<='0';
		when D=>
			RSTM<='0';  --RSTM,RSTRES, LDM,LDRES, WRB, INC, IDLE, CSA, CSB, SEL
			RSTRES<='0';
			LDM<='0';
			LDRES<='1';
			WRB<='0';
			INC<='0';
			IDLE<='0';
			CSA<='0';
			CSB<='0';
			SEL<="00";
			RDA<='0';
		when E=>
			RSTM<='0';  --RSTM,RSTRES, LDM,LDRES, WRB, INC, IDLE, CSA, CSB, SEL
			RSTRES<='0';
			LDM<='0';
			LDRES<='1';
			WRB<='0';
			INC<='0';
			IDLE<='0';
			CSA<='0';
			CSB<='0';
			SEL<="01";
			RDA<='0';
		when F=>
			RSTM<='0';  --RSTM,RSTRES, LDM,LDRES, WRB, INC, IDLE, CSA, CSB, SEL
			RSTRES<='0';
			LDM<='0';
			LDRES<='1';
			WRB<='0';
			INC<='0';
			IDLE<='0';
			CSA<='0';
			CSB<='0';
			SEL<="10";
			RDA<='0';
		when G=>
			RSTM<='0';  --RSTM,RSTRES, LDM,LDRES, WRB, INC, IDLE, CSA, CSB, SEL
			RSTRES<='0';
			LDM<='0';
			LDRES<='1';
			WRB<='0';
			INC<='0';
			IDLE<='0';
			CSA<='0';
			CSB<='0';
			SEL<="11";
			RDA<='0';
		when H=>
			RSTM<='0';  --RSTM,RSTRES, LDM,LDRES, WRB, INC, IDLE, CSA, CSB, SEL
			RSTRES<='0';
			LDM<='0';
			LDRES<='0';
			WRB<='1';
			INC<='1';
			IDLE<='0';
			CSA<='0';
			CSB<='1';
			SEL<="00";
			RDA<='0';
		when I=>
			RSTM<='0';  --RSTM,RSTRES, LDM,LDRES, WRB, INC, IDLE, CSA, CSB, SEL
			RSTRES<='0';
			LDM<='0';
			LDRES<='0';
			WRB<='0';
			INC<='0';
			IDLE<='1';
			CSA<='0';
			CSB<='0';
			SEL<="00";
			RDA<='0';
		when others=>
			
			RSTM<='1';  --RSTM,RSTRES, LDM,LDRES, WRB, INC, IDLE, CSA, CSB, SEL
			RSTRES<='1';
			LDM<='0';
			LDRES<='0';
			WRB<='0';
			INC<='0';
			IDLE<='0';
			CSA<='0';
			CSB<='0';
			SEL<="00";
			RDA<='0';
	end case;
	end process;
end bhv;
