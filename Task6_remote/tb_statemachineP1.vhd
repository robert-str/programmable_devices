-- VHDL Test Bench Created from source file stateMachine1.vhd -- 11/12/20  11:19:14
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Lattice recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "source->import"
-- menu in the ispLEVER Project Navigator to import the testbench.
-- Then edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
LIBRARY generics;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE generics.components.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS 

	COMPONENT stateMachineP1
	PORT(
		i_clk : IN std_logic;
		i_drv : IN std_logic;          
		o_flag : OUT std_logic
		);
	END COMPONENT;

	SIGNAL i_clk :  std_logic;
	SIGNAL i_drv :  std_logic;
	SIGNAL o_flag :  std_logic;

BEGIN

	uut: stateMachineP1 PORT MAP(
		i_clk => i_clk,
		i_drv => i_drv,
		o_flag => o_flag
	);



-- *** Test Bench - User Defined Section ***
   clkgen : PROCESS
   BEGIN
      i_clk <= '0';
	loop
      		wait for 5ns;
      		i_clk <= not i_clk;
	end loop;
	wait;
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      i_drv <= '1'; wait for 7ns;
      i_drv <= '0'; wait for 60ns;
      i_drv <= '1'; wait for 50ns;
      i_drv <= '0'; wait for 110ns;
      i_drv <= '1'; wait for 50ns;
      i_drv <= '0'; wait for 10ns;
      i_drv <= '1';
	
      wait; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;

