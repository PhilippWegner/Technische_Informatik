library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sipo is
    port (
        r_neg : in std_logic;
        clock : in std_logic; -- Taktgeber in Sekunden
        inputdata : in std_logic; -- Input Daten
        
        q0 : out std_logic; -- Ausgabe Q0
        q1 : out std_logic; -- Ausgabe Q1
        q2 : out std_logic; -- Ausgabe Q2
        q3 : out std_logic -- Ausgabe Q3
    );
end sipo;

architecture behave of sipo is
    signal ff0_q : std_logic := '0';
    signal ff1_q : std_logic := '0';
    signal ff2_q : std_logic := '0';
    signal ff3_q : std_logic := '0';
begin
    process(clock, r_neg)
    begin
        -- Wenn r_neg, dann zuruecksetzen
        if(r_neg = '0') then
            ff0_q <= '0';
            ff1_q <= '0';
            ff2_q <= '0';
            ff3_q <= '0';
            q0 <= ff0_q;
            q1 <= ff1_q;
            q2 <= ff2_q;
            q3 <= ff3_q;
        -- Wenn steigende Flanke, dann pro Flipflop verschieben
        elsif(rising_edge(clock)) then
            -- Input wird reingezogen
            ff0_q <= inputdata;
            -- ff3_q wird auf q3 geschoben
            q3 <= ff3_q;
            -- ff2_q wird auf q2 geschoben
            q2 <= ff2_q;
            -- ff1_q wird auf q1 geschoben
            q1 <= ff1_q;
            -- ff0_q wird auf q0 geschoben
            -- q0 <= ff0_q;
            q0 <= inputdata;
        -- Wenn fallende Flanke, dann Bits verschieben    
        elsif(falling_edge(clock)) then
            -- ff2_q auf ff3_q schieben
            ff3_q <= ff2_q;
            -- ff1_q auf ff2_q schieben
            ff2_q <= ff1_q;
            -- ff0_q auf ff1_q schieben
            ff1_q <= ff0_q;
        end if;
    end process;
end behave;