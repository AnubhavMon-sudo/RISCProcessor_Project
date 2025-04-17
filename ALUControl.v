`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2025 05:50:21 PM
// Design Name: 
// Module Name: ALUControl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALUControl(
input [3:0]opcode,
output reg [1:0]AluOp
    );
    
    always @(opcode) begin
    case(opcode) 
    4'b0000:AluOp=2'b00;
    4'b0001:AluOp=2'b01;
    4'b0011:AluOp=2'b01;
    4'b0111:AluOp=2'b10;
    default:AluOp=2'b11;
    endcase
    end
endmodule
