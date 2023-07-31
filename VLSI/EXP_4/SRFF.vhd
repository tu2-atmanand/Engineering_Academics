library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity SRff is
    port (  clk,s,r: in std_logic;
        q,qbar : out std_logic);

end SRff;

architecture ARC_RS of SRff is
begin
    process(clk)
    variable tmp : std_logic;
    begin
        if(rising_edge(clk)) then

            if(s = '0' and r ='0') then
                tmp:= tmp;
                elsif(s = '1' and r = '1' ) then
                    tmp:= 'X';
                    elsif(s='0' and r = '1') then
                        tmp := '0';
                    else
                        tmp := '1';
                    end if;
                end if;

                q <= tmp;
                qbar <= not tmp;
      end process;
end ARC_RS;








--library ieee;
--use ieee. std_logic_1164.all;
--use ieee. std_logic_arith.all;
--use ieee. std_logic_unsigned.all;
--
--entity SR_FF is
--    PORT( S,R,CLOCK: in std_logic;
--        Q, QBAR: out std_logic);
--end SR_FF;
--
--Architecture behavioral of SR_FF is
--begin
--    PROCESS(CLOCK)
--    variable tmp: std_logic;
--    begin
--        if(CLOCK='1' and CLOCK'EVENT) then
--            if(S='0' and R='0')then
--            tmp:=tmp;
--            elsif(S='1' and R='1')then
--            tmp:='Z';
--            elsif(S='0' and R='1')then
--            tmp:='0';
--        else
--            tmp:='1';
--        end if;
--    end if;
--    Q <= tmp;
--    QBAR <= not tmp;
--end PROCESS;
--end behavioral;



--library ieee;
--use ieee.std_logic_1164.all;
--
--entity SRFF is
--    port (S, R, clk: in std_logic;
--        Q, Q_bar: out std_logic);
--end entity;
--
--architecture behavioral of SRFF is
--begin
--    process (clk)
--    begin
--        if rising_edge(clk) then
--            if S='1' and R='0' then
--                Q <= '1';
--                Q_bar <= '0';
--            elsif S='0' and R='1' then
--                Q <= '0';
--                Q_bar <= '1';
--            elsif S='0' and R='0' then
--            else
--                Q <= 'X';
--                Q_bar <= 'X';
--            end if;
--        end if;
--    end process;
--end architecture;
--