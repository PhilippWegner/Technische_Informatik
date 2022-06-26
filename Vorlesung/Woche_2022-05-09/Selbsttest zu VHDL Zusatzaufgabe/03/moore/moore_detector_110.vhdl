library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- 101 palindrom
-- https://www.fpga4student.com/2017/09/vhdl-code-for-moore-fsm-sequence-detector.html [Hilfreich]
entity moore_detector_110 is
    port (
        reset : in std_logic;
        clock : in std_logic; -- Taktgeber in Sekunden
        sequence_in : in std_logic; -- Input Daten
        detector_out : out std_logic
    );
end moore_detector_110;

architecture behave of moore_detector_110 is
    type moore_fsm is (s00, s10, s20, s01);
    signal current_state : moore_fsm;
    signal next_state : moore_fsm;
begin
    clock_process : process(clock, reset)
    begin
        if(rising_edge(clock)) then
            -- Synchron reset
            if(reset = '1') then
                current_state <= s00;
            else
                current_state <= next_state;
            end if;

        end if;
    end process;

    state_mover : process(sequence_in, current_state)
    begin
        if(current_state = s00) then
            if(sequence_in = '1') then
                next_state <= s10;
            else -- sequence_in = '1'
                next_state <= s00;
            end if;
        elsif(current_state = s10) then
            if(sequence_in = '1') then
                next_state <= s20;
            else -- sequence_in = '0'
                next_state <= s00;      
            end if;
        elsif(current_state = s20) then
            if(sequence_in = '1') then
                next_state <= s20;
            else -- sequence_in = '0'
                next_state <= s01;
            end if;
        elsif(current_state = s01) then
            if(sequence_in = '1') then
                next_state <= s10;
            else -- sequence_in = '0'
                next_state <= s00;
            end if;
        else
            next_state <= s00;
        end if;
    end process;

    outputter : process(current_state)
    begin
        if(current_state = s00) then
            detector_out <= '0';
        elsif(current_state = s10) then
            detector_out <= '0';
        elsif(current_state = s20) then
            detector_out <= '0';
        elsif(current_state = s01) then
            detector_out <= '1';
        end if;
    end process;
end behave;