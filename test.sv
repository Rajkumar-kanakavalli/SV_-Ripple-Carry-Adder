`include "environment.sv"

class base_test;
environment env;

virtual rca_if.tb vif_in;
virtual rca_if.tb_mon_in  vif_mon_in;
virtual rca_if.tb_mon_out vif_mon_out;

function new(input virtual rca_if.tb vif_in,
			 input virtual rca_if.tb_mon_in vif_mon_in,
			 input virtual rca_if.tb_mon_out vif_mon_out);
this.vif_in = vif_in;
this.vif_mon_in = vif_mon_in;
this.vif_mon_out = vif_mon_out;
endfunction

function void build();
env = new(vif_in, vif_mon_in, vif_mon_out);
endfunction

task run();
$display("\n [Testcase] run started at time=%0t",$time);
build();
env.run();
//$display("[Testcase] run ended at time=%0t",$time);
endtask

endclass