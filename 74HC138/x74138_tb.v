//~ `New testbench
`timescale  1ns / 1ps
`include "x74138.v"

module tb_x74138;

// x74138 Inputs
reg   [2:0]  En                            = 0 ;
reg   [2:0]  I                             = 0 ;

// x74138 Outputs
wire  [7:0]  O                             ;

x74138  u_x74138 (
    .En                      ( En  [2:0] ),
    .I                       ( I   [2:0] ),

    .O                       ( O   [7:0] )
);

initial
    $monitor($time,":\t En=%b, I=%b, O=%b\n", En, I, O);
initial
begin
    $dumpfile("x74138.vcd");
    $dumpvars(0, u_x74138, En, I, O);
    En=3'b010; I=3'b000;
    #1 
    En=3'b001; I=3'b000;
    #1 
    En=3'b000; I=3'b000;
    #1 
    En=3'b100; I=3'b000;
    #1 
    En=3'b100; I=3'b001;
    #1 
    En=3'b100; I=3'b010;
    #1 
    En=3'b100; I=3'b011;
    #1 
    En=3'b100; I=3'b100;
    #1 
    En=3'b100; I=3'b101;
    #1 
    En=3'b100; I=3'b110;
    #1 
    En=3'b100; I=3'b111;
    #1 
    $finish;
end

endmodule