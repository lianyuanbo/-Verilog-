//~ `New testbench
`timescale  1ns / 1ps
`include "x74151.v"
module tb_x74151;

// x74151 Inputs
reg   En                                   = 0 ;
reg   [2:0]  S                             = 0 ;
reg   [7:0]  D                             = 0 ;

// x74151 Outputs
wire  Y                                    ;
wire  Yn                                   ;

x74151  u_x74151 (
    .En                      ( En        ),
    .S                       ( S   [2:0] ),
    .D                       ( D   [7:0] ),

    .Y                       ( Y         ),
    .Yn                      ( Yn        )
);

initial 
    $monitor($time,":\t D=%b, S=%b, En=%b, Y=%b, Yn=%b \n", D, S, En, Y, Yn); 
    //监视器的显示内容
initial
begin

    $dumpfile("x74151.vcd");
    $dumpvars(0, u_x74151, En, S, D, Y, Yn);
    //无法正常选择
    En=1; S[2:0]=3'b000; D[7:0]=8'b00000001;
    #5
    En=1; S[2:0]=3'b001; D[7:0]=8'b00000010;
    #5
    //正常进行选择
    En=0; S[2:0]=3'b010; D[7:0]=8'b00000100;
    #5
    En=0; S[2:0]=3'b011; D[7:0]=8'b00001000;
    #5
    En=0; S[2:0]=3'b100; D[7:0]=8'b00010000;
    #5
    En=0; S[2:0]=3'b101; D[7:0]=8'b00100000;
    #5
    $finish;
end
endmodule