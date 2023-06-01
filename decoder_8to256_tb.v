`include "decoder_8to256.v"

module decoder_8to256_tb;

  reg [7:0] address;
  wire [255:0] decoded_output;

  decoder_8to256 dut (
    .address(address),
    .decoded_output(decoded_output)
  );

  initial begin
    // Initialize inputs
    address = 8'b0;

    // Test case 1: Address 5
    address = 8'b00000101;
    #10; // Delay for some time
    $display("Address: %b, Decoded Output: %b", address, decoded_output);

    // Test case 2: Address 130
    address = 8'b10000010;
    #10; // Delay for some time
    $display("Address: %b, Decoded Output: %b", address, decoded_output);

    // Add more test cases if needed

    // End simulation
    $finish;
  end

endmodule
