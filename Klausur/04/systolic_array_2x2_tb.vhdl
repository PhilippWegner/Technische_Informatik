library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity systolic_array_2x2_tb is
end systolic_array_2x2_tb;

architecture test of systolic_array_2x2_tb is
    component systolic_array_2x2 port (
        clk: in std_logic;
        reset_n: in std_logic;
        a0,a1,b0,b1: in signed(7 downto 0);
        c00, c01, c10, c11: out signed(15 downto 0)
    );
    end component;
 -- Einfügen: Benötigte Signale
    signal clk, reset_n: std_logic;
    signal a0,a1,b0,b1: signed (7 downto 0);
    signal c00, c01, c10, c11: signed(15 downto 0);
    constant clk_period : time := 20 ns;
begin
 -- Einfügen: Benötigten Code für das Ansteuern des systolischen
 -- Arrays. Eingegeben werden sollen die Matrizen A und B.
 -- Berechnet werden soll C=A*B.

 systolisches_array_test : systolic_array_2x2 port map(
    clk => clk,
    reset_n => reset_n,

    a0 => a0,
    a1 => a1,

    b0 => b0,
    b1 => b1,

    c00 => c00,
    c01 => c01,
    c10 => c10,
    c11 => c11
 );

clock_process : process 
begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
end process;

stim_process : process
begin
    reset_n <= '1';
    a0 <= x"00";
	a1 <= x"00";
	b0 <= x"00";
	b1 <= x"00";
    wait for clk_period;
    reset_n <= '0';
	wait for 7*clk_period;
    reset_n <= '1';
	wait for 2*clk_period;
    a0 <= x"01"; -- a00 ist 1
	a1 <= x"00";
	b0 <= x"05"; -- b00 ist 5
	b1 <= x"00";
    wait for clk_period;
    a0 <= x"02"; -- a01 ist 2
	a1 <= x"03"; -- a10 ist 3 
	b0 <= x"07"; -- b10 ist 7
	b1 <= x"06"; -- b01 ist 6
    wait for clk_period;
    a0 <= x"00"; -- 0
	a1 <= x"04"; -- a11 ist 4
	b0 <= x"00"; -- 0
	b1 <= x"08"; -- b11 ist 8
    wait for clk_period;
    a0 <= x"00";
	a1 <= x"00";
	b0 <= x"00";
	b1 <= x"00";
    wait for 7*clk_period;
    assert false report "Reached end of test";
    wait;
end process;
end test;