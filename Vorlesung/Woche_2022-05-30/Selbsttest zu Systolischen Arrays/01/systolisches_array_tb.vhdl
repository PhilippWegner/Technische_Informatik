library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity systolisches_array_tb is
end systolisches_array_tb;

architecture test of systolisches_array_tb is
    component systolisches_array
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
    end component;

    signal clock : std_logic;
    signal reset : std_logic;
    ----
    signal in_matrix00 : signed(7 downto 0);
    signal in_matrix01 : signed(7 downto 0);
    signal in_matrix02 : signed(7 downto 0);
    ---
    signal in_matrix10 : signed(7 downto 0);
    signal in_matrix11 : signed(7 downto 0);
    signal in_matrix12 : signed(7 downto 0);
    ---
    signal out_matrix00 : signed(15 downto 0);
    signal out_matrix01 : signed(15 downto 0);
    signal out_matrix02 : signed(15 downto 0);
    ---
    signal out_matrix10 : signed(15 downto 0);
    signal out_matrix11 : signed(15 downto 0);
    signal out_matrix12 : signed(15 downto 0);
    ---
    signal out_matrix20 : signed(15 downto 0);
    signal out_matrix21 : signed(15 downto 0);
    signal out_matrix22 : signed(15 downto 0);
    


    constant clock_period : time := 20 ns;

    begin
    systolisches_array_test: systolisches_array port map(
        reset => reset,
        clock => clock,
        
        in_matrix00 => in_matrix00,
        in_matrix01 => in_matrix01,
        in_matrix02 => in_matrix02,
        ---
        in_matrix10 => in_matrix10,
        in_matrix11 => in_matrix11,
        in_matrix12 => in_matrix12,
        
        
        out_matrix00 => out_matrix00,
        out_matrix01 => out_matrix01,
        out_matrix02 => out_matrix02,
        ---
        out_matrix10 => out_matrix10,
        out_matrix11 => out_matrix11,
        out_matrix12 => out_matrix12,
        ---
        out_matrix20 => out_matrix20,
        out_matrix21 => out_matrix21,
        out_matrix22 => out_matrix22
    );

    clock_process : process 
    begin
        clock <= '0';
        wait for clock_period/2;
        clock <= '1';
        wait for clock_period/2;
    end process;

    stim_process : process
    begin
        reset <= '0';
        in_matrix00 <= x"00";
        in_matrix01 <= x"00";
        in_matrix02 <= x"00";
        ---
        in_matrix10 <= x"00";
        in_matrix11 <= x"00";
        in_matrix12 <= x"00";
        wait for clock_period;
        reset <= '1';
        wait for 7*clock_period;
        reset <= '0';
        wait for 2*clock_period;
        in_matrix00 <= x"01";
        in_matrix01 <= x"00";
        in_matrix02 <= x"00";
        ---
        in_matrix10 <= x"08";
        in_matrix11 <= x"00";
        in_matrix12 <= x"00";
        wait for clock_period;
        in_matrix00 <= x"02";
        in_matrix01 <= x"04";
        in_matrix02 <= x"00";
        ---
        in_matrix10 <= x"05";
        in_matrix11 <= x"07";
        in_matrix12 <= x"00";
        wait for clock_period;
        in_matrix00 <= x"03";
        in_matrix01 <= x"05";
        in_matrix02 <= x"07";
        in_matrix10 <= x"02";
        in_matrix11 <= x"04";
        in_matrix12 <= x"06";
        wait for clock_period;
        in_matrix00 <= x"00"; -- 0 
        in_matrix01 <= x"06"; -- a12 ist 6
        in_matrix02 <= x"08"; -- a21 ist 8
        in_matrix10 <= x"00"; -- 0
        in_matrix11 <= x"01"; -- b21 ist 1
        in_matrix12 <= x"03"; -- b12 ist 3
        wait for clock_period;
        in_matrix00 <= x"00"; -- 0 
        in_matrix01 <= x"00"; -- 0
        in_matrix02 <= x"09"; -- a22 ist 9
        in_matrix10 <= x"00"; -- 0
        in_matrix11 <= x"00"; -- 0
        in_matrix12 <= x"01"; -- b22 ist 1 
        wait for clock_period;
        in_matrix00 <= x"00"; -- a00 ist 0
        in_matrix01 <= x"00";
        in_matrix02 <= x"00";
        in_matrix10 <= x"00"; -- b00 ist 0
        in_matrix11 <= x"00";
        in_matrix12 <= x"00";
        wait for 3*clock_period;
        assert false report "Reached end of test";
        wait;
    end process;
end test;