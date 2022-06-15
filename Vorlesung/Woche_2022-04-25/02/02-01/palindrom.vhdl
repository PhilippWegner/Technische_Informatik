library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- 101 palindrom
-- https://www.youtube.com/watch?v=0FJfOkl2I5Q [Hilfreich]
entity palindrom is
    port (
        reset : in std_logic;
        clock : in std_logic; -- Taktgeber in Sekunden
        inputdata : in std_logic; -- Input Daten
        
        outputdata : out std_logic
    );
end palindrom;

architecture behave of palindrom is
    type state is (s0, s1, s2);
    signal presentstate : state;
    signal nextstate : state;
    signal generalcounter : integer := 0;
    signal inputcounter0 : integer := 0;
    signal inputcounter1 : integer := 0;
begin
    clock_process : process(clock, reset)
    begin
        if(rising_edge(clock)) then
            if(inputdata = '1') then
                inputcounter1 <= inputcounter1 + 1;
                inputcounter0 <= 0;
            elsif(inputdata = '0') then
                inputcounter0 <= inputcounter0 + 1;
                inputcounter1 <= 0;
            end if;

            generalcounter <= generalcounter + 1;
            if(reset = '1') then
                presentstate <= s0;
                generalcounter <= 0;
                inputcounter0 <= 0;
                inputcounter1 <= 0;
            else
                presentstate <= nextstate;
            end if;

        end if;
    end process;

    state_mover : process(inputdata, presentstate)
    begin
        --outputdata <= '0';
        -- State s0 ist aktuell
        if(presentstate = s0) then
            -- Wenn ich 1 bekommen, ruecke ich auf s1 und geben 0 aus
            if(inputdata = '1') then
                nextstate <= s1;
                outputdata <= '0';
            -- Sonst verweile ich in s0 und gebe 0 aus
            else
                nextstate <= s0;
                outputdata <= '0';
            end if;
        -- State S1 ist aktuell
        elsif(presentstate = s1) then
            -- Wenn ich 0 bekommen, ruecke ich auf s2 und geben 0 aus
            if(inputdata = '0') then
                nextstate <= s2;
                outputdata <= '0';
            -- Sonst verweile ich in s1 und gebe 0 aus
            else
                nextstate <= s1;
                outputdata <= '0';
            end if;
        elsif(presentstate = s2) then
            if(inputdata = '1') then
                nextstate <= s0;
                outputdata <= '1';
            else
                nextstate <= s0;
                outputdata <= '0';
            end if;
        else
            nextstate <= s0;
            outputdata <= '0';

        end if;
    end process;
end behave;