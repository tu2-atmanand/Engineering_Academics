library ieee;
use ieee.std_logic_1164.all;

entity tb_mux_4to1 is
end tb_mux_4to1;

architecture behavior of tb_mux_4to1 is
    component mux_4to1
    port(
        A,B,C,D : in std_logic;
        S0,S1 : in std_logic;
        Z : out std_logic
    );
end component;

signal A, B, C, D, S0, S1 : std_logic;
signal Z : std_logic;

begin

    uut : mux_4to1
    port map(A => A,B => B,C => C,D => D,S0 => S0,S1 => S1,Z => Z);

    stimulus : process
    begin
        A <= '0';
        B <= '0';
        C <= '0';
        D <= '0';
        S0 <= '0';
        S1 <= '0';
        wait for 10 ns;
        
        A <= '1';
        B <= '0';
        C <= '1';
        D <= '0';
        S0 <= '0';
        S1 <= '0';
        wait for 10 ns;
        
        A <= '0';
        B <= '1';
        C <= '0';
        D <= '0';
        S0 <= '1';
        S1 <= '0';
        wait for 10 ns;
        
        A <= '0';
        B <= '1';
        C <= '0';
        D <= '1';
        S0 <= '0';
        S1 <= '1';
        wait for 10 ns;
        
        A <= '0';
        B <= '0';
        C <= '0';
        D <= '1';
        S0 <= '1';
        S1 <= '1';
        wait for 10 ns;
        
    -- add more test cases as needed

        wait;
    end process;

end behavior;

































--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
--
--entity Mux4_1_D is
--end entity;
--
--architecture tb of Mux4_1_D is
--    component MUX4_1_D is
--        Port ( i : in STD_LOGIC_VECTOR (3 downto 0);
--            s : in STD_LOGIC_VECTOR (1 downto 0);
--            y : out STD_LOGIC);
--    end component;
--    signal i : STD_LOGIC_VECTOR (3 downto 0);
--    signal s : STD_LOGIC_VECTOR (1 downto 0);
--    signal y : STD_LOGIC;
--begin
--    uut: MUX4_1_D port map(
--        i => i,
--        s => s,
--        y => y);
--    stim: process
--    begin
--        i <= "1010";
--        s <= "00";
--        wait for 5 ns;
--        s <= "01";
--        wait for 5 ns;
--        s <= "10";
--        wait for 5 ns;
--        s <= "11";
--        wait for 5 ns;
--        wait;
--    end process;
--end tb;