library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity bcd is

port( 
	clk: in std_logic ;
	i_J, i_K: in std_logic ;
	o_Q: out std_logic  );

end;

architecture cde of bcd is
signal inJK: std_logic_vector(1 downto 0);

begin
inJK <= (i_J,i_K);

std: process(clk)
begin
	if( rising_edge(clk) ) then
	case inJK is
	when	"00" => o_Q <= o_Q;
	when	"10" => o_Q <= '1';
	when	"01" => o_Q <= '0';
	when	"11" => o_Q <= not o_Q; 	
	end case;
	end if;
end process std;

end cde;

