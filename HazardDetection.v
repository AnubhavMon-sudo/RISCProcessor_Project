`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2025 06:53:16 PM
// Design Name: 
// Module Name: HazardDetection
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


module HazardDetection(
input ALU_src, input [3:0]IDEX_rd, IFID_rt,IFID_rs,MEMWB_rd,IDEX_rs,IDEX_rt,EXMEM_rd, IFID_rd,
output reg [1:0]FA, output reg FB
    );
    wire [3:0]w1;
    //wire cond1, cond2, w4;
    wire w5,w6,w7;
    
//    assign w1= ~(IDEX_rd^IFID_rd);//correct
    
//    assign FB=w1[3]& w1[2] & w1[1] & w1[0]; //correct
    
    reg cond1;
    reg cond2, condn1;
    
    always@(MEMWB_rd, EXMEM_rd, IDEX_rt, IDEX_rs)
    begin
    condn1=(MEMWB_rd==IDEX_rt);
    if (condn1 && ~ALU_src)
    FB<=1'b1;
    else
    FB<=1'b0;
    end
   
    always @(MEMWB_rd,IDEX_rs,IDEX_rt,EXMEM_rd) begin
    cond1=(MEMWB_rd == IDEX_rs) ;
    cond2=(EXMEM_rd == IDEX_rs);
    if (cond1)
    FA <= 2'b00;
    else if (cond2)
    FA <= 2'b01;
    else
    FA <= 2'b10;
    end
    
endmodule
