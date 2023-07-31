library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity dff is
    port(d,clk : in std_logic;
        q,qbar : out std_logic);
end dff;

architecture DFF of dff is
begin
    process(clk)
    variable tmp : std_logic;
    begin
        if(rising_edge(clk)) then
            if(d = '0') then
                tmp := '0';
            else
                tmp := '1';
            end if;
        end if;

        q <= tmp;
        qbar <= not tmp;
    end process;
end DFF;








--library ieee;
--use ieee.std_logic_1164.all;
--
--entity d_ff is
--    port (d: in std_logic;
--        clk: in std_logic;
--        reset: in std_logic;
--        q: out std_logic);
--end d_ff;
--
--architecture behavioral of d_ff is
--begin
--    process (clk, reset)
--    begin
--        if (reset = '1') then
--            q <= '0';
--        elsif rising_edge(clk) then
--            q <= d;
--        end if;
--    end process;
--end behavioral;