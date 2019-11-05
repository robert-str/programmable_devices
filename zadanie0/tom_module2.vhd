library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity base2 is

port( 
	i_btn, i_sel: in std_logic ;
	o_led: out std_logic  );

end;

architecture base2 of base2 is
begin
o_led <= i_btn when i_sel='1';
end base2;

