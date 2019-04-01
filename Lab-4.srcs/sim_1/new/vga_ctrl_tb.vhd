----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2019 07:35:45 PM
-- Design Name: 
-- Module Name: vga_ctrl_tb - Behavioral
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

entity vga_ctrl_tb is
end vga_ctrl_tb;

architecture Behavioral of vga_ctrl_tb is

component vga_ctrl is 
port ( clk,en : in std_logic;
       hcount, vcount : out std_logic_vector(9 downto 0);
       vid, hs, vs : out std_logic
       );
end component;


--So our model only works off the clock input this is just for clarity in the tb
signal en : std_logic := '1';

signal clk : std_logic;
signal hcount, vcount : std_logic_vector(9 downto 0);
signal vid, hs, vs : std_logic;

begin

vga_control : vga_ctrl port map(
    clk => clk,
    en => en,
    hcount => hcount,
    vcount => vcount,
    vid  => vid,
    hs => hs,
    vs => vs
    );
    
process 
begin
clk <= '1';
wait for 4ns;
clk <= '0';
wait for 4ns;
end process;
 


end Behavioral;
