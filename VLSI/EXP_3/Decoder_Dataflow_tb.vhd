Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity decoder_2x4_D_tb is
end decoder_2x4_D_tb;
architecture dataflow of decoder_2x4_D_tb is
    component decoder_2x4_D
    port(A,B: in std_logic;
        Y: out std_logic_vector(3 downto 0));
end component;

signal A,B:STD_LOGIC := '0';
signal Y:STD_LOGIC_VECTOR(3 downto 0);
begin
    DECODE:decoder_2x4_D port map(A,B,Y);
    A <= not A after 20 ns;
    B <= not B after 10 ns;

end dataflow;











--library ieee;
--use ieee.std_logic_1164.all;
--
--entity decoder_3x8_df_tb is
--end entity;
--
--architecture tb of decoder_3x8_df_tb is
--    component decoder_3x8_df is
--        port (
--            I : in std_logic_vector(2 downto 0);
--            y : out std_logic_vector(7 downto 0)
--        );
--    end component;
--
--    signal I : std_logic_vector(2 downto 0) := "000";
--    signal y : std_logic_vector(7 downto 0);
--
--begin
--    uut: decoder_3x8_df port map (I => I, y => y);
--
--    process
--    begin
--        for i in 0 to 7 loop
--            I <= std_logic_vector(to_unsigned(i, 3));
--            wait for 10 ns;
--            assert y(i) = '1' report "Error: Unexpected output value" severity error;
--            y <= (others => '0');
--        end loop;
--        wait;
--    end process;
--end architecture;
--