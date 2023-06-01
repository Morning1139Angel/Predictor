`include "predictor.v"
`include "decoder_8to256.v"
`include "mux256to1.v"

module phtable(
    input[8-1:0] addr,
    input wire request,result, clk, taken,
    output prediction
);
    wire[(1 << 8)-1 :0] predictor_enables;
    wire[(1 << 8)-1 :0] predictor_outputs;

  decoder_8to256 decoder (
    .address(addr),
    .decoded_output(predictor_enables)
  );

    generate
    genvar i;
    for (i = 0; i < ((1 << 8)); i = i + 1) begin
      predictor inst (
        .enable(predictor_enables[i]),
        .request(request),
        .result(result),
        .clk(clk),
        .taken(taken),
        .prediction(predictor_outputs[i])
      );
    end
  endgenerate

  mux256to1 mux(.in(predictor_outputs), .sel(addr), .out(prediction))

endmodule