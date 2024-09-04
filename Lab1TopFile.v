`timescale 1ns / 1ps

module Lab1TopFile(Reset);

input Reset;

wire Clk, ClkOut;
wire [31:0] PCResult; 
wire [31:0] Instruction;
wire [6:0] out7;
wire [7:0] en_out;
//module InstructionFetchUnit(Instruction, PCResult, Reset, Clk);

 InstructionFetchUnit A(Instruction, PCResult, Reset, ClkOut);

//module ClkDiv(Clk, Rst, ClkOut);

ClkDiv B(Clk, 0, ClkOut);

//module Two4DigitDisplay(Clk, NumberA, NumberB, out7, en_out);

Two4DigitDisplay C(Clk, Instruction, PCResult, out7, en_out);


endmodule
