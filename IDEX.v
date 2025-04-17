`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2025 18:10:41
// Design Name: 
// Module Name: IDEX
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


module IDEX (input clk, input MReg, MR, MW, ALU_src, EnRW,input [3:0] opcode,
    input [31:0] rd1_in, rd2_in, sign_ext_in, output reg MReg_IDEX_out, MR_IDEX_out, MW_IDEX_out, ALU_src_IDEX_out, EnRW_IDEX_out, output reg [3:0] opcode_out,
    output reg [31:0] rd1_out, rd2_out, sign_ext_out,
    input [3:0] reg_rd_in, reg_rs_in, reg_rt_in,
    output reg [3:0] reg_rd_out, reg_rs_out, reg_rt_out
    );
    always@(posedge clk)
    {MReg_IDEX_out, MR_IDEX_out, MW_IDEX_out, ALU_src_IDEX_out, EnRW_IDEX_out, opcode_out, rd1_out, rd2_out, sign_ext_out,reg_rs_out, reg_rt_out, reg_rd_out}<={MReg, MR, MW, ALU_src, EnRW, opcode, rd1_in, rd2_in, sign_ext_in,reg_rs_in, reg_rt_in,reg_rd_in};
endmodule
