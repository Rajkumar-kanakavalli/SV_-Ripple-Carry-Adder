class scoreboard;
packet ref_pkt;
packet got_pkt;

mailbox #(packet) ipm_sbd;
mailbox #(packet) opm_sbd;

function new(input mailbox #(packet) ipm_sbd, 
			 input mailbox #(packet) opm_sbd);
this.ipm_sbd = ipm_sbd;
this.opm_sbd = opm_sbd;

endfunction

task run();

$display("-----------------SCOREBOARD RUN STARTED---------------------");
while(1)
begin

ipm_sbd.get(ref_pkt);
opm_sbd.get(got_pkt);

$display("[SCOREBOARD] [REFERENCE OUPUT] sum=%0d, cout=%0d, [DUT OUTPUT] sum=%0d, cout=%0d\n",ref_pkt.sum,ref_pkt.cout,got_pkt.sum,got_pkt.cout);
	                     //$display ("Time=%0t",$time);
	if ((ref_pkt.sum == got_pkt.sum)&&(ref_pkt.cout == got_pkt.cout))
		$display("**********TEST CASE PASS******************");
	else
	
		$display("******************TEST CASE FAIL********************");
	
	
end
$display("************SCOREBOARD RUN ENDED******************");
endtask

endclass