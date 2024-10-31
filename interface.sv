interface rca_if;
logic [3:0]a,b;
logic cin;
logic [3:0] sum;
logic cout;

modport tb(output a, output b, output cin,input sum,input cout);
modport tb_mon_in(input a, input b, input cin, output sum, output cout);
modport tb_mon_out(input sum,input cout);

endinterface