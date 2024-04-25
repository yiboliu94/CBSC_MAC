`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:07:08 07/24/2020 
// Design Name: 
// Module Name:    CBSC_SNG 
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
module CBSC_SNG
(
	input clk,
	input rst,
	input [6:0] x,
	//input EN,
	output reg x_sn 	
);

reg [6:0] FSM = 7'd0;
always @(posedge clk or negedge rst) begin
	if (!rst)	FSM <= 7'd0;
	else begin
		FSM <= FSM+1;
	end
end

always @(posedge clk or negedge rst) begin  // Counter-Based pattern SNG
	if (!rst)	x_sn <= 1'b0;
	else begin
		x_sn <= (x[6]&(!FSM[0])) | (x[5]&(!FSM[1])&(FSM[0])) | (x[4]&(!FSM[2])&(FSM[1])&(FSM[0])) | (x[3]&(!FSM[3])&(FSM[2])&(FSM[1])&(FSM[0])) | (x[2]&(!FSM[4])&(FSM[3])&(FSM[2])&(FSM[1])&(FSM[0]))  | (x[1]&(!FSM[5])&(FSM[4])&(FSM[3])&(FSM[2])&(FSM[1])&(FSM[0])) | (x[0]&(!FSM[6])&(FSM[5])&(FSM[4])&(FSM[3])&(FSM[2])&(FSM[1])&(FSM[0]));
	end
end

endmodule
