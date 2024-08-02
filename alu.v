module in;

reg [7:0] a;
reg [7:0] b;
reg [2:0] ins;
reg [7:0] out;
initial begin
    $dumpfile("aluu.vcd");
    $dumpvars;
a = 17;
b = 2;
ins = 6;




end
alu bd(a,b,ins,out);


endmodule




module alu (
    input [7:0] a,
    input [7:0] b,
    input [2:0] ins,
    output reg [7:0] out
);

// 000 -> add 
// 001 -> sub
// 010 -> and 
// 011 -> or
// 100 -> xor
// 101 -> not a
// 110 -> multiply
// 111 -> divide

always @(*) begin
    case(ins)
        3'b000: out = a + b;
        3'b001: out = a - b;
        3'b010: out = a & b;
        3'b011: out = a | b;
        3'b100: out = a ^ b;
        3'b101: out = ~a;
        3'b110: out = a * b;
        3'b111: out = a / b;
        // default: out = 8'b0;
    endcase
end

endmodule
