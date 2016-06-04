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

entity D_FF_gen is
	generic(width: integer := K);
   port(
      clk : in std_logic;
		rst : in std_logic;
		ce : in std_logic;
      d : in std_logic_vector(width-1 downto 0);
      q : out std_logic_vector(width-1 downto 0));
end entity D_FF_gen;
 
architecture Behavioral of D_FF_gen is
begin
   process (clk)
   begin
		if rising_edge(clk) then
			if(rst = '1') then
				q <= (others => '0');
			else
				if( ce = '1') then
					q <= d;
				end if;
			end if;
		end if;
	end process;
end architecture Behavioral;

