library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity instruction_reg_tb is
end;

architecture bench of instruction_reg_tb is

  component instruction_reg
     port (input: in std_logic_vector(15 downto 0);
           IL : in std_logic;
           opcode: out std_logic_vector(7 downto 0);
           DR,SA,SB : out std_logic_vector(2 downto 0));
  end component;

  signal input: std_logic_vector(15 downto 0);
  signal IL: std_logic;
  signal opcode: std_logic_vector(7 downto 0);
  signal DR,SA,SB: std_logic_vector(2 downto 0);

begin

  uut: instruction_reg port map ( input  => input,
                                  IL     => IL,
                                  opcode => opcode,
                                  DR     => DR,
                                  SA     => SA,
                                  SB     => SB );

  stimulus: process
  begin
   wait for 10ns;
   input <= "0101010101010101";
   IL <= '1';
   wait for 10ns;
   IL <= '0';
  end process;


end;