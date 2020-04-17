library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Logical_Circuit_tb is
end;

architecture bench of Logical_Circuit_tb is

  component Logical_Circuit
    Port ( 
      S0: in std_logic;
      S1: in std_logic;
      A: in std_logic_vector(15 downto 0);
      B: in std_logic_vector(15 downto 0);
      output_B: out std_logic_vector(15 downto 0)
    );
  end component;

  signal S0: std_logic;
  signal S1: std_logic;
  signal A: std_logic_vector(15 downto 0);
  signal B: std_logic_vector(15 downto 0);
  signal output_B: std_logic_vector(15 downto 0) ;

begin

  uut: Logical_Circuit port map ( S0       => S0,
                                  S1       => S1,
                                  A        => A,
                                  B        => B,
                                  output_B => output_B );

  stimulus: process
  begin
    wait for 20ns;
    A <= "0000000000000000";
    B <= "0000000000000001";
    wait for 20ns;
    S0 <= '0';
    S1 <= '0';
    wait for 20ns;
    S0 <= '1';
    S1 <= '0';
    wait for 20ns;
    S0 <= '0';
    S1 <= '1';
    wait for 20ns;
    S0 <= '1';
    S1 <= '1';
    
    wait for 20ns;
    --A <= "0101010101010101";
    --B <= "1010101010101010";
    wait for 20ns;
    S0 <= '0';
    S1 <= '0';
    wait for 20ns;
    S0 <= '1';
    S1 <= '0';
    wait for 20ns;
    S0 <= '0';
    S1 <= '1';
    wait for 20ns;
    S0 <= '1';
    S1 <= '1';
    
    wait for 20ns;
    --A <= "1101010110001011";
    --B <= "0011010101100101";
    wait for 20ns;
    S0 <= '0';
    S1 <= '0';
    wait for 20ns;
    S0 <= '1';
    S1 <= '0';
    wait for 20ns;
    S0 <= '0';
    S1 <= '1';
    wait for 20ns;
    S0 <= '1';
    S1 <= '1';
  end process;


end;