library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity enc_B is
    Port ( I : in  STD_LOGIC_VECTOR (3 downto 0);
        Y : out STD_LOGIC_VECTOR (1 downto 0));
end enc_B;

architecture Behavioral of enc_B is
begin
    process (I)
    begin
        if I = "0001" then Y <= "00";
        elsif I = "0010" then Y <= "01";
        elsif I = "0100" then Y <= "10";
        else Y <= "11";
        end if;
    end process;
end Behavioral;


-- for only structural its 4x2 and 2x4, and for rest its 8x3 and 3x8