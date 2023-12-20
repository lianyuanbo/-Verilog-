module x74121(
    input wire A,
    input wire B,
    output reg Q
);

reg [31:0] counter; // 32位计数器
wire trigger; // 触发信号

// 当 A 或 B 有一个为高电平时，触发信号为高
assign trigger = A | B;

always @(posedge trigger or negedge B) begin
    if (~B) begin
        Q <= 1'b0; // 当 B 为低电平时，Q 输出为低电平
        counter <= 0; // 计数器清零
    end else begin
        Q <= 1'b1; // 当触发信号为高电平时，Q 输出为高电平
        counter <= counter + 1; // 计数器加一
    end
end

always @(posedge Q) begin
    if (counter == 32'd1000) begin // 当计数器达到1000时
        Q <= 1'b0; // Q 输出为低电平
        counter <= 0; // 计数器清零
    end
end

endmodule