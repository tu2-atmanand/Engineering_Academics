library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity half_adder_dataf is
    port (a, b: in bit; s, c: out bit);
end half_adder_dataf;
architecture dataflow of half_adder_dataf is
begin
    s<=a xor b;
    c<=a and b;
end dataflow;











--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
--
--
--entity HA_1 is
--    port(a,b:in std_logic;sum,carry:out std_logic);
--end HA_1;
--
--architecture dataflow of HA_1 is
--begin
--    sum <= a xor b;
--    carry <= a and b;
--end dataflow;