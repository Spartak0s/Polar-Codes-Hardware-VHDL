----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:35:08 04/04/2016 
-- Design Name: 
-- Module Name:    D_FF_en - Behavioral 
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

entity D_FF_en is
	generic( width: integer := K);
    Port ( d : in  STD_LOGIC_VECTOR (width-1 downto 0);
           q : out  STD_LOGIC_VECTOR (width-1 downto 0);
			  clk : in STD_LOGIC;
           en : in  STD_LOGIC);
end D_FF_en;

architecture Behavioral of D_FF_en is

begin
   process (clk)
   begin
		if (rising_edge(clk) and en='1') then
			q <= d;
      end if;
	end process;
end architecture Behavioral;
