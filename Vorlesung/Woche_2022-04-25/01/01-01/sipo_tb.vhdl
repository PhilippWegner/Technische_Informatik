library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sipo_tb is
end sipo_tb;

architecture test of sipo_tb is
    component sipo
        port (
            r_neg : in std_logic;
            clock : in std_logic;
            inputdata : in std_logic;
            
            q0 : out std_logic;
            q1 : out std_logic;
            q2 : out std_logic;
            q3 : out std_logic
        );
    end component;
    signal r_neg : std_logic;
    signal clock : std_logic;
    signal inputdata : std_logic;
begin
    sipo_test: sipo port map(
        r_neg => r_neg, 
        clock => clock, 
        inputdata => inputdata
    );
    process begin
        -- Einlaufen:
        clock <= '0'; r_neg <= '0'; inputdata <= '0';
        wait for 100 ns;
        clock <= '1'; r_neg <= '0'; inputdata <= '0';
        wait for 100 ns;

        -- Starten:
        for i in 1 to 2 loop
            clock <= '0'; r_neg <= '1'; inputdata <= '1';
            wait for 100 ns;
            clock <= '1'; r_neg <= '1'; inputdata <= '1';
            wait for 100 ns;
            for j in 1 to 2 loop
                clock <= '0'; r_neg <= '1'; inputdata <= '0';
                wait for 100 ns;
                clock <= '1'; r_neg <= '1'; inputdata <= '0';
                wait for 100 ns;
            end loop;
            for k in 1 to 2 loop
                clock <= '0'; r_neg <= '1'; inputdata <= '1';
                wait for 100 ns;
                clock <= '1'; r_neg <= '1'; inputdata <= '1';
                wait for 100 ns;
            end loop;
            clock <= '0'; r_neg <= '1'; inputdata <= '0';
            wait for 100 ns;
            clock <= '1'; r_neg <= '1'; inputdata <= '0';
            wait for 100 ns;
        end loop;
        assert false report "Reached end of test";
        wait;
    end process;
end test;