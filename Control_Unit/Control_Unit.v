// iverilog -E -o Circuit_Full.v Control_Unit.v

`include "../Decoder/Decoder.v"
`include "../Conditional_Logic/Conditional_Logic.v"

module Control_Unit
(
    input wire [5:0] Funct,
    input wire [3:0] Cond,
    input wire [3:0] ALU_Flags,
    input wire [3:0] Rd,
    input wire [1:0] Op,
    input wire Clk,
    output wire [1:0] ImmSrc,
    output wire [1:0] RegSrc,
    output wire [1:0] ALUControl,
    output wire PCSrc,
    output wire RegWrite,
    output wire MemWrite,
    output wire MemtoReg,
    output wire ALUSrc
);

    wire [1:0] FlagW;
    wire PCS, RegW, MemW, NoWrite;

    Decoder D
    (
        .Op(Op),
        .Funct(Funct),
        .Rd(Rd),
        .FlagW(FlagW),
        .PCS(PCS),
        .RegW(RegW),
        .MemW(MemW),
        .NoWrite(NoWrite),
        .MemtoReg(MemtoReg),
        .ALUSrc(ALUSrc),
        .ImmSrc(ImmSrc),
        .RegSrc(RegSrc),
        .ALUControl(ALUControl)
    );

    Conditional_Logic C_L
    (
        .Clk(Clk),
        .Cond(Cond),
        .ALU_Flags(ALU_Flags),
        .FlagW(FlagW),
        .PCS(PCS),
        .RegW(RegW),
        .MemW(MemW),
        .NoWrite(NoWrite),
        .PCSrc(PCSrc),
        .RegWrite(RegWrite),
        .MemWrite(MemWrite)
    );

endmodule
