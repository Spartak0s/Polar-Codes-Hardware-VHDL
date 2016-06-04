library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;


entity mybpsk is
port(   simeio : in std_logic;
		symbol : out signed (79 downto 0)
		);
end entity;


architecture struct of mybpsk is

constant ena : signed (79 downto 0):= "00000000000000010000000000000000000000000000000000000000000000000000000000000000";
constant plinena : signed (79 downto 0):= "11111111111111110000000000000000000000000000000000000000000000000000000000000000";
begin

symbol<=plinena when simeio='0' else ena;

end struct;
