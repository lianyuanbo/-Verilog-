module x74138(
    En,
    I,
    O
);
  input wire [2:0] En;  //使能端
  input wire [2:0] I;   //输入端
  output wire [7:0] O;  //输出端

  assign O = (En == 3'b100) ? ~(8'b0000_0001 << I) : ~(8'b0000_0000);
  //74HC138的逻辑实现，当使能端为100时，输出端为输入端的2^I次方，否则输出端为全1
endmodule
