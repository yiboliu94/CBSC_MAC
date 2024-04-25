`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:26:58 10/13/2021 
// Design Name: 
// Module Name:    DTQ 
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
module DTQ
(
	input clk,
	input rst,
	input ini,
	input T,
	output reg Q
);

always @(posedge clk) begin
	if (rst)	Q <= ini;
	else if (T)	Q <= ~Q;
end

endmodule