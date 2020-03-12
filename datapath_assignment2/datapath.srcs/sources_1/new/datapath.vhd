----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2020 07:17:20 PM
-- Design Name: 
-- Module Name: datapath - Behavioral
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

entity datapath is
  Port (
        FS: in std_logic_vector(4 downto 0);
  
  
  
        Load_enable,MDselect,MBselect: in std_logic;
        data_in, constant_in: in std_logic_vector(15 downto 0);
        destinationSelect,Aselect,Bselect: in std_logic_vector(2 downto 0);
        Address_Out, Data_Out: out std_logic_vector(15 downto 0);
        v,c,n,z: out std_logic
   );
end datapath;

architecture Behavioral of datapath is

  component functional_unit
    Port (
         FS: in std_logic_vector(4 downto 0);
         A: in std_logic_vector(15 downto 0);
         B:in std_logic_vector(15 downto 0);
         output: out std_logic_vector(15 downto 0);
         v,c,n,z: out std_logic
    );
  end component;   
  
  
  component register_file
    Port ( 
           destination_select: in std_logic_vector(2 downto 0);
           data: in std_logic_vector(15 downto 0);
           write: in std_logic;
           selectA: in std_logic_vector(2 downto 0);
           selectB: in std_logic_vector(2 downto 0);
           A_data: out std_logic_vector(15 downto 0);
           B_data: out std_logic_vector(15 downto 0));
  end component;      


  component mux_2to1 
     Port (
        S2: in std_logic;
        from_arithmatic_circuit: in std_logic_vector(15 downto 0);
        from_logical_circuit: in std_logic_vector(15 downto 0);
        G_out: out std_logic_vector(15 downto 0)
     );
  end component;

  signal output_from_muxA, output_from_muxB, output_from_muxD, output_from_functional, output_from_register_file_B: std_logic_vector(15 downto 0);
  
  
begin
  register_file_unit: register_file port map(
     destination_select =>  destinationSelect,
     data => output_from_muxD,
     write => Load_enable,
     selectA => Aselect,
     selectB => Bselect,
     A_data => output_from_muxA,
     B_data => output_from_register_file_B
  );
  
  functional: functional_unit port map(
     FS => FS,
     A => constant_in,
     B => output_from_muxB,
     output => output_from_functional,
     v => v,
     c => c,
     n => n,
     z => z
  ); 
  
  mux_B: mux_2to1 port map(
     S2 => MBselect,
     from_arithmatic_circuit => output_from_register_file_B,
     from_logical_circuit => constant_in,
     G_out => output_from_muxB
  );
  
  mux_D: mux_2to1 port map(
     S2 => MDselect,
     from_arithmatic_circuit =>data_in ,
     from_logical_circuit => output_from_functional,
     G_out => output_from_muxD
  );
  Address_Out <= output_from_muxA after 1ns;
  Data_Out <= output_from_muxB after 1ns;

end Behavioral;
