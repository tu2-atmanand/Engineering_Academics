library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity encoder_dataflow_tb is
end entity;

architecture tb of encoder_dataflow_tb is
    component enc_D is
        Port ( A,B,C,D : in STD_LOGIC;
            Y0,Y1 : out STD_LOGIC);
    end component;
    signal A, B, C, D, Y0, Y1 : STD_LOGIC;

begin

    uut: enc_D port map(
        A => A, B => B,
        C => C, D => D,
        Y0 => Y0, Y1 => Y1);
    stim: process
    begin
        A <= '0';
        B <= '0';
        C <= '0';
        D <= '1';
        wait for 20 ns;
        A <= '0';
        B <= '0';
        C <= '1';
        D <= '0';
        wait for 20 ns;
        A <= '0';
        B <= '1';
        C <= '0';
        D <= '0';
        wait for 20 ns;
        A <= '1';
        B <= '0';
        C <= '0';
        D <= '0';
        wait for 20 ns;
        wait;
    end process;
end tb;