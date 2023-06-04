library ieee;
use ieee.std_logic_1164.all;

entity encoder8_3_B_tb is
end;

architecture bench of encoder8_3_B_tb is
  -- Component declaration for the encoder
    component encoder8_3_B
    port (
        en   : in  std_logic;
        a_in : in  std_logic_vector (7 downto 0);
        y_op : out std_logic_vector (2 downto 0)
    );
end component;

  -- Testbench signals
signal en   : std_logic := '0';
signal a_in : std_logic_vector (7 downto 0) := (others => '0');
signal y_op : std_logic_vector (2 downto 0);

begin
  -- Instantiate the encoder
    uut: encoder8_3_B port map (en => en, a_in => a_in, y_op => y_op);

  -- Stimulus process
    stimulus: process
    begin
    -- Enable the encoder
        en <= '0';

    -- Send input to the encoder and wait for 20 ns
        a_in <= "00000001"; wait for 20 ns;
        a_in <= "00000010"; wait for 20 ns;
        a_in <= "00000100"; wait for 20 ns;
        a_in <= "00001000"; wait for 20 ns;
        a_in <= "00010000"; wait for 20 ns;
        a_in <= "00100000"; wait for 20 ns;
        a_in <= "01000000"; wait for 20 ns;
        a_in <= "10000000"; wait for 20 ns;

    -- Disable the encoder and wait for 20 ns
        en <= '1'; wait for 20 ns;

    -- Send more input to the encoder and wait for 20 ns
        a_in <= "00000001"; wait for 20 ns;
        a_in <= "00000010"; wait for 20 ns;
        a_in <= "00000100"; wait for 20 ns;

    -- End the simulation
        wait;
    end process;
end bench;
