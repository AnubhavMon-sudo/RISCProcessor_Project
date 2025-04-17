`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2025 19:44:07
// Design Name: 
// Module Name: control_unit2
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


module control_unit2(
    input [3:0] opcode, 
    
//    output reg PCWrite,
//    output IFIDWrite,
//    output ST,
    output reg ALU_src,
 //   output reg [1:0] ALU_op,
    output reg MR,
    output reg MW,
    output reg MReg,
    output reg EnRW
//    output FA,
//    output FB

    );
    
    always@(opcode)
    begin
    case(opcode)
    4'b0000:{ALU_src,  MR, MW, MReg, EnRW}={1'b0, 1'b0, 1'b0, 1'b1, 1'b1};
    4'b0001:{ALU_src,  MR, MW, MReg, EnRW}={1'b1,  1'b0, 1'b1, 1'b1, 1'b0};
    4'b0011:{ALU_src,  MR, MW, MReg, EnRW}={1'b1,  1'b0, 1'b0, 1'b1, 1'b1};
    4'b0111:{ALU_src,  MR, MW, MReg, EnRW}={1'b0,  1'b0, 1'b0, 1'b1, 1'b1};
    default:{ALU_src,  MR, MW, MReg, EnRW}={1'b0,  1'b0, 1'b0, 1'b1, 1'b1};
    endcase
    end
endmodule
