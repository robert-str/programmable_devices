library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity adder2 is

port( 
	a: in std_logic ;
	b: in std_logic ;
	c: in std_logic ;
	sum: out std_logic_vector ( 1 downto 0 ) );

end;

architecture myadder of adder2 is
signal insig : std_logic_vector (2 downto 0);
begin
insig <= a & b & c;
with insig select
sum <= 	"00" when "000",
	"01" when "001" | "010" | "100",
	"10" when "110" | "011" | "101",
	"11" when others;
end myadder;

