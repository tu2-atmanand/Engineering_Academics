--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--
--entity full_adder_behav is
--    Port ( A : in STD_LOGIC;
--        B : in STD_LOGIC;
--        Cin : in STD_LOGIC;
--        S : out STD_LOGIC;
--        Cout : out STD_LOGIC);
--end full_adder_behav;
--
--architecture Behavioral of full_adder_behav is
--begin
--    S <= A xor B xor Cin;
--    Cout <= (A and B) or (Cin and (A xor B));
--end Behavioral;






-- Half Adder structural

library ieee;
use ieee.std_logic_1164.all;

entity xor_gate is
    port(x, y: in std_logic; z: out std_logic);
end xor_gate;
architecture behavioural1 of xor_gate is begin
    z <= x xor y;
end behavioural1;


library ieee;
use ieee.std_logic_1164.all;

entity and_gate is
    port(m, n: in std_logic; o: out std_logic);
end and_gate;
architecture behavioural2 of and_gate is begin
    o <= m and n;
end behavioural2;


library ieee;
use ieee.std_logic_1164.all;

entity half_adder_str is
    port(a, b: in std_logic; s, c: out std_logic);
end entity half_adder_str;

architecture structure of half_adder_str is
    component xor_gate is
        port (x, y: in std_logic; z: out std_logic);
    end component;
    component and_gate is
        port (m, n: in std_logic; o: out std_logic);
    end component;
begin
    I1: xor_gate port map(a, b, s);
    I2: and_gate port map(a, b, c);
end architecture structure;



-- Full Adder Structural


library ieee;
use ieee.std_logic_1164.all;

entity or_gate is
    port(x, y: in std_logic; z: out std_logic);
end entity or_gate;
architecture behavioural of or_gate is
begin
    z <= x or y;
end behavioural;



library ieee;
use ieee.std_logic_1164.all;

entity full_adder_str is
    Port ( A : in STD_LOGIC;
        B : in STD_LOGIC;
        Cin : in STD_LOGIC;
        S : out STD_LOGIC;
        Cout : out STD_LOGIC);
end entity full_adder_str;

architecture structure of full_adder_str is
    component half_adder_str is
        port (a, b: in std_logic; s, c: out std_logic);
    end component;
    component or_gate is
        port (x, y: in std_logic; z: out std_logic);
    end component;
    signal HAS_0, HAC_0, HAC_1: std_logic;
begin
    I1: half_adder_str port map(a=>A, b=>B, s=>HAS_0, c=>HAC_0);
    I2: half_adder_str port map(a=>HAS_0, b=>Cin, s=>S, c=>HAC_1);
    I3: or_gate port map(x=>HAC_1, y=>HAC_0, z=>Cout);
end architecture structure;




-- Ripple Carry Adder

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ripple_Adder is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
        B : in STD_LOGIC_VECTOR (3 downto 0);
        Cin : in STD_LOGIC;
        S : out STD_LOGIC_VECTOR (3 downto 0);
        Cout : out STD_LOGIC);
end Ripple_Adder;

architecture Behavioral of Ripple_Adder is
    component full_adder_str
    Port ( A : in STD_LOGIC;
        B : in STD_LOGIC;
        Cin : in STD_LOGIC;
        S : out STD_LOGIC;
        Cout : out STD_LOGIC);
end component;

signal c1,c2,c3: STD_LOGIC;
begin
    FA1: full_adder_str port map( A(0), B(0), Cin, S(0), c1);
    FA2: full_adder_str port map( A(1), B(1), c1, S(1), c2);
    FA3: full_adder_str port map( A(2), B(2), c2, S(2), c3);
    FA4: full_adder_str port map( A(3), B(3), c3, S(3), Cout);
end Behavioral;