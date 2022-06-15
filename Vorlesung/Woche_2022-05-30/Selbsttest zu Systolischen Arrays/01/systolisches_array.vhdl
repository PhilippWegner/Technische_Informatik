library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity systolisches_array is
    port (
        reset : in std_logic;
        clock : in std_logic; -- Taktgeber in Sekunden
        
        in_matrix00 : in signed(7 downto 0);
        in_matrix01 : in signed(7 downto 0);
        in_matrix02 : in signed(7 downto 0);
        ---
        in_matrix10 : in signed(7 downto 0);
        in_matrix11 : in signed(7 downto 0);
        in_matrix12 : in signed(7 downto 0);
        
        
        out_matrix00 : out signed(15 downto 0);
        out_matrix01 : out signed(15 downto 0);
        out_matrix02 : out signed(15 downto 0);
        ---
        out_matrix10 : out signed(15 downto 0);
        out_matrix11 : out signed(15 downto 0);
        out_matrix12 : out signed(15 downto 0);
        ---
        out_matrix20 : out signed(15 downto 0);
        out_matrix21 : out signed(15 downto 0);
        out_matrix22 : out signed(15 downto 0)
    );
end systolisches_array;

architecture pipelined of systolisches_array is
component systolische_zelle 
port (
        clock: in std_logic;
        reset: in std_logic;
        input_left: in signed(7 downto 0);
        input_top: in signed(7 downto 0);
        output_right: out signed(7 downto 0);
        output_bottom: out signed(7 downto 0);
        cell_out: out signed(15 downto 0)
);
end component;

--
--                  in_matrix10                                 in_matrix11                                 in_matrix12
--                      |                                           |                                           |
--                      V                                           V                                           V
--  in_matrix00  --> |zelle00| -->      out_matrix00_r      --> |zelle01| -->       out_matrix01_r      --> |zelle02| -->  out_matrix02_r
--                      |                                           |                                           |
--                      V                                           V                                           V
--
--              out_matrix00_b                                out_matrix01_b                              out_matrix02_b
--
--                      |                                           |                                           |
--                      V                                           V                                           V
--  in_matrix01  --> |zelle10| -->      out_matrix10_r      --> |zelle11| -->       out_matrix11_r      --> |zelle12| -->  out_matrix12_r
--                      |                                           |                                           |
--                      V                                           V                                           V
--
--              out_matrix10_b                                 out_matrix11_b                              out_matrix12_b
--  
--                      |                                           |                                           |
--                      V                                           V                                           V
--  in_matrix02  --> |zelle20| -->      out_matrix20_r      --> |zelle21| -->       out_matrix21_r      --> |zelle22| -->  out_matrix22_r
--                      |                                           |                                           |
--                      V                                           V                                           V
--              out_matrix20_b                                 out_matrix21_b                              out_matrix22_b
--


signal out_matrix00_r, out_matrix00_b : signed(7 downto 0);
signal out_matrix01_r, out_matrix01_b : signed(7 downto 0);
signal out_matrix02_r, out_matrix02_b : signed(7 downto 0);
---
signal out_matrix10_r, out_matrix10_b : signed(7 downto 0);
signal out_matrix11_r, out_matrix11_b : signed(7 downto 0);
signal out_matrix12_r, out_matrix12_b : signed(7 downto 0);
---
signal out_matrix20_r, out_matrix20_b : signed(7 downto 0);
signal out_matrix21_r, out_matrix21_b : signed(7 downto 0);
signal out_matrix22_r, out_matrix22_b : signed(7 downto 0);

begin
        -- |zelle00|zelle01|zelle02|
        -- |zelle10|zelle11|zelle12|
        -- |zelle20|zelle21|zelle22|

        -- 1)
        zelle00 : systolische_zelle port map(
            clock,
            reset,
            in_matrix00,
            in_matrix10,
            out_matrix00_r,
            out_matrix00_b,
            out_matrix00
        );
        -- 2)
        zelle01 : systolische_zelle port map(
            clock,
            reset,
            out_matrix00_r,
            in_matrix11,
            out_matrix01_r,
            out_matrix01_b,
            out_matrix01
        );
        -- 3)
        zelle02 : systolische_zelle port map(
            clock,
            reset,
            out_matrix01_r,
            in_matrix12,
            out_matrix02_r,
            out_matrix02_b,
            out_matrix02
        );

        ----------------------------------------------------
        -- 4)
        zelle10 : systolische_zelle port map(
            clock,
            reset,
            in_matrix01,
            out_matrix00_b,
            out_matrix10_r,
            out_matrix10_b,
            out_matrix10
        );
        -- 5)
        zelle11 : systolische_zelle port map(
            clock,
            reset,
            out_matrix10_r,
            out_matrix01_b,
            out_matrix11_r,
            out_matrix11_b,
            out_matrix11
        );
        -- 6)
        zelle12 : systolische_zelle port map(
            clock,
            reset,
            out_matrix11_r,
            out_matrix02_b,
            out_matrix12_r,
            out_matrix12_b,
            out_matrix12
        );

        ----------------------------------------------------
        -- 7)
        zelle20 : systolische_zelle port map(
            clock,
            reset,
            in_matrix02,
            out_matrix10_b,
            out_matrix20_r,
            out_matrix20_b,
            out_matrix20
        );
        -- 8)
        zelle21 : systolische_zelle port map(
            clock,
            reset,
            out_matrix20_r,
            out_matrix11_b,
            out_matrix21_r,
            out_matrix21_b,
            out_matrix21
        );
        -- 9)
        zelle22 : systolische_zelle port map(
            clock,
            reset,
            out_matrix21_r,
            out_matrix12_b,
            out_matrix22_r,
            out_matrix22_b,
            out_matrix22
        );
end pipelined;