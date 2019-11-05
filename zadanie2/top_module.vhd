library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity top is

port( 
	clk, zero: in std_logic ;
	seg7: out std_logic_vector(7 downto 0)  );

end;

----------------------------------------------------------------
----------------------------------------------------------------
architecture top of top is
signal nb: std_logic_vector (3 downto 0);
----------------------------------------------------------------
component counter is port( 
	i_clk, i_sigZero: in std_logic ;
	o_number: out std_logic_vector (3 downto 0));
end component;
----------------------------------------------------------------
component bcd_to_seg7 is port( 
	number: in std_logic_vector ( 3 downto 0 );
	seg7: out std_logic_vector ( 7 downto 0 ) );
end component;
----------------------------------------------------------------

begin

U1: counter port map(clk, zero, nb);
U2: bcd_to_seg7 port map(nb, seg7);

end top;

