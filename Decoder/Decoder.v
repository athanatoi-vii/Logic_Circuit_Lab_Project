// iverilog -E -o Circuit_Full.v Decoder.v

`include "../Decoder/ALU_Decoder.v"
`include "../Decoder/Main_Decoder.v"
`include "../Decoder/Pc_Logic.v"

module Decoder
(
    input wire [5:0] Funct,
    input wire [3:0] Rd,
    input wire [1:0] Op,
    output wire [1:0] ImmSrc,
    output wire [1:0] RegSrc,
    output wire [1:0] ALUControl,
    output wire [1:0] FlagW,
    output wire PCS,
    output wire RegW,
    output wire MemW,
    output wire MemtoReg,
    output wire ALUSrc,
    output wire NoWrite
);

    wire Branch, ALUOp;

    Main_Decoder M_D
    (
        .Op(Op),
        .Funct(Funct),
        .Branch(Branch),
        .ALUOp(ALUOp),
        .RegW(RegW),
        .MemW(MemW),
        .MemtoReg(MemtoReg),
        .ALUSrc(ALUSrc),
        .ImmSrc(ImmSrc),
        .RegSrc(RegSrc)
    );

    PC_Logic P_L
    (
        .Rd(Rd),
        .Branch(Branch),
        .RegW(RegW),
        .PCS(PCS)
    );

    ALU_Decoder A_D
    (
        .Funct(Funct [4:0]),
        .ALUOp(ALUOp),
        .NoWrite(NoWrite),
        .ALUControl(ALUControl),
        .FlagW(FlagW)
    );

endmodule
