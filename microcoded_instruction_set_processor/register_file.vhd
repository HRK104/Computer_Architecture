----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/10/2020 08:04:01 PM
-- Design Name: 
-- Module Name: register_file - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity register_file is
    Port ( 
           destination_select: in std_logic_vector(3 downto 0);
           data: in std_logic_vector(15 downto 0);
           write: in std_logic;
           selectA: in std_logic_vector(3 downto 0);
           selectB: in std_logic_vector(3 downto 0);
           A_data: out std_logic_vector(15 downto 0);
           B_data: out std_logic_vector(15 downto 0));
end register_file;


architecture Behavioral of register_file is

-- 16 bit Register for register file
COMPONENT reg
     PORT (D: in std_logic_vector(15 downto 0);
         write, fromDecoder : in std_logic;
         Q : out std_logic_vector(15 downto 0));
END COMPONENT;



-- 3 to 8 Decoder
COMPONENT decoder4to9
    PORT(
          A0 : IN std_logic;
          A1 : IN std_logic;
          A2 : IN std_logic;
          A3 : IN std_logic;
          Q0 : OUT std_logic;
          Q1 : OUT std_logic;
          Q2 : OUT std_logic;
          Q3 : OUT std_logic;
          Q4 : OUT std_logic;
          Q5 : OUT std_logic;
          Q6 : OUT std_logic;
          Q7 : OUT std_logic;
          Q8 : OUT std_logic);
END COMPONENT;



--  multiplexer
COMPONENT mux_forRegister
    Port (in0, in1, in2, in3,in4,in5,in6,in7, in8: in std_logic_vector (15 downto 0);
          s: in std_logic_vector(3 downto 0);
          z: out std_logic_vector (15 downto 0));
END COMPONENT;


-- signals
signal from_decoder0, from_decoder1, from_decoder2, from_decoder3,from_decoder4, from_decoder5, from_decoder6, from_decoder7,from_decoder8 : std_logic;
signal reg0_q, reg1_q, reg2_q, reg3_q,reg4_q, reg5_q, reg6_q, reg7_q, reg8_q, data_src_mux_out, src_reg : std_logic_vector(15 downto 0);



begin

  -- port maps ;-)
  -- register 0
  reg00: reg PORT MAP(
        D => data,
        write => write,
        fromDecoder => from_decoder0,
        Q => reg0_q
  );
  -- register 1
  reg01: reg PORT MAP(
        D => data,
        write => write,
        fromDecoder => from_decoder1,
        Q => reg1_q
  );

  -- register 2
  reg02: reg PORT MAP(
        D => data,
        write => write,
       fromDecoder => from_decoder2,
        Q => reg2_q
  );
  -- register 3
  reg03: reg PORT MAP(
        D => data,
        write => write,
       fromDecoder => from_decoder3,
        Q => reg3_q
  );
  -- register 4
  reg04: reg PORT MAP(
        D => data,
        write => write,
        fromDecoder => from_decoder4,
        Q => reg4_q
  );
  -- register 5
  reg05: reg PORT MAP(
        D => data,
        write => write,
        fromDecoder => from_decoder5,
        Q => reg5_q
  );
  -- register 6
  reg06: reg PORT MAP(
        D => data,
        write => write,
        fromDecoder => from_decoder6,
        Q => reg6_q
  );

  -- register 7
  reg07: reg PORT MAP(
        D => data,
        write => write,
        fromDecoder => from_decoder7,
        Q => reg7_q
  );
  
  -- register 8
  reg08: reg PORT MAP(
        D => data,
        write => write,
        fromDecoder => from_decoder8,
        Q => reg8_q
  );

  -- Destination register decoder
  des_decoder_4to9: decoder4to9 PORT MAP(
        A0 => destination_select(0),
        A1 => destination_select(1),
        A2 =>destination_select(2),
        A3 =>destination_select(3),
        Q0 => from_decoder0,
        Q1 => from_decoder1,
        Q2 => from_decoder2,
        Q3 => from_decoder3,
        Q4 => from_decoder4,
        Q5 => from_decoder5,
        Q6 => from_decoder6,
        Q7 => from_decoder7,
        Q8 => from_decoder8
  );



  -- 8 to 1 Data source multiplexer
  mux_A: mux_forRegister PORT MAP(
      In0 => reg0_q,
      In1 => reg1_q,
      In2 => reg2_q,
      In3 => reg3_q,
      In4 => reg4_q,
      In5 => reg5_q,
      In6 => reg6_q,
      In7 => reg7_q,
      In8 => reg8_q,
      S => selectA,
      Z => A_data
  );
  -- 8 to 1 source register multiplexer
  mux_B: mux_forRegister PORT MAP(
      In0 => reg0_q,
      In1 => reg1_q,
      In2 => reg2_q,
      In3 => reg3_q,
      In4 => reg4_q,
      In5 => reg5_q,
      In6 => reg6_q,
      In7 => reg7_q,
      In8 => reg8_q,
      S => selectB,
      Z => B_data
  );
  
end Behavioral;





