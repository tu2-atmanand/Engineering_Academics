-- 4x1 Multiplexer

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux_4_1_B is
    port(
        A,B,C,D : in STD_LOGIC;
        S0,S1: in STD_LOGIC;
        Z: out STD_LOGIC
    );
end mux_4_1_B;

architecture bhv of mux_4_1_B is
begin
    process (A,B,C,D,S0,S1) is
    begin
        if (S0 ='0' and S1 = '0') then
            Z <= A;
        elsif (S0 ='1' and S1 = '0') then
            Z <= B;
        elsif (S0 ='0' and S1 = '1') then
            Z <= C;
        else
            Z <= D;
        end if;
    end process;
end bhv;



-- Sir code

--library IEEE;
--use IEEE.STD_LOGIC_1164.all;
--
--entity mux_4_1_B is
--    port(
--        I:in BIT_VECTOR(3 downto 0); S:in bit_vector(1 downto 0); O: out bit
--    );
--end mux_4_1_B;
--
--architecture bhv of mux_4_1_B is
--begin
--    process (S,I) is
--    begin
--        case S is
--            when "00" => O <= I(0);
--            when "01" => O <= I(1);
--            when "10" => O <= I(2);
--            when "11" => O <= I(3);
--        end case;
--    end process;
--end bhv;
