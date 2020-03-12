
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_forRegister is
    Port (in0, in1, in2, in3,in4,in5,in6,in7: in std_logic_vector (15 downto 0);
          s: in std_logic_vector(2 downto 0);
          z: out std_logic_vector (15 downto 0));
end mux_forRegister;

architecture behavioural of mux_forRegister is
begin
  
    z <= in0 after 1 ns  when s="000"  else
         in1 after 1 ns  when s="001"  else
         in2 after 1 ns  when s="010"  else
         in3 after 1 ns  when s="011"  else
         in4 after 1 ns  when s="100"  else
         in5 after 1 ns  when s="101"  else
         in6 after 1 ns  when s="110"  else
         in7 after 1 ns  when s="111"   ;
end behavioural;