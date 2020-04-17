library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity mux8to1_tb is
end;

architecture bench of mux8to1_tb is

  component mux8to1
  Port (
          MS: in std_logic_vector(2 downto 0);
          C,V,Z,N: in std_logic;
          result: out std_logic
     );
  end component;

  signal MS: std_logic_vector(2 downto 0);
  signal C,V,Z,N: std_logic;
  signal result: std_logic ;

begin

  uut: mux8to1 port map ( MS     => MS,
                          C      => C,
                          V      => V,
                          Z      => Z,
                          N      => N,
                          result => result );

  stimulus: process
  begin
  
    wait for 10ns;
    C <= '1';
    V <= '1';
    Z <= '1';
    N <= '1';
   
    
    wait for 10ns; 
    MS <= "000";
    wait for 10ns; 
    MS <= "001";
    wait for 10ns; 
    MS <= "010";
    wait for 10ns; 
    MS <= "011";
    wait for 10ns; 
    MS <= "100";
    wait for 10ns; 
    MS <= "101";
    wait for 10ns; 
    MS <= "110";
    wait for 10ns; 
    MS <= "111";

  end process;


end;