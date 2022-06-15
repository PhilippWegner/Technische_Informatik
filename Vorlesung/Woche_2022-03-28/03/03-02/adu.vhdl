library ieee;
use ieee.std_logic_1164.all;

entity adu is
    port (
        ein: in std_logic_vector(6 downto 0);
        aus: out std_logic_vector(2 downto 0)
    );
end adu;

architecture behave of adu is
begin
    with ein select
        aus <=  "000" when "0000000",
                "001" when "0000001",
                "010" when "0000011",
                "011" when "0000111",
                "100" when "0001111",
                "101" when "0011111",
                "110" when "0111111",
                "111" when "1111111",
                "000" when others;
end behave;