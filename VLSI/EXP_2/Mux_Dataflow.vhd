library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MUX4_1_D is
    Port ( i : in  STD_LOGIC_VECTOR (3 downto 0);
        s : in  STD_LOGIC_VECTOR (1 downto 0);
        y : out  STD_LOGIC);
end MUX4_1_D;
architecture dataflow of MUX4_1_D is
begin
    with s select
    y <= i(0) when "00",
        i(1) when "01",
        i(2) when "10",
        i(3) when others;
end dataflow;