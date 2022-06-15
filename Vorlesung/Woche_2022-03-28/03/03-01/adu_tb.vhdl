library IEEE;
use IEEE.std_logic_1164.all;

entity adu_tb is
end adu_tb;

architecture test of adu_tb is
    component adu
        port (
            k7: in bit;
            k6: in bit;
            k5: in bit;
            k4: in bit;
            k3: in bit;
            k2: in bit;
            k1: in bit;

            z2: out bit;
            z1: out bit;
            z0: out bit
        );
    end component;

    signal k7, k6, k5, k4, k3, k2, k1, z0, z1, z2 : bit;

begin
    prioritaetsdekoder: adu port map(
            k1 => k1,
            k2 => k2,
            k3 => k3,
            k4 => k4,
            k5 => k5,
            k6 => k6,
            k7 => k7,
            z0 => z0,
            z1 => z1,
            z2 => z2
    );
    process begin
        k1 <= '0';
        k2 <= '0';
        k3 <= '0';
        k4 <= '0';
        k5 <= '0';
        k6 <= '0';
        k7 <= '0';
        wait for 1 ns;
        k1 <= '1';
        k2 <= '0';
        k3 <= '0';
        k4 <= '0';
        k5 <= '0';
        k6 <= '0';
        k7 <= '0';
        wait for 1 ns;
        k1 <= '1';
        k2 <= '1';
        k3 <= '0';
        k4 <= '0';
        k5 <= '0';
        k6 <= '0';
        k7 <= '0';
        wait for 1 ns;
        k1 <= '1';
        k2 <= '1';
        k3 <= '1';
        k4 <= '0';
        k5 <= '0';
        k6 <= '0';
        k7 <= '0';
        wait for 1 ns;
        k1 <= '1';
        k2 <= '1';
        k3 <= '1';
        k4 <= '1';
        k5 <= '0';
        k6 <= '0';
        k7 <= '0';
        wait for 1 ns;
        k1 <= '1';
        k2 <= '1';
        k3 <= '1';
        k4 <= '1';
        k5 <= '1';
        k6 <= '0';
        k7 <= '0';
        wait for 1 ns;
        k1 <= '1';
        k2 <= '1';
        k3 <= '1';
        k4 <= '1';
        k5 <= '1';
        k6 <= '1';
        k7 <= '0';
        wait for 1 ns;
        k1 <= '1';
        k2 <= '1';
        k3 <= '1';
        k4 <= '1';
        k5 <= '1';
        k6 <= '1';
        k7 <= '1';
        wait for 1 ns;

        assert false report "Reached end of test";
        wait;
    end process;
end test;