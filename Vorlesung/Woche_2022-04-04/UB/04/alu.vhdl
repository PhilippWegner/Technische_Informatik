library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity alu is
    port (
        inp_a : in signed(3 downto 0);
        inp_b : in signed(3 downto 0);
        sel : in std_logic_vector(3 downto 0);
        out_alu : out signed(3 downto 0)
    );
end alu;

architecture behave of alu is

begin
    process(inp_a, inp_b, sel)
        variable l : line;
    begin
        case sel is
            -- [Addition]       [A+B]
            when "0000" => out_alu <=  inp_a + inp_b;
            -- [Subtraktion]    [A-B]
            when "0001" => out_alu <=  inp_a - inp_b;
            -- [-]              [A-1]
            when "0010" => out_alu <=  inp_a - 1;
            -- [+]              [A+1]
            when "0011" => out_alu <=  inp_a + 1;
            -- [AND]            [A AND B]
            when "0100" => out_alu <=  inp_a and inp_b;
            -- [OR]             [A OR B]
            when "0101" => out_alu <=  inp_a or inp_b;
            -- [NOT]            [NOT A]
            when "0110" => out_alu <=  not inp_a;
            -- [XOR]            [A XOR B]
            when "0111" => out_alu <=  inp_a xor inp_b;
            -- default
            when others => NULL;
        end case;
    end process;
end behave;