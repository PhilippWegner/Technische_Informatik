library ieee;
use ieee.std_logic_1164.all;

-- Ein 1-aus-n-Decoder ist eine Schaltung mit n Ausgängen und log2(n) Eingängen.
-- In der Praxis muss aber die Anzahl der Eingänge auf die nächste ganze Zahl aufgerundet werden, wenn log2(n) keine ganze Zahl ist.
-- Der jeweils adressierte Ausgang geht dann auf High, wenn die Dualzahl A am Eingang der Nummer J des betreffenden Ausgangs yJ entspricht.
-- Die anderen Ausgänge werden dann nicht angesteuert und bleiben auf Low.

entity dau is
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
end dau;

--                   a2      a1      a0          |       y4      y3      y2      y1      y0
--           --------------------------------    |   --------------------------------------------
-- = 0               0       0       0           |       0       0       0       0       1
-- = 1               0       0       1           |       0       0       0       1       0
-- = 2               0       1       0           |       0       0       1       0       0
-- = 3               0       1       1           |       0       1       0       0       0
-- = 4               1       0       0           |       1       0       0       0       0


architecture behave of dau is
begin
    y0 <= not a2    and     not a1      and     not a0;
    y1 <= not a2    and     not a1      and     a0;
    y2 <= not a2    and     a1          and     not a0;
    y3 <= not a2    and     a1          and     a0;
    y4 <= a2        and     not a1      and     not a0;    
end behave;