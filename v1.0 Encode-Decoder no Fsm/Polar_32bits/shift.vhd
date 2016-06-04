----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:08:19 04/04/2016 
-- Design Name: 
-- Module Name:    shift - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.all;
use work.MyPackage.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shift is
  generic (width : integer := NdivK);
  port(clk, rst : in  std_logic; 
       outputs : out std_logic_vector(width-1 downto 0)); 
end shift; 
architecture Behavioral of shift is 
  signal tmp: std_logic_vector(width-1 downto 0) := (0=>'1', others=>'0'); 
  begin 
    process (clk) 
      begin  
			if rising_edge(clk) then
				if(rst = '1') then
					tmp <= (0 => '1', others => '0');
				else
					tmp <= tmp(width-2 downto 0)& tmp(width-1); 
				end if;
			end if;
    end process; 
    outputs <= tmp; 
end Behavioral; 

