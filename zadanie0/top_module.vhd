library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity base is

port( 
	i_btn: in std_logic;
	o_led: out std_logic);

end;

architecture top of base is
begin
one: process(i_btn)
begin
if i_btn = '1' then	o_led <= '1';
 	 else 	o_led <= '0';
end if;
end process one;
end top;

