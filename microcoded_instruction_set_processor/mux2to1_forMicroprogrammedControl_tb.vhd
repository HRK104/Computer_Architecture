library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity mux2to1_forMicroprogrammedControl_tb is
end;

architecture bench of mux2to1_forMicroprogrammedControl_tb is

  component mux2to1_forMicroprogrammedControl
   Port (
     MC: in std_logic;
     input_0, input_1: in std_logic_vector(7 downto 0);
     result: out std_logic_vector(7 downto 0)
    );
  end component;

  signal MC: std_logic;
  signal input_0, input_1: std_logic_vector(7 downto 0);
  signal result: std_logic_vector(7 downto 0) ;

begin

  uut: mux2to1_forMicroprogrammedControl port map ( MC      => MC,
                                                    input_0 => input_0,
                                                    input_1 => input_1,
                                                    result  => result );

  stimulus: process
  begin
  
    
    wait for 10ns;
    input_0 <= "00000000";
    input_1 <= "11111111";
    wait for 10ns;
    MC <= '0';
     wait for 10ns;
    MC <= '1';
  end process;


end;