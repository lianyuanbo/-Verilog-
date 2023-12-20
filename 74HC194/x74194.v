module x74194(
    CR,S,DSR,DSL,CP,D, Q
);

input CR, DSR, DSL, CP;
input [3:0]D;
input [1:0]S;
output reg [3:0]Q;

always @(posedge CP or negedge CR)
begin
if (~CR)
    Q <= 4'b1111;
else
    case (S)
        2'b00: Q <= D;
        2'b01: Q <= Q << 1;
        2'b10: Q <= Q >> 1;
        2'b11: Q <= 4'b0000;
    endcase
end

endmodule
