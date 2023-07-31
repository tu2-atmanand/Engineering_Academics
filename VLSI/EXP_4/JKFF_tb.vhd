library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity jkff_tb is
end jkff_tb;

architecture test_JKFF of jkff_tb is
    component jkff
    port (  clk,j,k: in std_logic;
        q,qbar : out std_logic);
end component;

signal CLK : std_logic := '0';
constant CLK_PERIOD : time := 10 ns;
signal J,K,Q,QBAR : std_logic;

begin
    map_JK : jkff port map(CLK,J,K,Q,QBAR);

    clock : process
    begin
        CLK <= CLK;
        wait for CLK_PERIOD/2 ;
        CLK <= not CLK;
        wait for CLK_PERIOD/2;
    end process;

    main : process
    begin
        J <='0'; K <='1';
        wait for 50 ns;
        J <='0'; K <='0';
        wait for 50 ns;
        J <='1'; K <='1';
        wait for 50 ns;
        J <='1'; K <='0';
        wait for 50 ns;
        J <='1'; K <='1';
        wait for 50 ns;
    end process;
end test_JKFF;
