library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port (in1, in2, c_in:in std_logic;
          sum, c_out:out std_logic );
end full_adder;

architecture dataflow of full_adder is
   signal s1,s2,s3: std_logic;
   constant gate_delay: Time := 1 ns;
   
   begin
    s1 <= (in1 xor in2) after gate_delay;
    s2 <= (c_in and s1) after gate_delay;
    s3 <= (in1 and in2) after gate_delay;
    sum <= (s1 xor c_in) after gate_delay;
    c_out <= (s2 or s3) after gate_delay;
  end dataflow;