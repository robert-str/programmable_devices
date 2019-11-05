library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity two_3bits_adder is

port( 
	i_a: in std_logic_vector ( 2 downto 0 );
	i_b: in std_logic_vector ( 2 downto 0 );
	segments: out std_logic_vector ( 7 downto 0 ) );

end;

architecture combinational of two_3bits_adder is
signal add_result: std_logic_vector(3 downto 0);
begin

ADDER1: entity adder3bit PORT MAP(i_a, i_b, add_result);

DEKODER1: entity bcd_to_seg7 PORT MAP (add_result, segments);


end combinational;

