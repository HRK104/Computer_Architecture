----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2020 12:25:49 PM
-- Design Name: 
-- Module Name: mux_4to1 - Behavioral
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

entity mux_4to1 is
  Port (--S0, S1, c_in:in std_logic;
          S0,S1:in std_logic;
          A: in std_logic;
          B: in std_logic;
          G:out std_ulogic );
--  Port ( );
end mux_4to1;

architecture Behavioral of mux_4to1 is
 constant gate_delay: Time := 1 ns;
begin
  G <= (A and B) after gate_delay when S0 = '0' and S1 = '0' else
       (A or B) after gate_delay when S0 = '0' and S1 = '1' else
       (A xor B) after gate_delay when S0 = '1' and S1 = '0' else
       (not A) after gate_delay when S0 = '1' and S1 = '1' else
       '0' after gate_delay;

end Behavioral;
