library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- 101 palindrom
-- https://www.fpga4student.com/2017/09/vhdl-code-for-moore-fsm-sequence-detector.html [Hilfreich]
entity frage01 is
    port (
        sr_in : in std_logic_vector(3 downto 0);
        sr_out : out std_logic_vector(3 downto 0)
    );
end frage01;



architecture behave of frage01 is
    signal sr_out_00 : std_logic;
    signal sr_out_01 : std_logic;
    signal sr_out_02 : std_logic;
    signal sr_out_03 : std_logic;
begin
    --sr_out(3 downto 1) <= sr_in(2 downto 0);
    --sr_out(0) <= '0';
    sr_out(3 downto 0) <= sr_in(3 downto 0);

    sr_out_00 <= sr_out(0);
    sr_out_01 <= sr_out(1);
    sr_out_02 <= sr_out(2);
    sr_out_03 <= sr_out(3);
end behave;