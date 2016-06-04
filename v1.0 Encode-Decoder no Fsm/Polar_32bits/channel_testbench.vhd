--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:53:10 04/26/2016
-- Design Name:   
-- Module Name:   D:/Dropbox/Thesis Project/Hardware/Backup/Polar_32bits/channel_testbench.vhd
-- Project Name:  Polar_32bits
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mysystem
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
use work.all;
use work.MyPackage.all;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY channel_testbench IS
END channel_testbench;
 
ARCHITECTURE behavior OF channel_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mysystem
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         dinready : IN  std_logic;
         datain : IN  signed(1 downto 0);
         sigma1 : IN  signed(39 downto 0);
         sigma2 : IN  signed(39 downto 0);
         doutready : OUT  std_logic;
         dataout11 : OUT  std_logic_vector(5 downto 0);
         dataout21 : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal dinready : std_logic := '0';
   signal datain : signed(1 downto 0) := "00";
   signal sigma1 : signed(39 downto 0) := (others => '0');
   signal sigma2 : signed(39 downto 0) := (others => '0');

 	--Outputs
   signal doutready : std_logic;
   signal dataout11 : std_logic_vector(5 downto 0);
   signal dataout21 : std_logic_vector(5 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mysystem PORT MAP (
          clk => clk,
          rst => rst,
          dinready => dinready,
          datain => datain,
          sigma1 => sigma1,
          sigma2 => sigma2,
          doutready => doutready,
          dataout11 => dataout11,
          dataout21 => dataout21
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
		rst <= '1';
		sigma1 <= "0000000000000000000000000000000000000000";
		sigma2 <= "1111111100000000000000000000000000000000";
		datain <= "00";
		dinready <= '1';
      wait for clk_period*10;
		datain <= "01";
		wait for clk_period*10;
		datain <= "10";
		wait for clk_period*10;
		datain <= "11";
		wait for clk_period*20;

      -- insert stimulus here 

      wait;
   end process;

END;
