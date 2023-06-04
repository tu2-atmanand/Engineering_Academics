library ieee;
use ieee.std_logic_1164.all;

entity or_gate is
    port(x, y: in std_logic; Z: out std_logic);
end entity or_gate;
architecture behavioural of or_gate is
begin
    Z <= X or Y;
end behavioural;





Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity encoder_4x2_str is
    port(Y:in std_logic_vector(3 downto 0);
        A,B:out std_logic);
end encoder_4x2_str;

architecture structural of encoder_4x2_str is
    component or_gate
    port(X,Y:in std_logic;
        Z:out std_logic);
end component;

signal n1:STD_LOGIC;
begin
    OR1: or_gate port map(Y(3),Y(2),A);
    OR2: or_gate port map(Y(3),Y(1),B);
end structural;













--library ieee;
--use ieee.std_logic_1164.all;
--
--entity gate_logic is
--    port (A: in std_logic;
--        B: in std_logic;
--        C: in std_logic;
--        D: in std_logic;
--        X: out std_logic_vector(1 downto 0));
--end gate_logic;
--
--architecture dataflow of gate_logic is
--begin
--    X(0) <= not ((not A) and (not B) and (not C) and (not D));
--    X(1) <= not ((not A) and (not C) and (not D)) or
--    not ((not B) and (not C) and (not D));
--end dataflow;
--
--entity encoder_4x2_structural is
--    port (A: in std_logic;
--        B: in std_logic;
--        C: in std_logic;
--        D: in std_logic;
--        Y: out std_logic_vector(1 downto 0));
--end encoder_4x2_structural;
--
--architecture structural of encoder_4x2_structural is
--    component gate_logic is
--        port (A: in std_logic;
--            B: in std_logic;
--            C: in std_logic;
--            D: in std_logic;
--            X: out std_logic_vector(1 downto 0));
--    end component;
--
--    signal W: std_logic_vector(1 downto 0);
--
--begin
--    U1: gate_logic port map (A, B, C, D, W);
--    Y <= W;
--end structural;
--