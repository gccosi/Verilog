
`timescale 1ns/1ps
module tb_runge_kutta;
  reg clk = 0;
  reg rst = 0;
  reg start = 0;
  wire [63:0] GERVACIO;
  runge_kutta uut (
    .clk(clk),
    .rst(rst),
    .start(start),
    .GERVACIO(GERVACIO)
  );
  always begin
    #1 clk = ~clk;
  end
  initial begin
    $dumpfile("tb_runge_kutta.vcd");
    $dumpvars(0,tb_runge_kutta); 
    rst = 1;
    start = 0;
    #1 rst = 0;start=1;
    #15 $finish;
  end
  always @(posedge clk) begin
    $display("Resultado: %f", $bitstoreal(GERVACIO));
  end
endmodule
