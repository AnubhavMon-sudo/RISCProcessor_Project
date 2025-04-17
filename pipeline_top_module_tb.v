`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2025 15:05:13
// Design Name: 
// Module Name: pipeline_top_module_tb
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


module pipeline_top_module_tb(

    );
    
    reg clk, reset;
    wire [31:0] ALU_out_exmem_out, pc_add_out, R_type_out, ALU_A_out, ALU_B_out, rd1, rd2, ALU_out, instrn ;
    wire [3:0] read_reg1, rs, rd, rt;
    wire MR, MW, MReg, ALU_src, EnRW;
    wire [1:0] ALU_op;
    wire [1:0] FA;
    wire FB;
    
    
    pipeline_top_module v1(clk, reset, R_type_out, pc_add_out, ALU_A_out, ALU_B_out, rd1, rd2, ALU_out, ALU_src, MR, MReg, MW, EnRW, ALU_op, read_reg1,FA,FB, rs,rt, rd, instrn, ALU_out_exmem_out);
    
    initial begin
    clk=1'b0;
    repeat(100)
    #10 clk=~clk;
    end
    
    initial begin
    reset=1'b1;
    #12 reset=1'b0;
    #20 reset=1'b1;
    #12 reset=1'b0;
    end

endmodule
