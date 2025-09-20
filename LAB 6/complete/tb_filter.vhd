
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_filter is
end entity;

architecture behavior of tb_filter is

    -- Control Signals
    signal CLK, START, DONE: std_logic := '0';
    signal RSTM, RSTRES, LDM, LDRES, WRB, INC, IDLE, CSA, CSB, RDA: std_logic;
    signal SEL: std_logic_vector(1 downto 0);
    
    -- Data Signals
    signal Din, Dout: signed(7 downto 0);
    signal ADD: std_logic_vector(9 downto 0);
    signal ADDR8: std_logic_vector(2 downto 0);

    -- Components
    component CU
        port( START, DONE, CLK: in std_logic;
              RSTM,RSTRES, LDM,LDRES, WRB, INC, IDLE, CSA, CSB, RDA: out std_logic;
              SEL: out std_logic_vector(1 downto 0));
    end component;

    component datapath
        port(
            CK, LDM, RSTM, LDRES, RSTRES, INC: in std_logic;
            SEL: in std_logic_vector(1 downto 0);
            DONE: out std_logic;
            ADD: out std_logic_vector(9 downto 0);
            Din: in signed(7 downto 0);
            Dout: out signed(7 downto 0)
        );
    end component;

    component input_mem
        port (
            ADDR : in std_logic_vector(2 downto 0);
            DATA_OUT : out signed(7 downto 0)
        );
    end component;

    component output_mem
        port (
            CLK      : in std_logic;
            WE       : in std_logic;
            ADDR     : in std_logic_vector(2 downto 0);
            DATA_IN  : in signed(7 downto 0);
            DATA_OUT : out signed(7 downto 0)
        );
    end component;

begin

    ADDR8 <= ADD(2 downto 0);

    cu_inst: CU port map(
        START => START, DONE => DONE, CLK => CLK,
        RSTM => RSTM, RSTRES => RSTRES, LDM => LDM, LDRES => LDRES,
        WRB => WRB, INC => INC, IDLE => IDLE, CSA => CSA, CSB => CSB,
        RDA => RDA, SEL => SEL
    );

    dp_inst: datapath port map(
        CK => CLK, LDM => LDM, RSTM => RSTM, LDRES => LDRES,
        RSTRES => RSTRES, INC => INC, SEL => SEL,
        DONE => DONE, ADD => ADD, Din => Din, Dout => Dout
    );

    imem: input_mem port map(
        ADDR => ADDR8,
        DATA_OUT => Din
    );

    omem: output_mem port map(
        CLK => CLK, WE => WRB, ADDR => ADDR8,
        DATA_IN => Dout, DATA_OUT => open
    );

    clk_proc: process
    begin
        while true loop
            CLK <= '0'; wait for 10 ns;
            CLK <= '1'; wait for 10 ns;
        end loop;
    end process;

    stim_proc: process
    begin
        -- Start signal
        START <= '0'; wait for 20 ns;
        START <= '1'; wait for 2000 ns;
        START <= '0'; wait for 200 ns;

        -- Wait and finish
        wait;
    end process;

end architecture;
