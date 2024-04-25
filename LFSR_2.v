`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    LFSR_2 
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
module LFSR_2
(
	input clk,
	//input rst,
	input [6:0] a,
	output reg [6:0] a_rn = 7'd0
);

always @(posedge clk) begin
	/*if (!rst) begin
		a_rn <= a;
	end
	else begin */
	begin
		a_rn[6:1] <= a_rn[5:0];
		a_rn[0] <= ~(^{a_rn[2],a_rn[0]});
	end
end

endmodule

