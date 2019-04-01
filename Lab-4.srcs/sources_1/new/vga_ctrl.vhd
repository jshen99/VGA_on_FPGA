----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2019 07:06:47 PM
-- Design Name: 
-- Module Name: vga_ctrl - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vga_ctrl is
    Port ( signal clk : in std_logic;
           signal en : in std_logic;
           signal hcount, vcount : out std_logic_vector(9 downto 0);
           signal vid, hs, vs : out std_logic
           );
end vga_ctrl;

architecture Behavioral of vga_ctrl is

signal hcounter : std_logic_vector(9 downto 0);
signal vcounter : std_logic_vector(9 downto 0);


begin

process(clk)
begin
if(rising_edge(clk))then
    if en = '1' then
    
        if unsigned(hcounter) < 800 then
            hcounter <= std_logic_vector(unsigned(hcounter)+1);
        else
            hcounter <= (others => '0');
        end if;
        if unsigned(vcounter) < 525 then
            vcounter <= std_logic_vector(unsigned(vcounter)+1);
        else
            vcounter <= (others => '0');
        end if;
        
        if unsigned(vcounter) >= 0 and unsigned(vcounter) < 480 and unsigned(hcounter) >= 0 and unsigned(hcounter) < 640 then
            vid <= '1';
        else 
            vid <= '0';
        end if;
        
        if unsigned(hcounter) > 655 and unsigned(hcounter) < 752 then
            hs <= '0';  
        else
            hs <= '1';
        end if;
        
        if unsigned(vcounter) > 489 and unsigned(vcounter) < 492 then
            vs <= '0';
        else
            vs <= '1';
        end if;
    end if; 

end if;
end process;


hcount <=  hcounter;
vcount <= vcounter;

end Behavioral;
