library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;
-- Einsatzgebiete : Puffer, Zur Konvertierung von einem seriellem in ein paralleles oder parallelem in serielles Format
entity schieberegister is
    port( 
        clear : in std_logic;
        clock : in std_logic; -- Taktgeber in Sekunden
        Eingabe : in std_logic; -- Input Daten
        
        Q0 : out std_logic; -- Ausgabe Q0
        Q1 : out std_logic; -- Ausgabe Q1
        Q2 : out std_logic; -- Ausgabe Q2
        Q3 : out std_logic -- Ausgabe Q3
    );
end schieberegister;
architecture behave of schieberegister is
signal tempQ1, tempQ2, tempQ3, tempQ0 : std_logic;
begin
    process (clock, clear)
    begin
        if (clear = '1') then
            Q3 <= '0'; -- Daten löschen
            Q2 <= '0'; Q1 <= '0'; Q0 <= '0';
            tempQ3 <= '0'; tempQ2 <= '0'; tempQ1 <= '0'; tempQ0 <= '0';
        elsif clock'event and clock = '1' then -- Steigende Flanke
            tempQ0 <= Eingabe; -- Eingabe speichern
            Q3 <= tempQ3; -- Daten ausgeben
            Q2 <= tempQ2;
            Q1 <= tempQ1;
            Q0 <= Eingabe; --tempQ0;
        elsif clock'event and clock = '0' then -- Fallende Flanke
            tempQ3 <= tempQ2; -- Bits schieben
            tempQ2 <= tempQ1;
            tempQ1 <= tempQ0;
        end if;
    end process;
end behave;