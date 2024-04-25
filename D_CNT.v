`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:16:55 10/07/2021 
// Design Name: 
// Module Name:    D_CNT 
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
module D_CNT
(
	input clk,
	input rst,
	input [7:0] w,
	output reg STOP
);

wire [7:0] ini;	// initial value of the counter
/*always @(posedge clk) begin
	if (rst)	ini <= w;
	else if (!STOP)	ini <= ini-1;
end*/

DCOUNTER DCNT (
	.clk(clk),
	.rst(rst),
	.init(w),
	.EN(~STOP),
	.counter(ini)
	);

always @(negedge clk) begin
	if (rst)	STOP <= 1'b0;
	else if (ini == 0)	STOP <= 1'b1;
end

endmodule
