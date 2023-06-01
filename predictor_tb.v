`include "predictor.v"

module predictor_tb;
  // Inputs
  reg request;
  reg result;
  reg clk;
  reg taken;

  // Outputs
  wire prediction;
  // Instantiate the predictor module
  reg enable;

  predictor dut (
    .enable(enable),
    .request(request),
    .result(result),
    .clk(clk),
    .taken(taken),
    .prediction(prediction)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Stimulus
  initial begin
    // Initialize inputs
    enable = 0;
    request = 0;
    result = 0;
    clk = 0;
    taken = 0;

    // Wait for some time
    #10;

    // Request received, not taken
    request = 1;
    taken = 0;
    #5;

    // Request received, not taken
    request = 1;
    taken = 0;
    #5;

// Request received, not taken
    request = 1;
    taken = 0;
    #5;

// Test case 1: Result received
    result = 1;
    #5;
    $display("prediction should be 1 :%b, while enable is 0 :%b", prediction, enable);

    enable = 1'b1;
    #10;

    // Request received, not taken
    request = 1;
    taken = 0;
    #5;

    // Request received, not taken
    request = 1;
    taken = 0;
    #5;

// Request received, not taken
    request = 1;
    taken = 0;
    #5;

// Test case 1: Result received
    result = 1;
    #5;
    $display("prediction should be 0 :%b, while enable is 1 :%b", prediction, enable);

    // End simulation
    $finish;
  end

  initial begin
        $dumpfile("./vcd/predictor.vcd");
        $dumpvars(0, predictor_tb);
    end
endmodule