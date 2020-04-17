library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity zero_fill_tb is
end;

architecture bench of zero_fill_tb is

  component zero_fill
   Port ( 
      SB: in std_logic_vector(2 downto 0);
      result: out std_logic_vector(15 downto 0)
   );
  end component;

  signal SB: std_logic_vector(2 downto 0);
  signal result: std_logic_vector(15 downto 0) ;

begin

  uut: zero_fill port map ( SB     => SB,
                            result => result );

  stimulus: process
  begin
  
    wait for 10ns;
    SB <= "000";
    wait for 10ns;
    SB <= "001";
    wait for 10ns;
    SB <= "010";
    wait for 10ns;
    SB <= "011";
    wait for 10ns;
    SB <= "100";
    wait for 10ns;
    SB <= "101";
    wait for 10ns;
    SB <= "110";
    wait for 10ns;
    SB <= "111";
    
    wait for 10ns;

    wait;
  end process;


end;