module x74121(
    input wire A,     // 输入信号 A
    input wire B,     // 输入信号 B
    output reg Q      // 输出信号 Q
);
  
  reg [15:0] count;   // 16位计数器
  reg triggered;      // 触发标志位
  reg pulse;          // 脉冲标志位

  always @(A, B) begin
    if (A == 1'b1 && B == 1'b0 && !triggered) begin
      triggered <= 1'b1;       // 触发新的脉冲
      count <= 16'b0;          // 计数器清零
      Q <= 1'b0;               // 输出信号置为低电平
    end else if (triggered) begin
      count <= count + 1;      // 计数器递增
      if (count == 16'd500) begin
        triggered <= 1'b0;     // 达到设定脉冲宽度，触发标志位清零
        Q <= 1'b1;             // 输出信号置为高电平
      end else begin
        Q <= 1'b0;             // 未达到设定脉冲宽度，输出信号置为低电平
      end
    end else begin
      Q <= 1'b0;               // 未触发或触发标志位为0，输出信号置为低电平
    end
  end
  
endmodule