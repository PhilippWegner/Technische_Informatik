library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- 101 palindrom
-- https://www.fpga4student.com/2017/09/vhdl-code-for-moore-fsm-sequence-detector.html [Hilfreich]
entity mealy_detector_110 is
    port (
        reset : in std_logic;
        clock : in std_logic; -- Taktgeber in Sekunden
        sequence_in : in std_logic; -- Input Daten
        detector_out : out std_logic
    );
end mealy_detector_110;

architecture behave of mealy_detector_110 is
    type mealy_fsm is (s0, s1, s2);
    signal current_state : mealy_fsm;
    signal next_state : mealy_fsm;
begin
    clock_process : process(clock, reset)
    begin
        if(rising_edge(clock)) then
            -- Synchron reset
            if(reset = '1') then
                current_state <= s0;
            else
                current_state <= next_state;
            end if;

        end if;
    end process;

    state_mover : process(sequence_in, current_state)
    begin
        if(current_state = s0) then
            if(sequence_in = '1') then
                next_state <= s1;
                detector_out <= '0';
            else -- sequence_in = '1'
                next_state <= s0;
                detector_out <= '0';
            end if;
        elsif(current_state = s1) then
            if(sequence_in = '1') then
                next_state <= s2;
                detector_out <= '0';
            else -- sequence_in = '0'
                next_state <= s0;
                detector_out <= '0';            
            end if;
        elsif(current_state = s2) then
            if(sequence_in = '1') then
                next_state <= s2;
                detector_out <= '0';
            else -- sequence_in = '0'
                next_state <= s0;
                detector_out <= '1';
            end if;
        else
            next_state <= s0;
            detector_out <= '0';
        end if;
    end process;
end behave;