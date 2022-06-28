-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 28.6.2022 12:09:21 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_pipo is
end tb_pipo;

architecture tb of tb_pipo is

    component pipo
        port (clk        : in std_logic;
              clear      : in std_logic;
              Input_Data : in std_logic_vector (3 downto 0);
              Q          : out std_logic_vector (3 downto 0));
    end component;

    signal clk        : std_logic;
    signal clear      : std_logic;
    signal Input_Data : std_logic_vector (3 downto 0);
    signal Q          : std_logic_vector (3 downto 0);

    constant TbPeriod : time := 100 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : pipo
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
        Input_Data <= (others => '0');

        -- Reset generation
        -- EDIT: Check that clear is really your reset signal
        clear <= '1';
        wait for 100 ns;
        clear <= '0';
        wait for 100 ns;
        --wait for 50 ns;

        -- EDIT Add stimuli here
        Input_Data <= "0001";
        wait for TbPeriod;
        Input_Data <= "1001";
        wait for TbPeriod;
        Input_Data <= "0101";
        wait for TbPeriod;
        Input_Data <= "0000";
        wait for TbPeriod;
        Input_Data <= "1111";
        wait for TbPeriod;
        Input_Data <= "1001";
        wait for TbPeriod;
        Input_Data <= "0010";
        wait for TbPeriod;
        

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_pipo of tb_pipo is
    for tb
    end for;
end cfg_tb_pipo;