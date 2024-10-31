class driver;
packet got_pkt;
mailbox #(packet) drv_mbx;
virtual rca_if drv_if;
event e;

function new(input mailbox #(packet) mbx,
			 input virtual rca_if drv_if,event e);
this.drv_mbx = mbx;
this.drv_if = drv_if;
this.e=e;
endfunction

task run();
$display("\n---------------------DRIVER RUN STARTED------------------");
   forever 
     begin
	     wait(e);
		drv_mbx.get(got_pkt);
		$display("[DRIVER] value of a=%0d, value of b=%0d, value of cin=%0d",got_pkt.a,got_pkt.b,got_pkt.cin);
		drv_if.a = got_pkt.a;
		drv_if.b = got_pkt.b;
		drv_if.cin = got_pkt.cin;
	
		$display("[DRIVER-INTERFACE]  a=%0d, b=%0d, cin=%0d, sum=%0d, cout=%0d \n",drv_if.a,drv_if.b,drv_if.cin,drv_if.sum,drv_if.cout);
	end
$display("-----------------DRIVER RUN ENDED---------------------");
endtask

endclass