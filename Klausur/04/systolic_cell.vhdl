library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity systolic_cell is
    port
    (
        clk: in std_logic;
        reset_n: in std_logic;
        i_top: in signed(7 downto 0);
        i_left: in signed(7 downto 0);
        o_right: out signed(7 downto 0);
        o_bottom: out signed(7 downto 0);
        cell_out: out signed(15 downto 0)
    );
end systolic_cell;


architecture pipelined of systolic_cell is
signal store: signed(15 downto 0);
begin
    P1: process(clk)
    begin
        if (clk'event and clk='1') then
            if reset_n='0' then
                store <= "0000000000000000";
            else
                store <= store + i_left * i_top;
                o_right <= i_left;
                o_bottom <= i_top;
            end if;
        end if;
        cell_out <= store;
    end process P1;
end pipelined;