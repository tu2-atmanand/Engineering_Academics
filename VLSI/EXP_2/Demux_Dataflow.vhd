
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Demux_1x4_D is
    Port ( I : in  STD_LOGIC;
        S : in  STD_LOGIC_VECTOR (1 downto 0);
        Y : out  STD_LOGIC_VECTOR (3 downto 0));
end Demux_1x4_D;

architecture dataflow of Demux_1x4_D is
begin
--- since the output is a combination of character and binary bits, bitwise operation with bit and CHARACTER will take place (&) not logical and
    with S select
    Y<=("000" & I) when "00",
        ("00" & I & "0") when "01",
        ("0" & I & "00") when "10",
    (I & "000") when others;
end dataflow;