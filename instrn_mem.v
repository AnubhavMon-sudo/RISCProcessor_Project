`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.02.2025 16:12:23
// Design Name: 
// Module Name: instrn_mem
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


module instrn_mem(
    input clk, input [31:0] address,
    output reg [31:0] instrn
    );
    
    wire [7:0] instrn_mem [23:0];
   
    
    assign instrn_mem[0]=8'h03;
    assign instrn_mem[1]=8'h21;
    assign instrn_mem[2]=8'h00;
    assign instrn_mem[3]=8'h00;
    assign instrn_mem[4]=8'h10;
    assign instrn_mem[5]=8'h43;
    assign instrn_mem[6]=8'h00;
    assign instrn_mem[7]=8'h06;
    assign instrn_mem[8]=8'h35;
    assign instrn_mem[9]=8'h30;
    assign instrn_mem[10]=8'he5;
    assign instrn_mem[11]=8'h71;
    assign instrn_mem[12]=8'h78;
    assign instrn_mem[13]=8'h76;
    assign instrn_mem[14]=8'h00;
    assign instrn_mem[15]=8'h00;
     assign instrn_mem[16]=8'hf9;
    assign instrn_mem[17]=8'h85;
    assign instrn_mem[18]=8'h00;
    assign instrn_mem[19]=8'h00;
    
    always@(address)
        begin
            
           instrn<={instrn_mem[address%20], instrn_mem[(address+1)%20], instrn_mem[(address+2)%20], instrn_mem[(address+3)%20]};
             
        end     
endmodule
