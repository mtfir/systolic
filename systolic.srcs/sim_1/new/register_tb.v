`timescale 1ns / 1ps

module register_tb;
    localparam T_CLK = 10;
    localparam WIDTH = 16;

    reg clk, rst_n, en, clr;
    reg [WIDTH-1:0] d;
    
    wire [WIDTH-1:0] q;
    
    register #(
        .WIDTH(WIDTH)
    ) register_inst (
        .clk( clk ), .rst_n(rst_n), .en(en), .clr(clr),
        .d(d), .q(q)
    );

    task expect;
        input [WIDTH-1:0] exp_q;
        
        if (q !== exp_q) begin
            $display("TEST FAILED");
            $display("At time %0d rst_n=%b en=%b clr=%b d=%b q=%b",
                $time, rst_n, en, clr, d, q);
            $display("q should be %b", exp_q);
            $finish;
        end else begin
            $display("At time %0d rst_n=%b en=%b clr=%b d=%b q=%b",
            $time, rst_n, en, clr, d, q);
        end
    endtask
    
    always begin
        clk = 0;
        #(T_CLK/2);
        clk = 1;
        #(T_CLK/2);
    end

    initial begin
        //Inisisasi
        rst_n = 0; en  = 0; clr = 0;
        d = 16'd0;
        #(T_CLK*2);
        
        // Reset
        rst_n = 1;
        #(T_CLK*2);
        d = 16'd88;
        #(T_CLK);
        expect(16'd00);
        
        // Enable
        en = 1;
        d = 16'd168;
        #(T_CLK);
        expect(16'd168);

        // Clear    
        clr = 1;
        #(T_CLK);
        expect(16'd00);

        $display("TEST PASSED");
        $finish;
    end
    
endmodule