-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 28.6.2022 18:57:37 UTC

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_bcd_7segment is
end tb_bcd_7segment;

architecture tb of tb_bcd_7segment is

    component bcd_7segment
        port (BCDin         : in std_logic_vector (3 downto 0);
              Seven_Segment : out std_logic_vector (6 downto 0));
    end component;

    signal BCDin         : std_logic_vector (3 downto 0);
    signal Seven_Segment : std_logic_vector (6 downto 0);

begin

    dut : bcd_7segment
    port map (BCDin         => BCDin,
              Seven_Segment => Seven_Segment);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        BCDin <= (others => '0');

        -- EDIT Add stimuli here
        BCDin <= x"0";
        wait for 50 ms;
        BCDin <= x"1";
        wait for 50 ms;
        BCDin <= x"2";
        wait for 50 ms;
        BCDin <= x"3";
        wait for 50 ms;
        BCDin <= x"4";
        wait for 50 ms;
        BCDin <= "1000";
        wait for 50 ms;
        BCDin <= x"5";
        wait for 50 ms;
        BCDin <= x"6";
        wait for 50 ms;
        BCDin <= x"7";
        wait for 50 ms;
        BCDin <= x"8";
        wait for 50 ms;
        BCDin <= x"9";
        wait for 50 ms;
        wait;
    end process;
end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_bcd_7segment of tb_bcd_7segment is
    for tb
    end for;
end cfg_tb_bcd_7segment;