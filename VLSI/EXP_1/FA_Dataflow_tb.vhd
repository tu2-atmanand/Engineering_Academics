library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity tb_full_adder_dataf is
end entity tb_full_adder_dataf;

architecture testbench of tb_full_adder_dataf is
    component full_adder_dataf is
        port(a, b, cin: in std_logic;
            s, cout: out std_logic);
    end component;
    signal a, b, cin, s, cout: std_logic;
begin
    H1: entity work.full_adder_dataf port map(a => a,
        b => b, cin => cin, s => s, cout => cout);
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