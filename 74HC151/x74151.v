module x74151(
    En,
    S,
    D,
    Y,
    Yn
);

input wire  En;  //使能端
input wire [2:0] S;   //选择端
input wire [7:0] D;  //输入端
output wire Y;  //输出端
output wire Yn;  //输出端


assign Y = (En == 1'b0) ? D[S] : 1'b0;
assign Yn = ~Y;

endmodule