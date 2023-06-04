library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity UpDownCounterBehav is
    port(
        CLk,RST,DIR:in STD_LOGIC; O:out STD_LOGIC_VECTOR(3 downto 0)
    );
end entity UpDownCounterBehav;


architecture rtl of UpDownCounterBehav is
    signal temp: STD_LOGIC_VECTOR(3 downto 0);
begin
    process(CLK,RST)
    begin
        if RST='1' then
            temp <= "0000";
        else if(CLK'EVENT AND CLk = '1') then
                if(DIR = '0') then
                    temp <= temp+1;
                else if(DIR = '1') then
                        temp <= temp -1;
                    end if;
                end if;
            end if;
        end if;
    end process;
    O<=temp;
end rtl;









--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
--
--entity Counter_VHDL is
--    port( Number: in std_logic_vector(0 to 3);
--        Clock: in std_logic;
--        Load: in std_logic;
--        Reset: in std_logic;
--        Direction: in std_logic;
--        Output: out std_logic_vector(0 to 3) );
--end Counter_VHDL;
--
--architecture Behavioral of Counter_VHDL is
--    signal temp: std_logic_vector(0 to 3) := (others => '0');
--    signal count_up: boolean := true;
--begin
--    process(Clock, Reset)
--    begin
--        if Reset = '1' then
--            temp <= "0000";
--            count_up <= true;
--        elsif (Clock'event and Clock = '1') then
--            if Load = '1' then
--                temp <= Number;
--                count_up <= true;
--            else
--                if count_up = true then
--                    if temp = "1111" then
--                        temp <= "0000";
--                        count_up <= false;
--                    else
--                        temp <= temp + 1;
--                    end if;
--                else
--                    if temp = "0000" then
--                        temp <= "1111";
--                        count_up <= true;
--                    else
--                        temp <= temp - 1;
--                    end if;
--                end if;
--            end if;
--        end if;
--    end process;
--    Output <= temp;
--end Behavioral;








--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
--
--entity Counter_VHDL is
--    port( Number: in std_logic_vector(0 to 3);
--        Clock: in std_logic;
--        Load: in std_logic;
--        Reset: in std_logic;
--        Direction: in std_logic;
--        Output: out std_logic_vector(0 to 3) );
--end Counter_VHDL;
--
--architecture Behavioral of Counter_VHDL is
--    signal temp: std_logic_vector(0 to 3);
--begin
--    process(Clock,Reset)
--    begin
--        if Reset='1' then
--            temp <= "0000";
--        elsif ( Clock'event and Clock='1') then
--            if Load='1' then
--                temp <= Number;
--            elsif (Load='0' and Direction='0') then
--                temp <= temp + 1;
--            elsif (Load='0' and Direction='1') then
--                temp <= temp - 1;
--            end if;
--        end if;
--    end process;
--    Output <= temp;
--end Behavioral;