


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY program_counter_TB IS

END program_counter_TB;

ARCHITECTURE behavior OF program_counter_TB IS 

    COMPONENT program_counter
    PORT(
         DR_input, SB_input : in std_logic_vector( 2 downto 0);
         pl : IN  std_logic;
         pi : IN  std_logic;
		 clock : IN std_logic;
		 reset : IN std_logic;
		 reset_input : IN std_logic_vector(15 downto 0); 
         result : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;

    


   signal DR_input, SB_input :  std_logic_vector( 2 downto 0);
   signal pl : std_logic := '0';
   signal pi : std_logic := '0';
   signal clock : std_logic := '0';
   signal reset : std_logic;
   signal reset_input : std_logic_vector(15 downto 0);
   signal result : std_logic_vector(15 downto 0);
   constant clock_period : time := 10 ns;
BEGIN
   uut: program_counter PORT MAP (
          DR_input => DR_input,
          SB_input => SB_input,
          pl => pl,
          pi => pi,
		  clock => clock,
		  reset => reset,
		  reset_input => reset_input,
          result => result
        );
        
        
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
	

   stim_proc: process
   begin
      wait for clock_period;		     
      DR_input<= "111";
      SB_input <= "111";
	  pi <= '0';
	  pl <= '1';
	  reset <= '0';
	  reset_input <= "0000000011111111";
	  wait for clock_period;
	  pi <= '0';
	  pl <= '0';
	  reset <= '0';
	  reset_input <= "0000000011111111";
	  wait for clock_period;
	  DR_input<= "111";
      SB_input <= "111";
      pi <= '0';
      pl <= '1';
      reset <= '0';
	  reset_input <= "0000000011111111";
      wait for clock_period;
      pi <= '0';
      pl <= '0';
      reset <= '0';
	  reset_input <= "0000000011111111";
      wait for clock_period;
      pi <= '1';
      pl <= '0';
      reset <= '0';
	  reset_input <= "0000000011111111";
      wait for clock_period;
      pi <= '0';
      pl <= '0';
      reset <= '0';
	  reset_input <= "0000000011111111";
      wait for clock_period;
      pi <= '0';
      pl <= '0';
      reset <= '1';
	  reset_input <= "0000000011111111";

   end process;



END;	
