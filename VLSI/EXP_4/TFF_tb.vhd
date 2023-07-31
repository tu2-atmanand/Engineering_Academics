library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Tff_tb is
end Tff_tb;

architecture test_TFF of Tff_tb is
    component Tff
    port( clk,t :in std_logic;
        q,qbar : out std_logic);
end component;

signal CLK : std_logic :='0';
constant CLK_PERIOD : time := 10 ns;

signal T,Q,QBAR :std_logic;
begin

    map_T : Tff port map(CLK,T,Q,QBAR);

    clock : process
    begin
        CLK <= CLK;
        wait for CLK_PERIOD/2 ;
        CLK <= not CLK;
        wait for CLK_PERIOD/2 ;
    end process;

    main : process
    begin

        T <= '0';
        wait for 50 ns;
        T <= '1';
        wait for 50 ns;
        T <= '1';
        wait for 50 ns;
        T <= '0';
        wait for 50 ns;
    end process;
end test_TFF;
