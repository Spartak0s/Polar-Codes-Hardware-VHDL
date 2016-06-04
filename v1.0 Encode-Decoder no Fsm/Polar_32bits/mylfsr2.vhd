-------------------------------------------------------------
-- This file is generated through a matalab script. For    --
-- any problems please contact to paraskeu@ceid.upatras.gr --
-- with subject: lfsr2 script. Thank you!                  --
-------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity mylfsr2 is
port ( starting: in std_logic_vector (7 downto 0);
	lfsr2_out: out std_logic_vector(7 downto 0);
	clk: in std_logic;
	rst: in std_logic;
	en: in std_logic);
end mylfsr2;

architecture struct of mylfsr2 is

signal count: std_logic_vector (7 downto 0);

begin

pr1:process(clk)
begin
	if (clk'event and clk='1')then
		if (rst='0') then
			count<=starting;
		elsif (en='1') then
			count(0)<=count(7);
			count(1)<=count(0);
			count(2)<=count(7) xor count(1);
			count(3)<=count(7) xor count(2);
			count(4)<=count(7) xor count(3);
			count(5)<=count(4);
			count(6)<=count(5);
			count(7)<=count(6);
		end if;
	end if;
end process;

lfsr2_out<=count;

end struct;
