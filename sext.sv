module sext1216(input logic [11:0] p, output logic [15:0] q);

always_comb begin
q = {{4{p[10]}},p[11:0]};
end
endmodule
