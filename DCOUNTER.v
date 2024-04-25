`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:59:09 10/13/2021 
// Design Name: 
// Module Name:    DCOUNTER 
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
module DCOUNTER
(
	input clk,
	input rst,
	input [7:0] init,
	input EN,  // enable signal
	output [7:0] counter
);

DTQ T0 (
	.clk(clk),
	.rst(rst),
	.ini(init[0]),
	.T(EN),
	.Q(counter[0])
	);

DTQ T1 (
	.clk(clk),
	.rst(rst),
	.ini(init[1]),
	.T((~counter[0])&EN),
	.Q(counter[1])
	);

DTQ T2 (
	.clk(clk),
	.rst(rst),
	.ini(init[2]),
	.T((~counter[1])&((~counter[0])&EN)),
	.Q(counter[2])
	);

DTQ T3 (
	.clk(clk),
	.rst(rst),
	.ini(init[3]),
	.T((~counter[2])&(~counter[1])&((~counter[0])&EN)),
	.Q(counter[3])
	);

DTQ T4 (
	.clk(clk),
	.rst(rst),
	.ini(init[4]),
	.T((~counter[3])&(~counter[2])&(~counter[1])&((~counter[0])&EN)),
	.Q(counter[4])
	);

DTQ T5 (
	.clk(clk),
	.rst(rst),
	.ini(init[5]),
	.T((~counter[4])&(~counter[3])&(~counter[2])&(~counter[1])&((~counter[0])&EN)),
	.Q(counter[5])
	);

DTQ T6 (
	.clk(clk),
	.rst(rst),
	.ini(init[6]),
	.T((~counter[5])&(~counter[4])&(~counter[3])&(~counter[2])&(~counter[1])&((~counter[0])&EN)),
	.Q(counter[6])
	);

DTQ T7 (
	.clk(clk),
	.rst(rst),
	.ini(init[7]),
	.T((~counter[6])&(~counter[5])&(~counter[4])&(~counter[3])&(~counter[2])&(~counter[1])&((~counter[0])&EN)),
	.Q(counter[7])
	);

endmodule
