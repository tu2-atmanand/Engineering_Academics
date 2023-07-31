Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity encoder_4x2_str_tb is
end encoder_4x2_str_tb;

architecture structural_tb of encoder_4x2_str_tb is
    component encoder_4x2_str
    port(A,B:out std_logic;
        Y:in std_logic_vector(3 downto 0));
end component;

signal Y:STD_LOGIC_VECTOR(3 downto 0) := "0000";
signal A,B:STD_LOGIC;
begin
    ENCODE:encoder_4x2_str port map(A,B,Y);
    Y(3)<=not Y(3) after 80 ns;
    Y(2)<=not Y(2) after 40 ns;
    Y(1)<=not Y(1) after 20 ns;
    Y(0)<=not Y(0) after 10 ns;
end structural_tb;

















--library ieee;
--use ieee.std_logic_1164.all;
--
--entity encoder_4x2_test is
--end encoder_4x2_test;
--
--architecture testbench of encoder_4x2_test is
--    signal A, B, C, D: std_logic;
--    signal Y: std_logic_vector(1 downto 0);
--
--begin
--    UUT: entity work.encoder_4x2_structural
--    port map (A, B, C, D, Y);
--
--    stimuli: process
--    begin
--        A <= '0'; B <= '0'; C <= '0'; D <= '0'; wait for 10 ns;
--        assert Y = "00" report "Error: Y = " & std_logic'image(Y) severity error;
--
--        A <= '1'; B <= '0'; C <= '0'; D <= '0'; wait for 10 ns;
--        assert Y = "01" report "Error: Y = " & std_logic'image(Y) severity error;
--
--        A <= '0'; B <= '1'; C <= '0'; D <= '0'; wait for 10 ns;
--        assert Y = "10" report "Error: Y = " & std_logic'image(Y) severity error;
--
--        A <= '0'; B <= '0'; C <= '1'; D <= '0'; wait for 10 ns;
--        assert Y = "11" report "Error: Y = " & std_logic'image(Y) severity error;
--
--        A <= '0'; B <= '0'; C <= '0'; D <= '1'; wait for 10 ns;
--        assert Y = "00" report "Error: Y = " & std_logic'image(Y) severity error;
--
--        A <= '1'; B <= '1'; C <= '0'; D <= '0'; wait for 10 ns;
--        assert
--