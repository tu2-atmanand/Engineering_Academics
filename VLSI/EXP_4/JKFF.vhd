library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity jkff is
    port (  clk,j,k: in std_logic;
        q,qbar : out std_logic);

end jkff;

architecture JKFF of jkff is
begin

    process(clk)
    variable tmp : std_logic;
    begin

        if(rising_edge(clk)) then

            if(j = '0' and k ='0') then
                tmp:= tmp;
                elsif(j = '1' and k = '1' ) then
                    tmp:=  not tmp;
                    elsif(j = '0' and k = '1') then
                        tmp := '0';
                    else
                        tmp := '1';
                    end if;
                end if;

                q <= tmp;
                qbar <= not tmp;
            end process;
        end JKFF;
