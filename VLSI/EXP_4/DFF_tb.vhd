library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity dff_tb is
end dff_tb;

architecture test_DFF of dff_tb is
    component dff
    port(d,clk : in std_logic;
        q,qbar : out std_logic);
end component;
signal CLK  : std_logic := '0';
constant CLK_PERIOD : time := 10 ns;
signal D,Q,QBAR :std_logic;
begin
    map_d : dff port map(D,CLK,Q,QBAR);

    clk_process : process
    begin
        CLK <= CLK;
        wait for CLK_PERIOD/2 ;
        CLK <= not CLK;
        wait for CLK_PERIOD/2;
    end process;

    main : process
    begin
        D <= '1';
        wait for 50 ns;
        D <= '0';
        wait for 50 ns;
    end process;
end test_DFF;










--library ieee;
--use ieee.std_logic_1164.all;
--
--entity d_ff_tb is
--end d_ff_tb;
--
--architecture testbench of d_ff_tb is
--    signal d_in: std_logic := '0';
--    signal clk: std_logic := '0';
--    signal reset: std_logic := '0';
--    signal q_out: std_logic;
--
--begin
--    uut: entity work.d_ff
--    port map (d => d_in, clk => clk, reset => reset, q => q_out);
--
--    stimulus: process
--    begin
--        reset <= '1';
--        wait for 10 ns;
--        reset <= '0';
--        wait for 10 ns;
--        d_in <= '1';
--        wait for 10 ns;
--        clk <= not clk;
--        wait for 10 ns;
--        clk <= not clk;
--        wait for 10 ns;
--        d_in <= '0';
--        wait for 10 ns;
--        clk <= not clk;
--        wait for 10 ns;
--        clk <= not clk;
--        wait for 10 ns;
--        d_in <= '1';
--        wait for 10 ns;
--        clk <= not clk;
--        wait for 10 ns;
--        clk <= not clk;
--        wait;
--    end process;
--
--end testbench;
--