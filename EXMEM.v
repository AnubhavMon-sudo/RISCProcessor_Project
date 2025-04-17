`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2025 18:10:41
// Design Name: 
// Module Name: EXMEM
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


module EXMEM(input clk, input MReg_in, MR_in, MW_in, EnRW_in,
    input [31:0] ALU_out_in, rd2_in,
    input zero_in,
    input [3:0]reg_rd_in,
    output reg [31:0] ALU_out_out, rd2_out, output reg MReg_out, MR_out, MW_out, EnRW_out, output reg zero_out,
    output reg [3:0]reg_rd_out );
    
  always@(posedge clk)
    {MReg_out, MR_out, MW_out, EnRW_out, zero_out, ALU_out_out, rd2_out,reg_rd_out}<={MReg_in, MR_in, MW_in, EnRW_in, zero_in, ALU_out_in, rd2_in,reg_rd_in};
endmodule
