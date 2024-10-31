class omonitor;
packet pkt;
virtual rca_if.tb_mon_out vif;
mailbox #(packet) mbx;

function new(input mailbox #(packet) mbx_in,
			 input virtual rca_if.tb_mon_out vif);
this.mbx = mbx_in;
this.vif = vif;
endfunction

task run();
	$display("------------------OMONITOR RUN STARTED-----------------------");
	forever
	 begin
		@(vif.sum);
		//@(vif.cout);
		$display("[omonitor - Interface] sum=%0d,cout=%0d",vif.sum,vif.cout);
		pkt = new;
		pkt.sum = vif.sum;
		pkt.cout=vif.cout;
		
		mbx.put(pkt);
		
		$display("[omonitor] sum=%0d,cout=%0d  time=%0t \n",pkt.sum,pkt.cout,$time);
		end
endtask

endclass