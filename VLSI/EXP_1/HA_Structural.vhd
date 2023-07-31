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


















--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
--
--
--entity xor_1 is
--    port(a,b:in std_logic;c:out std_logic);
--end xor_1;
--
--architecture struct of xor_1 is
--begin
--    c<=a xor b;
--end struct;
--
--
--
--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
--
--
--
--entity and_1 is
--    port(a,b:in std_logic; c:out std_logic);
--end and_1;
--
--architecture struct of and_1 is
--begin
--    c<=a and b;
--end struct;
--
--
--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
--
--entity HA_2 is
--    port(a,b:in std_logic; sum,carry: out std_logic);
--end HA_2;
--
--architecture Structural of HA_2 is
--    component xor_1
--    port(a,b:in std_logic;c:out std_logic);
--end component;
--component and_1
--port(a,b:in std_logic; c:out std_logic);
--end component;
--begin
--    X1:xor_1 port map(a,b,sum);
--    A1:and_1 port map(a,b,carry);
--end Structural;
--