--library IEEE;
--use IEEE.std_logic_1164.all;
--use IEEE.numeric_std.all;
--
--entity Mux4_1_S_tb is
--end entity Mux4_1_S_tb;
--
--architecture tb of Mux4_1_S_tb is
--    component Mux4_1_S
--    port(A,B,C,D: in STD_LOGIC;
--        CTRL1 : in STD_LOGIC_VECTOR(1 downto 0);
--        Y: out STD_LOGIC);
--end component;
--
--signal A,B,C,D,Y: STD_LOGIC:='0';
--signal CTRL1 : STD_LOGIC_VECTOR(1 downto 0):="00";
--
--begin
--    MUX : Mux4_1_S port map(A,B,C,D,CTRL1,Y);
--
--    process
--    begin
--        CTRL1 <= "01";
--        wait for 10 ns;
--        CTRL1 <= "10";
--        wait for 10 ns;
--        CTRL1 <= "11";
--        wait for 10 ns;
--        CTRL1 <= "00";
--        wait for 10 ns;
--    end process;
--
--    process
--    begin
--        A <= '1';
--        wait for 40 ns;
--        A <= '0';
--        wait for 40 ns;
--    end process;
--
--    process
--    begin
--        B <= '1';
--        wait for 80 ns;
--        B <= '0';
--        wait for 80 ns;
--    end process;
--
--    process
--    begin
--        C <= '1';
--        wait for 160 ns;
--        C <= '0';
--        wait for 160 ns;
--    end process;
--
--    process
--    begin
--        D <= '1';
--        wait for 320 ns;
--        D <= '0';
--        wait for 320 ns;
--    end process;
--
--end tb;








library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Mux4_1_S_tb is
end entity Mux4_1_S_tb;

architecture tb of Mux4_1_S_tb is
    component Mux4_1_S
    port(A,B,C,D: in STD_LOGIC;
        CTRL1 : in STD_LOGIC_VECTOR(1 downto 0);
        Y: out STD_LOGIC);
end component;
signal A,B,C,D : STD_LOGIC:='0';
signal Y : STD_LOGIC;
signal CTRL1 : STD_LOGIC_VECTOR(1 downto 0):="00";
begin
    MUX : Mux4_1_S port map(A,B,C,D,CTRL1,Y);
    CTRL1(1) <= not CTRL1(1) after 10 ns;
    CTRL1(0) <= not CTRL1(0) after 20 ns;
    A<= not A after 40 ns;
    B<= not B after 80 ns;
    C<= not C after 160 ns;
    D<= not D after 320 ns;
end tb;








--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
--
--entity Mux4_1_S_tb is
--end entity;
--
--architecture tb of Mux4_1_S_tb is
--    component MUX4_1_S is
--        Port ( i : in STD_LOGIC_VECTOR (3 downto 0);
--            s : in STD_LOGIC_VECTOR (1 downto 0);
--            y : out STD_LOGIC);
--    end component;
--    signal i : STD_LOGIC_VECTOR (3 downto 0);
--    signal s : STD_LOGIC_VECTOR (1 downto 0);
--    signal y : STD_LOGIC;
--begin
--    uut: MUX4_1_S port map(
--        i => i,
--        s => s,
--        y => y);
--
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