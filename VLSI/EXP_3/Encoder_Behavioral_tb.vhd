library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity encoder_behavioural_tb is
end entity;
architecture tb of encoder_behavioural_tb is
    component enc_B is
        Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
            Y : out STD_LOGIC_VECTOR (1 downto 0));
    end component;
    signal I: STD_LOGIC_VECTOR(3 downto 0);
    signal Y: STD_LOGIC_VECTOR(1 downto 0);
begin
    uut: enc_B port map(
        I => I, Y => Y);
    stim: process
    begin
        I <= "0001";
        wait for 20 ns;
        I <= "0010";
        wait for 20 ns;
        I <= "0100";
        wait for 20 ns;
        I <= "1000";
        wait for 20 ns;
        wait;
    end process;
end tb;