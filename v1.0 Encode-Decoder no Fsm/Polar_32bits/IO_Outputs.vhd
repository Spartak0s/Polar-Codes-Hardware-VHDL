----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:15:25 04/05/2016 
-- Design Name: 
-- Module Name:    IO_Outputs - Behavioral 
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

entity IO_Outputs is
    Port ( 	clk : in std_logic;
				inputs : in  STD_LOGIC_VECTOR (N/2-1 downto 0);
           outputs : out STD_LOGIC_VECTOR (K-1 downto 0));
end IO_Outputs;

architecture Behavioral of IO_Outputs is
signal counter_out: std_logic_vector(NdivKbits-1 downto 0);
begin

Mux_counter: entity work.counter generic map(width => NdivKbits) port map(clk,'0','1',counter_out);
MUX: entity work.mux port map(counter_out,inputs,outputs);



end Behavioral;

