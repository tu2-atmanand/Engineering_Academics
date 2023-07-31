library ieee;
use ieee.std_logic_1164.all;

entity tb_demux_1to4 is
end tb_demux_1to4;

architecture behavior of tb_demux_1to4 is
    component demux_1to4_D
    port(
        A : in std_logic;
        S : in std_logic_vector(1 downto 0);
        Y0, Y1, Y2, Y3 : out std_logic
    );
end component;
signal A : std_logic;
signal S : std_logic_vector(1 downto 0);
signal Y0, Y1, Y2, Y3 : std_logic;
begin
    uut : demux_1to4_D
    port map(
        A => A,
        S => S,
        Y0 => Y0,
        Y1 => Y1,
        Y2 => Y2,
        Y3 => Y3
    );

    stimulus : process
    begin
        A <= '0';S <= "00";
        wait for 10 ns;
        A <= '1';S <= "00";
        wait for 10 ns;
        A <= '0';S <= "01";
        wait for 10 ns;
        A <= '1';S <= "01";
        wait for 10 ns;
        A <= '0';S <= "10";
        wait for 10 ns;
        A <= '1';S <= "10";
        wait for 10 ns;
        A <= '0';S <= "11";
        wait for 10 ns;
        A <= '1';S <= "11";
        wait for 10 ns;
        wait;
    end process;
end behavior;















--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
--
--entity Demux_1x4_D_tb is
--end entity;
--
--architecture tb of Demux_1x4_D_tb is
--    component Demux_1x4_D is
--        Port ( I : in STD_LOGIC;
--            S : in STD_LOGIC_VECTOR (1 downto 0);
--            Y : out STD_LOGIC_VECTOR (3 downto 0));
--    end component;
--    signal I : STD_LOGIC;
--    signal S : STD_LOGIC_VECTOR(1 downto 0);
--    signal Y : STD_LOGIC_VECTOR(3 downto 0);
--begin
--    uut: Demux_1x4_D port map(
--        I => I,
--        S => S,
--        Y => Y);
--    stim: process
--    begin
--        I <= '1';
--        S <= "00";
--        wait for 20 ns;
--        S <= "01";
--        wait for 20 ns;
--        S <= "10";
--        wait for 20 ns;
--        S <= "11";
--        wait for 20 ns;
--        wait;
--    end process;
--end tb;