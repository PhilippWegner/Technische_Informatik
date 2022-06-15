library ieee;
use ieee.std_logic_1164.all;

entity adu is
    port (
        k7: in bit;
        k6: in bit;
        k5: in bit;
        k4: in bit;
        k3: in bit;
        k2: in bit;
        k1: in bit;

        z2: out bit;
        z1: out bit;
        z0: out bit
    );
end adu;

architecture behave of adu is
begin
    z0 <= (k1 xor k2) or (k3 xor k4) or (k5 xor k6) or (k7);
    z1 <= ((k1 and k2) xor (k3 and k4)) or (k6);
    z2 <= k4; --or k5 or k6 or k7;
end behave;