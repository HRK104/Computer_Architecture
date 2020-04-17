----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2020 03:12:21 PM
-- Design Name: 
-- Module Name: mux_shifter - Behavioral
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

entity mux_shifter is
  Port (
        in0, in1,in2: in std_logic;
        S: in std_logic_vector(1 downto 0);
        H: out std_logic
   );
end mux_shifter;

architecture Behavioral of mux_shifter is
 constant gate_delay: Time := 1 ns;
begin
  H <= in0 after gate_delay when S ="00" else
       in1 after gate_delay when S ="01" else
       in2 after gate_delay when S ="10" else
       '0';

end Behavioral;
