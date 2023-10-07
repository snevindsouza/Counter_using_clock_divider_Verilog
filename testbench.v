module testbench;

    reg clk;
    wire [3:0] count;

    clk_div dut(.clk(clk),.count(count));

    always #1 clk = ~clk;

    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(0,testbench);
        clk <= 1'b0;
        $monitor("clk = %d , count = %d\n",clk,count);
    end

    initial #1000 $finish;

endmodule