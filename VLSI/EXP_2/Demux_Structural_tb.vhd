library ieee;
use ieee.std_logic_1164.all;

entity tb_Demux_1x4_S is
end entity tb_Demux_1x4_S;

architecture testbench of tb_Demux_1x4_S is

    signal I : std_logic;
    signal S : std_logic_vector(1 downto 0);
    signal O : std_logic_vector(3 downto 0);
    
    component Demux_1x4_S is
        port (
            I : in std_logic;
            S : in std_logic_vector(1 downto 0);
            O : out std_logic_vector(3 downto 0)
        );
    end component;
    
    constant clk_period : time := 20 ns;
    
begin

    DUT : Demux_1x4_S port map (I, S, O);
    
    -- Clock process
    process
    begin
        while now < 1000 ns loop
            wait for clk_period/2;
            I <= '1';
            wait for clk_period/2;
            I <= '0';
        end loop;
        wait;
    end process;
    
    -- Stimulus process
    process
    begin
        -- Test case 1
        S <= "00";
        wait for 20 ns;
        assert O = "0001"
        report "Error: Test case 1 failed"
        severity error;
        
        -- Test case 2
        S <= "01";
        wait for 20 ns;
        assert O = "0010"
        report "Error: Test case 2 failed"
        severity error;
        
        -- Test case 3
        S <= "10";
        wait for 20 ns;
        assert O = "0100"
        report "Error: Test case 3 failed"
        severity error;
        
        -- Test case 4
        S <= "11";
        wait for 20 ns;
        assert O = "1000"
        report "Error: Test case 4 failed"
        severity error;
        
        wait;
    end process;
    
end architecture testbench;
