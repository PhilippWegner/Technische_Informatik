library IEEE; use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all;

entity systolic_array_2x2 is
    port (
        clk: in std_logic;
        reset_n: in std_logic;
        a0,a1,b0,b1 : in signed (7 downto 0);
        c00,c01,c10,c11 : out signed (15 downto 0)
    );
end systolic_array_2x2;

architecture pipelined of systolic_array_2x2 is
    component systolic_cell is
        port (
            clk: in std_logic;
            reset_n: in std_logic;
            i_top : in signed (7 downto 0);
            i_left: in signed (7 downto 0);
            o_right: out signed (7 downto 0);
            o_bottom: out signed (7 downto 0);
            cell_out: out signed (15 downto 0)
        );
    end component;

signal c00right,c00bottom,c01right,c01bottom: signed(7 downto 0);
signal c10right,c10bottom,c11right,c11bottom: signed(7 downto 0);
begin
-- 1. Instanz der Zelle
cell00: systolic_cell port map(
    clk,
    reset_n,
    b0,
    a0,
    c00right,
    c00bottom,
    c00
);
-- 2. Instanz der Zelle
cell01: systolic_cell port map(
    clk,
    reset_n,
    b1,
    c00right,
    c01right,
    c01bottom,
    c01
);
-- 3. Instanz der Zelle
cell10: systolic_cell port map(
    clk,
    reset_n,
    c00bottom,
    a1,
    c10right,
    c10bottom,
    c10
);
-- 4. Instanz der Zelle
cell11: systolic_cell port map(
    clk,
    reset_n,
    c01bottom,
    c10right,
    c11right,
    c11bottom,
    c11
);
end pipelined;