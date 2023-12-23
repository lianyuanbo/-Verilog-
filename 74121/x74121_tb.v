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
    $monitor($time,":\t A=%b, B=%b, Q=%b\n", A, B, Q);

initial
begin
    $dumpfile("x74121.vcd");
    $dumpvars(0, u_x74121, A, B, Q);
    // 初始化输入信号
    A = 0;
    B = 0;
    
    // 模拟触发信号
    #10 A = 1;
    #5 A = 0;
    
    // 控制引脚置高并保持一段时间
    #20 B = 1;
    #50 B = 0;
    
    // 模拟触发信号
    #10 A = 1;
    #5 A = 0;
    
    // 等待输出脉冲信号
    #100 $finish;
  end

endmodule