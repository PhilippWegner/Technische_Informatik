library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity palindrom_tb is
end palindrom_tb;

architecture test of palindrom_tb is
    component palindrom
        port (
            reset : in std_logic;
            clock : in std_logic; -- Taktgeber in Sekunden
            inputdata : in std_logic; -- Input Daten
        
            outputdata : out std_logic
        );
    end component;

    signal reset : std_logic := '0';
    signal clock : std_logic := '0'; -- Taktgeber in Sekunden
    signal inputdata : std_logic := '0'; -- Input Daten

    signal outputdata : std_logic;
begin
    sipo_test: palindrom port map(
        reset => reset, 
        clock => clock, 
        inputdata => inputdata,
        outputdata => outputdata
    );
    clock_process : process 
    begin
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
    end process;

    state_mover : process
    begin
        reset <= '1';
        wait for 100 ns;
        -- um 1/2 priode verschoben, damit steigende Flanke!
        reset <= '0';
        wait for 10 ns;

        inputdata <= '1';
        wait for 20 ns;
        inputdata <= '1';
        wait for 20 ns;
        inputdata <= '0';
        wait for 20 ns;
        inputdata <= '0';
        wait for 20 ns;
        inputdata <= '1';
        wait for 20 ns;
        inputdata <= '1';
        wait for 20 ns;
        inputdata <= '0';
        wait for 20 ns;
        inputdata <= '1';
        wait for 20 ns;
        inputdata <= '0';
        wait for 20 ns;
        inputdata <= '1';
        wait for 20 ns;
        inputdata <= '1';
        wait for 20 ns;
        inputdata <= '1';
        wait for 20 ns;
        inputdata <= '0';
        wait for 20 ns;
        inputdata <= '1';
        wait for 20 ns;
    end process;
end test;