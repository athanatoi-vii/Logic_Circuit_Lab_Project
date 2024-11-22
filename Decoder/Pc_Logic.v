module PC_Logic
(
    input wire [3:0] Rd,
    input wire Branch,
    input wire RegW,
    output reg PCS
);

    always @(*)
    begin
        if (Branch)
            PCS = Rd[0];
        else if (RegW)
            PCS = Rd[1];
        else
            PCS = 1'b0;
    end

endmodule
