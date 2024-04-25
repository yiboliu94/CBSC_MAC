`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:19:39 03/02/2021 
// Design Name: 
// Module Name:    Counter 
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
module Counter // carry chain
(
	input clk,
	input rst,
	input SN,  // stochastic number bit input
	output [7:0] counter
);

TQ T0 (
	.clk(clk),
	.rst(rst),
	.T(SN),
	.Q(counter[0])
	);

TQ T1 (
	.clk(clk),
	.rst(rst),
	.T(counter[0]&SN),
	.Q(counter[1])
	);

TQ T2 (
	.clk(clk),
	.rst(rst),
	.T(counter[1]&(counter[0]&SN)),
	.Q(counter[2])
	);

TQ T3 (
	.clk(clk),
	.rst(rst),
	.T(counter[2]&(counter[1]&(counter[0]&SN))),
	.Q(counter[3])
	);

TQ T4 (
	.clk(clk),
	.rst(rst),
	.T(counter[3]&(counter[2]&(counter[1]&(counter[0]&SN)))),
	.Q(counter[4])
	);

TQ T5 (
	.clk(clk),
	.rst(rst),
	.T(counter[4]&(counter[3]&(counter[2]&(counter[1]&(counter[0]&SN))))),
	.Q(counter[5])
	);

TQ T6 (
	.clk(clk),
	.rst(rst),
	.T(counter[5]&(counter[4]&(counter[3]&(counter[2]&(counter[1]&(counter[0]&SN)))))),
	.Q(counter[6])
	);

TQ T7 (
	.clk(clk),
	.rst(rst),
	.T(counter[6]&(counter[5]&(counter[4]&(counter[3]&(counter[2]&(counter[1]&(counter[0]&SN))))))),
	.Q(counter[7])
	);


endmodule
