library ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity SISO_tb is
end SISO_tb;

architecture testsiso of SISO_tb is
    component SISO
    port(SI : in std_logic ; SO : out std_logic ; CLK : in bit);
end component;
signal SI, SO : std_logic;
signal CLK : bit;
begin
    s : SISO port map(SI,SO,CLK);
    p1:process
    begin
        CLK <= '1';
        wait for 10 ns;
        CLK <= '0';
        wait for 10 ns;
    end process;
    p2:process
    begin
        SI <= '0';
        wait for 20 ns;
        SI <= '1';
        wait for 20 ns;
    end process;
end testsiso;
