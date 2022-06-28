-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 28.6.2022 20:38:46 UTC

library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_systolic_array is
end tb_systolic_array;

architecture tb of tb_systolic_array is

    component systolic_array
        port (clk     : in std_logic;
              reset_n : in std_logic;
              a0      : in signed (7 downto 0);
              a1      : in signed (7 downto 0);
              b0      : in signed (7 downto 0);
              b1      : in signed (7 downto 0);
              c00     : out signed (15 downto 0);
              c01     : out signed (15 downto 0);
              c10     : out signed (15 downto 0);
              c11     : out signed (15 downto 0));
    end component;

    signal clk     : std_logic;
    signal reset_n : std_logic;
    signal a0      : signed (7 downto 0);
    signal a1      : signed (7 downto 0);
    signal b0      : signed (7 downto 0);
    signal b1      : signed (7 downto 0);
    signal c00     : signed (15 downto 0);
    signal c01     : signed (15 downto 0);
    signal c10     : signed (15 downto 0);
    signal c11     : signed (15 downto 0);

    constant TbPeriod : time := 100 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : systolic_array
    port map (clk     => clk,
              reset_n => reset_n,
              a0      => a0,
              a1      => a1,
              b0      => b0,
              b1      => b1,
              c00     => c00,
              c01     => c01,
              c10     => c10,
              c11     => c11);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        a0 <= (others => '0');
        a1 <= (others => '0');
        b0 <= (others => '0');
        b1 <= (others => '0');

        -- Reset generation
        -- EDIT: Check that reset_n is really your reset signal
        reset_n <= '0';
        wait for 100 ns;
        reset_n <= '1';
        wait for 100 ns;

        -- EDIT Add stimuli here
        wait for 5 * TbPeriod;
        -- 		(1 2)			(5 6)			 (5 7)	
        --	A = (3 4)		B = (7 8)		BT = (6 8)	

		-- 1 --
        a0 <= x"01"; -- a0 ist 1
	   	a1 <= x"00";
        
	   	b0 <= x"05"; -- b0 ist 5
	   	b1 <= x"00";
        wait for TbPeriod;
        -- 2 --
        a0 <= x"02"; -- a0 ist 2
	   	a1 <= x"03"; -- a1 ist 3
        
	   	b0 <= x"07"; -- b0 ist 7
	   	b1 <= x"06"; -- b1 ist 6
        wait for TbPeriod;
        -- 3 --
        a0 <= x"00"; -- a0 ist 0
	   	a1 <= x"04"; -- a1 ist 4
        
	   	b0 <= x"00"; -- b0 ist 0
	   	b1 <= x"08"; -- b1 ist 8
        wait for TbPeriod;
        -- RESET --
        a0 <= x"00"; 
	   	a1 <= x"00"; 
        
	   	b0 <= x"00"; 
	   	b1 <= x"00"; 
        wait for 10*TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_systolic_array of tb_systolic_array is
    for tb
    end for;
end cfg_tb_systolic_array;