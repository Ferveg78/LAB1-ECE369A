`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 1 
// Module - PCAdder_tb.v
// Description - Test the 'PCAdder.v' module.
////////////////////////////////////////////////////////////////////////////////

module PCAdder_tb();

    reg [31:0] PCResult;          // Declare a 32-bit register to hold the PC input
    wire [31:0] PCAddResult;      // Declare a 32-bit wire to hold the PC + 4 output

    // Instantiate the PCAdder module
    PCAdder u0(.PCResult(PCResult), .PCAddResult(PCAddResult));

	initial begin
		// Initialize PCResult with different test values and check PCAddResult
        $monitor("Time = %0d, PCResult = %h, PCAddResult = %h", $time, PCResult, PCAddResult);
        
        // Test case 1: Initial value of PCResult = 0
        PCResult = 32'h00000000;
        #10; // Wait for 10 time units

        // Test case 2: PCResult = 4
        PCResult = 32'h00000004;
        #10; // Wait for 10 time units

        // Test case 3: PCResult = 32
        PCResult = 32'h00000020;
        #10; // Wait for 10 time units

        // Test case 4: PCResult = Max unsigned 32-bit integer
        PCResult = 32'hFFFFFFFF;
        #10; // Wait for 10 time units

        // Test case 5: PCResult = Some random value
        PCResult = 32'h12345678;
        #10; // Wait for 10 time units

        // End simulation
        $finish;
	end

endmodule

