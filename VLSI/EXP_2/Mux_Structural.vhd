library ieee;
use ieee.std_logic_1164.all;

entity or_gate2 is
    port(x, y: in std_logic; z: out std_logic);
end entity or_gate2;
architecture behavioural of or_gate2 is
begin
    z <= x or y;
end behavioural;

library ieee;
use ieee.std_logic_1164.all;

entity not_1 is
    port(x: in std_logic; z: out std_logic);
end entity not_1;
architecture behavioural of not_1 is
begin
    z <= not(x);
end behavioural;


library ieee;
use ieee.std_logic_1164.all;

entity and_gate2 is
    port(x, y: in std_logic; z: out std_logic);
end entity and_gate2;
architecture behavioural of and_gate2 is
begin
    z <= x and y;
end behavioural;

-- MUX 2X1
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MUX2 is
    port(
        A,B,S1:in STD_LOGIC;
        Y:out STD_LOGIC
    );
end entity MUX2;

architecture struc of MUX2 is
    component or_gate2 is
        port (x, y: in std_logic; z: out std_logic);
    end component;
    component and_gate2 is
        port (x, y: in std_logic; z: out std_logic);
    end component;
    component not_1 is
        port (x: in std_logic; z: out std_logic);
    end component;
    signal l1,l2,l3: STD_LOGIC;
begin
    I1: not_1 port map(S1,l3);
    I2: and_gate2 port map(A,l3,l1);
    I3: and_gate2 port map(B,S1,l2);
    I4: or_gate2 port map(l1,l2,Y);
end architecture struc;


-- MUX 4X1

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity MUX4_1_S is
    port(
        A,B,C,D: in STD_LOGIC;
        CTRL1 : in STD_LOGIC_VECTOR(1 downto 0);
        Y: out STD_LOGIC
    );
end entity MUX4_1_S;

architecture rtl of MUX4_1_S is
    component MUX2
    port(A,B,S1:in STD_LOGIC;
        Y:out STD_LOGIC);
end component;
signal a1,a2:STD_LOGIC;
begin
    MUXa:MUX2 port map(A,B,CTRL1(0),a1);
    MUXb:MUX2 port map(C,D,CTRL1(0),a2);
    MUXc:MUX2 port map(a1,a2,CTRL1(1),Y);
end architecture rtl;








--library ieee;
--use ieee.std_logic_1164.all;
--
--entity and3 is
--    port(a0,a1, a2 :in std_logic; aout:out std_logic);
--end and3;
--architecture struct of and3 is
--begin
--    aout<= a0 and a1 and a2;
--end struct;
--
--
--library ieee;
--use ieee.std_logic_1164.all;
--
--entity inv is
--    port(pin :in std_logic; pout:out std_logic);
--end inv;
--architecture struct of inv is
--begin
--    pout <= not pin;
--end struct;
--
--
--library ieee;
--use ieee.std_logic_1164.all;
--
--entity or4 is
--    port(r0,r1, r2, r3 :in std_logic; rout:out std_logic);
--end or4;
--architecture struct of or4 is
--begin
--    rout<= r0 or r1 or r2 or r3;
--end struct;
--
--
--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
--
--entity MUX4_1_S is
--    port ( Sel0,Sel1 : in std_logic;
--        A, B, C, D : in std_logic;
--        Y : out std_logic );
--end MUX4_1_S;
--
--architecture structural of MUX4_1_S is
--    component inv
--    port (pin : in std_logic; pout :out std_logic);
--end component;
--component and3
--port (a0,a1,a2: in std_logic; aout:out std_logic);
--end component;
--component or4
--port (r0,r1,r2,r3:in std_logic; rout:out std_logic);
--end component;
--
--signal selbar0,selbar1,t1,t2,t3,t4: std_logic;
--begin
--    INV0: inv port map (Sel0, selbar1);
--    INV1: inv port map (Sel1, selbar1);
--    A1: and3 port map (A, selbar0, selbar1, t1);
--    A2: and3 port map (B, Sel0, selbar1, t2);
--    A3: and3 port map (C, selbar0, Sel1, t2);
--    A4: and3 port map (D, Sel0, Sel1, t4);
--    O1: or4 port map (t1, t2, t3, t4, Y);
--end structural;