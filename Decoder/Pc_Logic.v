module PC_Logic
(
    input wire [3:0] Rd,
    input wire Branch,
    input wire RegW,
    output reg PCS
);
    reg [3:0] Line = 4'b0000;

    always @(*)
    begin
        if (RegW)
            Line = 4'b0000;
        else if (Branch)
        begin
            PCS = Rd[Line];
            Line = Line + 1;
        end
    end

endmodule
