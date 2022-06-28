-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 28.6.2022 19:20:40 UTC

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
              a2      : in signed (7 downto 0);
              b0      : in signed (7 downto 0);
              b1      : in signed (7 downto 0);
              b2      : in signed (7 downto 0);
              c00     : out signed (15 downto 0);
              c01     : out signed (15 downto 0);
              c02     : out signed (15 downto 0);
              c10     : out signed (15 downto 0);
              c11     : out signed (15 downto 0);
              c12     : out signed (15 downto 0);
              c20     : out signed (15 downto 0);
              c21     : out signed (15 downto 0);
              c22     : out signed (15 downto 0));
    end component;

    signal clk     : std_logic;
    signal reset_n : std_logic;
    signal a0      : signed (7 downto 0);
    signal a1      : signed (7 downto 0);
    signal a2      : signed (7 downto 0);
    signal b0      : signed (7 downto 0);
    signal b1      : signed (7 downto 0);
    signal b2      : signed (7 downto 0);
    signal c00     : signed (15 downto 0);
    signal c01     : signed (15 downto 0);
    signal c02     : signed (15 downto 0);
    signal c10     : signed (15 downto 0);
    signal c11     : signed (15 downto 0);
    signal c12     : signed (15 downto 0);
    signal c20     : signed (15 downto 0);
    signal c21     : signed (15 downto 0);
    signal c22     : signed (15 downto 0);

    constant TbPeriod : time := 100 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : systolic_array
    port map (clk     => clk,
              reset_n => reset_n,
              a0      => a0,
              a1      => a1,
              a2      => a2,
              b0      => b0,
              b1      => b1,
              b2      => b2,
              c00     => c00,
              c01     => c01,
              c02     => c02,
              c10     => c10,
              c11     => c11,
              c12     => c12,
              c20     => c20,
              c21     => c21,
              c22     => c22);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        a0 <= (others => '0');
        a1 <= (others => '0');
        a2 <= (others => '0');
        b0 <= (others => '0');
        b1 <= (others => '0');
        b2 <= (others => '0');

        -- Reset generation
        -- EDIT: Check that reset_n is really your reset signal
        reset_n <= '0';
        wait for 100 ns;
        reset_n <= '1';
        wait for 100 ns;

        -- EDIT Add stimuli here
        wait for 5 * TbPeriod;
        -- 		(1 2)			(9 8 7)			 (9 6)	
        --	A = (4 5)		B = (6 5 4)		BT = (8 5)	
        --		(7 8)							 (7 4)	
        
		-- 1 --
        a0 <= x"01"; -- a0 ist 1
	   	a1 <= x"00";
	   	a2 <= x"00";
        
	   	b0 <= x"09"; -- b0 ist 9
	   	b1 <= x"00";
	   	b2 <= x"00";
        wait for TbPeriod;
        -- 2 --
        a0 <= x"02"; -- a0 ist 2
	   	a1 <= x"04"; -- a1 ist 4
	   	a2 <= x"00";
        
	   	b0 <= x"06"; -- b0 ist 6
	   	b1 <= x"08"; -- b1 ist 8
	   	b2 <= x"00";
        wait for TbPeriod;
        -- 3 --
        a0 <= x"00"; -- a0 ist 0
	   	a1 <= x"05"; -- a1 ist 5
	   	a2 <= x"07"; -- a2 ist 7
        
	   	b0 <= x"00"; -- b0 ist 0
	   	b1 <= x"05"; -- b1 ist 5
	   	b2 <= x"07"; -- b2 ist 7
        wait for TbPeriod;
        -- 4 --
        a0 <= x"00"; -- a0 ist 0
	   	a1 <= x"00"; -- a1 ist 0
	   	a2 <= x"08"; -- a2 ist 8
        
	   	b0 <= x"00"; -- b0 ist 0
	   	b1 <= x"00"; -- b1 ist 0
	   	b2 <= x"04"; -- b2 ist 4
        wait for TbPeriod;
        -- RESET --
        a0 <= x"00";
	   	a1 <= x"00";
	   	a2 <= x"00";
        
	   	b0 <= x"00";
	   	b1 <= x"00";
	   	b2 <= x"00";
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