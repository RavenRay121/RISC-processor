

module regRead(
    input [3:0] address;
    input [7:0] r0;
    input [7:0] r1;
    input [7:0] r2;
    input [7:0] r3;
    input [7:0] r4;
    input [7:0] r5;
    input [7:0] r6;
    input [7:0] r7;
    input [7:0] r8;
    input [7:0] r9;
    input [7:0] r10;
    input [7:0] r11;
    input [7:0] r12;
    input [7:0] r13;
    input [7:0] r14;
    input [7:0] r15;
    output [7:0] out;


);

reg [7:0] acc;

always @(*) begin
if (address == 4'h0) acc <= r0;
else if (address == 4'h1) acc <= r1;
else if (address == 4'h2) acc <= r2;
else if (address == 4'h3) acc <= r3;
else if (address == 4'h4) acc <= r4;
else if (address == 4'h5) acc <= r5;
else if (address == 4'h6) acc <= r6;
else if (address == 4'h7) acc <= r7;
else if (address == 4'h8) acc <= r8;
else if (address == 4'h9) acc <= r9;
else if (address == 4'hA) acc <= r10;
else if (address == 4'hB) acc <= r11;
else if (address == 4'hC) acc <= r12;
else if (address == 4'hD) acc <= r13;
else if (address == 4'hE) acc <= r14;
else acc <= r15;
end


assign out = acc;


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



