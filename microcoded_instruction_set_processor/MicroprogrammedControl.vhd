----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/04/15 15:52:06
-- Design Name: 
-- Module Name: mux8to1 - Behavioral
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

entity MicroprogrammedControl is
Port (
        reset_for_PC, reset_for_CAR,Clock,C,V,Z,N: in std_logic;
        reset_input_for_CAR: in std_logic_vector(7 downto 0);
        reset_input_for_PC: in std_logic_vector(15 downto 0);
        from_memory_M: in std_logic_vector(15 downto 0);
        output_from_PC: out std_logic_vector(15 downto 0);
        --NA: out std_logic_vector(7 downto 0);
        FS: out std_logic_vector(4 downto 0);
        DR,SA,SB: out std_logic_vector(2 downto 0)
   );
end MicroprogrammedControl;


architecture Behavioral of MicroprogrammedControl is

-- mux8to1
COMPONENT mux8to1    
     Port (
        MS: in std_logic_vector(2 downto 0);
        C,V,Z,N: in std_logic;
        result: out std_logic);    
END COMPONENT;

component mux2to1_forMicroprogrammedControl is
      Port (
       MC: in std_logic;
       input_0, input_1: in std_logic_vector(7 downto 0);
       result: out std_logic_vector(7 downto 0)
     );
end component;    

component program_counter is
   Port(
     DR_input, SB_input : in std_logic_vector( 2 downto 0);
	 pl			: in std_logic ;
	 pi 		: in std_logic ;
	 clock,reset		: in std_logic;
	 reset_input: in std_logic_vector(15 downto 0);
	 result : out std_logic_vector(15 downto 0)
   );
end component;   


component instruction_reg is
   port (input: in std_logic_vector(15 downto 0);
         IL : in std_logic;
         opcode: out std_logic_vector(7 downto 0);
         DR,SA,SB : out std_logic_vector(2 downto 0));
end component;


component control_address_reg is
  Port ( 
    input_from_muxC,reset_input: in std_logic_vector( 7 downto 0);
    input_from_muxS,reset: in std_logic;
    result: out std_logic_vector( 7 downto 0)
  );
end component;

-- control_memory
COMPONENT control_memory    
Port( 
  MW : out std_logic; 
  MM : out std_logic; 
  RW : out std_logic; 
  MD : out std_logic; 
  FS : out std_logic_vector(4 downto 0); 
  MB : out std_logic; 
  TB : out std_logic; 
  TA : out std_logic; 
  TD : out std_logic;
  PL : out std_logic; 
  PI : out std_logic; 
  IL : out std_logic; 
  MC : out std_logic; 
  MS : out std_logic_vector(2 downto 0); 
  NA : out std_logic_vector(7 downto 0); 
  IN_CAR : in std_logic_vector(7 downto 0));   
END COMPONENT;

signal from_mux_S: std_logic;
signal MS, DR_result, SA_result, SB_result: std_logic_vector(2 downto 0); 
--signal FS: std_logic_vector(4 downto 0);
signal MW,MM,RW,MD,MB,TB,TA,TD,PL,PI,IL,MC: std_logic;
signal NAsignal,from_CAR, input_1_for_muxC, from_muxC:  std_logic_vector(7 downto 0);

begin

  muxS: mux8to1 PORT MAP(
        MS => MS,
        C => C,
        V => V,
        Z => Z,
        N => N,
        result => from_mux_S
  );
  
  muxC: mux2to1_forMicroprogrammedControl PORT MAP(
       MC => MC,
       input_0 => NAsignal,
       input_1 => input_1_for_muxC,
       result => from_muxC
  );
  
  CAR: control_address_reg PORT MAP(
      input_from_muxC => from_muxC,
      input_from_muxS => from_mux_S,
      reset => reset_for_CAR,
      reset_input => reset_input_for_CAR,
      result => from_CAR
  );
  
  PC: program_counter PORT MAP(
     DR_input => DR_result,
     SB_input => SB_result,
     reset => reset_for_PC,
     reset_input => reset_input_for_PC,
     PI => PI,
     PL => PL,
     Clock => Clock,
     result => output_from_PC
  );
  
  instruction_register: instruction_reg PORT MAP(
      input => from_memory_M,
      IL => IL,
      opcode => input_1_for_muxC,
      DR => DR_result,
      SA => SA_result,
      SB => SB_result
  );
  
  c_memory: control_memory PORT MAP(
       MW => MW, 
       MM => MM,
       RW => RW,
       MD => MD,
       FS => FS,
       MB => MB,
       TB => TB, 
       TA => TA,
       TD => TA,
       PL => PL,
       PI => PI,
       IL => IL,
       MC => MC,
       MS => MS,
       NA => NAsignal,
       IN_CAR => from_CAR
       
  );
  
  DR <= DR_result;
  SA <= SA_result;
  SB <= SB_result;
  
  --NA <= NAsignal;
end Behavioral;
