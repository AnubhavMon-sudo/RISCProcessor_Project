`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2025 15:53:06
// Design Name: 
// Module Name: PC
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


module PC(
    input  clk,reset,
    input [31:0] d,
    output reg [31:0] pc
    );
    
    always@(posedge clk)
    begin
    if (reset)
    pc<=32'h00000000;
    else
    pc<=d;
    end
endmodule
