library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
-----------------------------------------------------
entity stateMachine1 is port( 
 i_clk:     in  std_logic;
 i_btn:     in  std_logic_vector(1 downto 0);
 o_clkSlow: out std_logic;
 o_diodes:  out std_logic_vector(7 downto 0));
end;
-----------------------------------------------------
-----------------------------------------------------
architecture sequential of stateMachine1 is
type state is (S0, S1);
signal currState, nextState: state;
signal clk_slow, OE: std_logic; -- OE = output enable

component clk_prescaler port( 
 i_clk_fast:       in std_logic ;
 i_prescalerValue: in std_logic_vector(6 downto 0);
 o_clk_slow:      out std_logic  );
end component;
-----------------------------------------------------
begin
-----------------------------------------------------
pres: clk_prescaler port map (i_clk, "0100000" ,clk_slow);

o_diodes <= (others => clk_slow) when OE='1' else (others => 'Z');
o_clkSlow <= clk_slow;
-----------------------------------------------------
stateMemory: process (i_clk)
begin
 if( rising_edge(i_clk) ) then
  if(currState /= nextState) then
   currState <= nextState;
  end if;
 end if;
end process stateMemory;
-----------------------------------------------------
stateDecode:process(i_btn,currState)
begin
 case currState is
  when	S0 =>
	OE <= '0';
	if(i_btn="10") then
		nextState <= S1;
	else
		nextState <= S0;
	end if;
 when	S1 =>
	OE <= '1';			
	if(i_btn="01") then
		nextState <= S0;
	else
		nextState <= S1;
	end if;
 when	others =>
	nextState <= S0;
	OE <= '0';
end case;
end process stateDecode;
-----------------------------------------------------
end sequential;
