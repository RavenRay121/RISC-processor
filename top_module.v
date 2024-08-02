`include "alu.v"
`include "data_path.v"
`include "temp.v"
`include "register.v"





module top_module;



reg [7:0] r0;
reg [7:0] r1;
reg [7:0] r2;
reg [7:0] r3;
reg [7:0] r4;
reg [7:0] r5;
reg [7:0] r6;
reg [7:0] r7;
reg [7:0] r8;
reg [7:0] r9;
reg [7:0] r10;
reg [7:0] r11;
reg [7:0] r12;
reg [7:0] r13;
reg [7:0] r14;
reg [7:0] r15;



reg [3:0] address;

reg [15:0] ins;

reg clk;

initial begin
$dumpfile("test.vcd");
$dumpvars;
r0 = 0;
r1 = 0;
r2 = 0;
r3 = 0;
r4 = 0;
r5 = 0;
r6 = 0;
r7 = 0;
r8 = 0;
r9 = 0;
r10 = 0;
r12 = 0;
r13 = 0;
r14 = 0;
r15 = 0;
$display("processor started working:");
clk = 0;
 #5 clk = ~clk;
 #5 clk = ~clk;
 #5 clk = ~clk;
 #5 clk = ~clk;
 #5 clk = ~clk;
 #5 clk = ~clk;
 #5 clk = ~clk;
 #5 clk = ~clk;
 #5 clk = ~clk;
 #5 clk = ~clk;
 #5 clk = ~clk;
 #5 clk = ~clk;
 #5 clk = ~clk;
 #5 clk = ~clk;
 #5 clk = ~clk;
 #5 clk = ~clk;
 #5 clk = ~clk;
 #5 clk = ~clk;
  #5 clk = ~clk;
 #5 clk = ~clk;
 #5 clk = ~clk;
 #5 clk = ~clk;
 #5 clk = ~clk;
 #5 clk = ~clk;
 #5 clk = ~clk;
 #5 clk = ~clk;
 #5 clk = ~clk;
 #5 clk = ~clk;
 #5 clk = ~clk;
 #5 clk = ~clk;
end

reg [7:0] op1;
reg [7:0] op21;
reg [7:0] op22;
reg [7:0] op2;

regRead u1(
    ins[7:4],
    r0,
    r1,
    r2,
    r3,
    r4,
    r5,
    r6,
    r7,
    r8,
    r9,
    r10,
    r11,
    r12,
    r13,
    r14,
    r15,
    op1
);

regRead u1(
    ins[3:0],
    r0,
    r1,
    r2,
    r3,
    r4,
    r5,
    r6,
    r7,
    r8,
    r9,
    r10,
    r11,
    r12,
    r13,
    r14,
    r15,
    op21
);

always @(*) begin

    op22 <= {{4{ins[3]}},ins[3:0]};
    if (ins[15]) op2 = op22;
    else op2 = op21;

end


wire  [7:0] res;
alu UUT1(a,b,ins[14:12],res);


regWrite uuuu(
    clk,
    ins[11:8],
    res,
    ins[1],
    r0,
    r1,
    r2,
    r3,
    r4,
    r5,
    r6,
    r7,
    r8,
    r9,
    r10,
    r11,
    r12,
    r13,
    r14,
    r15,
    op21
);






endmodule


module regWrite(
    input clk,
    input [3:0] address,
    input [7:0] data,
    input enable,
    output reg [7:0] r0,
    output reg [7:0] r1,
    output reg [7:0] r2,
    output reg [7:0] r3,
    output reg [7:0] r4,
    output reg [7:0] r5,
    output reg [7:0] r6,
    output reg [7:0] r7,
    output reg [7:0] r8,
    output reg [7:0] r9,
    output reg [7:0] r10,
    output reg [7:0] r11,
    output reg [7:0] r12,
    output reg [7:0] r13,
    output reg [7:0] r14,
    output reg [7:0] r15


);

    always @(posedge clk) 
    begin
        if (enable) begin
        if (address == 4'b0000) r0 <= data;
        else if (address == 4'b0001) r1 <= data;
        else if (address == 4'b0010) r2 <= data;
        else if (address == 4'b0011) r3 <= data;
        else if (address == 4'b0100) r4 <= data;
        else if (address == 4'b0101) r5 <= data;
        else if (address == 4'b0110) r6 <= data;
        else if (address == 4'b0111) r7 <= data;
        else if (address == 4'b1000) r8 <= data;
        else if (address == 4'b1001) r9 <= data;
        else if (address == 4'b1010) r10 <= data;
        else if (address == 4'b1011) r11 <= data;
        else if (address == 4'hC) r12 <= data;
        else if (address == 4'hD) r13 <= data;
        else if (address == 4'hE) r14 <= data;
        else  r15 <= data;
        // else if (address == 4'hF) r12 <= data
        end
        


    end
    


endmodule



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



