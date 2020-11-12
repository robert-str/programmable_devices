library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity adder is

port( 
	a: in std_logic ;
	b: in std_logic ;
	c: in std_logic ;
	res: out std_logic_vector (1 downto 0)  );

end;

architecture bitadder of adder is
signal aa,bb,cc: std_logic_vector (1 downto 0);
begin
	aa <= '0'&a;bb <= '0'&b;cc <= '0'&c;
 res <= aa+bb+cc; 
end bitadder;

