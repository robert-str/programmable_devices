
-- VHDL Test Bench Created from source file multip2.vhd -- 11/02/20  11:09:55
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

	COMPONENT multip2
	PORT(
		i_signals : IN std_logic_vector(3 downto 0);
		i_select : IN std_logic_vector(1 downto 0);          
		o_signal : OUT std_logic
		);
	END COMPONENT;

	SIGNAL o_signal :  std_logic;
	SIGNAL i_signals :  std_logic_vector(3 downto 0);
	SIGNAL i_select :  std_logic_vector(1 downto 0);

BEGIN

	uut: multip2 PORT MAP(
		o_signal => o_signal,
		i_signals => i_signals,
		i_select => i_select
	);


-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      wait; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
