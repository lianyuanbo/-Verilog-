//~ `New testbench
`timescale  1ns / 1ps
`include "x74121.v"
module tb_x74121;

// x74121 Inputs
reg   A                                    = 0 ;
reg   B                                    = 0 ;

// x74121 Outputs
wire  Q                                    ;

x74121  u_x74121 (
    .A                       ( A   ),
    .B                       ( B   ),

    .Q                       ( Q   )
);

initial
begin
    $dumpfile("x74121.vcd");
    $dumpvars(0, u_x74121, A, B, Q);
    // Test case 1
    A = 0;
    B = 0;
    #10;
    if (Q !== 0) $display("Test case 1 failed");

    // Test case 2
    A = 1;
    B = 0;
    #10;
    if (Q !== 1) $display("Test case 2 failed");

    // Test case 3
    A = 0;
    B = 1;
    #10;
    if (Q !== 1) $display("Test case 3 failed");

    // Test case 4
    A = 1;
    B = 1;
    #10;
    if (Q !== 0) $display("Test case 4 failed");

    $finish;
end

endmodule