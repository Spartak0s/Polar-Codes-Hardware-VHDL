--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:33:19 04/02/2016
-- Design Name:   
-- Module Name:   D:/Dropbox/Thesis Project/Hardware/Polar1024/test_encoder.vhd
-- Project Name:  Polar1024
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Decoder1024
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_encoder IS
END test_encoder;
 
ARCHITECTURE behavior OF test_encoder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoder1024
    PORT(
         inputs : IN  std_logic_vector(0 to 1023);
         clk : IN  std_logic;
         outputs : OUT  std_logic_vector(511 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal inputs : std_logic_vector(0 to 1023) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal outputs : std_logic_vector(511 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder1024 PORT MAP (
          inputs => inputs,
          clk => clk,
          outputs => outputs
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
