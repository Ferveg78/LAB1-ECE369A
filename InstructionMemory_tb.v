`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 
// Module - InstructionMemory_tb.v
// Description - Test the 'InstructionMemory_tb.v' module.
////////////////////////////////////////////////////////////////////////////////

module InstructionMemory_tb(); 

    wire [31:0] Instruction;

    reg [31:0] Address;

	InstructionMemory u0(
		.Address(Address),
        .Instruction(Instruction)
	);

	initial begin
	
   // Monitor the values of Address and Instruction for debugging
        $monitor("Time = %0d, Address = %h, Instruction = %h", $time, Address, Instruction);

        // Test case 1: Address = 0 (should read memory[0] = 0 * 3 = 0)
        Address = 32'h00000000;
        #100; // Wait for 10 time units

        // Test case 2: Address = 4 (should read memory[1] = 1 * 3 = 3)
        Address = 32'h00000004;
        #100; // Wait for 10 time units

        // Test case 3: Address = 8 (should read memory[2] = 2 * 3 = 6)
        Address = 32'h00000008;
        #100; // Wait for 10 time units

        // Test case 4: Address = 20 (should read memory[5] = 5 * 3 = 15)
        Address = 32'h00000014;
        #100; // Wait for 10 time units

        // Test case 5: Address = 124 (should read memory[31] = 31 * 3 = 93)
        Address = 32'h0000007C;
        #100; // Wait for 10 time units

        // Test case 6: Address with non-aligned value (should read memory[2] = 2 * 3 = 6)
        Address = 32'h0000000A;  // Address with non-zero lower two bits
        #100; // Wait for 10 time units

        // Test case 7: Maximum valid address (should read memory[127] = 127 * 3 = 381)
        Address = 32'h000001FC;
        #100; // Wait for 10 time units

        // End simulation
        $finish;
	
	end

endmodule

