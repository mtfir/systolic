`timescale 1ns / 1ps

module pe_tb;
    localparam T_CLK = 10;
    localparam WIDTH = 16;
    localparam FRAC_BIT = 10;

    reg [WIDTH-1:0] a_in;
    reg [WIDTH-1:0] y_in;
    reg [WIDTH-1:0] b;

    wire [WIDTH-1:0] a_out;
    wire [WIDTH-1:0] y_out;

    pe #(
        .WIDTH(WIDTH), .FRAC_BIT(FRAC_BIT)
    ) pe_inst (
        .a_in(a_in), .y_in(y_in), .b(b), .a_out(a_out), .y_out(y_out)
    );

    task expect;
        input [WIDTH-1:0] exp_a_out;
        input [WIDTH-1:0] exp_y_out;

        begin
            if (a_out !== exp_a_out || y_out !== exp_y_out) begin
                $display("TEST FAILED");
                $display("At time %0d a_in=%b y_in=%b b=%b a_out=%b y_out=%b",
                    $time, a_in, y_in, b, a_out, y_out
                );
                if (a_out !== exp_a_out)
                    $display("a_out should be %b", exp_a_out);
                if (y_out !== exp_y_out)
                    $display("y_out should be %b", exp_y_out);
                $finish;
            end else begin
                $display("At time %0d a_in=%b y_in=%b b=%b a_out=%b y_out=%b",
                    $time, a_in, y_in, b, a_out, y_out
                );
            end
        end
    endtask

    initial begin
        a_in = 16'h0000; y_in = 16'h0000; b = 16'h0400;
        #(T_CLK);
        expect(16'h0000, 16'h0000); // a_out = 0, y_out = 0 * 1 + 0 = 0

        a_in = 16'h0600; y_in = 16'h0000; b = 16'h0800;
        #(T_CLK);
        expect(16'h0600, 16'h0C00); // a_out = 1.5, y_out = 1.5 * 2 + 0 = 3 

        a_in = 16'hF400; y_in = 16'h0400; b = 16'h0400;
        #(T_CLK);
        expect(16'hF400, 16'hF800); // a_out = -3, y_out = (-3) * 1 + 1 = -2 

        a_in = 16'hF000; y_in = 16'h0400; b = 16'hFC00;
        #(T_CLK);
        expect(16'hF000, 16'h1400); // a_out = -4, y_out = (-4) * (-1) + 1 = 5

        a_in = 16'h1600; y_in = 16'h1A00; b = 16'h0E00;
        #(T_CLK);
        expect(16'h1600, 16'h6700); // a_out = 5.5, y_out = 5.5 * 3.5 + 6.5 = 25.75

        $display("TEST PASSED");
        $finish;
    end

endmodule