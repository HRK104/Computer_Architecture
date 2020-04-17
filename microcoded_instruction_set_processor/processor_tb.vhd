library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity processor_tb is
end;

architecture bench of processor_tb is

  component processor
    Port ( 
      reset_for_PC, reset_for_CAR: in std_logic;
      reset_input_for_CAR: in std_logic_vector(7 downto 0);
      reset_input_for_PC: in std_logic_vector(15 downto 0);
      Clock: in std_logic
      --FS: in std_logic_vector(4 downto 0);
      --output_from_muxD, output_from_memory_M: out std_logic_vector(15 downto 0)
    );
  end component;

  signal reset_for_PC, reset_for_CAR, Clock: std_logic;
  signal reset_input_for_CAR: std_logic_vector(7 downto 0);
  --signal FS: std_logic_vector(4 downto 0) ;
  --signal reset_input_for_PC,output_from_muxD,output_from_memory_M: std_logic_vector(15 downto 0);
  signal reset_input_for_PC: std_logic_vector(15 downto 0);
  constant clock_period : time := 10 ns;
begin

  uut: processor port map ( Clock => Clock,
                            reset_for_PC => reset_for_PC,
                            reset_input_for_PC => reset_input_for_PC,
                            reset_for_CAR => reset_for_CAR,
                            reset_input_for_CAR => reset_input_for_CAR
                            --FS    => FS,
--                            output_from_memory_M => output_from_memory_M,
--                            output_from_muxD => output_from_muxD );
                            );


  clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
   
   
   
  stimulus: process
  begin
  
    

    wait for 30ns;
    reset_for_PC <= '0';
    reset_for_CAR <= '0';
    reset_input_for_PC <= "0101010101010101";
    reset_input_for_CAR <= "00001111";
    --FS <= "00000";
    wait for 30ns;
    reset_for_PC <= '0';
    reset_for_CAR <= '0';
    reset_input_for_PC <= "0101010101010101";
    reset_input_for_CAR <= "00001111";
    --FS <= "00001";
    wait for 30ns;
    reset_for_PC <= '0';
    reset_for_CAR <= '0';
    reset_input_for_PC <= "0101010101010101";
    reset_input_for_CAR <= "00001111";
    --FS <= "00010";
    wait for 30ns;
    reset_for_PC <= '0';
    reset_for_CAR <= '0';
    reset_input_for_PC <= "0101010101010101";
    reset_input_for_CAR <= "00001111";
    --FS <= "00011";
    wait for 30ns;
    reset_for_PC <= '0';
    reset_for_CAR <= '0';
    reset_input_for_PC <= "0101010101010101";
    reset_input_for_CAR <= "00001111";
    --FS <= "00100";
    wait for 30ns;
    reset_for_PC <= '0';
    reset_for_CAR <= '0';
    reset_input_for_PC <= "0101010101010101";
    reset_input_for_CAR <= "00001111";
    --FS <= "00101";
    wait for 30ns;
    reset_for_PC <= '0';
    reset_for_CAR <= '0';
    reset_input_for_PC <= "0101010101010101";
    reset_input_for_CAR <= "00001111";
    --FS <= "00110";
     wait for 30ns;
    reset_for_PC <= '0';
    reset_for_CAR <= '0';
    reset_input_for_PC <= "0101010101010101";
    reset_input_for_CAR <= "00001111";
    --FS <= "00111";
    
    
    
    wait for 30ns;
    reset_for_PC <= '1';
    reset_for_CAR <= '0';
    reset_input_for_PC <= "0101010101010101";
    reset_input_for_CAR <= "00001111";
    --FS <= "00000";
    wait for 30ns;
    reset_for_PC <= '0';
    reset_for_CAR <= '1';
    reset_input_for_PC <= "0101010101010101";
    reset_input_for_CAR <= "00001111";
    --FS <= "00000";
    
  end process;


end;