library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity tb_half_adder_str is
end entity tb_half_adder_str;
architecture testbench of tb_half_adder_str is
    component half_adder_str is
        port(a, b: in std_logic; s, c: out std_logic);
    end component;
    signal a, b, s, c: std_logic := '0';
begin
    H1: half_adder_str port map(a, b, s, c);
    stimulus_proc: process
    begin
        a <= '0'; b <= '0';
        wait for 10 ns;
        a <= '0'; b <= '1';
        wait for 10 ns;
        a <= '1'; b <= '0';
        wait for 10 ns;
        a <= '1'; b <= '1';
        wait for 10 ns;
    end process;
end architecture testbench;













--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
--
--
--entity HA_Structural_tb is
--end HA_Structural_tb;
--
--architecture rtl of HA_Structural_tb is
--    signal a,b:std_logic;
--    signal sum,carry:std_logic;
--    component HA_2
--    port(a,b:in std_logic; sum,carry:out std_logic);
--end component;
--begin
--    H1: HA_2 port map(a,b,sum,carry);
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