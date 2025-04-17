`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2025 20:13:14
// Design Name: 
// Module Name: data_mem
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


module data_mem(
    input [31:0] write_data_mem, address, input clk, mem_read, mem_write,
    output reg [31:0] read_data
    );
    
     reg [16:0] data_mem [23:0];
     
     
      initial begin
     data_mem[0]<=32'h00000000;
     data_mem[1]<=32'h00000000;
     data_mem[2]<=32'h00000000;
     data_mem[3]<=32'h00000000;
     data_mem[4]<=32'h00000000;
     data_mem[5]<=32'h00000000;
     data_mem[6]<=32'h00000000;
     data_mem[7]<=32'h00000000;
     data_mem[8]<=32'h00000000;
     data_mem[9]<=32'h00000000;
     data_mem[10]<=32'h00000000;
     data_mem[11]<=32'h00000000;
     data_mem[12]<=32'h00000000;
     data_mem[13]<=32'h00000000;
     data_mem[14]<=32'h00000000;
     data_mem[15]<=32'h00000000;
     data_mem[16]<=32'h00000000;
     
    end
    
    always@(address, write_data_mem)
    begin
    
    read_data<=mem_read?data_mem[address]:read_data;
    data_mem[address]<=mem_write?write_data_mem:data_mem[address];
    end
    
    
    
endmodule
