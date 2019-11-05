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
      diode1 <= "0000010";
      btn <= "00";
      wait for 30ns;
      btn <= "01";
      wait; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;

