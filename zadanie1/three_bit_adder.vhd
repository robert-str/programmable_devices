library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity adder3bit is

port( 
	i_a: in std_logic_vector ( 2 downto 0 );
	i_b: in std_logic_vector ( 2 downto 0 );
	o_result: out std_logic_vector ( 3 downto 0 ) );

end;

architecture combinational of adder3bit is
signal c1, c2 : std_logic;

signal out1,out2 : std_logic_vector ( 1 downto 0 );

component sum port( 
	i_a, i_b, i_c: in std_logic;
	o_wyjscie: out std_logic_vector(1 downto 0) );
end component;

begin
B1:  sum PORT MAP( i_a(0), i_b(0), '0', out1 );
B2:  sum PORT MAP( i_a(1), i_b(1), out1(0), out2 );

o_result(3) <= '0';
o_result(2) <= out2(1);
o_result(1) <= out2(0);
o_result(0) <= out1(0);
--B2:  sum PORT MAP( i_a(1), i_b(1), c1, o_result(1), c2 );
--B3:  sum PORT MAP( i_a(2), i_b(2), c2, o_result(2), o_result(3) );
end combinational;

