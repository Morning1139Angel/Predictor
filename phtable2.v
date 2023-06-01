module phtable2 (
    input[8-1:0] addr,
    input wire request,result, clk, taken,
    output prediction
);
    reg[1:0] states[(1 << 8)-1:0];

    initial begin
        prediction = 1'b1;
        
        initial begin
            for (i = 0; i < (1 << 8); i = i + 1) begin
                states[i] = 2'b11;
            end
        end
    end

    always @(posedge clk) begin
        if (request) begin
            prediction = state[addr];
        end

        if (result ) begin
            if (taken && state[addr] != 2'b11) begin
                state[addr] = state[addr] + 1 ;
            end
            if (!taken && state[addr] != 2'b00) begin
                state[addr] = state[addr] - 1 ;
            end
        end
    end

endmodule //phtable2