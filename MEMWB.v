`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2025 12:10:21
// Design Name: 
// Module Name: MEMWB
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


module MEMWB(input clk, MReg_in, EnRW_in, input [31:0] read_data_in, ALU_out_in, input [3:0] reg_rd_in, output reg MReg_out, EnRW_out, output reg [31:0] read_data_out, ALU_out_out, output reg [3:0] reg_rd_out

    );
    always@(posedge clk)
    
    {MReg_out, EnRW_out, read_data_out, ALU_out_out, reg_rd_out}<={MReg_in, EnRW_in, read_data_in, ALU_out_in, reg_rd_in};
endmodule
