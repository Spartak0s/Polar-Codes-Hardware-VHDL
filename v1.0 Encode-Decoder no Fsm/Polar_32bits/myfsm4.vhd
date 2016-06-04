library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;


entity myfsm4 is
port (  clk		: in std_logic;
		rst		: in std_logic;
		cc	: in std_logic;
		
		frames	: in std_logic_vector(35 downto 0);
		
		in_val_enc	: out std_logic;
		end_enc	: in std_logic
);
end entity;



architecture struct of myfsm4 is

type state_type is (a0,x1,x2,delay1stfrm,delay2);
signal state: state_type;


signal count8,coun4: std_logic_vector (3 downto 0);
signal count_info : std_logic_vector (9 downto 0);

begin

	pr1:process(clk)
	begin
		if clk'event and clk='1' then
			if rst='0' then
				state<=a0;
				count_info<="0000000000";
				count8<="0000";
				--	fra_en2<='0';
				--	coun4<="0000";
			else
			
				case state is
				when a0=>
					--coun4<="0000";
				count_info<="0000000000";
					--fra_en2<='0';
				if frames="000000000000000000000000000000000001" then	--++if cc='1' then 
					
						 if count8="0111" then
						 count8<="0000";
							state<=delay1stfrm;--				x1;--
						else
						count8<=count8+1;
							state<=a0;
						end if;
								
				end if;				
					
				when delay1stfrm=>--delay gia to 1o frame
					--coun4<="0000";
					--fra_en2<='0';
						count8<="0000";
				count_info<="0000000000";
					if end_enc='1' then 
							state<=delay2;--x1;				
					else
						
							state<=delay1stfrm;
					end if;
			when delay2=>
				
				count_info<="0000000000";
						 if count8="1000" then
						 count8<="0000";
							state<=x1;--delay1stfrm;--				x1;--
						else
						count8<=count8+1;
							state<=delay2;
						end if;
								
					
				when x1=>		
				
				 count8<="0000";
				
				if count_info="1011110011" then
				count_info<="0000000000";
				state<=x2;
				else
				count_info<=count_info +1;
				state<=x1;
				end if;
				
				when x2=>--ok
					count_info<="0000000000";
					if end_enc='1' then
						state<=x1;
					else
						state<=x2;
					end if;
				
				--------------------------------------------------------------------
				when others=>
					-- coun4<="0000";
					-- fra_en2<='0';
				count8<="0000";
					state<=a0;
					count_info<="0000000000";
				end case; 
			end if;   
		end if;
	end process;

	pr2:process(state)
	begin   
		case state is 
			when a0=>	--beg	<='1'; -- 
						in_val_enc	<='0';
						
				
			when delay1stfrm=>
						--beg	<='0'; -- 
						in_val_enc	<='0';
						
			when delay2=>
						--beg	<='0'; -- 
						in_val_enc	<='0';
			
			
			when x1=>	--beg	<='1'; -- 
						in_val_enc	<='1';
						
						
			when x2=>	--beg	<='1'; -- 
						in_val_enc	<='0';
						
						
				
						
						
			when others=> --beg<='1';
						 in_val_enc	<='0';
						
		end case;
	end process;
end struct;
