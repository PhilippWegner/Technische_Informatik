-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity bcd_7segment is port (
	BCDin : in std_logic_vector(3 downto 0);
    Seven_Segment : out std_logic_vector(6 downto 0)
);
end bcd_7segment;

architecture behavior of bcd_7segment is
begin
    	--  -	a 	-
        --	|		|
        --	f		b
        --	|		|
        --	-	g	-
        --	|		|
        --	e		c
        --	|		|
        --	-	d	-
	with BCDin select							-- a,b,c,d,e,f,g
    	Seven_Segment <= "1111110" when x"0", 	-- 1,1,1,1,1,1,0
                          "0110000" when x"1",	-- 0,1,1,0,0,0,0
                          "1101101" when x"2",	-- 1,1,0,1,1,0,1
                          "1111001" when x"3",	-- 1,1,1,1,0,0,1
                          "0110011" when x"4",	-- 0,1,1,0,0,1,1
                          "1011011" when x"5",	-- 1,0,1,1,0,1,1
                          "1011111" when x"6",	-- 1,0,1,1,1,1,1
                          "1110000" when x"7",	-- 1,1,1,0,0,0,0
                          "1111111" when x"8",	-- 1,1,1,1,1,1,1
                          "1111011" when x"9",	-- 1,1,1,1,0,1,1
                          "0000000" when others;
end behavior;
