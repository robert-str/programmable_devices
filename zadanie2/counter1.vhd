library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;     -- TUTAJ DODAJ GDY VARIABLE

entity counter is

port( 
	i_clk, i_sigZero: in std_logic ;
	o_number: out std_logic_vector (3 downto 0) := "0100" );

end;

architecture seq of counter is
--signal counter : std_logic_vector (3 downto 0) := "0000";
constant c_toSet: std_logic_vector (3 downto 0) := "1010"; -- A=10
begin
--o_number <= counter;

process(i_clk)
begin 
	if rising_edge(i_clk) then
		if(i_sigZero='1') then
			o_number <= c_toSet;
		else
			o_number <= o_number + 1;
		end if;
	end if;
end process;

end seq;

