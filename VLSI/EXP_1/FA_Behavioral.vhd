library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity full_adder_behav is
    port (a, b, cin: in bit;
        sum, cout: out bit);
end full_adder_behav;

architecture befa of full_adder_behav is
    signal D: bit_vector(2 downto 0);
begin
    D<=(a & b & cin);
    process(D)
    begin
        case D is
            when "000" => sum<='0'; cout<='0';
            when "001" => sum<='1'; cout<='0';
            when "010" => sum<='1'; cout<='0';
            when "011" => sum<='0'; cout<='1';
            when "100" => sum<='1'; cout<='0';
            when "101" => sum<='0'; cout<='1';
            when "110" => sum<='0'; cout<='1';
            when "111" => sum<='1'; cout<='1';
        end case;
        end process;
end befa;

















--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
--entity full_adder_behav is
--    port (a, b, cin: in std_logic;
--        sum, cout: out std_logic);
--end full_adder_behav;
--architecture behavioural of full_adder_behav is
--begin
--    process(a, b, cin)
--    begin
--        sum <= a xor b xor cin;
--        cout <= ((a xor b) and cin) or (a and b);
--    end process;
--end behavioural;