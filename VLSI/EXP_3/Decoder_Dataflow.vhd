Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity decoder_2x4_D is
    port(A,B: in std_logic;
        Y: out std_logic_vector(3 downto 0));
end decoder_2x4_D;

architecture dataflow of decoder_2x4_D is
begin

    Y(0) <= (not A) and (not B);
    Y(1) <= (not A) and B;
    Y(2) <= A and (not B);
    Y(3) <= A and B;

end dataflow;









--library ieee;
--use ieee.std_logic_1164.all;
--
--entity decoder_3x8_df is
--    port (
--        I : in std_logic_vector(2 downto 0);
--        y : out std_logic_vector(7 downto 0)
--    );
--end entity;
--
--architecture dataflow of decoder_3x8_df is
--begin
--    y(0) <= not I(2) and not I(1) and not I(0);
--    y(1) <= not I(2) and not I(1) and I(0);
--    y(2) <= not I(2) and I(1) and not I(0);
--    y(3) <= not I(2) and I(1) and I(0);
--    y(4) <= I(2) and not I(1) and not I(0);
--    y(5) <= I(2) and not I(1) and I(0);
--    y(6) <= I(2) and I(1) and not I(0);
--    y(7) <= I(2) and I(1) and I(0);
--end architecture;
--
--