library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;


entity mydff2 is
port(   clk : in std_logic;
		rst : in std_logic;
		wen : in std_logic;
		eisod : in std_logic;
		deigma : out std_logic
		);
end entity;


architecture struct of mydff2 is


begin

pr1:process (clk) 
begin
   if clk='1' and clk'event then
      if rst='0' then 
         deigma <='0';
      elsif (wen='1') then
         deigma <= eisod;
      end if;
   end if;
end process;



end struct;
