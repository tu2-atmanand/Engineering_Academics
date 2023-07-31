library ieee;
use ieee.std_logic_1164.all;

entity mux_4to1 is
    port(
        A,B,C,D : in STD_LOGIC;
        S0,S1: in STD_LOGIC;
        Z: out STD_LOGIC
    );
end mux_4to1;

architecture dataflow of mux_4to1 is
begin
    Z <= (A and not S1 and not S0) or
    (B and not S1 and S0) or
    (C and S1 and not S0) or
    (D and S1 and S0);
end dataflow;















--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
--
--entity MUX4_1_D is
--    Port ( i : in  STD_LOGIC_VECTOR (3 downto 0);
--        s : in  STD_LOGIC_VECTOR (1 downto 0);
--        y : out  STD_LOGIC);
--end MUX4_1_D;
--architecture dataflow of MUX4_1_D is
--begin
--    with s select
--    y <= i(0) when "00",
--        i(1) when "01",
--        i(2) when "10",
--        i(3) when others;
--end dataflow;