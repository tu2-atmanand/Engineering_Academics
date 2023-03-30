library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity decoder_behavioral_tb is
end entity;

architecture tb of decoder_behavioral_tb is
    component dec_D is
        Port ( A,B : in STD_LOGIC;
            Y3,Y2,Y1,Y0 : out STD_LOGIC);
    end component;
    signal A, B, Y3, Y2, Y1, Y0 : STD_LOGIC;
begin
    uut: dec_D port map(
        A => A, B => B,
        Y0 => Y0, Y1 => Y1,
        Y2 => Y2, Y3 => Y3);
    stim: process
    begin
        A <= '0';B <= '0';
        wait for 20 ns;
        A <= '0';B <= '1';
        wait for 20 ns;
        A <= '1';B <= '0';
        wait for 20 ns;
        A <= '1';B <= '1';
        wait for 20 ns;
        wait;
    end process;
end tb;