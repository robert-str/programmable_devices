
-- VHDL Test Bench Created from source file stateMachine1.vhd -- 01/15/19  14:00:21
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

	COMPONENT stateMachine1
	PORT(
		i_clk : IN std_logic;
		i_btn : IN std_logic_vector(1 downto 0);          
		o_clkSlow : OUT std_logic;
		o_diodes : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	SIGNAL i_clk :  std_logic;
	SIGNAL i_btn :  std_logic_vector(1 downto 0);
	SIGNAL o_clkSlow :  std_logic;
	SIGNAL o_diodes :  std_logic_vector(7 downto 0);

BEGIN

	uut: stateMachine1 PORT MAP(
		i_clk => i_clk,
		i_btn => i_btn,
		o_clkSlow => o_clkSlow,
		o_diodes => o_diodes
	);


-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      wait; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
