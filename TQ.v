`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:16:57 03/02/2021 
// Design Name: 
// Module Name:    TQ 
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
module TQ
(
	input clk,
	input rst,
	input T,
	output reg Q
);

always @(posedge clk) begin
	if (rst)	Q <= 0;
	else if (T)	Q <= ~Q;
end

endmodule
