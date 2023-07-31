library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity SRff_tb is
end SRff_tb;

architecture test_SR of SRff_tb is
    component SRff
    port (  clk,s,r: in std_logic;
        q,qbar : out std_logic);
end component;

signal CLK : std_logic := '0';
constant CLK_PERIOD : time := 10 ns;
signal S,R,Q,QBAR : std_logic;

begin
    map_sr : SRff port map(CLK,S,R,Q,QBAR);

    clock : process
    begin
        CLK <= CLK;
        wait for CLK_PERIOD/2 ;
        CLK <= not CLK;
        wait for CLK_PERIOD/2;
    end process;

    main : process
    begin
        S <='1'; R<='0';
        wait for 50 ns;
        S <='0'; R<='0';
        wait for 50 ns;
        S <='0'; R<='1';
        wait for 50 ns;
        S <='1'; R<='1';
        wait for 50 ns;
    end process;
end test_SR;








--library ieee;
--use ieee.std_logic_1164.all;
--use ieee. std_logic_arith.all;
--use ieee. std_logic_unsigned.all;
--
--entity SR_FF_tb is
--end SR_FF_tb;
--
--architecture behavioral of SR_FF_tb is
--    -- component declaration for SR_FF
--    component SR_FF
--    PORT(
--        S, R, CLOCK : IN std_logic;
--        Q, QBAR : OUT std_logic
--    );
--end component;
--
--    -- signals for testbench
--signal S_tb, R_tb, CLOCK_tb : std_logic;
--signal Q_tb, QBAR_tb : std_logic;
--
--begin
--    -- instance of SR_FF
--    UUT: SR_FF port map(S_tb, R_tb, CLOCK_tb, Q_tb, QBAR_tb);
--
--    -- test clock signal
--    CLOCK_tb <= '0', '1' after 5 ns, '0' after 10 ns, '1' after 15 ns, '0' after 20 ns;
--
--    -- test case 1: SR = 00
--    S_tb <= '0';
--    R_tb <= '0';
--    after 10 ns;
--
--    -- test case 2: SR = 11
--    S_tb <= '1';
--    R_tb <= '1';
--    wait for 25 ns;
--
--    -- test case 3: SR = 01
--    S_tb <= '0';
--    R_tb <= '1';
--    wait for 25 ns;
--
--    -- test case 4: SR = 10
--    S_tb <= '1';
--    R_tb <= '0';
--    wait for 25 ns;
--
--    -- end simulation
--    wait;
--end behavioral;







--
--library ieee;
--use ieee.std_logic_1164.all;
--
--entity SRFF_tb is
--end entity;
--
--architecture behavioral_tb of SRFF_tb is
--    component SRFF
--    port (S, R, clk: in std_logic;
--        Q, Q_bar: out std_logic);
--end component;
--
--signal clk: std_logic:='0';
--signal S,R,Q, Q_bar: std_logic;
--constant clk_period : time :=10 ns;
--begin
--    uut: SRFF port map(S, R, clk, Q, Q_bar);
--
--    clock : process
--    begin
--        clk <= clk;
--        wait for clk_period/2;
--        clk<= not clk;
--        wait for clk_period/2;
--    end process;
--
--    main : process
--    begin
--        S<='1';R<='0';
--        wait for 10 ns;
--        S<='0';R<='0';
--        wait for 10 ns;
--        S<='0';R<='1';
--        wait for 10 ns;
--        S<='1';R<='1';
--        wait for 10 ns;
--    end process;
--    end behavioral_tb;
