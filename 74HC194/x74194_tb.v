//~ `New testbench
`timescale  1ns / 1ps
`include "x74194.v"
module tb_x74194;

// x74194 Inputs
reg   CR                                   = 0 ;
reg   DSR                                  = 0 ;
reg   DSL                                  = 0 ;
reg   CP                                   = 0 ;
reg   [3:0]  D                             = 0 ;
reg   [1:0]  S                             = 0 ;

// x74194 Outputs
wire  [3:0]  Q                             ;

x74194  u_x74194 (
    .CR                      ( CR         ),
    .DSR                     ( DSR        ),
    .DSL                     ( DSL        ),
    .CP                      ( CP         ),
    .D                       ( D    [3:0] ),
    .S                       ( S    [1:0] ),

    .Q                       ( Q    [3:0] )
);

initial
$monitor($time,"\tDSR=%b,DSL=%b,S=%b,D=%b,Q=%b",DSR,DSL,S,D,Q);
//时钟脉冲
initial 
	CP=0;
always
	#1 CP=~CP;
//测试
initial 
begin
    $dumpfile("x74194.vcd");
    $dumpvars(0,u_x74194,CR,DSR,DSL,CP,D,S,Q);
	//预置为1111
	CR=1;S=2'b11;DSR=0;DSL=0;D=4'b1111;
	#2
	//清零
	CR=0;S=2'b11;DSR=0;DSL=0;D=4'b1111;
	#2
	//右移，DSR=1
	CR=1;S=2'b01;DSR=1;DSL=0;D=4'b1111;
	#2
	//右移，DSR=1
	CR=1;S=2'b01;DSR=1;DSL=0;D=4'b1111;
	#2
	//右移，DSR=0
	CR=1;S=2'b01;DSR=0;DSL=0;D=4'b1111;
	#2
	//右移，DSR=0
	CR=1;S=2'b01;DSR=0;DSL=0;D=4'b1111;
	#2
	//清零
	CR=0;S=2'b11;DSR=0;DSL=0;D=4'b1111;
	#2
	//左移，DSL=1
	CR=1;S=2'b10;DSR=0;DSL=1;D=4'b1111;
	#2
	//左移，DSL=1
	CR=1;S=2'b10;DSR=0;DSL=1;D=4'b1111;
	#2
	//左移，DSL=0
	CR=1;S=2'b10;DSR=0;DSL=0;D=4'b1111;
	#2
	//左移，DSL=0
	CR=1;S=2'b10;DSR=0;DSL=0;D=4'b1111;
	#2
	$finish;
end

endmodule