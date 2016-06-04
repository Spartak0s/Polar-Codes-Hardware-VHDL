--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:07:49 05/09/2016
-- Design Name:   
-- Module Name:   D:/Dropbox/Thesis Project/Hardware/Backup/Polar_32bits/test_encoder32.vhd
-- Project Name:  Polar_32bits
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Encoder
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_encoder32 IS
END test_encoder32;
 
ARCHITECTURE behavior OF test_encoder32 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Encoder
    PORT(
         inputs : IN  std_logic_vector(15 downto 0);
         outputs : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal inputs : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal outputs : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: Encoder PORT MAP (
          inputs => inputs,
          outputs => outputs
        );
		  
   -- Stimulus process
   stim_proc: process
		variable I : integer range 0 to (2**16)+1 := 0;
   begin		
      -- hold reset state for 100 ns.
      wait for 5 ns;
		while( I /= (2**16)) loop
			inputs <= std_logic_vector(to_unsigned(I,inputs'length));
			I := I + 1;
			wait for 1ns;
		end loop;
      -- insert stimulus here 
      wait;
   end process;

END;
