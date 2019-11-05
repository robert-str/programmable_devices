library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity stateMachine1 is

port( 
	i_clk: in std_logic;
	i_btn: in std_logic_vector ( 7 downto 0 );
	o_clkSlow: out std_logic;
	o_state: out std_logic_vector ( 1 downto 0 );
	o_diodes: out std_logic_vector ( 7 downto 0 ) );

end;
---------------------------------------------------------
---------------------------------------------------------
architecture sequential of stateMachine1 is
type state is (S0, S1, S2, S3);
signal currState, nextState: state;
signal clk_slow, OE: std_logic;

component clk_prescaler port( 
	clk_fast: in std_logic ;
	prescalerValue: in std_logic_vector(6 downto 0);
	clk_slow: out std_logic  );
end component;

begin
pres: clk_prescaler port map (i_clk, "0100000" ,clk_slow);
o_diodes <= (others => clk_slow) when OE='1' else (others => 'Z');
o_clkSlow <= clk_slow;

---------------------------------------------------------
proc1: process (i_clk)
variable counter: unsigned (5 downto 0);
begin
	if( rising_edge(i_clk) ) then
		if(currState /= nextState) then
			if(counter = 63) then
			 currState <= nextState;
			 counter := "000000";
			else
			 counter := counter +1;
			end if;
		end if;
	end if;
end process proc1;
---------------------------------------------------------

---------------------------------------------------------
proc2:process(i_btn,currState)
begin
	case currState is
	when	S0 =>
			OE <= '0';
			o_state <= 0;
			if(i_btn(2 downto 0)="001") then
				nextState <= S1;
			else
				nextState <= S0;
			end if;
	when	S1 =>
			OE <= '0';
			o_state <= 1;			
			if(i_btn(2 downto 0)="100") then
				nextState <= S2;
			else
				nextState <= S0;
			end if;
	when	S2 =>
			OE <= '1';
			o_state <= 2;			
			if(i_btn(2 downto 0)="101") then
				nextState <= S0;
			else
				nextState <= S2;
			end if;
	when	others =>
			nextState <= S0;
			OE <= '0';
			o_state <= 0;
	end case;
end process proc2;
---------------------------------------------------------

end;
