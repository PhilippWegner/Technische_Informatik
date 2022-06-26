library ieee;
library ieee.std_logic_1164;
library ieee.numeric_std.all;

-- Tabelle:
-- Zahl | BCDin | Seven_segment (a,b,c,d,e,f,g)
-- 0    | 0000  | 1111110
-- 1    | 0001  | 0110000
-- 2    | 0010  | 1101101
-- 3    | 0011  | 1111001
-- 4    | 0100  | 0110011
-- 5    | 0101  | 1011011
-- 6    | 0110  | 1011111
-- 7    | 0111  | 1110000
-- 8    | 1000  | 1111111
-- 9    | 1001  | 1111011

entity sieben_segment_anzeige is
    port (
        BCDin : in std_logic_vector (3 downto 0);
        Seven_segment : out std_logic_vector (6 downto 0)
    );
end sieben_segment_anzeige;

architecture Behavioral of sieben_segment_anzeige is
begin
    stim_process : process(BCDin)
    begin
        case BCDin is 
            -- when "0000" 
            when x"0"
                => Seven_segment <= "1111110";
            -- when "0001" 
            when x"1"
                => Seven_segment <= "0110000";
            -- when "0010" 
            when x"2"
                => Seven_segment <= "1101101";
            -- when "0011" 
            when x"3"
                => Seven_segment <= "1111001";
            -- when "0100" 
            when x"4"
                => Seven_segment <= "0110011";
            -- when "0101" 
            when x"5"
                => Seven_segment <= "1011011";
            -- when "0110" 
            when x"6"
                => Seven_segment <= "1011111";
            -- when "0111" 
            when x"7"
                => Seven_segment <= "1110000";
            -- when "1000" 
            when x"8"
                => Seven_segment <= "1111111";
            -- when "1001" 
            when x"9"
                => Seven_segment <= "1111011";
            when others 
                => Seven_segment <= "0000000";
    end process;
end Behavioral;
