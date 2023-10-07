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

always @(posedge clk) begin
    i = i+1;
    if (i == 4) begin
        clkdiv = ~clkdiv;
        i = 0;
    end
end

always @(posedge clkdiv) begin
    count = count+1;
end

endmodule