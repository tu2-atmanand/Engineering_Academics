library ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity SIPO_tb is
end SIPO_tb;

architecture testsipo of SIPO_tb is
    component SIPO
    port(SI : in std_logic ; SO : out std_logic_vector(3 downto 0) ; CLK : in bit);
end component;
signal SI : std_logic;
signal SO : std_logic_vector(3 downto 0);
signal CLK : bit;
begin
    s : sipo port map(SI,SO,CLK);
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
end testsipo;
