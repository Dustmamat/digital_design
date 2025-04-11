LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
ENTITY part3_cska IS
PORT( num1, num2: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	ck, rst: IN STD_LOGIC;
	sum: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	isovf: OUT STD_LOGIC);
END ENTITY;

ARCHITECTURE p3 OF part3_cska IS
SIGNAL A,B: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL sum_intermediate: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL ovf_intermediate: STD_LOGIC;
SIGNAL cout_intermediate: STD_LOGIC;


COMPONENT regn
GENERIC ( N : integer:=16);
PORT (R : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
Clock, Resetn : IN STD_LOGIC;
Q : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0));
END COMPONENT;


COMPONENT flipflop
PORT (D, Clock, Resetn : IN STD_LOGIC;
Q : OUT STD_LOGIC);
END COMPONENT;

COMPONENT cska
port(a, b: in std_logic_vector(15 downto 0);
	c_out: out std_logic;
	sum: out std_logic_vector(15 downto 0));
END COMPONENT;

COMPONENT ovf
port(a, b, sum: in std_logic_vector(15 downto 0);
	c_out: in std_logic;
	 isovf: out std_logic);
END COMPONENT;

BEGIN

reg1: regn PORT MAP(num1, ck, rst,A);
reg2: regn PORT MAP(num2,ck,rst,B);
cska1: cska PORT MAP(A,B,cout_intermediate,sum_intermediate);
reg3: regn PORT MAP(sum_intermediate,ck,rst,sum);
overflow1: ovf PORT MAP(A,B,sum_intermediate,cout_intermediate, ovf_intermediate);
ff1: flipflop PORT MAP(ovf_intermediate,ck,rst,isovf);
END ARCHITECTURE;
