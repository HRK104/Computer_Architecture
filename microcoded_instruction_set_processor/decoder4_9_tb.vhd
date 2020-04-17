library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity decoder4to9_tb is
end;

architecture bench of decoder4to9_tb is

  component decoder4to9
  Port ( A0,A1,A2,A3 : in std_logic;
         Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8: out std_logic);
  end component;

  signal A0,A1,A2,A3: std_logic;
  signal Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8: std_logic;

begin

  uut: decoder4to9 port map ( A0 => A0,
                              A1 => A1,
                              A2 => A2,
                              A3 => A3,
                              Q0 => Q0,
                              Q1 => Q1,
                              Q2 => Q2,
                              Q3 => Q3,
                              Q4 => Q4,
                              Q5 => Q5,
                              Q6 => Q6,
                              Q7 => Q7,
                              Q8 => Q8 );

  stimulus: process
  begin
  
    wait for 10ns;		
      A0 <= '0';
     A1 <= '0';
     A2 <= '0';
     A3 <= '0';
    wait for 10ns;
     A0 <= '1';
     A1 <= '0';
     A2 <= '0';
     A3 <= '0';
     wait for 10ns;
     A0 <= '0';
     A1 <= '1';
     A2 <= '0';
     A3 <= '0';
     wait for 10ns;
     A0 <= '1';
     A1 <= '1';
     A2 <= '0';
     A3 <= '0';
     wait for 10ns;
     A0 <= '0';
     A1 <= '0';
     A2 <= '1';
     A3 <= '0';
     wait for 10ns;
     A0 <= '1';
     A1 <= '0';
     A2 <= '1';
     A3 <= '0';
     wait for 10ns;
     A0 <= '0';
     A1 <= '1';
     A2 <= '1';
     A3 <= '0';
     wait for 10ns;
     A0 <= '1';
     A1 <= '1';
     A2 <= '1';
     A3 <= '0';
     wait for 10ns;
     A0 <= '0';
     A1 <= '0';
     A2 <= '0';
     A3 <= '1';
     
 --     wait;

  end process;


end;