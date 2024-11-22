module Conditional_Check
(
    input wire [3:0] Cond,
    input wire [1:0] Flags1,
    input wire [1:0] Flags2,
    output reg CondEx
);

    always @(*)
    begin
        case (Cond)
            4'b0000: CondEx = 1'b1;
            4'b0001: CondEx = 1'b0;
            4'b0010: CondEx = Flags1;
            4'b0011: CondEx = Flags2;
            4'b0100: CondEx = ~Flags1;
            4'b0101: CondEx = ~Flags1;
            4'b0110: CondEx = Flags1 & Flags2;
            4'b0111: CondEx = Flags1 | Flags2;
            4'b1000: CondEx = Flags1 ^ Flags2;
            4'b1001: CondEx = ~(Flags1 ^ Flags2);
            4'b1010: CondEx = ~(Flags1 & Flags2);
            4'b1011: CondEx = ~(Flags1 | Flags2);
            4'b1100: CondEx = Flags1 & ~Flags2;
            4'b1101: CondEx = ~Flags1 & Flags2;
            default: CondEx = 1'b0;
        endcase
    end

endmodule
