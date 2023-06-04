library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Tff is
    port( clk,t : in std_logic;
        q, qbar : out std_logic);
end Tff;

architecture TFF of Tff is
begin
    process(clk)

    variable tmp : std_logic := '0';
    begin
        if(rising_edge(clk)) then
            if(t = '0') then
                tmp := tmp;
            else
                tmp := not tmp;
            end if;
        end if;

        q <= tmp;
        qbar <= not tmp;

    end process;
end TFF;
