library IEEE;
use IEEE.std_logic_1164.all;

entity fakultaet_tb is
end fakultaet_tb;

architecture test of fakultaet_tb is
    component fakultaet
        port (
            ein: in Integer;
            aus: out Integer
        );
    end component;

    signal ein, aus : Integer;

begin
    dut: fakultaet port map(
            ein => ein,
            aus => aus
    );
    process begin
        ein <= 0; -- 1
        wait for 1 ns;
        ein <= 1; -- 1
        wait for 1 ns;
        ein <= 6; -- 720
        wait for 1 ns;
        ein <= 10; -- 3.628.800
        wait for 1 ns;

        assert false report "Reached end of test";
        wait;
    end process;
end test;