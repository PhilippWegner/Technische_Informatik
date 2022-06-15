library ieee;
use ieee.std_logic_1164.all;

entity fakultaet is
    port (
        ein: in Integer;
        aus: out Integer
    );
end fakultaet;

architecture behave of fakultaet is
    function fak(P : integer) return integer is
    begin
        if P <= 1 then
            return 1;
        else
            return P * fak(P-1);
        end if;
    end;
begin
    aus <= fak(ein);
end behave;