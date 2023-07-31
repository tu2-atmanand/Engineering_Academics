library ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity SIPO is
    port(SI : in std_logic ; SO : out std_logic_vector(3 downto 0) ; CLK : in bit);
end SIPO;

architecture structsipo of SIPO is
    signal temp : std_logic_vector(3 downto 0) := "0000";
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            SO <= temp;
            temp(2 downto 0) <= temp(3 downto 1);
            temp(3) <= SI;
        end if;
    end process;
end structsipo;
