class imonitor;
reg c1,c2,c3;
packet pkt;
virtual rca_if.tb_mon_in vif;
mailbox #(packet) mbx;
event e;

function new(input mailbox #(packet) mbx_in,
			 input virtual rca_if.tb_mon_in vif,
			 event e);
			 
this.mbx = mbx_in;
this.vif = vif;
this.e=e;
endfunction

task run();
	$display("-------------------imonitor started---------------------");
	forever
	 begin
	  wait(e);
	  pkt = new;
	  pkt.a = vif.a;
	  pkt.b = vif.b;
	  pkt.cin = vif.cin;
	  $display("[imonitor] a=%0d, b=%0d, cin=%0d, sum=%0d, cout=%0d",pkt.a,pkt.b,pkt.cin,pkt.sum,pkt.cout);
	  
//REFERENCE LOGIC (BFM)
	 pkt.sum[0]=pkt.a[0]^pkt.b[0]^pkt.cin;  //sum[0]
   c1=(pkt.a[0]&pkt.b[0])|(pkt.a[0]&pkt.cin)|(pkt.cin&pkt.b[0]); //cout0 /cin1

     pkt.sum[1]=pkt.a[1]^pkt.b[1]^c1;  //sum[1]
    c2=(pkt.a[1]&pkt.b[1])|(pkt.a[1]&c1)|(c1&pkt.b[1]);  //cout1 /cin2

      pkt.sum[2]=pkt.a[2]^pkt.b[2]^c2;  //sum[2]
    c3=(pkt.a[2]&pkt.b[2])|(pkt.a[2]&c2)|(c2&pkt.b[2]);  //cout2 /cin3

        pkt.sum[3]=pkt.a[3]^pkt.b[3]^c3;  //sum[3]
       pkt.cout=(pkt.a[3]&pkt.b[3])|(pkt.a[3]&c3)|(c3&pkt.b[3]);//cout3 /cout 
   //#1;
     
	 mbx.put(pkt);
	  
	
	$display("[imonitor] at time=\t, sum=%0d,cout=%0d \n",pkt.sum,pkt.cout);
	end
endtask
endclass