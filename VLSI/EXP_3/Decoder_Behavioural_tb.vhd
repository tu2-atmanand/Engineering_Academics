library ieee;
use ieee.std_logic_1164.all;

entity decoder_3x8_b_tb is
end entity decoder_3x8_b_tb;

architecture testbench of decoder_3x8_b_tb is
    signal I: std_logic_vector(2 downto 0);
    signal y: std_logic_vector(7 downto 0);

    component decoder_3x8_b is
        port (
            I: in std_logic_vector(2 downto 0);
            y: out std_logic_vector(7 downto 0)
        );
    end component;
begin
    UUT: decoder_3x8_b port map (I,y);
    -- Test cases
    stimulus: process
    begin
        I <= "000"; wait for 10 ns;
        assert y = "00000001" report "Error for input 000" severity error;
        I <= "001"; wait for 10 ns;
        assert y = "00000010" report "Error for input 001" severity error;
        I <= "010"; wait for 10 ns;
        assert y = "00000100" report "Error for input 010" severity error;
        I <= "011"; wait for 10 ns;
        assert y = "00001000" report "Error for input 011" severity error;
        I <= "100"; wait for 10 ns;
        assert y = "00010000" report "Error for input 100" severity error;
        I <= "101"; wait for 10 ns;
        assert y = "00100000" report "Error for input 101" severity error;
        I <= "110"; wait for 10 ns;
        assert y = "01000000" report "Error for input 110" severity error;
        I <= "111"; wait for 10 ns;
        assert y = "10000000" report "Error for input 111" severity error;
        wait;
    end process stimulus;
end architecture testbench;
