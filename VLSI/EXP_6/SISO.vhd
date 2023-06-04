library ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity SISO is
    port(SI :in std_logic; SO:out std_logic; CLK:in bit);
end SISO;

architecture beh_siso of SISO is
    signal temp : std_logic_vector(3 downto 0) := "0000";
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            SO <= temp(0);
            temp(2 downto 0) <= temp(3 downto 1);
            temp(3) <= SI;
        end if;
    end process;
end beh_siso;
