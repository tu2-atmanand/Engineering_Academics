library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity tb_half_adder_dataf is
end entity tb_half_adder_dataf;
architecture testbench of tb_half_adder_dataf is
    component half_adder_dataf is
        port(a, b: in bit; s, c: out bit);
    end component;
    signal a, b, s, c: bit;
begin
    H1: half_adder_dataf port map(a => a, b => b,
        s => s, c => c);
    process begin
        a <= '0'; b <= '0';
        wait for 10 ns;
        a <= '0'; b <= '1';
        wait for 10 ns;
        a <= '1'; b <= '0';
        wait for 10 ns;
        a <= '1'; b <= '1';
        wait for 10 ns;
    end process;
end testbench;















--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
--
--
--entity HA_Dataflow_tb is
--end HA_Dataflow_tb;
--
--architecture rtl of HA_Dataflow_tb is
--    signal a,b:std_logic;
--    signal sum,carry:std_logic;
--    component HA_1
--    port(a,b:in std_logic; sum,carry:out std_logic);
--end component;
--begin
--    H1: HA_1 port map(a,b,sum,carry);
--    process
--    begin
--        a<='0';b<='0';
--        wait for 5 ns;
--        a<='0';b<='1';
--        wait for 5 ns;
--        a<='1';b<='0';
--        wait for 5 ns;
--        a<='1';b<='1';
--        wait for 5 ns;
--    end process;
--end architecture rtl;