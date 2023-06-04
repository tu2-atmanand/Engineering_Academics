library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity encoder8_3_B is
    port (en: in std_logic;
        a_in: in std_logic_vector (7 downto 0);
        y_op: out std_logic_vector (2 downto 0));
end encoder8_3_B;
architecture behavioral of encoder8_3_B is
begin
    process (en, a_in)
    begin
        if (en = '1') then
            y_op <= "ZZZ";
        else
            case (a_in) is
                when "00000001" => y_op <= "000";
                when "00000010" => y_op <= "001";
                when "00000100" => y_op <= "010";
                when "00001000" => y_op <= "011";
                when "00010000" => y_op <= "100";
                when "00100000" => y_op <= "101";
                when "01000000" => y_op <= "110";
                when "10000000" => y_op <= "111";
                when others => null;
            end case;
        end if;
    end process;
end;


-- for only structural its 4x2 and 2x4, and for rest its 8x3 and 3x8
--
--entity Priority_Encoder_A is
--    Port ( INPUT : in STD_LOGIC_VECTOR (3 downto 0);
--        OUTPUT : out STD_LOGIC_VECTOR (2 downto 0));
--end Priority_Encoder_A;
--
--
--architecture Behavioral of Priority_Encoder_A is
--
--begin
--    process(INPUT)
--    begin
--        if (INPUT(3)='1') then
--            OUTPUT <= "111";
--        elsif (INPUT(2)='1') then
--            OUTPUT <= "101";
--        elsif (INPUT(1)='1') then
--            OUTPUT <= "011";
--        elsif (INPUT(0)='1') then
--            OUTPUT <= "001";
--        else
--            OUTPUT <= "000";
--        end if;
--    end process;
--
--end Behavioral;