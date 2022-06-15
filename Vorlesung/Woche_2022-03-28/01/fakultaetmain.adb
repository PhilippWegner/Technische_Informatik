with Ada.Text_IO;
procedure FakultaetMain is
    
    -- Rekursive Berechnung der Fakultaet:
function Fakultaet(P: Integer) return Integer is
    begin
        -- Ausstieg der Rekursion
        if P <= 1 then
            return 1;
        -- Normaler Rekrusionsaufruf
        else
            return P * Fakultaet(P-1);
        end if;
    end Fakultaet;
    
    fakt : Integer;
begin
    fakt := 6;
    Ada.Text_IO.Put_Line("Willkommen beim Fakultaetsrechner!" );
    Ada.Text_IO.Put("Die Fakultaet von" & Integer'Image(fakt) & " ist:" );
    Ada.Text_IO.Put_Line(Integer'Image(fakultaet(fakt)));
end FakultaetMain;