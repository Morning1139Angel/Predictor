# VerilogPredictor

```bash
iverilog -o vvp/predictor.vvp predictor_tb.v
vvp vvp/predictor.vvp
gtkwave vcd/predictor.vcd


iverilog -o vvp/decoder_8to256.vpp decoder_8to256_tb.v
vvp vvp vvp/decoder_8to256.vvp 
```