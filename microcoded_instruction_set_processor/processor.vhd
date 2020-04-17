----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/04/16 14:08:03
-- Design Name: 
-- Module Name: processor - Behavioral
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

entity processor is
  Port ( 
    --reset_for_PC, reset_for_CAR,Clock: in std_logic;
    reset_for_PC, reset_for_CAR,Clock: in std_logic;
    reset_input_for_CAR: in std_logic_vector(7 downto 0);
    reset_input_for_PC: in std_logic_vector(15 downto 0)
    --FS: in std_logic_vector(4 downto 0);
    --output_from_muxD, output_from_memory_M: out std_logic_vector(15 downto 0)
  );
end processor;

architecture Behavioral of processor is

  component datapath is 
    port(
        FS: in std_logic_vector(4 downto 0);
        TD, TA, TB, MB, MM, MD,RW: in std_logic;
        DR,SA,SB: in std_logic_vector(2 downto 0);
        output_from_PC:  in std_logic_vector(15 downto 0);
  
        
        --data_in, constant_in: in std_logic_vector(15 downto 0);
        data_in: in std_logic_vector(15 downto 0);
        --destinationSelect,Aselect,Bselect: in std_logic_vector(2 downto 0);
        --Address_Out, Data_Out,muxD_output: out std_logic_vector(15 downto 0);
        Address_Out, Data_Out: out std_logic_vector(15 downto 0);
        v,c,n,z: out std_logic
        
        --output_from_registerFile_A_ver2,output_from_muxD_ver2,output_from_functional_ver2: out std_logic_vector(15 downto 0)
   );
  end component; 
  
  component memory is
    Port ( address : in STD_LOGIC_VECTOR (15 downto 0);
           write_data : in  STD_LOGIC_VECTOR (15 downto 0);
           MemWrite : in  STD_LOGIC;
           read_data : out  STD_LOGIC_VECTOR (15 downto 0));
  end component;
  
--  component MicroprogrammedControl is
--   Port (
--        Clock,C,V,Z,N: in std_logic;
--        from_memory_M: in std_logic_vector(15 downto 0);
--        output_from_PC: out std_logic_vector(15 downto 0);
--        DR,SA,SB: out std_logic_vector(2 downto 0)
--   );
--end component;


component MicroprogrammedControl is
Port (
        reset_for_PC, reset_for_CAR,Clock,C,V,Z,N: in std_logic;
        reset_input_for_CAR: in std_logic_vector(7 downto 0);
        reset_input_for_PC,from_memory_M: in std_logic_vector(15 downto 0);
        output_from_PC: out std_logic_vector(15 downto 0);
        --NA: out std_logic_vector(7 downto 0);
        FS: out std_logic_vector(4 downto 0);
        DR,SA,SB: out std_logic_vector(2 downto 0)
   );
end component;
  
  

  signal TD, TA, TB, MB, MM, MD,RW,MW, C_from_datapath,V_from_datapath,Z_from_datapath,N_from_datapath:  std_logic;
  signal FS: std_logic_vector( 4 downto 0);
  signal DR_output,SA_output,SB_output:  std_logic_vector(2 downto 0);
  signal output_PC, output_from_memory,address_input_for_memory,data_input_for_memory, muxD_output_signal: std_logic_vector( 15 downto 0);
begin
  datapath_set: datapath port map(
    FS => FS,
    TD => TD,
    TA => TA,
    TB => TB,
    MB => MB,
    MM => MM,
    MD => MD,
    RW => RW,
    DR => DR_output,
    SA => SA_output,
    SB => SB_output,
    output_from_PC => output_PC,
    data_in => output_from_memory,
    Address_Out => address_input_for_memory,
    Data_Out => data_input_for_memory,
    --muxD_output => muxD_output_signal,
    C => C_from_datapath,
    V => V_from_datapath,
    N => N_from_datapath,
    Z => Z_from_datapath
  );
  
  memory_M: memory port map(
    address => address_input_for_memory,
    write_data => data_input_for_memory,
    MemWrite => MW,
    read_data => output_from_memory
  );
  
  Microprogrammed_control: MicroprogrammedControl port map(
   Clock => Clock,
   C => C_from_datapath,
   V => V_from_datapath,
   Z => Z_from_datapath,
   N => N_from_datapath,
   reset_for_PC => reset_for_PC,
   reset_input_for_PC => reset_input_for_PC,
   reset_for_CAR => reset_for_CAR,
   reset_input_for_CAR => reset_input_for_CAR,
   from_memory_M => output_from_memory,
   output_from_PC => output_PC,
   FS => FS,
   DR => DR_output,
   SA => SA_output,
   SB => SB_output
  );
  
  --output_from_muxD <= muxD_output_signal;
  --output_from_memory_M <= output_from_memory;
end Behavioral;
