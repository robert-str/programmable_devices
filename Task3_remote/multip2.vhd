library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity multip2 is

port( 
	o_signal: out std_logic ;
	i_signals: in std_logic_vector ( 3 downto 0 );
	i_select: in std_logic_vector ( 1 downto 0 ) );

end;

architecture multiplexer4 of multip2 is
begin
o_signal <= 	i_signals(0) when i_select = "00" else
		i_signals(1) when i_select = "01" else
		i_signals(2) when i_select = "10" else
		i_signals(3);
end multiplexer4;

