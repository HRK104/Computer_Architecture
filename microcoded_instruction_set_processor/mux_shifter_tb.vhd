library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity mux_shifter_tb is
end;

architecture bench of mux_shifter_tb is

  component mux_shifter
    Port (
          in0, in1,in2: in std_logic;
          S: in std_logic_vector(1 downto 0);
          H: out std_logic
     );
  end component;

  signal in0, in1,in2: std_logic;
  signal S: std_logic_vector(1 downto 0);
  signal H: std_logic ;

begin

  uut: mux_shifter port map ( in0 => in0,
                              in1 => in1,
                              in2 => in2,
                              S   => S,
                              H   => H );

  stimulus: process
  begin
  
   wait for 10ns;
   in0 <= '0';
   in1 <= '1';
   in2 <= '0';

    wait for 10ns;
    S <= "00";
    wait for 10ns;
    S <= "01";
    wait for 10ns;
    S <= "10";
    
    wait for 10ns;
   in0 <= '0';
   in1 <= '1';
   in2 <= '1';

    wait for 10ns;
    S <= "00";
    wait for 10ns;
    S <= "01";
    wait for 10ns;
    S <= "10";
    
  end process;


end;