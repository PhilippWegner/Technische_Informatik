library IEEE;
use IEEE.std_logic_1164.all;

entity dau_tb is
end dau_tb;

architecture test of dau_tb is
    component dau
        port (
            a0: in bit;
            a1: in bit;
            a2: in bit;
    
            y0: out bit;
            y1: out bit;
            y2: out bit;
            y3: out bit;
            y4: out bit
        );
    end component;

    signal a0, a1, a2, y0, y1, y2, y3, y4 : bit;

begin
    prioritaetsdekoder: dau port map(
            a0 => a0,
            a1 => a1,
            a2 => a2,
            y0 => y0,
            y1 => y1,
            y2 => y2,
            y3 => y3,
            y4 => y4
    );
    process begin
        a0 <= '0';
        a1 <= '0';
        a2 <= '0';
        wait for 1 ns;
        a0 <= '1';
        a1 <= '0';
        a2 <= '0';
        wait for 1 ns;
        a0 <= '0';
        a1 <= '1';
        a2 <= '0';
        wait for 1 ns;
        a0 <= '1';
        a1 <= '1';
        a2 <= '0';
        wait for 1 ns;
        a0 <= '0';
        a1 <= '0';
        a2 <= '1';
        wait for 1 ns;

        assert false report "Reached end of test";
        wait;
    end process;
end test;