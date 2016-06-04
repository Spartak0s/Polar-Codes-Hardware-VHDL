----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:19:54 04/05/2016 
-- Design Name: 
-- Module Name:    mux - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux is
	generic (in_width : integer := (N/2)*(integer_part+fractional_part);
				out_width : integer :=(integer_part+fractional_part);
				sel_width : integer := Ndiv2bits);
	Port (	sel : in std_logic_vector(sel_width-1 downto 0);
				inputs : in  STD_LOGIC_VECTOR (in_width-1 downto 0);
				outputs : out STD_LOGIC_VECTOR (out_width-1 downto 0));
end mux;

architecture Behavioral of mux is
begin

process(sel,inputs) is
constant in_div_out : integer := in_width /out_width;
variable tmp : std_logic_vector(out_width-1 downto 0);
begin
	for i in 0 to in_div_out-1 loop
		if i = unsigned(sel) then
			tmp := inputs(((out_width-1)+i*out_width) downto (i*out_width));
		end if;
	end loop;
	outputs <= tmp;
end process;
		



end Behavioral;

