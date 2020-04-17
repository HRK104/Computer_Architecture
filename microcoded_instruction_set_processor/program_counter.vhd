------------------------------------------------------------------------------------
---- Company: 
---- Engineer: 
---- 
---- Create Date: 2020/04/16 11:27:05
---- Design Name: 
---- Module Name: program_counter - Behavioral
---- Project Name: 
---- Target Devices: 
---- Tool Versions: 
---- Description: 
---- 
---- Dependencies: 
---- 
---- Revision:
---- Revision 0.01 - File Created
---- Additional Comments:
---- 
------------------------------------------------------------------------------------


--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.numeric_std.ALL;

---- Uncomment the following library declaration if using
---- arithmetic functions with Signed or Unsigned values
----use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx leaf cells in this code.
----library UNISIM;
----use UNISIM.VComponents.all;

--entity program_counter is
-- Port (
--    DR_input, SB_input: in std_logic_vector( 2 downto 0);
--    PL, PI: in std_logic;
--    result: out std_logic_vector(15 downto 0)
--  );
--end program_counter;

--architecture Behavioral of program_counter is

--signal clock: std_logic := '1';
--signal PC: std_logic_vector(15 downto 0) := "0000000000000000";
--signal DR_and_SB: std_logic_vector(5 downto 0);

--begin

 
-- DR_and_SB(5) <= DR_input(2) after 1ns;
-- DR_and_SB(4) <= DR_input(1) after 1ns;
-- DR_and_SB(3) <= DR_input(0) after 1ns;
-- DR_and_SB(2) <= SB_input(2) after 1ns;
-- DR_and_SB(1) <= SB_input(1) after 1ns;
-- DR_and_SB(0) <= SB_input(0) after 1ns;
 
 
-- process(clock)
-- variable DR_and_SB_Int : integer;
-- begin
--  DR_and_SB_Int:= to_integer(signed(DR_and_SB));
--  if(rising_edge(clock)) then 
  
--    if PL ='1' then
--      PC <= std_logic_vector(signed(PC) + DR_and_SB_Int);
--    else 
--	  if PI = '1' then
--	     PC <= std_logic_vector(unsigned(PC) + 1);
--	  end if;  
--    end if;
--  end if; 
--  result <= PC;   
-- end process;
 
 

          

--end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;



entity program_counter is

	port(
		DR_input, SB_input : in std_logic_vector( 2 downto 0);
		pl			: in std_logic ;
		pi 		: in std_logic ;
		reset : in std_logic;
		reset_input : in std_logic_vector(15 downto 0);
		clock		: in std_logic;
		result : out std_logic_vector(15 downto 0)
	);

end program_counter;



architecture Behavioral of program_counter is

signal PC: std_logic_vector( 15 downto 0) := X"0000";
signal DR_and_SB: std_logic_vector( 5 downto 0);
begin

    DR_and_SB(5) <= DR_input(2);
    DR_and_SB(4) <= DR_input(1);
    DR_and_SB(3) <= DR_input(0);
    DR_and_SB(2) <= SB_input(2);
    DR_and_SB(1) <= SB_input(1);
    DR_and_SB(0) <= SB_input(0);
    
	process(clock)
		variable DR_and_SB_Int : integer;
			begin
			    if reset = '1' then
				      PC <= reset_input;
				elsif(rising_edge(clock)) then 
				    DR_and_SB_Int := to_integer(signed(DR_and_SB));
				     
					  
					  if pl = '1' then
						   	PC <= std_logic_vector(signed(PC) + DR_and_SB_Int);
					  else 
						  if pi = '1' then
							  	PC <= std_logic_vector(unsigned(PC) + 1);
						  end if;
					  end if;
					end if;  
				
	end process;
	result <= PC;
end Behavioral;
