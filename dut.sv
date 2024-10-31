module rca_dut (rca_if dut_if);
reg c1,c2,c3;

always@(*)
begin
dut_if.sum[0]=dut_if.a[0]^dut_if.b[0]^dut_if.cin;  //sum[0]
c1=(dut_if.a[0]&dut_if.b[0])|(dut_if.a[0]&dut_if.cin)|(dut_if.cin&dut_if.b[0]); //cout0 /cin1

dut_if.sum[1]=dut_if.a[1]^dut_if.b[1]^c1;  //sum[1]
c2=(dut_if.a[1]&dut_if.b[1])|(dut_if.a[1]&c1)|(c1&dut_if.b[1]);  //cout1 /cin2

dut_if.sum[2]=dut_if.a[2]^dut_if.b[2]^c2;  //sum[2]
c3=(dut_if.a[2]&dut_if.b[2])|(dut_if.a[2]&c2)|(c2&dut_if.b[2]);  //cout2 /cin3

dut_if.sum[3]=dut_if.a[3]^dut_if.b[3]^c3;  //sum[3]
dut_if.cout=(dut_if.a[3]&dut_if.b[3])|(dut_if.a[3]&c3)|(c3&dut_if.b[3]);//cout3 /cout 
//$display("[DUT]sum = %0d,cout = %0d",dut_if.sum,dut_if.cout);
end 
endmodule