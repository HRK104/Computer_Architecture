----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2020 04:30:41 PM
-- Design Name: 
-- Module Name: mux_forRegister_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity mux_forRegister_tb is
end;

architecture bench of mux_forRegister_tb is

  component mux_forRegister
      Port (in0, in1, in2, in3,in4,in5,in6,in7,in8: in std_logic_vector (15 downto 0);
            s: in std_logic_vector(3 downto 0);
            z: out std_logic_vector (15 downto 0));
  end component;

  signal in0, in1, in2, in3,in4,in5,in6,in7,in8: std_logic_vector (15 downto 0);
  signal s: std_logic_vector(3 downto 0);
  signal z: std_logic_vector (15 downto 0);

begin

  uut: mux_forRegister port map ( in0 => in0,
                                  in1 => in1,
                                  in2 => in2,
                                  in3 => in3,
                                  in4 => in4,
                                  in5 => in5,
                                  in6 => in6,
                                  in7 => in7,
                                  in8 => in8,
                                  s   => s,
                                  z   => z );

  stimulus: process
  begin
      wait for 10ns;
      in0 <= "0000000000000001";
      in1 <= "0000000000000010";
      in2 <= "0000000000000100";
      in3 <= "0000000000001000";
      in4 <= "0000000000010000";
      in5 <= "0000000000100000";
      in6 <= "0000000001000000";
      in7 <= "0000000010000000";
      in8 <= "0000000100000000";
      wait for 10ns;
      s <= "0000";
      wait for 10ns;
      s <= "0001";
      wait for 10ns;
      s <= "0010";
      wait for 10ns;
      s <= "0011";
      wait for 10ns;
      s <= "0100";
      wait for 10ns;
      s <= "0101";
      wait for 10ns;
      s <= "0110";
      wait for 10ns;
      s <= "0111";
      wait for 10ns;
      s <= "1000";
  end process;


end;