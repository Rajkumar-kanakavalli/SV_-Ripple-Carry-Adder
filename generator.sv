class generator;
packet pkt;
mailbox #(packet) gen_mbx;
event e;

function new(mailbox #(packet) mbx, event e);
this.gen_mbx= mbx;
this.e = e;
endfunction

extern task run();
endclass
//----------------------------------------------------------

task generator::run();
$display("\n-----------------GENERATOR RUN STARTED-----------------------");

repeat(4)
begin
pkt = new();
assert(pkt.randomize());
$display("[GENERATOR]  a=%0d, b=%0d, cin=%0d",pkt.a,pkt.b,pkt.cin);
gen_mbx.put(pkt);
#10;
-> e;
end
$display("------------GENERATOR RUN ENDED---------------");
endtask