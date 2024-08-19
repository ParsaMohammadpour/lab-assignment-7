library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity multiplier is
generic (N: integer := 4);
port (
		clk    : in std_logic;
	    a    :  in  std_logic_vector(N-1 downto 0);
        b    :  in  std_logic_vector(N-1 downto 0);
        res :  out std_logic_vector(2*N-1 downto 0) );
end entity multiplier;

architecture behavioral of multiplier is

begin

process(clk)
variable b_extended, b_num : STD_LOGIC_VECTOR(2*N-1 downto 0) := (others => '0');
variable counter : INTEGER := 0;
variable pre_a, pre_b : STD_LOGIC_VECTOR(N-1 downto 0);
begin
	if rising_edge(Clk) then
		if counter = 0 then
			b_num(2*N-1 downto N) := (others => '0');
			b_num(N-1 downto 0) := b;
			b_extended := (others => '0');
			pre_a := a;
			pre_b := b;
		end if;
		if counter < N then
			if a(counter) = '1' then
				b_extended := std_logic_vector(unsigned(b_extended) + unsigned(b_num));
			end if;
			b_num := std_logic_vector(shift_left(unsigned(b_num), 1));
		end if;
		counter := counter + 1;
		if counter > N-1 then
			if not (pre_a = a and pre_b = b) then
				counter := 0;
			end if;
		end if;
		res <= b_extended;
	end if;
	--b_num <= "0000" & b;
	--b_extended <= "1010" & a;
    --for i in 0 to N-1 loop
	--	if a(i) = '1' then
	--		b_extended <= std_logic_vector(unsigned(b_extended) + unsigned(b_num));
	--	end if;
	--	b_num <= std_logic_vector(shift_left(unsigned(b_num), 1));
	--	wait for 2 ns;
    --end loop;
	--res <= b_extended;
end process;
end behavioral;