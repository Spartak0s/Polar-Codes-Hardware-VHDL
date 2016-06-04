----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:23:05 04/04/2016 
-- Design Name: 
-- Module Name:    IO_Input - Behavioral 
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

entity IO_Input is
    Port ( inputs : in  STD_LOGIC_VECTOR (K-1 downto 0);
			  clk : in std_logic;
           outputs : out  STD_LOGIC_VECTOR (N/2-1 downto 0));
end IO_Input;

architecture Behavioral of IO_Input is
signal enable: std_logic_vector(NdivK-1 downto 0);
begin


Shift:if(NdivK-1)/=0 generate
	Shift_register: entity work.shift port map(clk,'0',enable);
	FF:for i in 0 to NdivK-1 generate
		FF_ins: entity work.D_FF_en port map(inputs,outputs((i*K)+K-1 downto i*K),clk,enable(i));
	end generate FF;
end generate Shift;


No_Shift:if (NdivK-1)=0 generate
			FF_ins: entity work.D_FF_en port map(inputs,outputs(K-1 downto 0),clk,'1');
end generate No_Shift;
		
		


end Behavioral;

