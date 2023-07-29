library ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity PISO_tb is
end PISO_tb;

architecture testpiso of PISO_tb is
    component PISO
    port(SI : in std_logic_vector(3 downto 0) ; SO : out std_logic ; CLK : in bit);
end component;
signal SI : std_logic_vector(3 downto 0);
signal SO : std_logic;
signal CLK : bit;
begin
    s : piso port map(SI,SO,CLK);
    p1 : process
    begin
        CLK <= '1';
        wait for 10 ns;
        CLK <= '0';
        wait for 10 ns;
    end process;
    p2 : process
    begin
        SI <= "0000";
        wait for 20 ns;
        SI <= "0011";
        wait for 20 ns;
        SI <= "1100";
        wait for 20 ns;
        SI <= "1111";
        wait for 20 ns;
    end process;
end testpiso;