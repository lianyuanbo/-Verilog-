module x74161(
    CR,PE,CEP,CET,CP,D, Q,TC
);

input CR,PE,CEP,CET,CP;
input [3:0]D;
output reg [3:0]Q;
output reg TC;

always @(posedge CP or negedge CR)
begin
if (~CR)begin   
        Q <= 4'b1111;
        TC <= 0;
    end
    
else if (~PE)
    Q <= D;

else
    casex ({CEP,CET})
	2'b0x: Q <= Q;         //保持
	2'bx0:begin 
        Q <= Q; TC <= 0; 
        end      //保持
	2'b11:begin 
        Q<=Q+1'b1; TC<=(Q==4'b1111); 
        end    //计数
    endcase
end

endmodule