-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is port (
	inp_a : in signed(3 downto 0);
    inp_b : in signed(3 downto 0);
    sel : in std_logic_vector(2 downto 0);
    out_alu : out signed(3 downto 0);
);
end alu;

architecture behavior of alu is
begin
	with sel select
    	out_alu <= inp_a + inp_b when "000",
       			inp_a - inp_b when "001",
          		inp_a - 1 when "010",
          		inp_b + 1 when "011",
        		inp_a and inp_b when "100",
        		inp_a or inp_b when "101",
       			not inp_a when "110",
          		inp_a xor inp_b when "111",
                "0000" when others;
end behavior;