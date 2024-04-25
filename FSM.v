`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:12:32 07/09/2020 
// Design Name: 
// Module Name:    FSM 
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
module FSM
(
	input clk,
	input rst,
	output [6:0] FSM
);

/*always @(posedge clk) begin
	if (rst)	FSM <= 0;
	else	FSM <= FSM+1;
end*/

Counter CNT (
	.clk(clk),
	.rst(rst),
	.SN(1'b1),
	.counter(FSM)
	);

endmodule
