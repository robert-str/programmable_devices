library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity adder2x3 is

port( 
	a: in std_logic_vector ( 2 downto 0 );
	b: in std_logic_vector ( 2 downto 0 );
	w: out std_logic_vector ( 3 downto 0 ) );

end;

architecture adder_my of adder2x3 is

	component adder port(
		a : IN std_logic;
		b : IN std_logic;
		c : IN std_logic;          
		res : OUT std_logic_vector(1 downto 0)
	);	
	end component;

	signal c0,c1: std_logic;
begin

	add0: adder port map(a=>a(0), b=>b(0), c=>'0',res(0)=>w(0),res(1)=>c0);	
	add1: adder port map(a=>a(1), b=>b(1), c=>c0,res(0)=>w(1),res(1)=>c1);
	add2: adder port map(a=>a(2), b=>b(2), c=>c1,res(0)=>w(2),res(1)=>w(3));

end adder_my;

