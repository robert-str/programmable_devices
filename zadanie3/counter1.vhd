library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;     -- TUTAJ DODAJ GDY VARIABLE

entity counter is

port( 
	i_clk, i_sigZero: in std_logic ;
	o_number: out std_logic_vector (7 downto 0) := "00000000" );

end;

architecture seq of counter is

begin


process(i_clk)
variable seconds: unsigned (3 downto 0) := 0;
variable dsec: unsigned (3 downto 0) := 0;
begin 
	if rising_edge(i_clk) then
		if(dsec=9) then
			dsec := 0;
			if(seconds=9) then
				seconds := 0;
			else
				seconds := seconds+1;	
			end if;
		else
			dsec := dsec + 1;
		end if;
	end if;
	o_number(7 downto 4) <= std_logic_vector(seconds);
 	o_number(3 downto 0) <= std_logic_vector(dsec);
end process;

end seq;

