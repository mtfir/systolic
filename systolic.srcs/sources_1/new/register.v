`timescale 1ns / 1ps

module register #(
    parameter WIDTH = 16
)(
    input wire clk, rst_n, en, clr,
    input signed [WIDTH-1:0] d,
    
    output reg signed [WIDTH-1:0] q
);

    always @(posedge clk) begin
        if (!rst_n || clr) begin
            q <= {WIDTH{1'b0}};
        end else if (en) begin
            q <= d;
        end
    end


endmodule
