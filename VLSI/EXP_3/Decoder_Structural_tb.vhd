
Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity decoder_2x4_S_tb is
end decoder_2x4_S_tb;
architecture structural_tb of decoder_2x4_S_tb is
    component decoder_2x4_S
    port(A,B:in std_logic;
        Y:out std_logic_vector(3 downto 0));
end component;

signal A,B:STD_LOGIC := '0';
signal Y:STD_LOGIC_VECTOR(3 downto 0);
begin
    DECODE:decoder_2x4_S port map(A,B,Y);
    A<=not A after 20 ns;
    B<=not B after 10 ns;
end structural_tb;






--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--
--entity decoder_2x4_s_tb is
--end decoder_2x4_s_tb;
--
--architecture Behavioral of decoder_2x4_s_tb is
--
--    signal i0_tb, i1_tb, nsel_tb : std_logic;
--    signal y_tb : std_logic_vector(3 downto 0);
--
--begin
--
--    uut : entity work.decoder_2x4_s
--    port map (i0 => i0_tb, i1 => i1_tb, nsel => nsel_tb,
--        y => y_tb);
--
--    stim_proc : process
--    begin
--        for i in 0 to 3 loop
--            i0_tb <= std_logic((i = 0) or (i = 1));
--            i1_tb <= std_logic((i = 1) or (i = 3));
--            nsel_tb <= '0';
--            wait for 10 ns;
--            assert y_tb = "0000" report "Error on input " & integer'image(i)
--            severity error;
--
--            nsel_tb <= '1';
--            wait for 10 ns;
--            case i is
--                when 0 =>
--                    assert y_tb = "1110" report "Error on input " & integer'image(i)
--                    severity error;
--                when 1 =>
--                    assert y_tb = "1101" report "Error on input " & integer'image(i)
--                    severity error;
--                when 2 =>
--                    assert y_tb = "1011" report "Error on input " & integer'image(i)
--                    severity error;
--                when 3 =>
--                    assert y_tb = "0111" report "Error on input " & integer'image(i)
--                    severity error;
--
--