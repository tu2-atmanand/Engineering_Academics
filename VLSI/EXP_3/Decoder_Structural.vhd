library ieee;
use ieee.std_logic_1164.all;

entity and_gate is
    port(x, y: in std_logic; z: out std_logic);
end entity and_gate;
architecture andbhav of and_gate is
begin
    z <= x and y;
end andbhav;


library ieee;
use ieee.std_logic_1164.all;

entity not_gate is
    port(x: in std_logic; z: out std_logic);
end entity not_gate;
architecture notbehav of not_gate is
begin
    z <= not(x);
end notbehav;



Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity decoder_2x4_S is
    port(A,B:in std_logic;
        Y:out std_logic_vector(3 downto 0));
end decoder_2x4_S;

architecture structural of decoder_2x4_S is
    
    component and_gate
    port(x,y:in std_logic;
        z:out std_logic);
end component;

component not_gate
port(x:in std_logic;
    z:out std_logic);
end component;

signal n1,n2:STD_LOGIC;
begin
    NOT1: not_gate port map(A,n1);
    NOT2: not_gate port map(B,n2);
    ANDS1: and_gate port map(A,B,Y(3));
    ANDS2: and_gate port map(A,n2,Y(2));
    ANDS3: and_gate port map(B,n1,Y(1));
    ANDS4: and_gate port map(n1,n2,Y(0));
end structural;










--library IEEE;
--use IEEE.STD_LOGIC_1164.all;
--
--entity gate_logic is
--    port (i0, i1 : in std_logic;
--        nsel : in std_logic;
--        o0, o1, o2, o3 : out std_logic);
--end gate_logic;
--
--architecture dataflow of gate_logic is
--begin
--    o0 <= (i0 and i1 and nsel);
--    o1 <= (i0 and not i1 and nsel);
--    o2 <= (not i0 and i1 and nsel);
--    o3 <= (not i0 and not i1 and nsel);
--end dataflow;
--
--entity decoder_2x4_s is
--    port (i0, i1 : in std_logic;
--        nsel : in std_logic;
--        y : out std_logic_vector(3 downto 0));
--end decoder_2x4_s;
--
--architecture structural of decoder_2x4_s is
--    component gate_logic
--    port (i0, i1 : in std_logic;
--        nsel : in std_logic;
--        o0, o1, o2, o3 : out std_logic);
--end component;
--
--signal gate_out_0, gate_out_1, gate_out_2, gate_out_3 : std_logic;
--begin
--    gates : gate_logic port map (i0 => i0, i1 => i1, nsel => nsel,
--        o0 => gate_out_0, o1 => gate_out_1,
--        o2 => gate_out_2, o3 => gate_out_3);
--    y <= gate_out_0 & gate_out_1 & gate_out_2 & gate_out_3;
--end structural;
--
--