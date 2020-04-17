----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2020 09:40:45 AM
-- Design Name: 
-- Module Name: mux_2to1 - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_2to1 is
  Port (
        S2: in std_logic;
        from_arithmatic_circuit: in std_logic_vector(15 downto 0);
        from_logical_circuit: in std_logic_vector(15 downto 0);
        G_out: out std_logic_vector(15 downto 0)
   );
end mux_2to1;

architecture Behavioral of mux_2to1 is
 constant gate_delay: Time := 1 ns;
begin
  G_out <= from_arithmatic_circuit after gate_delay when S2 = '0' else
           from_logical_circuit  after gate_delay  when S2 = '1' else
           "0000000000000000" after gate_delay;

end Behavioral;
