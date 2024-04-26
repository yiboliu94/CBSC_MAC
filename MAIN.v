`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    MAIN 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module MAIN
(
	input clk,
	input rst,
	input [6:0] BN_X1, //input 7bit binary number for SC multiplication, which is CBSC multiplication input x
    	input [6:0] BN_Y1, ////input 7bit binary number for SC multiplication, which is CBSC multiplication input w
	input [6:0] BN_X2, //input 7bit binary number for SC multiplication, which is CBSC multiplication input x
    	input [6:0] BN_Y2, ////input 7bit binary number for SC multiplication, which is CBSC multiplication input w
	input [6:0] BN_X3, //input 7bit binary number for SC multiplication, which is CBSC multiplication input x
    	input [6:0] BN_Y3, ////input 7bit binary number for SC multiplication, which is CBSC multiplication input w
	input [6:0] BN_X4, //input 7bit binary number for SC multiplication, which is CBSC multiplication input x
    	input [6:0] BN_Y4, ////input 7bit binary number for SC multiplication, which is CBSC multiplication input w
	//input sel,  //deprecated input mux_selection when we generate it inside by LFSR.
	output reg [6:0] Q    // Q is the sum_output, in BN.
);


// convert input BN_X1234 to SN_X1234
wire [6:0] FSM;
FSM FSM_0 (
	.clk(clk),
	.rst(rst),
	.FSM(FSM)
	);


wire SN_X1;
CBSC_SNG SNG_1 (
	.clk(clk),
	.rst(rst),
	.x(BN_X1),
	.x_sn(SN_X1)
	);
wire SN_X2;
CBSC_SNG SNG_2 (
	.clk(clk),
	.rst(rst),
	.x(BN_X2),
	.x_sn(SN_X2)
	);
wire SN_X3;
CBSC_SNG SNG_3 (
	.clk(clk),
	.rst(rst),
	.x(BN_X3),
	.x_sn(SN_X3)
	);
wire SN_X4;
CBSC_SNG SNG_4 (
	.clk(clk),
	.rst(rst),
	.x(BN_X4),
	.x_sn(SN_X4)
	);

	
// initial Counter by input w for SC multiplication
reg STOP1;
D_CNT down_cnt1 (
	.clk(clk),
	.rst(rst),
	.w(BN_Y1),
	.STOP(STOP1)
	);
reg STOP2;
D_CNT down_cnt2 (
	.clk(clk),
	.rst(rst),
	.w(BN_Y2),
	.STOP(STOP2)
	);
reg STOP3;
D_CNT down_cnt3(
	.clk(clk),
	.rst(rst),
	.w(BN_Y3),
	.STOP(STOP3)
	);
reg STOP4;
D_CNT down_cnt4 (
	.clk(clk),
	.rst(rst),
	.w(BN_Y4),
	.STOP(STOP4)
	);

// Conduct CBSC multiplication by down counter
Counter CNT_BIN1 (
	.clk(clk),
	.rst(rst),
	.SN(SN_X1),
	.counter(p1)
	);

Counter CNT_BIN2 (
	.clk(clk),
	.rst(rst),
	.SN(SN_X2),
	.counter(p2)
	);
Counter CNT_BIN3 (
	.clk(clk),
	.rst(rst),
	.SN(SN_X3),
	.counter(p3)
	);
Counter CNT_BIN4 (
	.clk(clk),
	.rst(rst),
	.SN(SN_X4),
	.counter(p4)
	);
always @(negedge clk) begin
	Q <= p1 + p2 + p3 + p4;
end

endmodule
