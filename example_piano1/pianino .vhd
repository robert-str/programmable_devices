
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
entity pianino is
port(	CLK0 : in std_logic;
	out0 : out std_logic_vector(7 downto 0);
	datain : in std_logic_vector(4 downto 0));

end;

architecture simple of pianino is
begin
process(datain, CLK0)
variable odlicz : integer range 0 to 255;
variable max : integer range 0 to 480;
variable play : boolean;
begin 


if datain = "00001" then
	max := 18;
	play := true;
elsif datain = "00010" then
	max := 17;
	play := true;
elsif datain = "00011" then
	max := 16;
	play := true;
elsif datain = "00100" then
	max := 15;
	play := true;
elsif datain = "00101" then
	max := 14;
	play := true;
elsif datain = "00110" then
	max :=13;
	play := true;
elsif datain = "00111" then
	max :=12;
	play := true;
elsif datain = "01000" then
	max :=11;
	play := true;
elsif datain = "01001" then
	max :=10;
	play := true;
elsif datain = "01010" then
	max :=9;
	play := true;
elsif datain = "01011" then
	max :=8;
	play := true;
elsif datain = "01100" then
	max :=7;
	play := true;
elsif datain = "01101" then
	max :=6;
	play := true;
elsif datain = "01110" then
	max :=5;
	play := true;
elsif datain = "01111" then
	max :=4;
	play := true;
elsif datain = "10000" then
	max :=3;
	play := true;
else
	max :=0;
	odlicz := 0;
	play := false;
	out0 <= "00000000";
end if;


if (rising_edge(CLK0) and play = true)  then	
 	if odlicz = max then
		out0 <= not out0;
		odlicz := 0;
	else
		odlicz := odlicz + 1;

	end if;
end if;


end process;
end simple;

