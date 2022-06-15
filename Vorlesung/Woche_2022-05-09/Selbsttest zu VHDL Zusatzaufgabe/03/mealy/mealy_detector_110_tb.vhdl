library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mealy_detector_110_tb is
end mealy_detector_110_tb;

architecture test of mealy_detector_110_tb is
    component mealy_detector_110
        port (
            reset : in std_logic;
            clock : in std_logic; -- Taktgeber in Sekunden
            sequence_in : in std_logic; -- Input Daten
            detector_out : out std_logic
        );
    end component;

    signal reset : std_logic := '0';
    signal clock : std_logic := '0'; -- Taktgeber in Sekunden
    signal sequence_in : std_logic := '0'; -- Input Daten
    signal detector_out : std_logic;

    constant clock_period : time := 20 ns;
    begin
    detector_110_test: mealy_detector_110 port map(
        reset => reset, 
        clock => clock, 
        sequence_in => sequence_in,
        detector_out => detector_out
    );
    clock_process : process 
    begin
        clock <= '0';
        wait for clock_period/2;
        clock <= '1';
        wait for clock_period/2;
    end process;

    state_mover : process
    begin
        sequence_in <= '0';
        reset <= '1';
        -- Wait 100 ns for global reset to finish
        wait for 30 ns;
        reset <= '0';
        wait for 40 ns;

        sequence_in <= '1';
        wait for clock_period;
        sequence_in <= '1';
        wait for clock_period;
        sequence_in <= '0';
        wait for clock_period;
        sequence_in <= '0';
        wait for clock_period;
        sequence_in <= '1';
        wait for clock_period;
        sequence_in <= '1';
        wait for clock_period;
        sequence_in <= '0';
        wait for clock_period;
        sequence_in <= '1';
        wait for clock_period;
        sequence_in <= '0';
        wait for clock_period;
        sequence_in <= '1';
        wait for clock_period;
        sequence_in <= '1';
        wait for clock_period;
        sequence_in <= '1';
        wait for clock_period;
        sequence_in <= '0';
        wait for clock_period;
        sequence_in <= '1';
        wait;
    end process;
end test;