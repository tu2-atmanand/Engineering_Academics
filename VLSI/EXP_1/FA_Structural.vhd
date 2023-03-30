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
    port(a, b, cin: in std_logic; s, cout: out std_logic);
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
    I1: half_adder_str port map(a=>a, b=>b, s=>HAS_0, c=>HAC_0);
    I2: half_adder_str port map(a=>HAS_0, b=>cin, s=>s, c=>HAC_1);
    I3: or_gate port map(x=>HAC_1, y=>HAC_0, z=>cout);
end architecture structure;