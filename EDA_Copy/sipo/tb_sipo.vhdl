-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 28.6.2022 11:56:20 UTC

library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_sipo is
end tb_sipo;

architecture tb of tb_sipo is

    component sipo
        port (clk        : in std_logic;
              clear      : in std_logic;
              Input_Data : in std_logic;
              Q          : inout std_logic_vector (3 downto 0));
    end component;

    signal clk        : std_logic;
    signal clear      : std_logic;
    signal Input_Data : std_logic;
    signal Q          : std_logic_vector (3 downto 0);

    constant TbPeriod : time := 1000 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : sipo
    port map (clk        => clk,
              clear      => clear,
              Input_Data => Input_Data,
              Q          => Q);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        Input_Data <= '0';

        -- Reset generation
        -- EDIT: Check that clear is really your reset signal
        clear <= '1';
        wait for 100 ns;
        clear <= '0';
        wait for 100 ns;

        -- EDIT Add stimuli here
        wait for 10 * TbPeriod;
        
        Input_Data <= '0';
		wait for TbPeriod;
        
        Input_Data <= '0';
		wait for TbPeriod;
        
        Input_Data <= '1';
		wait for TbPeriod;
        
        Input_Data <= '0';
		wait for TbPeriod;
        
        Input_Data <= '1';
		wait for TbPeriod;
        Input_Data <= '1';
		wait for TbPeriod;
        Input_Data <= '0';
		wait for TbPeriod;
        Input_Data <= '1';
		wait for TbPeriod;
        
        Input_Data <= '0';
		wait for TbPeriod;
        Input_Data <= '0';
		wait for TbPeriod;
        Input_Data <= '0';
		wait for TbPeriod;
        Input_Data <= '0';
		wait for TbPeriod;
        
        Input_Data <= '1';
		wait for TbPeriod;
        Input_Data <= '1';
		wait for TbPeriod;
        Input_Data <= '1';
		wait for TbPeriod;
        Input_Data <= '1';
		wait for TbPeriod;
        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_sipo of tb_sipo is
    for tb
    end for;
end cfg_tb_sipo;