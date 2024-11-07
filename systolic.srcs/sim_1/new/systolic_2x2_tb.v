`timescale 1ns / 1ps

module systolic_2x2_tb;

    localparam T_CLK = 10;
    localparam WIDTH = 16;
    localparam FRAC_BIT = 10;
    
    reg clk, rst_n, en, clr;

    reg signed [WIDTH-1:0] a0, a1;
    reg signed [WIDTH-1:0] b00, b01, b10, b11;
    
    wire signed [WIDTH-1:0] y0, y1;

    systolic_2x2 #(
        .WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)
    ) systolic_2x2_inst (
        .clk(clk), .rst_n(rst_n), .en(en), .clr(clr),
        .a0(a0), .a1(a1),
        .b00(b00), .b01(b01), .b10(b10), .b11(b11),
        .y0(y0), .y1(y1)
    );

    always begin
        clk = 0;
        #(T_CLK/2);
        clk = 1;
        #(T_CLK/2);
    end
    
    initial begin
        clk = 0; rst_n = 0; en = 0; clr = 1;
        #(T_CLK);

        rst_n = 1; clr = 0;
        #(T_CLK);

        en = 1;

        b00 = 16'h0400; // 1.0
        b01 = 16'h0800; // 2.0
        b10 = 16'h0C00; // -0.5
        b11 = 16'h1000; // 1.5

        a0 = 16'h0399; // 0.9
        a1 = 16'h0800; // 2.0
        #(T_CLK);

        a0 = 16'h0C00; // -0.5
        a1 = 16'h1000; // 1.5
        #(T_CLK);

        a0 = 0;
        a1 = 0;
        #(T_CLK*5);

        $stop;

    end

endmodule
