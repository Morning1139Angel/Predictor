module predictor(input wire request, result, clk, taken, output reg prediction);
    reg[1:0] state;

    initial begin
        state = 2'b00;
    end

    always @(posedge clk) begin
        if (result) begin
            prediction = state[1];
        end

        if (request ) begin
            if (taken && state != 2'b11) begin
                state = state + 1 ;
            end
            if (!taken && state != 2'b00) begin
                state = state - 1 ;
            end
        end
    end
endmodule