library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity HA_Dataflow_tb2 is
end HA_Dataflow_tb2;

architecture rtl of HA_Dataflow_tb2 is
    signal a,b:std_logic;
    signal sum,carry:std_logic;
    component HA_1
    port(a,b:in std_logic; sum,carry:out std_logic);
end component;
begin
    H1: HA_1 port map(a,b,sum,carry);
    process
    begin
        a<='0';b<='0' after 5 ns;
        a<='0';b<='1' after 10 ns;
        a<='1';b<='0' after 15 ns;
        a<='1';b<='1' after 20 ns;
    end process;
end architecture rtl;