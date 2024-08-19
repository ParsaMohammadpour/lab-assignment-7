library ieee;
use ieee.std_logic_1164.all;

entity multiplier_tb is end entity;

architecture behavior of multiplier_tb is
 COMPONENT multiplier
 GENERIC (N      : INTEGER := 4);
 PORT(
	clk    : in std_logic;
	a,b : in STD_LOGIC_VECTOR(3 downto 0);
    res: out STD_LOGIC_VECTOR(7 downto 0)
 );
 END COMPONENT;
	
	signal clk    : std_logic := '1';
    signal a, b        : std_logic_vector(3 downto 0);
    signal res      : std_logic_vector(7 downto 0);
begin
uut: multiplier
        generic map (
            N => a'length
        )
        port map (
			clk => clk,
            a     => a,   
            b      => b,
            res => res
        );

-- Process for generating the clock
    clk <= not clk after 1 ns;

    stim_proc: process
    begin
        a <= "0111";
        b <= "1010";
		wait for 20 ns;
        a <= "0100";
        b <= "1011";
		wait for 20 ns;
        a <= "1010";
        b <= "1000";
		wait for 20 ns;
        a <= "1111";
        b <= "1111";
        wait;
    end process;
end architecture;