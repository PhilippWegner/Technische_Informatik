library ieee;
use ieee.std_logic_1164.all;

entity pipo is port (
	clk : in std_logic;
	clear : in std_logic;
	Input_Data: in std_logic_vector(3 downto 0);
	Q : out std_logic_vector(3 downto 0)
);
end pipo;

architecture behavior of pipo is
begin
   	process(clk)
  	begin
     	if clear = '1' then
       		Q <= "0000";
    	elsif rising_edge(clk) then
       		Q <= Input_Data;
    	end if;
  	end process;
end behavior;