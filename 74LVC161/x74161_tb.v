//~ `New testbench
`timescale  1ns / 1ps
`include "x74161.v"
module tb_x74161;

// x74161 Inputs
reg   CR                                   = 0 ;
reg   PE                                   = 0 ;
reg   CEP                                  = 0 ;
reg   CET                                  = 0 ;
reg   CP                                   = 0 ;
reg   [3:0]  D                             = 0 ;

// x74161 Outputs
wire  [3:0]  Q                             ;
wire  TC                                   ;

x74161  u_x74161 (
    .CR                      ( CR         ),
    .PE                      ( PE         ),
    .CEP                     ( CEP        ),
    .CET                     ( CET        ),
    .CP                      ( CP         ),
    .D                       ( D    [3:0] ),

    .Q                       ( Q    [3:0] ),
    .TC                      ( TC         )
);

initial
	$monitor($time,"\tCR=%b,PE=%b,CEP=%b,CET=%b,CP=%b,D=%b,Q=%b,TC=%b",CR,PE,CEP,CET,CP,D,Q,TC);
//时钟信号
initial
    CP=1;
always 
    #5 CP=~CP;
//元件例化    
initial
begin
    $dumpfile("x74161.vcd");
    $dumpvars(0,u_x74161,CR,PE,CEP,CET,CP,D,Q,TC);
    //清零
	CR=0;PE=1;D=4'b1100;CET=0;CEP=0;
	#5;
	//置数
	CR=1;PE=0;D=4'b1100;CET=0;CEP=0;
	#10;
	//计数
	CR=1;PE=1;D=4'b0000;CET=1;CEP=1;
	#60;
	//禁止计数
	CR=1;PE=1;D=4'b0000;CET=1;CEP=0;
	#20;
    $finish;
end

endmodule