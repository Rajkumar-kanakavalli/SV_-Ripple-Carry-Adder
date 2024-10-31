`include "interface.sv"
`include "dut.sv"
`include "program.sv"

module tb;

rca_if intf ();
	
rca_dut dut(intf);
	
program_test testbench(intf);

endmodule