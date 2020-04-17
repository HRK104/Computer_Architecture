------------------------------------------------------------------------------------
---- Company: 
---- Engineer: 
---- 
---- Create Date: 02/24/2020 07:17:20 PM
---- Design Name: 
---- Module Name: datapath - Behavioral
---- Project Name: 
---- Target Devices: 
---- Tool Versions: 
---- Description: 
---- 
---- Dependencies: 
---- 
---- Revision:
---- Revision 0.01 - File Created
---- Additional Comments:
---- 
------------------------------------------------------------------------------------


--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;

---- Uncomment the following library declaration if using
---- arithmetic functions with Signed or Unsigned values
----use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx leaf cells in this code.
----library UNISIM;
----use UNISIM.VComponents.all;

--entity datapath is
--  Port (
--        FS: in std_logic_vector(4 downto 0);
--        TD, TA, TB, MB, MM, MD,RW: in std_logic;
--        DR,SA,SB: in std_logic_vector(2 downto 0);
--        output_from_PC:  in std_logic_vector(15 downto 0);
  
        
--        --data_in, constant_in: in std_logic_vector(15 downto 0);
--        data_in: in std_logic_vector(15 downto 0);
--        --destinationSelect,Aselect,Bselect: in std_logic_vector(2 downto 0);
--        --Address_Out, Data_Out, muxD_output: out std_logic_vector(15 downto 0);
--        Address_Out, Data_Out: out std_logic_vector(15 downto 0);
--        v,c,n,z: out std_logic
        
--        --output_from_registerFile_A_ver2,output_from_muxD_ver2,output_from_functional_ver2: out std_logic_vector(15 downto 0)
--   );
--end datapath;

--architecture Behavioral of datapath is

--  component functional_unit
--    Port (
--         FS: in std_logic_vector(4 downto 0);
--         A: in std_logic_vector(15 downto 0);
--         B:in std_logic_vector(15 downto 0);
--         output: out std_logic_vector(15 downto 0);
--         v,c,n,z: out std_logic
--    );
--  end component;   
  
  
--  component register_file
--    Port ( 
--           destination_select: in std_logic_vector(3 downto 0);
--           data: in std_logic_vector(15 downto 0);
--           write: in std_logic;
--           selectA: in std_logic_vector(3 downto 0);
--           selectB: in std_logic_vector(3 downto 0);
--           A_data: out std_logic_vector(15 downto 0);
--           B_data: out std_logic_vector(15 downto 0));
--  end component;      


--  component mux_2to1 
--     Port (
--        S2: in std_logic;
--        from_arithmatic_circuit: in std_logic_vector(15 downto 0);
--        from_logical_circuit: in std_logic_vector(15 downto 0);
--        G_out: out std_logic_vector(15 downto 0)
--     );
--  end component;
  
  
--  component zero_fill
--    Port (
--      SB: in std_logic_vector(2 downto 0);
--      result: out std_logic_vector(15 downto 0)
--    );
--  end component;   

--  signal outpur_from_register_File_A, output_from_muxB, output_from_muxD, output_from_functional, output_from_register_file_B, output_from_zero_fill: std_logic_vector(15 downto 0);
--  signal DA,AA,BA: std_logic_vector(3 downto 0);
  
  
--begin
----  register_file_unit: register_file port map(
----     destination_select =>  destinationSelect,
----     data => output_from_muxD,
----     write => Load_enable,
----     selectA => Aselect,
----     selectB => Bselect,
----     A_data => output_from_muxA,
----     B_data => output_from_register_file_B
----  );
--  register_file_unit: register_file port map(
--     destination_select =>  DA,
--     data => output_from_muxD,
--     write => RW,
--     selectA => AA,
--     selectB => BA,
--     A_data => outpur_from_register_File_A,
--     B_data => output_from_register_file_B
--  );
  
--  functional: functional_unit port map(
--     FS => FS,
--     --A => constant_in,
--     A => outpur_from_register_File_A,
--     B => output_from_muxB,
--     output => output_from_functional,
--     v => v,
--     c => c,
--     n => n,
--     z => z
--  ); 
  
--  mux_B: mux_2to1 port map(
--     S2 => MB,
--     from_arithmatic_circuit => output_from_register_file_B, --from_arithmatic_circuit == 0
--     from_logical_circuit => output_from_zero_fill, --from_logical_circuit == 1
--     G_out => output_from_muxB
--  );
  
--  mux_D: mux_2to1 port map(
--     S2 => MD,
--     from_arithmatic_circuit =>data_in ,  --from_arithmatic_circuit == 0
--     from_logical_circuit => output_from_functional,  --from_arithmatic_circuit == 1
--     G_out => output_from_muxD
--  );
  
--  mux_M: mux_2to1 port map(
--     S2 => MM,
--     from_arithmatic_circuit =>outpur_from_register_File_A ,  --from_arithmatic_circuit == 0
--     from_logical_circuit => output_from_PC,  --from_arithmatic_circuit == 1
--     G_out => Address_Out
--  );
  
--  zero_fill_register: zero_fill port map(
--    SB => SB,
--    result=> output_from_zero_fill
--  );
  
  
--  DA(0) <= DR(0);
--  DA(1) <= DR(1);
--  DA(2) <= DR(2);
--  DA(3) <= TD;
  
--  AA(0) <= SA(0);
--  AA(1) <= SA(1);
--  AA(2) <= SA(2);
--  AA(3) <= TA;
  
--  BA(0) <= SB(0);
--  BA(1) <= SB(1);
--  BA(2) <= SB(2);
--  BA(3) <= TB;
  
--  --Address_Out <= outpur_from_register_File_A after 1ns;
--  Data_Out <= output_from_muxB after 1ns;
----  output_from_registerFile_A_ver2 <= outpur_from_register_File_A;
----  output_from_muxD_ver2 <= output_from_muxD;
----  output_from_functional_ver2 <= output_from_functional;

--  --muxD_output <= output_from_muxD;
--end Behavioral;


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
        TD, TA, TB, MB, MM, MD,RW: in std_logic;
        DR,SA,SB: in std_logic_vector(2 downto 0);
        output_from_PC:  in std_logic_vector(15 downto 0);
  
        
        --data_in, constant_in: in std_logic_vector(15 downto 0);
        data_in: in std_logic_vector(15 downto 0);
        --destinationSelect,Aselect,Bselect: in std_logic_vector(2 downto 0);
        --Address_Out, Data_Out, muxD_output: out std_logic_vector(15 downto 0);
        Address_Out, Data_Out: out std_logic_vector(15 downto 0);
        v,c,n,z: out std_logic
        
        --output_from_registerFile_A_ver2,output_from_muxD_ver2,output_from_functional_ver2: out std_logic_vector(15 downto 0)
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
           destination_select: in std_logic_vector(3 downto 0);
           data: in std_logic_vector(15 downto 0);
           write: in std_logic;
           selectA: in std_logic_vector(3 downto 0);
           selectB: in std_logic_vector(3 downto 0);
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
  
  
  component zero_fill
    Port (
      SB: in std_logic_vector(2 downto 0);
      result: out std_logic_vector(15 downto 0)
    );
  end component;   

  signal outpur_from_register_File_A, output_from_muxB, output_from_muxD, output_from_functional, output_from_register_file_B, output_from_zero_fill: std_logic_vector(15 downto 0);
  signal DA,AA,BA: std_logic_vector(3 downto 0);
  
  
begin
--  register_file_unit: register_file port map(
--     destination_select =>  destinationSelect,
--     data => output_from_muxD,
--     write => Load_enable,
--     selectA => Aselect,
--     selectB => Bselect,
--     A_data => output_from_muxA,
--     B_data => output_from_register_file_B
--  );
  register_file_unit: register_file port map(
     destination_select =>  DA,
     data => output_from_muxD,
     write => RW,
     selectA => AA,
     selectB => BA,
     A_data => outpur_from_register_File_A,
     B_data => output_from_register_file_B
  );
  
  functional: functional_unit port map(
     FS => FS,
     --A => constant_in,
     A => outpur_from_register_File_A,
     B => output_from_muxB,
     output => output_from_functional,
     v => v,
     c => c,
     n => n,
     z => z
  ); 
  
  mux_B: mux_2to1 port map(
     S2 => MB,
     from_arithmatic_circuit => output_from_register_file_B, --from_arithmatic_circuit == 0
     from_logical_circuit => output_from_zero_fill, --from_logical_circuit == 1
     G_out => output_from_muxB
  );
  
  mux_D: mux_2to1 port map(
     S2 => MD,
     from_arithmatic_circuit =>data_in ,  --from_arithmatic_circuit == 0
     from_logical_circuit => output_from_functional,  --from_arithmatic_circuit == 1
     G_out => output_from_muxD
  );
  
  mux_M: mux_2to1 port map(
     S2 => MM,
     from_arithmatic_circuit =>outpur_from_register_File_A ,  --from_arithmatic_circuit == 0
     from_logical_circuit => output_from_PC,  --from_arithmatic_circuit == 1
     G_out => Address_Out
  );
  
  zero_fill_register: zero_fill port map(
    SB => SB,
    result=> output_from_zero_fill
  );
  
  
  DA(0) <= DR(0);
  DA(1) <= DR(1);
  DA(2) <= DR(2);
  DA(3) <= TD;
  
  AA(0) <= SA(0);
  AA(1) <= SA(1);
  AA(2) <= SA(2);
  AA(3) <= TA;
  
  BA(0) <= SB(0);
  BA(1) <= SB(1);
  BA(2) <= SB(2);
  BA(3) <= TB;
  
  --Address_Out <= outpur_from_register_File_A after 1ns;
  Data_Out <= output_from_muxB after 1ns;
--  output_from_registerFile_A_ver2 <= outpur_from_register_File_A;
--  output_from_muxD_ver2 <= output_from_muxD;
--  output_from_functional_ver2 <= output_from_functional;

  --muxD_output <= output_from_muxD;
end Behavioral;


