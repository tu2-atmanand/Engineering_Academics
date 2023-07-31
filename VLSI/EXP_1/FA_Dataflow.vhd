library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity full_adder_dataf is
    port (a, b, cin: in std_logic; s, cout: out std_logic);
end full_adder_dataf;
architecture dataflow of full_adder_dataf is
begin
    s <= a xor b xor cin;
    cout <= ((a xor b) and cin) or (a and b);
end dataflow;