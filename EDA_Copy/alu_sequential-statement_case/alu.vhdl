-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is port (
	inp_a : in signed(3 downto 0);
    inp_b : in signed(3 downto 0);
    sel : in std_logic_vector(2 downto 0);
    out_alu : out signed(3 downto 0)
);
end alu;

architecture behavior of alu is
begin
	process(sel)
    begin
    	case sel is
        	when "000" => out_alu <= inp_a + inp_b;
            when "001" => out_alu <= inp_a - inp_b;
            when "010" => out_alu <= inp_a - 1;
            when "011" => out_alu <= inp_b + 1;
            when "100" => out_alu <= inp_a and inp_b;
            when "101" => out_alu <= inp_a or inp_b;
            when "110" => out_alu <= not inp_a;
            when "111" => out_alu <= inp_a xor inp_b;
            when others => out_alu <= "0000";
         end case;
     end process;
end behavior;