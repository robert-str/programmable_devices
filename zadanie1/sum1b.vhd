library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity sum is

port( 
	i_a, i_b, i_c: in std_logic;
	o_wyjscie: out std_logic_vector(1 downto 0) );

end;

architecture comb of sum is
signal wejscie: std_logic_vector(2 downto 0);

begin
wejscie <= (i_a, i_b, i_c);

process (wejscie)
begin
case wejscie is
	when "000" => o_wyjscie <= "00";
	when "111" => o_wyjscie <= "11";
	when "001" => o_wyjscie <= "01";
	when "010" => o_wyjscie <= "01";
	when "100" => o_wyjscie <= "01";
	when others => o_wyjscie <= "10";
end case;
end process;
end comb;

