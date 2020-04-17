
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity functional_unit_tb is
end;

architecture bench of functional_unit_tb is

  component functional_unit
     Port (
           FS: in std_logic_vector(4 downto 0);
           A: in std_logic_vector(15 downto 0);
           B:in std_logic_vector(15 downto 0);
           output: out std_logic_vector(15 downto 0);
           v,c,n,z: out std_logic
      );
  end component;

  signal FS: std_logic_vector(4 downto 0);
  signal A: std_logic_vector(15 downto 0);
  signal B: std_logic_vector(15 downto 0);
  signal output: std_logic_vector(15 downto 0);
  signal v,c,n,z: std_logic ;

begin

  uut: functional_unit port map ( FS     => FS,
                                  A      => A,
                                  B      => B,
                                  output => output,
                                  v      => v,
                                  c      => c,
                                  n      => n,
                                  z      => z );

  stimulus: process
  begin
    wait for 30ns;
    A <= "0000000000000001";
    B <= "0000000000000010";
    wait for 30ns;
    FS <= "00000";
    wait for 30ns;
    FS <= "00001";
    wait for 30ns;
    FS <= "00010";
    wait for 30ns;
    FS <= "00011";
    wait for 30ns;
    FS <= "00100";
    wait for 30ns;
    FS <= "00101";
    wait for 30ns;
    FS <= "00110";
    wait for 30ns;
    FS <= "00111";
    
    wait for 30ns;
    FS <= "01000";
    wait for 30ns;
    FS <= "01010";
    wait for 30ns;
    FS <= "01100";
    wait for 30ns;
    FS <= "01110";
    
    wait for 30ns;
    FS <= "10000";
    wait for 30ns;
    FS <= "10100";
    wait for 30ns;
    FS <= "11000";
  end process;


end;