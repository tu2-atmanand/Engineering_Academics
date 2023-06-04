library ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity PISO is
    port(SI : in std_logic_vector(3 downto 0) ; SO : out std_logic; CLK : in bit);
end PISO;

architecture structpiso of PISO is
    signal temp : std_logic_vector(3 downto 0) := "0000";
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            SO <= temp(0);
            temp <= SI;
        end if;
    end process;
end structpiso;
