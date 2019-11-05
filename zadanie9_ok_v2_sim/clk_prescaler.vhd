library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
-----------------------------------------------------
-----------------------------------------------------
entity clk_prescaler is port( 
	i_clk_fast: in std_logic ;
	i_prescalerValue: in std_logic_vector(6 downto 0);
	o_clk_slow: out std_logic := '0'  );
end;
-----------------------------------------------------
-----------------------------------------------------
architecture prescaler of clk_prescaler is

signal clk_slow_temp: std_logic := '0';
signal s_activePrescaler: std_logic_vector (6 downto 0);
-----------------------------------------------------
begin
o_clk_slow <= clk_slow_temp;
-----------------------------------------------------
zegar:process (i_clk_fast)
variable counter : std_logic_vector (6 downto 0) := "0000000";
 begin
 if (rising_edge(i_clk_fast)) then
	if(counter=i_prescalerValue) then 
		counter := (others => '0');
		clk_slow_temp <= not clk_slow_temp;	
	else
		counter := counter + 1;
	end if;	
 end if;
end process;
-----------------------------------------------------
end prescaler;

