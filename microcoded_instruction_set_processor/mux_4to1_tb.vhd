library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity mux_4to1_tb is
end;

architecture bench of mux_4to1_tb is

  component mux_4to1
    Port (
            S0,S1:in std_logic;
            A: in std_logic;
            B: in std_logic;
            G:out std_ulogic );
  end component;

  signal S0,S1: std_logic;
  signal A: std_logic;
  signal B: std_logic;
  signal G: std_ulogic ;

begin

  uut: mux_4to1 port map ( S0 => S0,
                           S1 => S1,
                           A  => A,
                           B  => B,
                           G  => G );

  stimulus: process
  begin
  
    S0 <= '0';
    S1 <= '0';
    A <= '0';
    B <= '0';

    wait for 10ns;
    S0 <= '1';
    S1 <= '0';
    A <= '0';
    B <= '0';
    wait for 10ns;
    S0 <= '0';
    S1 <= '1';
    A <= '0';
    B <= '0';
    wait for 10ns;
    S0 <= '1';
    S1 <= '1';
    A <= '0';
    B <= '0';
    wait for 10ns;
    S0 <= '0';
    S1 <= '0';
    A <= '1';
    B <= '0';
    wait for 10ns;
    S0 <= '1';
    S1 <= '0';
    A <= '1';
    B <= '0';
    wait for 10ns;
    S0 <= '0';
    S1 <= '1';
    A <= '1';
    B <= '0';
    wait for 10ns;
    S0 <= '1';
    S1 <= '1';
    A <= '1';
    B <= '0';
    wait for 10ns;
    S0 <= '0';
    S1 <= '0';
    A <= '0';
    B <= '1';
    wait for 10ns;
    S0 <= '1';
    S1 <= '0';
    A <= '0';
    B <= '1';
    wait for 10ns;
    S0 <= '0';
    S1 <= '1';
    A <= '0';
    B <= '1';
    wait for 10ns;
    S0 <= '1';
    S1 <= '1';
    A <= '0';
    B <= '1';
    wait for 10ns;
    S0 <= '0';
    S1 <= '0';
    A <= '1';
    B <= '1';
    wait for 10ns;
    S0 <= '1';
    S1 <= '0';
    A <= '1';
    B <= '1';
    wait for 10ns;
    S0 <= '0';
    S1 <= '1';
    A <= '1';
    B <= '1';
    wait for 10ns;
    S0 <= '1';
    S1 <= '1';
    A <= '1';
    B <= '1';
  end process;


end;