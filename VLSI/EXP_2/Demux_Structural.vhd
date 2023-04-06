
library ieee;
use ieee.std_logic_1164.all;

entity not3 is
    port(x: in std_logic; z: out std_logic);
end entity not3;
architecture dataflow of not3 is
begin
    z <= not(x);
end dataflow;


library ieee;
use ieee.std_logic_1164.all;

entity and_gate3 is
    port(x, y: in std_logic; z: out std_logic);
end entity and_gate3;
architecture dataflow of and_gate3 is
begin
    z <= x and y;
end dataflow;


-- 1x2 Demultiplexer
library IEEE;
use IEEE.std_logic_1164.all;

entity Demux_1x2_S is
    port (
        I : in std_logic;
        S : in std_logic;
        O0 : out std_logic;
        O1 : out std_logic
    );
end entity Demux_1x2_S;

architecture structural of Demux_1x2_S is
    component and_gate3 is
        port (
            x : in std_logic;
            y : in std_logic;
            z : out std_logic
        );
    end component;
    
    component not3 is
        port (
            x : in std_logic;
            z : out std_logic
        );
    end component;
    
    signal S_bar : std_logic;
begin
    U1: not3 port map(S, S_bar);
    U2: and_gate3 port map(I, S_bar, O0);
    U3: and_gate3 port map(I, S, O1);
end architecture structural;





library IEEE;
use IEEE.std_logic_1164.all;

entity Demux_1x4_S is
    port(
        I: in std_logic; S: in std_logic_vector(1 downto 0);
        O: out std_logic_vector(3 downto 0)
    );
end entity Demux_1x4_S;

architecture structural of Demux_1x4_S is
    component Demux_1x2_S is
        port(
            I: in std_logic;
            S: in std_logic;
            O0: out std_logic;
            O1: out std_logic
        );
    end component;

    signal I1, I2, I3: std_logic;

begin
    U1: Demux_1x2_S port map(I1, S(0), O(0), O(1));
    U2: Demux_1x2_S port map(I2, S(0), O(2), O(3));
    U3: Demux_1x2_S port map(I, S(1), I1, I2);
end architecture structural;



