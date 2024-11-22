// iverilog -E -o Circuit_Full.v Conditional_Logic.v

`include "../Conditional_Logic/Clk_Flags.v"
`include "../Conditional_Logic/Conditional_Check.v"

module Conditional_Logic
(
    input wire [3:0] Cond,
    input wire [3:0] ALU_Flags,
    input wire [1:0] FlagW,
    input wire Clk,
    input wire PCS,
    input wire RegW,
    input wire MemW,
    input wire NoWrite,
    output wire PCSrc,
    output wire RegWrite,
    output wire MemWrite
);

    wire [1:0] Flags1, Flags2, Flag_Write;
    wire CondEx;

    function And;
        input bit1;
        input bit2;

        begin
            And = bit1 & bit2;
        end
    endfunction

    function And_Midel_Not;
        input bit1;
        input bit2;
        input bit3;
    
        begin
            And_Midel_Not = bit1 & ~bit2 & bit3;
        end
    endfunction

    function [1:0] Tow_And_One;
        input [1:0] bit1;
        input bit2;

        begin
            Tow_And_One = bit1 & {2{bit2}};
        end
    endfunction

    assign PCSrc = And(PCS, CondEx);
    assign RegWrite = And_Midel_Not(RegW, NoWrite, CondEx);
    assign MemWrite = And(MemW, CondEx);
    assign Flag_Write = Tow_And_One(FlagW, CondEx);

    Clk_Flags C_F_1
    (
        .ALU_Flags(ALU_Flags [3:2]),
        .Clk(Clk),
        .Flag_Write(Flag_Write [1]),
        .Flags(Flags1)
    );

    Clk_Flags C_F_2
    (
        .ALU_Flags(ALU_Flags [1:0]),
        .Clk(Clk),
        .Flag_Write(Flag_Write [0]),
        .Flags(Flags2)
    );

    Conditional_Check C_C
    (
        .Flags1(Flags1),
        .Flags2(Flags2),
        .Cond(Cond),
        .CondEx(CondEx)
    );

endmodule
