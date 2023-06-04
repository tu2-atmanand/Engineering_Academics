Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity encoder_4x2_D_tb is
end encoder_4x2_D_tb;
architecture encoder_4x2_tb_d of encoder_4x2_D_tb is
    component encoder_4x2_D
    port(A,B,C,D: in std_logic;
        Y: out std_logic_vector(1 downto 0));
end component;

signal A,B,C,D:STD_LOGIC := '0';
signal Y:STD_LOGIC_VECTOR(1 downto 0);
begin
    ENCODE:encoder_4x2_D port map(A,B,C,D,Y);
    A <= not A after 80 ns;
    B <= not B after 40 ns;
    C <= not C after 20 ns;
    D <= not D after 10 ns;

end encoder_4x2_tb_d;