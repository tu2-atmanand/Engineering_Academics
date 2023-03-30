library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity tb_full_adder_behav is
end tb_full_adder_behav;
architecture testbench of tb_full_adder_behav is
    signal a, b, cin: bit;
    signal sum, cout: bit;
    component full_adder_behav
    port (a, b, cin: in bit;
        sum, cout: out bit);
end component;
begin
    H1: full_adder_behav port map(a, b, cin, sum, cout);
    process begin
        a<='0'; b<='0'; cin<='0';
        wait for 10 ns;
        a<='0'; b<='0'; cin<='1';
        wait for 10 ns;
        a<='0'; b<='1'; cin<='0';
        wait for 10 ns;
        a<='0'; b<='1'; cin<='1';
        wait for 10 ns;
        a<='1'; b<='0'; cin<='0';
        wait for 10 ns;
        a<='1'; b<='0'; cin<='1';
        wait for 10 ns;
        a<='1'; b<='1'; cin<='0';
        wait for 10 ns;
        a<='1'; b<='1'; cin<='1';
        wait for 10 ns;
    end process;
end testbench;