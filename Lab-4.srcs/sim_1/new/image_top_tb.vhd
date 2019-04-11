----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2019 12:18:58 PM
-- Design Name: 
-- Module Name: image_top_tb - Behavioral
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

entity image_top_tb is
end image_top_tb;

architecture Behavioral of image_top_tb is

component image_top is 
port( signal clk : in std_logic;
      signal vga_r , vga_b : out std_logic_vector(4 downto 0);
      signal vga_g : out std_logic_vector(5 downto 0);
      signal vga_hs, vga_vs : out std_logic
    );
end component;

signal clk : std_logic;
signal vga_r, vga_b : std_logic_vector(4 downto 0);
signal vga_g : std_logic_vector(5 downto 0);
signal vga_hs, vga_vs : std_logic;

begin


image : image_top port map( 
  clk => clk,
  vga_r => vga_r,
  vga_b => vga_b,
  vga_g => vga_g,
  vga_hs => vga_hs,
  vga_vs => vga_vs
  );


process 
begin
clk <= not clk;
wait for 4ns;
end process;


end Behavioral;
