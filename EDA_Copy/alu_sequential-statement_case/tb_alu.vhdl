-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 28.6.2022 09:22:14 UTC

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_alu is
end tb_alu;

architecture tb of tb_alu is

    component alu
        port (inp_a   : in signed (3 downto 0);
              inp_b   : in signed (3 downto 0);
              sel     : in std_logic_vector (2 downto 0);
              out_alu : out signed (3 downto 0));
    end component;

    signal inp_a   : signed (3 downto 0);
    signal inp_b   : signed (3 downto 0);
    signal sel     : std_logic_vector (2 downto 0);
    signal out_alu : signed (3 downto 0);

begin

    dut : alu
    port map (inp_a   => inp_a,
              inp_b   => inp_b,
              sel     => sel,
              out_alu => out_alu);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        inp_a <= (others => '0');
        inp_b <= (others => '0');
        sel <= (others => '0');
		
        -- EDIT Add stimuli here
		inp_a <= "0001";
        inp_b <= "0010";
        sel <= "000";
        wait for 1 ns;
        --assert(dout = "0011") report "FAIL inp_a + inp_b" severity error;
        
		inp_a <= "0011";
        inp_b <= "0011";
        sel <= "001";
        wait for 1 ns;
        --assert(dout = "0000") report "FAIL inp_a - inp_b" severity error;
        
		inp_a <= "0001";
        inp_b <= "0000";
        sel <= "010";
        wait for 1 ns;
        --assert(dout = "0011") report "FAIL inp_a - 1" severity error;
        
		inp_a <= "0010";
        inp_b <= "0000";
        sel <= "011";
        wait for 1 ns;
        --assert(dout = "0011") report "FAIL inp_b + 1" severity error;
        
		inp_a <= "0011";
        inp_b <= "0011";
        sel <= "100";
        wait for 1 ns;
        --assert(dout = "0011") report "FAIL inp_a and inp_b" severity error;
        
        inp_a <= "0011";
        inp_b <= "0011";
        sel <= "101";
        wait for 1 ns;
        --assert(dout = "0011") report "FAIL inp_a or inp_b" severity error;
        
        inp_a <= "0101";
        inp_b <= "0000";
        sel <= "110";
        wait for 1 ns;
        --assert(dout = "0011") report "FAIL not inp_a" severity error;
        
        inp_a <= "1001";
        inp_b <= "1101";
        sel <= "111";
        wait for 1 ns;
        --assert(dout = "0011") report "inp_a xor inp_b" severity error;
  
        
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_alu of tb_alu is
    for tb
    end for;
end cfg_tb_alu;