library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity UpDownCounterBehav_tb is
end entity UpDownCounterBehav_tb;

architecture rtl of UpDownCounterBehav_tb is
    signal CLK,RST,DIR:STD_LOGIC;
    signal O:STD_LOGIC_VECTOR(3 downto 0);
    component UpDownCounterBehav
    port(CLK,RST,DIR:in STD_LOGIC; O:out STD_LOGIC_VECTOR(3 downto 0));
end component;
begin
    A1: UpDownCounterBehav port map(CLK,RST,DIR,O);
    P2:process
    begin
        CLK<='0';
        wait for 2 ns;
        CLK<='1';
        wait for 2 ns;
    end process;
    P1:process
    begin
        RST<='1';
        wait for 4 ns;
        RST<='0';
        DIR<='0';
        wait for 61 ns;
        DIR<='1';
        wait for 100 ns;
    end process;
end architecture rtl;

















--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--
--entity Counter_VHDL_TB is
--end Counter_VHDL_TB;
--
--architecture Behavioral of Counter_VHDL_TB is
--    component Counter_VHDL is
--        port (
--            Number: in std_logic_vector(0 to 3);
--            Clock: in std_logic;
--            Load: in std_logic;
--            Reset: in std_logic;
--            Direction: in std_logic;
--            Output: out std_logic_vector(0 to 3)
--        );
--    end component;
--
--    signal Clock: std_logic := '0';
--    signal Reset: std_logic := '0';
--    signal Load: std_logic := '0';
--    signal Direction: std_logic := '0';
--    signal Number: std_logic_vector(0 to 3) := "0000";
--    signal Output: std_logic_vector(0 to 3);
--begin
--    DUT: Counter_VHDL port map(Number => Number,
--        Clock => Clock,
--        Load => Load,
--        Reset => Reset,
--        Direction => Direction,
--        Output => Output);
--
--    ClockProcess: process
--    begin
--        while true loop
--            Clock <= not Clock;
--            wait for 5 ns;
--        end loop;
--    end process;
--
--    ResetProcess: process
--    begin
--        Reset <= '1';
--        wait for 10 ns;
--        Reset <= '0';
--        wait for 10 ns;
--    end process;
--
--    LoadProcess: process
--    begin
--        wait for 10 ns;
--        Load <= '1';
--        Number <= "0001";
--        wait for 10 ns;
--        Load <= '0';
--        wait for 100 ns;
--        for i in 0 to 14 loop
--            wait for 10 ns;
--        end loop;
--        Load <= '1';
--        Number <= "0000";
--        wait for 10 ns;
--        Load <= '0';
--        wait;
--    end process;
--
--end Behavioral;
--