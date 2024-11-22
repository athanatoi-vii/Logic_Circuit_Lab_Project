module Main_Decoder
(
    input wire [5:0] Funct,
    input wire [1:0] Op,
    output reg [1:0] ImmSrc,
    output reg [1:0] RegSrc,
    output reg Branch,
    output reg ALUOp,
    output reg RegW,
    output reg MemW,
    output reg MemtoReg,
    output reg ALUSrc
);

    always @(*)
    begin
        Branch = 0;
        ALUOp = 0;
        RegW = 0;
        MemW = 0;
        MemtoReg = 0;
        ALUSrc = 0;
        ImmSrc = 2'b00;
        RegSrc = 2'b00;

        case (Op)
            2'b00:
            begin
                RegW = 1;
                MemtoReg = 1;
                ALUSrc = 1;
                ImmSrc = 2'b01;
                ALUOp = 0;
            end
            2'b01:
            begin
                MemW = 1;
                ALUSrc = 1;
                ImmSrc = 2'b01;
                RegSrc = 2'b10;
                ALUOp = 0;
            end
            2'b10:
            begin
                Branch = 1;
                ALUSrc = 0;
                ImmSrc = 2'b10;
                RegSrc = 2'b01;
                ALUOp = 0;
            end
            2'b11:
            begin
                RegW = 1;
                MemtoReg = 0;
                ALUSrc = 0;
                ImmSrc = 2'b00;
                ALUOp = 1;
            end
        endcase
    end

endmodule
