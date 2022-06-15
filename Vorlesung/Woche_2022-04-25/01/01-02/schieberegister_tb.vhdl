library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity schieberegister_tb is
end schieberegister_tb;

architecture testbench of schieberegister_tb is
    component schieberegister
        port (
            clear : in std_logic;
            clock : in std_logic; -- Taktgeber in Sekunden
            Eingabe : in std_logic; -- Input Daten
            Q0 : out std_logic; -- Ausgabe Q0
            Q1 : out std_logic; -- Ausgabe Q1
            Q2 : out std_logic; -- Ausgabe Q2
            Q3 : out std_logic -- Ausgabe Q3
        );
    end component;
    signal clear, clock, Eingabe : std_logic;
begin
    Schieberegister_test: schieberegister port map
        (clear => clear, clock => clock, Eingabe => Eingabe);
    process begin -- Starten
        -- 1
        clock <= '1';
        clear <= '1';
        Eingabe <= '1';
        wait for 50 ms;
        clear <= '0';
        clock <= '0';
        Eingabe <= '1';
        wait for 50 ms;
        ---------------------
        -- 1
        clock <= '1';
        clear <= '0';
        Eingabe <= '1';
        wait for 50 ms;
        clear <= '0';
        clock <= '0';
        Eingabe <= '0';
        wait for 50 ms;
        ----------------------
        -- 0
        clock <= '1';
        clear <= '0';
        Eingabe <= '0';
        wait for 50 ms;
        clear <= '0';
        clock <= '0';
        Eingabe <= '0';
        wait for 50 ms;
        ----------------------
        -- 0
        clock <= '1';
        clear <= '0';
        Eingabe <= '0';
        wait for 50 ms;
        clear <= '0';
        clock <= '0';
        Eingabe <= '1';
        wait for 50 ms;
        ---------------------
        -- 1
        clock <= '1';
        clear <= '0';
        Eingabe <= '1';
        wait for 50 ms;
        clear <= '0';
        clock <= '0';
        Eingabe <= '1';
        wait for 50 ms;
        ---------------------
        -- 1
        clock <= '1';
        clear <= '0';
        Eingabe <= '1';
        wait for 50 ms;
        clear <= '0';
        clock <= '0';
        Eingabe <= '0';
        wait for 50 ms;

        assert false report "Reached end of test";
        wait;
    end process;
end testbench;