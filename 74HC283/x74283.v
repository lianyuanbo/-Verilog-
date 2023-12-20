module x74283(
    C_1,    //最低位的进位
    A,      //待加数
    B,      //待加数
    CO,     //最高位的进位
    S       //输出数
);
input C_1;
input [3:0] A, B;
output CO;
output [3:0] S;

// 中间变量定义
wire [3:0] P, G, C;

assign P=A ^ B;
assign G=A & B;
// 得到P为传输信号，G为产生信号

genvar i;
assign C[0] = G[0] | (P[0] & C_1);
for(i = 1; i <= 3; i = i + 1) 
    assign C[i] = G[i] | (P[i] & C[i - 1]);
// 依次根据各位进位信号的逻辑表达式进行数据流建模

assign CO = C[3];   // 得到输出进位信号


assign S[0] = P[0] ^ C_1;
for(i = 1; i <= 3;i = i + 1) 
    assign S[i] = P[i] ^ C[i - 1];
// 依次根据各位输出信号的逻辑表达式进行数据流建模

endmodule