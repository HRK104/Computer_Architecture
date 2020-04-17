library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity control_address_reg_tb is
end;

architecture bench of control_address_reg_tb is

  component control_address_reg
    Port ( 
      input_from_muxC: in std_logic_vector( 7 downto 0);
      input_from_muxS, reset: in std_logic;
      reset_input : in std_logic_vector(7 downto 0);
      result: out std_logic_vector( 7 downto 0)
    );
  end component;

  signal input_from_muxC: std_logic_vector( 7 downto 0);
  signal input_from_muxS,reset: std_logic;
  signal result, reset_input: std_logic_vector( 7 downto 0) ;

begin

  uut: control_address_reg port map ( input_from_muxC => input_from_muxC,
                                      reset          => reset,
                                      
                                      input_from_muxS => input_from_muxS,
                                      reset_input    => reset_input,
                                      result          => result );

  stimulus: process
  begin

    wait for 10ns;
    reset <= '0';
    reset_input <= "01010101";
    input_from_muxC <= "11111111";
    input_from_muxS <= '1';
    wait for 10ns;
    input_from_muxS <= '0';    
    wait for 10ns;
    reset <= '1';
    reset_input <= "01010101";
    input_from_muxC <= "11111111";
    input_from_muxS <= '1';
    wait for 10ns;
    input_from_muxS <= '0';  
  end process;


end;