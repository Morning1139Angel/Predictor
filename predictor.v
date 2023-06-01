module predictor(input wire enable, request, result, clk, taken, output reg prediction);
    reg[1:0] state;

    initial begin
        prediction = 1'b1;
        state = 2'b11;
    end

    always @(posedge clk) begin
        if (enable && request) begin
            prediction = state[1];
        end

        if (enable && result ) begin
            if (taken && state != 2'b11) begin
                state = state + 1 ;
            end
            if (!taken && state != 2'b00) begin
                state = state - 1 ;
            end
        end
    end
endmodule