-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 28.6.2022 15:23:49 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_mealy_110 is
end tb_mealy_110;

architecture tb of tb_mealy_110 is

    component mealy_110
        port (clk  : in std_logic;
              rst  : in std_logic;
              din  : in std_logic;
              dout : out std_logic);
    end component;

    signal clk  : std_logic;
    signal rst  : std_logic;
    signal din  : std_logic;
    signal dout : std_logic;

    constant TbPeriod : time := 20 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : mealy_110
    port map (clk  => clk,
              rst  => rst,
              din  => din,
              dout => dout);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        din <= '0';

        -- Reset generation
        -- EDIT: Check that rst is really your reset signal
        rst <= '1';
        wait for 100 ns;
        rst <= '0';
        wait for TbPeriod;
        din <= '1';
        wait for 2*TbPeriod;
        din <= '0';
        wait for 2*TbPeriod;
        din <= '1';
        wait for 2*TbPeriod;
        din <= '0';

        -- EDIT Add stimuli here
        wait for 10 * TbPeriod;
		
        
        
        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_mealy_110 of tb_mealy_110 is
    for tb
    end for;
end cfg_tb_mealy_110;