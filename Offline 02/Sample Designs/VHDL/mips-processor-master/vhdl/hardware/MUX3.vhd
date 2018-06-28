----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:52:38 09/11/2012 
-- Design Name: 
-- Module Name:    MUX - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX3 is
	generic (N :NATURAL);
	Port ( selector : in  STD_LOGIC_VECTOR (1 downto 0) := (others => '0');
           bus_in0 : in  STD_LOGIC_VECTOR (N-1 downto 0) := (others => '0');
           bus_in1 : in  STD_LOGIC_VECTOR (N-1 downto 0) := (others => '0');
           bus_in2 : in  STD_LOGIC_VECTOR (N-1 downto 0) := (others => '0');
           bus_out : out  STD_LOGIC_VECTOR (N-1 downto 0) := (others => '0')
	);
end MUX3;

architecture Behavioral of MUX3 is

begin

MUX3 : process(selector, bus_in0, bus_in1, bus_in2)
	begin
		if (selector = "00") then
			bus_out <= bus_in0;
		elsif (selector = "01") then
			bus_out <= bus_in1;
		else 
			bus_out <= bus_in2;
		end if;
	end process;
end Behavioral;

