`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.02.2025 17:22:03
// Design Name: 
// Module Name: main_alu
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


module main_alu(input [31:0] a, b, output reg [31:0] result, input [1:0] ALU_op, output zero

    );
    
    wire [31:0] xnor_out, add_out, and_out, sub_out;
    assign xnor_out=~(a^b);
    assign add_out=a+b;
    assign and_out=a & b;
    assign sub_out=a-b;
    always@(ALU_op, a, b)
    begin
    case(ALU_op)
    2'b00:result=xnor_out;
    2'b01:result=add_out;
    2'b10:result=and_out;
    default:result=sub_out;
    
    endcase
    end
    
    assign zero=result?1'b0:1'b1;
    
endmodule
