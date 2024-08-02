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