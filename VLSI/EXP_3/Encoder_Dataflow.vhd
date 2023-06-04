Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity encoder_4x2_D is
    port(A,B,C,D: in std_logic;
        Y: out std_logic_vector(1 downto 0));
end encoder_4x2_D;

architecture dataflow of encoder_4x2_D is
begin
    Y(1) <= A or B;
    Y(0) <= A or C;
end dataflow;