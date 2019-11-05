library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity simple1 is

port( 
	wyjsc : out std_logic;
	diode1: in std_logic_vector (7 downto 0);
	btn: in std_logic_vector (1 downto 0));

end;

architecture combinational of simple1 is
	signal wy: std_logic;
begin

wyjsc <= wy;

with btn select
	wy <=   diode1(0) when "00",
		diode1(1) when "01",
		diode1(2) when "10",
		diode1(3) when others;	


end combinational;

