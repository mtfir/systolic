`timescale 1ns / 1ps

module pe #(
    parameter WIDTH = 16,
    parameter FRAC_BIT = 10
)(
    input wire signed [WIDTH-1:0] a_in,
    input wire signed [WIDTH-1:0] y_in,
    input wire signed [WIDTH-1:0] b,
    
    output wire signed [WIDTH-1:0] a_out,
    output wire signed [WIDTH-1:0] y_out
);

    assign a_out = a_in;
    wire signed [(2*WIDTH)-1:0] product = a_in * b;
    wire signed [WIDTH-1:0] y_out_i = product >>> FRAC_BIT;
    assign y_out = y_out_i + y_in;

endmodule