library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity sequenz_erkenner_tb is
end sequenz_erkenner_tb;

architecture test of sequenz_erkenner_tb is
    component sequenz_erkenner
        port (
            clk : in std_logic;
            rst : in std_logic;
            din : in std_logic;
            dout : out std_logic
        );
    end component;
 
signal clk : std_logic := '0';
signal din : std_logic := '0';
signal rst : std_logic := '0';
signal dout : std_logic;

constant clk_period : time := 20 ns;

begin
detector_10_test: sequenz_erkenner port map (
    clk => clk,
    din => din,
    rst => rst,
    dout => dout
);
 
-- Clock process definitions
clock_process : process
begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
end process;
 
-- Stimulus process
state_mover : process
begin
    rst <= '1';
    din <= '0';
    wait for 100 ns;  
    rst <= '0';
    din <= '0';
    wait for clk_period;
    -- wait for 0.5*clk_period;
    rst <= '0';
    din <= '1';
    wait for 2*clk_period;
    rst <= '0';
    din <= '0';
    wait for 2*clk_period;
    rst <= '0';
    din <= '1';
    wait for 2*clk_period;
    rst <= '0';
    din <= '0';
    wait for 2*clk_period;
    rst <= '0';
    din <= '0';
    wait for 2*clk_period;

    assert false report "Reached end of test";
    wait;
end process;
 
end test;