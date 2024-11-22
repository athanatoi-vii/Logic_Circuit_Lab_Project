module Clk_Flags
(
    input wire [1:0] ALU_Flags,
    input wire Clk,
    input wire Flag_Write,
    output reg [1:0] Flags
);

    always @(posedge Clk)
    begin
        if (Flag_Write)
            Flags <= ALU_Flags;
    end

endmodule
