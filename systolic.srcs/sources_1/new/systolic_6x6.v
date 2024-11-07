`timescale 1ns / 1ps

module systolic_6x6 #(
    parameter WIDTH = 16,
    parameter FRAC_BIT = 10
)(
    input wire clk, rst_n, en, clr,

    input wire signed [WIDTH-1:0] a0, a1, a2, a3, a4, a5,
    input wire signed [WIDTH-1:0] b00, b01, b02, b03, b04, b05,
    input wire signed [WIDTH-1:0] b10, b11, b12, b13, b14, b15,
    input wire signed [WIDTH-1:0] b20, b21, b22, b23, b24, b25,
    input wire signed [WIDTH-1:0] b30, b31, b32, b33, b34, b35,
    input wire signed [WIDTH-1:0] b40, b41, b42, b43, b44, b45,
    input wire signed [WIDTH-1:0] b50, b51, b52, b53, b54, b55,

    output wire signed [WIDTH-1:0] y0, y1, y2, y3, y4, y5
);
    
    wire signed [WIDTH-1:0] a00_in, a01_in, a02_in, a03_in, a04_in, a05_in;
    wire signed [WIDTH-1:0] a10_in, a11_in, a12_in, a13_in, a14_in, a15_in;
    wire signed [WIDTH-1:0] a20_in, a21_in, a22_in, a23_in, a24_in, a25_in;
    wire signed [WIDTH-1:0] a30_in, a31_in, a32_in, a33_in, a34_in, a35_in;
    wire signed [WIDTH-1:0] a40_in, a41_in, a42_in, a43_in, a44_in, a45_in;
    wire signed [WIDTH-1:0] a50_in, a51_in, a52_in, a53_in, a54_in, a55_in;
    
    wire signed [WIDTH-1:0] a00_out, a01_out, a02_out, a03_out, a04_out, a05_out;
    wire signed [WIDTH-1:0] a10_out, a11_out, a12_out, a13_out, a14_out, a15_out;
    wire signed [WIDTH-1:0] a20_out, a21_out, a22_out, a23_out, a24_out, a25_out;
    wire signed [WIDTH-1:0] a30_out, a31_out, a32_out, a33_out, a34_out, a35_out;
    wire signed [WIDTH-1:0] a40_out, a41_out, a42_out, a43_out, a44_out, a45_out;
    wire signed [WIDTH-1:0] a50_out, a51_out, a52_out, a53_out, a54_out, a55_out;
    
    wire signed [WIDTH-1:0] y00_in, y01_in, y02_in, y03_in, y04_in, y05_in;
    wire signed [WIDTH-1:0] y10_in, y11_in, y12_in, y13_in, y14_in, y15_in;
    wire signed [WIDTH-1:0] y20_in, y21_in, y22_in, y23_in, y24_in, y25_in;
    wire signed [WIDTH-1:0] y30_in, y31_in, y32_in, y33_in, y34_in, y35_in;
    wire signed [WIDTH-1:0] y40_in, y41_in, y42_in, y43_in, y44_in, y45_in;
    wire signed [WIDTH-1:0] y50_in, y51_in, y52_in, y53_in, y54_in, y55_in;
    
    wire signed [WIDTH-1:0] y00_out, y01_out, y02_out, y03_out, y04_out, y05_out;
    wire signed [WIDTH-1:0] y10_out, y11_out, y12_out, y13_out, y14_out, y15_out;
    wire signed [WIDTH-1:0] y20_out, y21_out, y22_out, y23_out, y24_out, y25_out;
    wire signed [WIDTH-1:0] y30_out, y31_out, y32_out, y33_out, y34_out, y35_out;
    wire signed [WIDTH-1:0] y40_out, y41_out, y42_out, y43_out, y44_out, y45_out;
    wire signed [WIDTH-1:0] y50_out, y51_out, y52_out, y53_out, y54_out, y55_out;
    
    // INPUT Y0x BERNILAI 0
    assign y00_in = 0;
    assign y01_in = 0;
    assign y02_in = 0;
    assign y03_in = 0;
    assign y04_in = 0;
    assign y05_in = 0;
    
    // PROCESSING ELEMENT
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_00(.a_in(a00_in), .y_in(y00_in), .b(b00), .a_out(a00_out), .y_out(y00_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_01(.a_in(a01_in), .y_in(y01_in), .b(b01), .a_out(a01_out), .y_out(y01_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_02(.a_in(a02_in), .y_in(y02_in), .b(b02), .a_out(a02_out), .y_out(y02_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_03(.a_in(a03_in), .y_in(y03_in), .b(b03), .a_out(a03_out), .y_out(y03_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_04(.a_in(a04_in), .y_in(y04_in), .b(b04), .a_out(a04_out), .y_out(y04_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_05(.a_in(a05_in), .y_in(y05_in), .b(b05), .a_out(a05_out), .y_out(y05_out));
    
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_10(.a_in(a10_in), .y_in(y10_in), .b(b10), .a_out(a10_out), .y_out(y10_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_11(.a_in(a11_in), .y_in(y11_in), .b(b11), .a_out(a11_out), .y_out(y11_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_12(.a_in(a12_in), .y_in(y12_in), .b(b12), .a_out(a12_out), .y_out(y12_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_13(.a_in(a13_in), .y_in(y13_in), .b(b13), .a_out(a13_out), .y_out(y13_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_14(.a_in(a14_in), .y_in(y14_in), .b(b14), .a_out(a14_out), .y_out(y14_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_15(.a_in(a15_in), .y_in(y15_in), .b(b15), .a_out(a15_out), .y_out(y15_out));
    
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_20(.a_in(a20_in), .y_in(y20_in), .b(b20), .a_out(a20_out), .y_out(y20_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_21(.a_in(a21_in), .y_in(y21_in), .b(b21), .a_out(a21_out), .y_out(y21_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_22(.a_in(a22_in), .y_in(y22_in), .b(b22), .a_out(a22_out), .y_out(y22_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_23(.a_in(a23_in), .y_in(y23_in), .b(b23), .a_out(a23_out), .y_out(y23_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_24(.a_in(a24_in), .y_in(y24_in), .b(b24), .a_out(a24_out), .y_out(y24_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_25(.a_in(a25_in), .y_in(y25_in), .b(b25), .a_out(a25_out), .y_out(y25_out));
    
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_30(.a_in(a30_in), .y_in(y30_in), .b(b30), .a_out(a30_out), .y_out(y30_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_31(.a_in(a31_in), .y_in(y31_in), .b(b31), .a_out(a31_out), .y_out(y31_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_32(.a_in(a32_in), .y_in(y32_in), .b(b32), .a_out(a32_out), .y_out(y32_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_33(.a_in(a33_in), .y_in(y33_in), .b(b33), .a_out(a33_out), .y_out(y33_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_34(.a_in(a34_in), .y_in(y34_in), .b(b34), .a_out(a34_out), .y_out(y34_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_35(.a_in(a35_in), .y_in(y35_in), .b(b35), .a_out(a35_out), .y_out(y35_out));
    
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_40(.a_in(a40_in), .y_in(y40_in), .b(b40), .a_out(a40_out), .y_out(y40_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_41(.a_in(a41_in), .y_in(y41_in), .b(b41), .a_out(a41_out), .y_out(y41_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_42(.a_in(a42_in), .y_in(y42_in), .b(b42), .a_out(a42_out), .y_out(y42_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_43(.a_in(a43_in), .y_in(y43_in), .b(b43), .a_out(a43_out), .y_out(y43_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_44(.a_in(a44_in), .y_in(y44_in), .b(b44), .a_out(a44_out), .y_out(y44_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_45(.a_in(a45_in), .y_in(y45_in), .b(b45), .a_out(a45_out), .y_out(y45_out));
    
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_50(.a_in(a50_in), .y_in(y50_in), .b(b50), .a_out(a50_out), .y_out(y50_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_51(.a_in(a51_in), .y_in(y51_in), .b(b51), .a_out(a51_out), .y_out(y51_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_52(.a_in(a52_in), .y_in(y52_in), .b(b52), .a_out(a52_out), .y_out(y52_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_53(.a_in(a53_in), .y_in(y53_in), .b(b53), .a_out(a53_out), .y_out(y53_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_54(.a_in(a54_in), .y_in(y54_in), .b(b54), .a_out(a54_out), .y_out(y54_out));
    pe #(.WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)) pe_55(.a_in(a55_in), .y_in(y55_in), .b(b55), .a_out(a55_out), .y_out(y55_out));
    
    //REGISTER A
    register #(.WIDTH(WIDTH)) reg_a0_1(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a0), .q(a00_in));
    
    wire signed [WIDTH-1:0] a1_1;
    register #(.WIDTH(WIDTH)) reg_a1_1(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a1), .q(a1_1));
    register #(.WIDTH(WIDTH)) reg_a1_2(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a1_1), .q(a10_in));
    
    wire signed [WIDTH-1:0] a2_1, a2_2;
    register #(.WIDTH(WIDTH)) reg_a2_1(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a2), .q(a2_1));
    register #(.WIDTH(WIDTH)) reg_a2_2(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a2_1), .q(a2_2));
    register #(.WIDTH(WIDTH)) reg_a2_3(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a2_2), .q(a20_in));
    
    wire signed [WIDTH-1:0] a3_1, a3_2, a3_3;
    register #(.WIDTH(WIDTH)) reg_a3_1(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a3), .q(a3_1));
    register #(.WIDTH(WIDTH)) reg_a3_2(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a3_1), .q(a3_2));
    register #(.WIDTH(WIDTH)) reg_a3_3(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a3_2), .q(a3_3));
    register #(.WIDTH(WIDTH)) reg_a3_4(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a3_3), .q(a30_in));
    
    wire signed [WIDTH-1:0] a4_1, a4_2, a4_3, a4_4;
    register #(.WIDTH(WIDTH)) reg_a4_1(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a4), .q(a4_1));
    register #(.WIDTH(WIDTH)) reg_a4_2(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a4_1), .q(a4_2));
    register #(.WIDTH(WIDTH)) reg_a4_3(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a4_2), .q(a4_3));
    register #(.WIDTH(WIDTH)) reg_a4_4(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a4_3), .q(a4_4));
    register #(.WIDTH(WIDTH)) reg_a4_5(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a4_4), .q(a40_in));
    
    wire signed [WIDTH-1:0] a5_1, a5_2, a5_3, a5_4, a5_5;
    register #(.WIDTH(WIDTH)) reg_a5_1(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a5), .q(a5_1));
    register #(.WIDTH(WIDTH)) reg_a5_2(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a5_1), .q(a5_2));
    register #(.WIDTH(WIDTH)) reg_a5_3(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a5_2), .q(a5_3));
    register #(.WIDTH(WIDTH)) reg_a5_4(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a5_3), .q(a5_4));
    register #(.WIDTH(WIDTH)) reg_a5_5(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a5_4), .q(a5_5));
    register #(.WIDTH(WIDTH)) reg_a5_6(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a5_5), .q(a50_in));
    
    //REGISTER Y
    register #(.WIDTH(WIDTH)) reg_y5_1(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y55_out), .q(y5));
    
    wire signed [WIDTH-1:0] y4_1;
    register #(.WIDTH(WIDTH)) reg_y4_1(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y54_out), .q(y4_1));
    register #(.WIDTH(WIDTH)) reg_y4_2(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y4_1), .q(y4));
    
    wire signed [WIDTH-1:0] y3_1, y3_2;
    register #(.WIDTH(WIDTH)) reg_y3_1(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y53_out), .q(y3_1));
    register #(.WIDTH(WIDTH)) reg_y3_2(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y3_1), .q(y3_2));
    register #(.WIDTH(WIDTH)) reg_y3_3(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y3_2), .q(y3));
    
    wire signed [WIDTH-1:0] y2_1, y2_2, y2_3;
    register #(.WIDTH(WIDTH)) reg_y2_1(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y52_out), .q(y2_1));
    register #(.WIDTH(WIDTH)) reg_y2_2(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y2_1), .q(y2_2));
    register #(.WIDTH(WIDTH)) reg_y2_3(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y2_2), .q(y2_3));
    register #(.WIDTH(WIDTH)) reg_y2_4(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y2_3), .q(y2));
    
    wire signed [WIDTH-1:0] y1_1, y1_2, y1_3, y1_4;
    register #(.WIDTH(WIDTH)) reg_y1_1(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y51_out), .q(y1_1));
    register #(.WIDTH(WIDTH)) reg_y1_2(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y1_1), .q(y1_2));
    register #(.WIDTH(WIDTH)) reg_y1_3(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y1_2), .q(y1_3));
    register #(.WIDTH(WIDTH)) reg_y1_4(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y1_3), .q(y1_4));
    register #(.WIDTH(WIDTH)) reg_y1_5(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y1_4), .q(y1));
    
    wire signed [WIDTH-1:0] y0_1, y0_2, y0_3, y0_4, y0_5;
    register #(.WIDTH(WIDTH)) reg_y0_1(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y50_out), .q(y0_1));
    register #(.WIDTH(WIDTH)) reg_y0_2(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y0_1), .q(y0_2));
    register #(.WIDTH(WIDTH)) reg_y0_3(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y0_2), .q(y0_3));
    register #(.WIDTH(WIDTH)) reg_y0_4(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y0_3), .q(y0_4));
    register #(.WIDTH(WIDTH)) reg_y0_5(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y0_4), .q(y0_5));
    register #(.WIDTH(WIDTH)) reg_y0_6(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y0_5), .q(y0));
    
    //REGISTER INTERNAL HORIZONTAL
    register #(.WIDTH(WIDTH)) reg_00_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a00_out), .q(a01_in));
    register #(.WIDTH(WIDTH)) reg_01_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a01_out), .q(a02_in));
    register #(.WIDTH(WIDTH)) reg_02_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a02_out), .q(a03_in));
    register #(.WIDTH(WIDTH)) reg_03_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a03_out), .q(a04_in));
    register #(.WIDTH(WIDTH)) reg_04_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a04_out), .q(a05_in));
    
    register #(.WIDTH(WIDTH)) reg_10_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a10_out), .q(a11_in));
    register #(.WIDTH(WIDTH)) reg_11_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a11_out), .q(a12_in));
    register #(.WIDTH(WIDTH)) reg_12_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a12_out), .q(a13_in));
    register #(.WIDTH(WIDTH)) reg_13_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a13_out), .q(a14_in));
    register #(.WIDTH(WIDTH)) reg_14_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a14_out), .q(a15_in));
    
    register #(.WIDTH(WIDTH)) reg_20_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a20_out), .q(a21_in));
    register #(.WIDTH(WIDTH)) reg_21_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a21_out), .q(a22_in));
    register #(.WIDTH(WIDTH)) reg_22_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a22_out), .q(a23_in));
    register #(.WIDTH(WIDTH)) reg_23_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a23_out), .q(a24_in));
    register #(.WIDTH(WIDTH)) reg_24_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a24_out), .q(a25_in));
    
    register #(.WIDTH(WIDTH)) reg_30_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a30_out), .q(a31_in));
    register #(.WIDTH(WIDTH)) reg_31_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a31_out), .q(a32_in));
    register #(.WIDTH(WIDTH)) reg_32_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a32_out), .q(a33_in));
    register #(.WIDTH(WIDTH)) reg_33_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a33_out), .q(a34_in));
    register #(.WIDTH(WIDTH)) reg_34_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a34_out), .q(a35_in));
    
    register #(.WIDTH(WIDTH)) reg_40_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a40_out), .q(a41_in));
    register #(.WIDTH(WIDTH)) reg_41_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a41_out), .q(a42_in));
    register #(.WIDTH(WIDTH)) reg_42_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a42_out), .q(a43_in));
    register #(.WIDTH(WIDTH)) reg_43_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a43_out), .q(a44_in));
    register #(.WIDTH(WIDTH)) reg_44_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a44_out), .q(a45_in));
    
    register #(.WIDTH(WIDTH)) reg_50_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a50_out), .q(a51_in));
    register #(.WIDTH(WIDTH)) reg_51_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a51_out), .q(a52_in));
    register #(.WIDTH(WIDTH)) reg_52_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a52_out), .q(a53_in));
    register #(.WIDTH(WIDTH)) reg_53_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a53_out), .q(a54_in));
    register #(.WIDTH(WIDTH)) reg_54_hor(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(a54_out), .q(a55_in));
    
    //REGISTER INTERNAL VERTIKAL
    register #(.WIDTH(WIDTH)) reg_00_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y00_out), .q(y10_in));
    register #(.WIDTH(WIDTH)) reg_10_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y10_out), .q(y20_in));
    register #(.WIDTH(WIDTH)) reg_20_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y20_out), .q(y30_in));
    register #(.WIDTH(WIDTH)) reg_30_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y30_out), .q(y40_in));
    register #(.WIDTH(WIDTH)) reg_40_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y40_out), .q(y50_in));
    
    register #(.WIDTH(WIDTH)) reg_01_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y01_out), .q(y11_in));
    register #(.WIDTH(WIDTH)) reg_11_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y11_out), .q(y21_in));
    register #(.WIDTH(WIDTH)) reg_21_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y21_out), .q(y31_in));
    register #(.WIDTH(WIDTH)) reg_31_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y31_out), .q(y41_in));
    register #(.WIDTH(WIDTH)) reg_41_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y41_out), .q(y51_in));
    
    register #(.WIDTH(WIDTH)) reg_02_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y02_out), .q(y12_in));
    register #(.WIDTH(WIDTH)) reg_12_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y12_out), .q(y22_in));
    register #(.WIDTH(WIDTH)) reg_22_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y22_out), .q(y32_in));
    register #(.WIDTH(WIDTH)) reg_32_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y32_out), .q(y42_in));
    register #(.WIDTH(WIDTH)) reg_42_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y42_out), .q(y52_in));
    
    register #(.WIDTH(WIDTH)) reg_03_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y03_out), .q(y13_in));
    register #(.WIDTH(WIDTH)) reg_13_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y13_out), .q(y23_in));
    register #(.WIDTH(WIDTH)) reg_23_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y23_out), .q(y33_in));
    register #(.WIDTH(WIDTH)) reg_33_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y33_out), .q(y43_in));
    register #(.WIDTH(WIDTH)) reg_43_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y43_out), .q(y53_in));
    
    register #(.WIDTH(WIDTH)) reg_04_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y04_out), .q(y14_in));
    register #(.WIDTH(WIDTH)) reg_14_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y14_out), .q(y24_in));
    register #(.WIDTH(WIDTH)) reg_24_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y24_out), .q(y34_in));
    register #(.WIDTH(WIDTH)) reg_34_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y34_out), .q(y44_in));
    register #(.WIDTH(WIDTH)) reg_44_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y44_out), .q(y54_in));
    
    register #(.WIDTH(WIDTH)) reg_05_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y05_out), .q(y15_in));
    register #(.WIDTH(WIDTH)) reg_15_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y15_out), .q(y25_in));
    register #(.WIDTH(WIDTH)) reg_25_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y25_out), .q(y35_in));
    register #(.WIDTH(WIDTH)) reg_35_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y35_out), .q(y45_in));
    register #(.WIDTH(WIDTH)) reg_45_ver(.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .d(y45_out), .q(y55_in));
    
endmodule