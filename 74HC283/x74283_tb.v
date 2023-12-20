//~ `New testbench
`timescale  1ns / 1ps
`include "x74283.v"
module tb_x74283;

// x74283 Inputs
reg   C_1                                  = 0 ;
reg   [3:0]  A                             = 0 ;
reg   [3:0]  B                             = 0 ;

// x74283 Outputs
wire  CO                                   ;
wire  [3:0]  S                             ;

x74283  u_x74283 (
    .C_1                     ( C_1        ),
    .A                       ( A    [3:0] ),
    .B                       ( B    [3:0] ),

    .CO                      ( CO         ),
    .S                       ( S    [3:0] )
);

initial
    $monitor($time,":\t A=%b, B=%b, C_1=%b, CO=%b, S=%b \n", A, B, C_1, CO, S);
    //监视器的显示内容
initial
begin
    $dumpfile("x74283.vcd");
    $dumpvars(0, u_x74283, C_1, A, B, CO, S);
    A=4'b0000; B=4'b0000; C_1=0;
    #5
    A=4'b0001; B=4'b0001; C_1=1;
    #5
    A=4'b0010; B=4'b0010; C_1=0;
    #5
    A=4'b0011; B=4'b0011; C_1=1;
    #5
    A=4'b0100; B=4'b0100; C_1=0;
    #5
    A=4'b1111; B=4'b1111; C_1=1;
    #5
    $finish;
end

endmodule