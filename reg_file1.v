`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2025 17:48:02
// Design Name: 
// Module Name: reg_file1
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


module reg_file1(
 input clk, input [3:0] read_reg1, read_reg2, write_reg, output reg [31:0] read_data1, read_data2, input [31:0] write_data, input reg_write

    );
    
     reg [31:0] file [15:0];
   initial begin
    file[0]<=32'h00000000;
    file[1]<=32'h0005671E;  
    file[2]<=32'h00098AAA;
    file[3]<=32'h00000003;
    file[4]<=32'h0000000A;
    file[5]<=32'h00000005;
    file[6]<=32'h000F1234;
    file[7]<=32'h0007660A;
    file[8]<=32'h00000008;
    file[9]<=32'h00000009;
    file[10]<=32'h0000000a;
    file[11]<=32'h0000000b;
    file[12]<=32'h0000000c;
    file[13]<=32'h0000000d;
    file[14]<=32'h0000000e;
    end
    
    
    always@(read_reg1, read_reg2)
    begin
    read_data1<=file[read_reg1];
    read_data2<=file[read_reg2];
    end
    
    always@(write_data)
    begin
    file[write_reg]<=reg_write?write_data:file[write_reg];
    
    
    end

endmodule
