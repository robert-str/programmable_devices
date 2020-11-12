library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity fullAdder2x3 is

port( 
	ai: in std_logic_vector ( 2 downto 0 );
	bi: in std_logic_vector ( 2 downto 0 );
	res: out std_logic_vector ( 3 downto 0 ) );

end;

architecture myFullAdder of fullAdder2x3 is

COMPONENT adder1
	PORT(
		a : IN std_logic;
		b : IN std_logic;
		c : IN std_logic;          
		sum : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;


signal c0,c1: std_logic;

begin
	stage0: adder1 PORT MAP(
		a => ai(0),
		b => bi(0),
		c => '0',
		sum(0) => res(0),
		sum(1) => c0
	);
	stage1: adder1 PORT MAP(
		a => ai(1),
		b => bi(1),
		c => c0,
		sum(0) => res(1),
		sum(1) => c1
	);
	stage2: adder1 PORT MAP(
		a => ai(2),
		b => bi(2),
		c => c1,
		sum(0) => res(2),
		sum(1) => res(3)
	);


end myFullAdder;

