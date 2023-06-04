library ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity PIPO is
    port(SI :in std_logic_vector(3 downto 0) ; SO : out std_logic_vector(3 downto 0) ; CLK : in bit);
end PIPO;

architecture structpipo of PIPO is
    signal temp : std_logic_vector(3 downto 0) := "0000";
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            SO <= temp;
            temp <= SI;
        end if;
    end process;
end structpipo;
