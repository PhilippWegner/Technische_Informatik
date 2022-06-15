library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity ampelschaltung_tb is
end ampelschaltung_tb;

architecture test of ampelschaltung_tb is
    component ampelschaltung
        port (
            clk : in std_logic;
            r_neg : in std_logic;
    
            haupt_gruen : out std_logic;
            haupt_gelb : out std_logic;
            haupt_rot : out std_logic;
    
            neben_gruen : out std_logic;
            neben_gelb : out std_logic;
            neben_rot : out std_logic
        );
    end component;

    -- INPUT
    signal clk : std_logic;
    signal r_neg : std_logic;

    -- OUTPUT
    signal haupt_gruen : std_logic;
    signal haupt_gelb : std_logic;
    signal haupt_rot : std_logic;

    signal neben_gruen : std_logic;
    signal neben_gelb : std_logic;
    signal neben_rot : std_logic;

begin
    dut: ampelschaltung port map(
            clk => clk,
            r_neg => r_neg,

            haupt_gruen => haupt_gruen,
            haupt_gelb => haupt_gelb,
            haupt_rot => haupt_rot,

            neben_gruen => neben_gruen,
            neben_gelb => neben_gelb,
            neben_rot => neben_rot
    );
    process
        begin
            -- Einlauf
            clk <= '1';
            r_neg <= '0';
            wait for 0.5 sec;
            clk <= '0';
            r_neg <= '0';
            wait for 0.5 sec;
            
            -- Loop
            for i in 1 to 40 loop
                clk <= '1';
                r_neg <= '1';
                wait for 0.5 sec;
                clk <= '0';
                r_neg <= '1';
                wait for 0.5 sec;
            end loop;

            assert false report "Reached end of test";
            wait;
        end process;
end test;