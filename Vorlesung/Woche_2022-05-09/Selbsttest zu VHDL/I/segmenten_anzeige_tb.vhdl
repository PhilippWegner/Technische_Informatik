library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity segmenten_anzeige_tb is
end segmenten_anzeige_tb;

architecture test of segmenten_anzeige_tb is
    component segmenten_anzeige
        port (
            sequence_in : in integer; -- Input Daten
            detector_out : out std_logic_vector(6 downto 0)
        );
    end component;

    signal sequence_in : integer;

    begin
        segmenten_anzeige_test: segmenten_anzeige port map(
        sequence_in => sequence_in
    );

    stim_process : process
    begin
        for counter in 0 to 9 loop
            sequence_in <= counter;
            wait for 20 ns;
        end loop;
        assert false report "Reached end of test";
        wait;
    end process;
end test;