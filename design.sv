// Code your design here
`timescale 1ns/1ps
module runge_kutta(
    input wire clk,
    input wire rst,
    input wire start,
  output reg [63:0] GERVACIO
);
real h = 0.1;
real y = 1.0;
real t = 0.0;
real k1, k2, k3, k4;
always @(posedge clk or posedge rst) begin
    if (rst) begin
        y <= 1.0;
        t <= 0.0;
        GERVACIO <= 0;
    end else begin
      if (start) begin
        
        k1 <= h * (2*t * y);
        k2 <= h * (2*(t + h/2) * (y + k1/2));
        k3 <= h * (2*(t + h/2) * (y + k2/2));
        k4 <= h * (2*(t + h) * (y + k3));
        #2
       y <= y + (k1 + 2*k2 + 2*k3 + k4) / 6;
            
        GERVACIO <= $realtobits(y);//$rtoi(y * 65536); //real a entero A 16 bits
        t <= t + h;
        end
    end
end

endmodule
