`timescale 1ns / 1ps

module systolic_2x2 #(
    parameter WIDTH = 16,
    parameter FRAC_BIT = 10
)(
    input wire clk, rst_n, en, clr,

    input wire signed [WIDTH-1:0] a0, a1,
    input wire signed [WIDTH-1:0] b00, b01, b10, b11,

    output wire signed [WIDTH-1:0] y0, y1
);

    wire signed [WIDTH-1:0] a00_in, a01_in, a10_in, a11_in;
    wire signed [WIDTH-1:0] a00_out, a01_out, a10_out, a11_out;
    wire signed [WIDTH-1:0] y00_in, y01_in, y10_in, y11_in;
    wire signed [WIDTH-1:0] y0_temp, y1_temp, y00_out, y01_out;
    wire signed [WIDTH-1:0] a1_reg0;
    wire signed [WIDTH-1:0] y0_reg0;
    
    assign y00_in = 0;
    assign y01_in = 0;

    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_00(.a_in(a00_in), .y_in(y00_in), .b(b00), .a_out(a00_out), .y_out(y00_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_01(.a_in(a01_in), .y_in(y01_in), .b(b01), .a_out(a01_out), .y_out(y01_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_10(.a_in(a10_in), .y_in(y10_in), .b(b10), .a_out(a10_out), .y_out(y0_temp));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_11(.a_in(a11_in), .y_in(y11_in), .b(b11), .a_out(a11_out), .y_out(y1_temp));
    
    register #(.WIDTH(WIDTH)) a0_reg0_inst(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a0), .q(a00_in));
    register #(.WIDTH(WIDTH)) a1_reg0_inst(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a1), .q(a1_reg0));
    register #(.WIDTH(WIDTH)) a1_reg1_inst(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a1_reg0), .q(a10_in));

    register #(.WIDTH(WIDTH)) a0_reg1_inst(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a00_out), .q(a01_in));
    register #(.WIDTH(WIDTH)) a1_reg2_inst(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a10_out), .q(a11_in));
    
    register #(.WIDTH(WIDTH)) y0_reg0_inst(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y01_out), .q(y11_in));
    register #(.WIDTH(WIDTH)) y0_reg1_inst(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y0_temp), .q(y0_reg0));
    register #(.WIDTH(WIDTH)) y1_reg0_inst(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y00_out), .q(y10_in));
    
    register #(.WIDTH(WIDTH)) y1_reg1_inst(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y1_temp), .q(y1));
    register #(.WIDTH(WIDTH)) y0_reg2_inst(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y0_reg0), .q(y0));
    
endmodule
