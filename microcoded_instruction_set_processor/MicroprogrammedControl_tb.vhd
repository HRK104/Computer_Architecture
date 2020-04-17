library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity MicroprogrammedControl_tb is
end;

architecture bench of MicroprogrammedControl_tb is

  component MicroprogrammedControl
  Port (
          reset_for_PC,reset_for_CAR, Clock,C,V,Z,N: in std_logic;
          reset_input_for_PC,from_memory_M: in std_logic_vector(15 downto 0);
          reset_input_for_CAR: in std_logic_vector(7 downto 0);
          output_from_PC: out std_logic_vector(15 downto 0);
          --NA: out std_logic_vector(7 downto 0);
          FS: out std_logic_vector(4 downto 0);
          DR,SA,SB: out std_logic_vector(2 downto 0)
     );
  end component;

  signal reset_for_PC,reset_for_CAR,Clock,C,V,Z,N: std_logic;
  signal reset_input_for_PC,from_memory_M: std_logic_vector(15 downto 0);
  signal reset_input_for_CAR: std_logic_vector(7 downto 0);
  signal output_from_PC: std_logic_vector(15 downto 0);
  signal FS: std_logic_vector(4 downto 0);
  --signal NA: std_logic_vector( 7 downto 0);
  signal DR,SA,SB: std_logic_vector(2 downto 0) ;

  constant clock_period : time := 10 ns;
begin

  uut: MicroprogrammedControl port map ( Clock          => Clock,
                                         C              => C,
                                         reset_for_PC =>reset_for_PC,
                                         reset_for_CAR  =>reset_for_CAR,
                                         reset_input_for_PC => reset_input_for_PC,
                                         reset_input_for_CAR => reset_input_for_CAR,
                                         V              => V,
                                         Z              => Z,
                                         N              => N,
                                         from_memory_M  => from_memory_M,
                                         output_from_PC => output_from_PC,
                                         --NA             => NA,
                                         FS             =>FS,
                                         DR             => DR,
                                         SA             => SA,
                                         SB             => SB );


  clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
   
   
  stimulus: process
  begin
  
    wait for 10ns;
    from_memory_M <= "1111111111111111";
    C <= '1';
    V <= '1';
    Z <= '1';
    N <= '1';
    reset_for_PC <='0';
    reset_for_CAR  <='0';
    reset_input_for_PC <= "0101010101010101";
    reset_input_for_CAR <= "00001111"; 
    
    wait for 10ns;
    from_memory_M <= "1111111111111111";
    C <= '1';
    V <= '1';
    Z <= '1';
    N <= '1';
    reset_for_PC <='1';
    reset_for_CAR  <='0';
    reset_input_for_PC <= "0101010101010101";
    reset_input_for_CAR <= "00001111"; 
    
    wait for 10ns;
    from_memory_M <= "1111111111111111";
    C <= '1';
    V <= '1';
    Z <= '1';
    N <= '1';
    reset_for_PC <='0';
    reset_for_CAR  <='1';
    reset_input_for_PC <= "0101010101010101";
    reset_input_for_CAR <= "00001111"; 
    
  end process;


end;