`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 1
// Module - ProgramCounter_tb.v
// Description - Test the 'ProgramCounter.v' module.
////////////////////////////////////////////////////////////////////////////////

module ProgramCounter_tb(); 

	reg [31:0] Address;
	reg Reset, Clk;

	wire [31:0] PCResult;

    ProgramCounter u0(
        .Address(Address), 
        .PCResult(PCResult), 
        .Reset(Reset), 
        .Clk(Clk)
    );

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
	
	 // Monitor the values of Address, Reset, Clk, and PCResult for debugging
        $monitor("Time = %0d, Clk = %b, Reset = %b, Address = %h, PCResult = %h", 
                 $time, Clk, Reset, Address, PCResult);
        
        // Initial reset to set PCResult to 0
        Reset <= 1; 
        Address <= 32'h00000000;
        #20; // Wait for 20 time units (2 clock cycles)

        // Release reset and set a new address
        Reset <= 0; 
        Address <= 32'h00000004;
        #20; // Wait for 20 time units (2 clock cycles)

        // Change the address to another value
        Address <= 32'h00000008;
        #20; // Wait for 20 time units (2 clock cycles)

        // Reset the PC again
        Reset <= 1;
        #20; // Wait for 20 time units (2 clock cycles)

        // Release reset and set a new address
        Reset <= 0;
        Address <= 32'h00000010;
        #20; // Wait for 20 time units (2 clock cycles)

        // Apply another address to check normal operation
        Address <= 32'h00000014;
        #40; // Wait for 40 time units (4 clock cycles)

        // Test complete, end simulation
        $finish;
	
	end

endmodule

