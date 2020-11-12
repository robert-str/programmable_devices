library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
-----------------------------------------------------
entity stateMachineInit is port( 
 i_clk:     in  std_logic;
 i_drv:     in  std_logic;
 o_flag:   out std_logic);
end;
-----------------------------------------------------
-----------------------------------------------------
architecture sequential of stateMachineInit is
type state is (Sidle, Sflag);
signal currState, nextState: state;

begin
-----------------------------------------------------
stateMemory: process (i_clk)

begin
 if( rising_edge(i_clk) ) then
	currState <= nextState;
 end if;
end process stateMemory;
---------------------------------------------------
stateDecode:process(i_drv,currState)
begin
 case currState is
  when	Sidle =>
	o_flag <= '0';
	if(i_drv='0') then
		nextState <= Sflag;
	else
		nextState <= Sidle;
	end if;
 when	Sflag =>
	o_flag <= '1';		
	if(i_drv='0') then
		nextState <= Sidle;
	else
		nextState <= Sflag;
	end if;
 when	others =>
	nextState <= Sidle;
	o_flag <= '0';
end case;
end process stateDecode;
-----------------------------------------------------
end sequential;
