
-- VHDL Test Bench Created from source file simple1.vhd -- 11/09/18  13:11:36
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

	COMPONENT simple1
	PORT(
		diode1 : IN std_logic_vector(6 downto 0);
		btn : IN std_logic_vector(1 downto 0);          
		wyjsc : OUT std_logic
		);
	END COMPONENT;

	SIGNAL wyjsc :  std_logic;
	SIGNAL diode1 :  std_logic_vector(6 downto 0);
	SIGNAL btn :  std_logic_vector(1 downto 0);

BEGIN

	uut: simple1 PORT MAP(
		wyjsc => wyjsc,
		diode1 => diode1,
		btn => btn
	);


-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      wait; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
