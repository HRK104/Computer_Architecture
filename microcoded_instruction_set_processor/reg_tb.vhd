
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity reg_tb is
end;

architecture bench of reg_tb is

  component reg
     port (D: in std_logic_vector(15 downto 0);
           write, fromDecoder : in std_logic;
           Q : out std_logic_vector(15 downto 0));
  end component;

  signal D: std_logic_vector(15 downto 0);
  signal write, fromDecoder: std_logic;
  signal Q: std_logic_vector(15 downto 0);

begin

  uut: reg port map ( D           => D,
                      write       => write,
                      fromDecoder => fromDecoder,
                      Q           => Q );

  stimulus: process
  begin

    wait for 10ns;
    D <= "0101010101010101";
    write <= '0';
    fromDecoder <= '0';
     wait for 10ns;
    write <= '0';
    fromDecoder <= '1';
     wait for 10ns;
    write <= '1';
    fromDecoder <= '0';
     wait for 10ns;
    write <= '1';
    fromDecoder <= '1';
  end process;


end;