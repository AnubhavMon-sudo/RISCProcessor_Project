`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.04.2025 16:54:54
// Design Name: 
// Module Name: pipeline_top_module
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


module pipeline_top_module(input clk, reset, output [31:0] write_data_out,  pc_add_out1, ALU_A_out, ALU_B_out, rd1_out, rd2_out, ALU_out1, output ALU_src_out, MR_out, MReg_out, MW_out, EnRW_out, output [1:0] ALU_op_out, output [3:0] read_reg1, output [1:0] FA_out, output FB_out, output [3:0] rs_out, rt_out, rd_out, output [31:0] instrn_out,
output [31:0] ALU_exmem_out
    );
     wire [31:0] read_data_MEMWB_out, ALU_out_MEMWB_out;
 wire [31:0] ALU_out_EXMEM_out;
     wire [3:0] opcode;
     wire [3:0]reg_rd_MEMWB_out;
     wire [1:0] FA;
     wire FB;
    wire ALU_src, MR, MW, MReg, EnRW, ALU_src_IDEX_out, MR_IDEX_out, MW_IDEX_out, MReg_IDEX_out, EnRW_IDEX_out;
    //careful added an extra flip flop to prevent control signals from reaching 1 clk cycle early
    reg MReg_d, MR_d, MW_d, ALU_src_d, EnRW_d;
    reg [3:0] opcode_d;
    wire [3:0] opcode_d1;
    wire MReg_d1, MR_d1, MW_d1, ALU_src_d1, EnRW_d1;
    
//    assign {MReg_d1, MR_d1, MW_d1, ALU_src_d1, EnRW_d1, opcode_d1}={MReg_d, MR_d, MW_d, ALU_src_d, EnRW_d, opcode_d};
    
//    always@(posedge clk)
//    {MReg_d, MR_d, MW_d, ALU_src_d, EnRW_d,  opcode_d}<={MReg, MR, MW, ALU_src, EnRW, opcode};
    
   wire [31:0] pc_out, instrn, pc_add_out,pc_IFID_out, instrn_IFID_out;
   
   PC i1(clk, reset, pc_add_out, pc_out); //correct
   
   instrn_mem i2(clk, pc_out, instrn);
   assign pc_add_out=pc_out+32'h00000004;
   IFID i3(clk, instrn, instrn_IFID_out);
   
   wire [31:0] read_data1, read_data2, write_data, sign_ext_out;
 
   wire EnRW_reg_file_in;
   assign opcode=instrn_IFID_out[31:28];
   
   reg_file1 i4(clk, instrn_IFID_out[23:20], instrn_IFID_out[19:16], instrn_IFID_out[27:24], read_data1, read_data2, write_data, EnRW_reg_file_in);
   
   sign_ext i5(instrn_IFID_out[15:0], sign_ext_out);
   
   wire [31:0] read_data1_IDEX_out, read_data2_IDEX_out, sign_ext_IDEX_out;
   wire [3:0] opcode_IDEX_out;
   //wire ALU_src_IDEX_out, ALU_op_IDEX_out, MR_IDEX_out, MW_IDEX_out, MReg_IDEX_out, EnRW_IDEX_out;
  
   
   control_unit2 v1(opcode, ALU_src, MR, MW, MReg, EnRW);
   //done till here 
   wire [3:0]reg_rd_IDEX_in, reg_rs_IDEX_out, reg_rt_IDEX_out, reg_rd_IDEX_out;
//   reg [3:0] reg_rd_IDEX_delay;
//   always@(posedge clk)
//   reg_rd_IDEX_delay<=instrn_IFID_out[27:24];
   
//   assign reg_rd_IDEX_in=reg_rd_IDEX_delay;
  IDEX v2(clk, MReg, MR, MW, ALU_src, EnRW, opcode, read_data1, read_data2, sign_ext_out, MReg_IDEX_out, MR_IDEX_out, MW_IDEX_out, ALU_src_IDEX_out, EnRW_IDEX_out, opcode_IDEX_out, read_data1_IDEX_out, read_data2_IDEX_out, sign_ext_IDEX_out,instrn_IFID_out[27:24], instrn_IFID_out[23:20], instrn_IFID_out[19:16], reg_rd_IDEX_out, reg_rs_IDEX_out, reg_rt_IDEX_out);
  
     wire [31:0] ALU_A, ALU_B, ALU_out;
     wire [1:0] ALU_op;
     wire zero;
     reg [31:0] w1;
     
     always@(FA, read_data1_IDEX_out, ALU_out_EXMEM_out, ALU_out_MEMWB_out)
     begin
     case(FA)
     2'b00:w1=ALU_out_MEMWB_out;
     2'b01:w1=ALU_out_EXMEM_out;
     default:w1=read_data1_IDEX_out;
     endcase
     end
     
     assign ALU_A=w1;
     
     wire [31:0] FB_mux_in;
//     assign w1=FA[0]?ALU_out_MEMWB_out:ALU_out_EXMEM_out;
//     assign ALU_A=FA[1]?read_data1_IDEX_out:w1;
     assign FB_mux_in=ALU_src_IDEX_out?sign_ext_IDEX_out:read_data2_IDEX_out;
     assign ALU_B=FB?ALU_out_MEMWB_out:FB_mux_in;
     main_alu v3(ALU_A, ALU_B, ALU_out, ALU_op, zero);
     
     ALUControl v4(opcode_IDEX_out, ALU_op);
     
    
     wire [31:0] read_data2_EXMEM_out;
     wire  MReg_EXMEM_out, MR_EXMEM_out, MW_EXMEM_out, EnRW_EXMEM_out, zero_EXMEM_out;
     wire [31:0] read_data;
     wire [3:0]reg_rd_EXMEM_out;
     wire [31:0] write_data_data_mem_in;
     reg [31:0] ALU_out_EXMEM_out_d;
     EXMEM v5(clk, MReg_IDEX_out, MR_IDEX_out, MW_IDEX_out, EnRW_IDEX_out, ALU_out, read_data2_IDEX_out, zero,reg_rd_IDEX_out, ALU_out_EXMEM_out, read_data2_EXMEM_out, MReg_EXMEM_out, MR_EXMEM_out, MW_EXMEM_out, EnRW_EXMEM_out, zero_EXMEM_out,reg_rd_EXMEM_out);
     
     
     
     always@(posedge clk)
     ALU_out_EXMEM_out_d<=ALU_out_EXMEM_out;
     
     assign write_data_data_mem_in=ALU_out_EXMEM_out_d;
     
     data_mem v6(write_data_data_mem_in, ALU_out_EXMEM_out, clk, MR_EXMEM_out, MW_EXMEM_out, read_data);
     
    
     wire MReg_MEMWB_out, EnRW_MEMWB_out;
     
     HazardDetection h1(ALU_src_IDEX_out, reg_rd_IDEX_out, instrn_IFID_out[19:16], instrn_IFID_out[23:20], reg_rd_MEMWB_out, reg_rs_IDEX_out, reg_rt_IDEX_out, reg_rd_EXMEM_out, instrn_IFID_out[27:24], FA, FB);
     
     MEMWB v7(clk, MReg_EXMEM_out, EnRW_EXMEM_out, read_data, ALU_out_EXMEM_out, reg_rd_EXMEM_out, MReg_MEMWB_out, EnRW_MEMWB_out, read_data_MEMWB_out, ALU_out_MEMWB_out, reg_rd_MEMWB_out);
     
     assign write_data=MReg_MEMWB_out?ALU_out_MEMWB_out:read_data_MEMWB_out;
     
     assign EnRW_reg_file_in=EnRW_MEMWB_out;
     
     //tapping below
     
     assign write_data_out=write_data;
     assign pc_add_out1=pc_add_out;
     
     assign ALU_A_out=ALU_A;
     assign ALU_B_out=ALU_B;
     assign ALU_op_out=ALU_op;
     assign {ALU_src_out, MR_out, MW_out, MReg_out, EnRW_out}={ALU_src_IDEX_out, MR, MW, MReg, EnRW_MEMWB_out};
     assign rd1_out=read_data1;
     assign rd2_out=read_data2;
     assign ALU_out1=ALU_out;
     assign read_reg1=instrn_IFID_out[23:20];
     assign instrn_out=instrn_IFID_out;
     assign FA_out=FA;
     assign FB_out=FB;
     
     assign ALU_exmem_out=ALU_out_EXMEM_out;
     assign {rs_out, rd_out, rt_out}={instrn_IFID_out[23:20], instrn_IFID_out[27:24], instrn_IFID_out[19:16]};
endmodule
