library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity datapath is
    port(
        CK, LDM, RSTM, LDRES, RSTRES, INC: in std_logic;
        SEL: in std_logic_vector(1 downto 0); -- Fixed: must be 2-bit for mux4to1
        DONE: out std_logic;
        ADD: out std_logic_vector(9 downto 0);
        Din: in signed(7 downto 0);
        Dout: out signed(7 downto 0)
    );
end entity;

architecture dp of datapath is

    -- Component declarations
    component reg8
        port(
            ck, ld, rst: in std_logic;
            D: in signed(7 downto 0);
            Q: out signed(7 downto 0)
        );
    end component;

    component mod1025
        port(
            ck, inc, rst: in std_logic;
            Q: out integer range 0 to 1024
        );
    end component;

    component adder
        port(
            A, B: in signed(9 downto 0);
            C: out signed(9 downto 0)
        );
    end component;

    component cx1
        port(
            X1: in integer range 0 to 1024;
            eq: out std_logic
        );
    end component;

    component cx2
        port(
            Xin: in signed(9 downto 0);
            Xout: out signed(7 downto 0)
        );
    end component;

    component sh_half
        port(
            Xin: in signed(7 downto 0);
            Xout: out signed(9 downto 0)
        );
    end component;

    component sh_quarter
        port(
            Xin: in signed(7 downto 0);
            Xout: out signed(9 downto 0)
        );
    end component;

    component sh_two
        port(
            Xin: in signed(7 downto 0);
            Xout: out signed(9 downto 0)
        );
    end component;

    component sh_four
        port(
            Xin: in signed(7 downto 0);
            Xout: out signed(9 downto 0)
        );
    end component;

    component mux4to1_10bit
        port(
            sel: in std_logic_vector(1 downto 0);
            X1, X2, X3, X4: in signed(9 downto 0);
            Xout: out signed(9 downto 0)
        );
    end component;

    -- Internal signals
    signal r1, r2, r3, r4: signed(7 downto 0);
    signal x1, x2, x3, x4: signed(9 downto 0);
    signal mux_out: signed(9 downto 0);
    signal adder_out: signed(9 downto 0);
    signal rres: signed(9 downto 0);
    signal ADD_int: integer range 0 to 1024;

begin

    -- Register chain
    reg8_1: reg8 port map(CK, LDM, RSTM, Din, r1);
    reg8_2: reg8 port map(CK, LDM, RSTM, r1, r2);
    reg8_3: reg8 port map(CK, LDM, RSTM, r2, r3);
    reg8_4: reg8 port map(CK, LDM, RSTM, r3, r4);

    -- Shift operations
    s1: sh_half port map(r1, x1);
    s2: sh_two port map(r2, x2);
    s3: sh_four port map(r3, x3);
    s4: sh_quarter port map(r4, x4);

    -- MUX
    mux4to1: mux4to1_10bit port map(SEL, x1, x2, x3, x4, mux_out);

    -- Adder
    adder_1: adder port map(mux_out, rres, adder_out);

    -- Register for result
    reg8_res: reg8 port map(CK, LDRES, RSTRES, adder_out(7 downto 0), rres(7 downto 0)); -- only lower 8 bits go to reg8

    -- Result converter
    cx2_1: cx2 port map(rres, Dout);

    -- Counter
    ctr: mod1025 port map(CK, INC, RSTM, ADD_int);
    ADD <= std_logic_vector(to_unsigned(ADD_int, 10)); -- Convert integer to 10-bit std_logic_vector

    -- Done flag (optional example logic using comparator)
    done_flag: cx1 port map(ADD_int, DONE); -- 'DONE' high when ADD_int == 1024

end architecture;
