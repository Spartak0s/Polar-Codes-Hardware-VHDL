----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:03:21 02/23/2016 
-- Design Name: 
-- Module Name:    D_FF - Behavioral 
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

entity D_FF_llr is
   port(
      clk : in std_logic;
      rst : in std_logic;
      d : in llr;
      q : out llr);
end entity D_FF_llr;
 
architecture Behavioral of D_FF_llr is
begin
   process (clk,rst)
   begin
		if (rst='1') then
			q <= (others => '0');
      elsif rising_edge(clk) then
			q <= d;
      end if;
	end process;
end architecture Behavioral;

