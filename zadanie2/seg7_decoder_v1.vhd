library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity bcd_to_seg7 is

port( 
	number: in std_logic_vector ( 3 downto 0 );
	seg7: out std_logic_vector ( 7 downto 0 ) );

end;

architecture combinational of bcd_to_seg7 is
begin

with number select
	seg7 <= B"0000_0011" when B"0000", --0
		B"1001_1111" when B"0001", --1
		B"0010_0101" when B"0010", --2
		B"0000_1101" when B"0011", --3
		B"1001_1001" when B"0100", --4
		B"0100_1001" when B"0101", --5
		B"0100_0001" when B"0110", --6
		B"0001_1111" when B"0111", --7
		B"0000_0001" when B"1000", --8
		B"0000_1001" when B"1001", --9
		--X"FF" when others;
		B"0001_0001" when B"1010", --10 - A
		B"0000_0000" when B"1011", --11 - B.
		B"0110_0011" when B"1100", --12 - C
		B"0000_0010" when B"1101", --13 - D.
		B"0110_0001" when B"1110", --14 - E
		B"0111_0001" when B"1111"; --15 - F
end combinational;

