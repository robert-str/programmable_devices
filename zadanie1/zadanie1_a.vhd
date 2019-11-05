library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity simple1 is

port( 
	diode1: out std_logic_vector (7 downto 0);
	btn1, btn2: in std_logic);

end;

architecture combinational of simple1 is
	signal b, nb: std_logic; 
begin
b <= btn1;
nb <= not btn1;

diode1 <=  (b,nb,b,nb,b,nb,b,nb) when btn2 = '0' else
	 "ZZZZZZZZ";
end combinational;

