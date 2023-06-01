module decoder_8to256 (
  input [7:0] address,
  output [255:0] decoded_output
);
  generate
    genvar i;
    for (i = 0; i < 256; i = i + 1) begin
      assign decoded_output[i] = (address == i) ? 1'b1 : 1'b0;
    end
  endgenerate
endmodule