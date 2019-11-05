library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity top is

port( 
	clk: in std_logic ;
	i_prescalerSelect: in std_logic_vector(6 downto 0);
	seg7: out std_logic_vector(7 downto 0);
	clock_out, LD, BI: out std_logic  );

end;

----------------------------------------------------------------
----------------------------------------------------------------
architecture top of top is
signal clock_sig: std_logic;
--signal nb: std_logic_vector (3 downto 0);
----------------------------------------------------------------
component counter is port( 
	i_clk, i_sigZero: in std_logic ;
	o_number: out std_logic_vector (7 downto 0));
end component;
----------------------------------------------------------------
--component bcd_to_seg7 is port( 
--	number: in std_logic_vector ( 3 downto 0 );
--	seg7: out std_logic_vector ( 7 downto 0 ) );
--end component;
----------------------------------------------------------------
component clk_prescaler is port( 
	clk_fast: in std_logic ;
	prescalerValue: in std_logic_vector(6 downto 0);
	clk_slow: out std_logic  );
end component;
----------------------------------------------------------------
begin

U0: clk_prescaler port map (clk, i_prescalerSelect, clock_sig);
U1: counter port map(clock_sig, '0', seg7);
--U2: bcd_to_seg7 port map(nb, seg7);

clock_out <= clock_sig;
LD <= '1';
BI <= '0';
end top;

