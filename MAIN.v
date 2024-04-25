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
	input [6:0] BN_X, //input 7bit binary number for SC multiplication, which is CBSC multiplication input x
    input [6:0] BN_Y, ////input 7bit binary number for SC multiplication, which is CBSC multiplication input w
    input BN_Z, //input BN for BN_addition, from other MAC.
	//input sel,  //deprecated input mux_selection when we generate it inside by LFSR.
	output reg [6:0] Q    // Q is the sum_output, in BN.
);


// convert input BN_X to SN_X
	wire [6:0] FSM;    //FSM is name of a module and port- this may not be allowed
FSM FSM_0 (
	.clk(clk),
	.rst(rst),
	.FSM(FSM)
	);
wire SN_X;
CBSC_SNG SNG_1 (
	.clk(clk),
	.rst(rst),
	.x(BN_X),
	.x_sn(SN_X)
	);


	
// initial Counter by input w for SC multiplication
reg STOP;
D_CNT down_cnt (
	.clk(clk),
	.rst(rst),
	.w(BN_Y),
	.STOP(STOP)
	);
// Conduct CBSC multiplicatio by down counter
Counter CNT_BIN (
	.clk(clk),
	.rst(rst),
	.SN(x_SN),
	.counter(p)
	);


always @(negedge clk) begin
	Q <= p + BN_Z;
end

endmodule
