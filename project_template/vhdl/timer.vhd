library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timer is
    port(
        -- bus interface
        clk     : in  std_logic;
        reset_n : in  std_logic;
        cs      : in  std_logic;
        read    : in  std_logic;
        write   : in  std_logic;
        address : in  std_logic_vector(1 downto 0);
        wrdata  : in  std_logic_vector(31 downto 0);

        irq     : out std_logic;
        rddata  : out std_logic_vector(31 downto 0)
    );
end timer;

architecture synth of timer is
    	constant REG_STATUS : std_logic_vector := "11";
	constant REG_CONTROL : std_logic_vector := "10";
	constant REG_PERIOD : std_logic_vector := "01";
	constant REG_COUNTER : std_logic_vector := "00";
	
	signal read_reg : std_logic;
	signal address_reg : std_logic_vector(1 downto 0);
	
	-- status
	signal run : std_logic; -- RO
	signal timeout : std_logic; -- RW
	
	-- control
	signal cont : std_logic; -- RW
	signal ito : std_logic; -- RW
	
	--period
	signal period : std_logic_vector(31 downto 0); -- RW
	
	-- counter
	signal counter : std_logic_vector(31 downto 0); -- RO
	
begin
	irq <= ito and timeout;
	
	-- address_reg
	process(clk, reset_n)
	begin
		if (reset_n = '0') then
			address_reg <= (others => '0');
			read_reg <= '0';
		elsif (rising_edge(clk)) then
			address_reg <= address;
			read_reg <= read and cs;
		end if;
	end process;
	
	
	-- read
	process(read_reg, address_reg, run, timeout, cont, ito, period, counter)
	begin
		-- rddata is disconnected by default
		rddata <= (others => 'Z');

		if (read_reg = '1') then
			-- during a read, rddata is set to 0 by default
			rddata <= (others => '0');

			case address_reg is
				when REG_STATUS =>
				
					rddata(0) <= run;
					rddata(1) <= timeout;
					
				when REG_CONTROL =>
					rddata(0) <= cont;
					rddata(1) <= ito;
					
				when REG_PERIOD =>
					rddata <= period;
					
				when REG_COUNTER =>
					rddata <= counter;
					
				when others =>
			end case;
		end if;
	end process;
	
	-- write and counter
	process(clk, reset_n)
	begin
		if (reset_n = '0') then
			counter <= (others => '0');
			period <= (others => '0');
			timeout <= '0';
			run <= '0';
			cont <= '0';
			ito <= '0';
		
		elsif (rising_edge(clk)) then
			if (run = '1') then
				if (unsigned(counter) = 0) then
					counter <= period;
					run <= cont;
					timeout <= '1';
				else
					counter <= std_logic_vector(unsigned(counter) - 1);
				end if;
			end if;
			
			if (cs = '1' and write = '1') then
				case address is
					when REG_STATUS =>
						timeout <= timeout and wrdata(0);
					when REG_CONTROL =>
						
						if (wrdata(2) = '1') then
							
							run <= '0';
						elsif (wrdata(3) = '1') then
							
							run <= '1';
						end if;
						
						cont <= wrdata(0);
						ito <= wrdata(1);
						
					when REG_PERIOD =>
						period <= wrdata;
						counter <= wrdata;
						run <= '0';
					when others =>
				end case;
			end if;
		end if;
		
	end process;
	
end synth;
