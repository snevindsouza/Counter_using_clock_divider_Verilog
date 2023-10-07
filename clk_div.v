module clk_div (
    input clk,
    output reg [3:0] count
);

integer i;
reg clkdiv;

initial begin
    i = 0;
    count = 4'b0000;
    clkdiv = 1'b0;
end

always @(posedge clk) begin    //4MHz clock (spartan 6 FPGA)
    i = i+1;
    if (i == 4) begin        //i == 2000000 for 4MHz clock (depends on the FPGA)
        clkdiv = ~clkdiv;
        i = 0;
    end
end

always @(posedge clkdiv) begin    //1Hz clock
    count = count+1;
end

endmodule
