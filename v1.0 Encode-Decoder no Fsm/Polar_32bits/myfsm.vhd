library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;


entity myfsm is
port (  clk		: in std_logic;
		rst		: in std_logic;
		freezing : in std_logic;
		running	: out std_logic;
		conti	: out std_logic;
		address	: out signed (9 downto 0)
);
end entity;

architecture struct of myfsm is

	type state_type is (r0,t0,t1);
	signal state: state_type;
	signal addr : signed (9 downto 0);
--	signal var1 : std_logic;

begin

	pr1:process(clk)
	begin
		if clk'event and clk='1' then
			if rst='0' then
				state<=r0;
				addr<="0000000000";
			else
				case state is
				when r0=>
					if (addr="1001101100" and freezing='0') then
						state<=t0;
						addr<="0000000000";
					elsif (addr="1001101100" and freezing='1') then
						state<=t1;
						addr<="0000000000";
					else
						state<=r0;
						addr<=addr+4;
					end if;
				when t0=>
					if (freezing='1') then
						state<=t1;
						if (addr="1001101100") then
							addr<="0000000000";
						else
							addr<=addr+4;
						end if;
					else
						if (addr="1001101100") then
							addr<="0000000000";
						else
							addr<=addr+4;
						end if;
						state<=t0;
					end if;
				when t1 =>
					if (freezing='0') then
						state<=t0;
					else
						state<=t1;
					end if;
				when others=>
					state<=r0;
					addr<="0000000000";
				end case; 
			end if;   
		end if;
	end process;

	pr2:process(state)
	begin   
		case state is 
			when r0=> 	running<='0';
						conti<='1';
			when t0=> 	running<='1';
						conti<='1';
			when t1=> 	running<='1';
						conti<='0';
			when others=> running<='0';
						conti<='0';
		end case;
	end process;
	
--	running<=var1;
	address<=addr;

end struct;
