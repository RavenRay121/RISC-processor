// `include "C:\Users\risha\OneDrive\Desktop\processor\temp2.v"
`include "temp2.v"
module temp;

reg a = 0;
wire b;
initial 
begin
    #5 a = 1;
    #5 a = 0;

    $display("hello");
    #5 $finish;

end

tem u1(a,b);

endmodule