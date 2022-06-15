library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity alu_tb is
end alu_tb;

architecture test of alu_tb is
    component alu
        port (
            inp_a : in signed(3 downto 0);
            inp_b : in signed(3 downto 0);
            sel : in std_logic_vector(3 downto 0);
            out_alu : out signed(3 downto 0)
        );
    end component;

    signal inp_a : signed(3 downto 0); 
    signal inp_b : signed(3 downto 0);
    signal sel : std_logic_vector(3 downto 0);
    signal out_alu : signed(3 downto 0);

begin
    dut: alu port map(
            inp_a => inp_a,
            inp_b => inp_b,
            sel => sel,
            out_alu => out_alu
    );
    process begin
        inp_a <= "1011";
        inp_b <= "0011";

        sel <= "0000";
        wait for 1 ns;
        sel <= "0001";
        wait for 1 ns;
        sel <= "0010";
        wait for 1 ns;
        sel <= "0011";
        wait for 1 ns;
        sel <= "0100";
        wait for 1 ns;
        sel <= "0101";
        wait for 1 ns;
        sel <= "0110";
        wait for 1 ns;
        sel <= "0111";
        wait for 1 ns;

        assert false report "Reached end of test";
        wait;
    end process;
end test;