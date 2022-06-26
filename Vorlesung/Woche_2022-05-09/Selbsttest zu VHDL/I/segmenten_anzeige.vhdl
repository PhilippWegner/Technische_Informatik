library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- 101 palindrom
-- https://www.fpga4student.com/2017/09/vhdl-code-for-moore-fsm-sequence-detector.html [Hilfreich]
entity segmenten_anzeige is
    port (
        sequence_in : in integer; -- Input Daten
        detector_out : out std_logic_vector (6 downto 0)
    );
end segmenten_anzeige;

architecture behave of segmenten_anzeige is
begin
    stim_process : process(sequence_in)
    begin
        detector_out <= "0000000";
        -- detector_out <= "abcdefg"
        if(sequence_in = 0) then
            detector_out <= "1111110";
        elsif(sequence_in = 1) then
            detector_out <= "0110000";
        elsif(sequence_in = 2) then
            detector_out <= "1101101";
        elsif(sequence_in = 3) then
            detector_out <= "1111001";
        elsif(sequence_in = 4) then
            detector_out <= "1111001";
        elsif(sequence_in = 5) then
            detector_out <= "1011011";
        elsif(sequence_in = 6) then
            detector_out <= "1011111";
        elsif(sequence_in = 7) then
            detector_out <= "1110000";
        elsif(sequence_in = 8) then
            detector_out <= "1111111";
        elsif(sequence_in = 9) then
            detector_out <= "1111011";
        else
            detector_out <= "0000000";
        end if;
    end process;
end behave;