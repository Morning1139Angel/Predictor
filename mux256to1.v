module mux256to1( 
    input [(1 << 8)-1 :0] in,
    input [8-1:0] sel,
    output out );
    
    assign out = in[sel];

endmodule