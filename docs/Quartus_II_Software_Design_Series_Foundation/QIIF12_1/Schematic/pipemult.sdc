create_clock -period 10 [get_ports clk1]
create_clock -period 10 -name vir_clock
derive_clock_uncertainty
set_input_delay -clock vir_clock 0 [get_ports wren]
set_input_delay -clock vir_clock 0 [get_ports data*]
set_input_delay -clock vir_clock 0 [get_ports rdaddress*]
set_input_delay -clock vir_clock 0 [get_ports wraddress*]
set_output_delay -clock vir_clock 0 [get_ports q*]