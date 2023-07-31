library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity tb_full_adder_str is
end entity tb_full_adder_str;
architecture testbench of tb_full_adder_str is
    component full_adder_str is
        port(a, b, cin: in std_logic;
            s, cout: out std_logic);
    end component;
    signal a, b, cin, s, cout: std_logic;
begin
    H1: full_adder_str port map(a, b, cin, s, cout);
    process
    begin
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
end architecture testbench;