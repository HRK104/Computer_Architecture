library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity mux_2to1_tb is
end;

architecture bench of mux_2to1_tb is

  component mux_2to1
    Port (
          S2: in std_logic;
          from_arithmatic_circuit: in std_logic_vector(15 downto 0);
          from_logical_circuit: in std_logic_vector(15 downto 0);
          G_out: out std_logic_vector(15 downto 0)
     );
  end component;

  signal S2: std_logic;
  signal from_arithmatic_circuit: std_logic_vector(15 downto 0);
  signal from_logical_circuit: std_logic_vector(15 downto 0);
  signal G_out: std_logic_vector(15 downto 0) ;

begin

  uut: mux_2to1 port map ( S2                      => S2,
                           from_arithmatic_circuit => from_arithmatic_circuit,
                           from_logical_circuit    => from_logical_circuit,
                           G_out                   => G_out );

  stimulus: process
  begin
    wait for 10ns;
    from_arithmatic_circuit <= "0000000000000001";
    from_logical_circuit <= "0000000000000010";
    S2 <= '0';
    wait for 10ns;
    S2 <= '1';
  end process;


end;