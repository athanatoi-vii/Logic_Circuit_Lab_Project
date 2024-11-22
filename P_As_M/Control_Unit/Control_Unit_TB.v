// gtkwave

`include "Control_Unit.v"
`timescale 1ns / 1ps

module Control_Unit_TB ();

    reg [5:0] Funct;
    reg [3:0] Cond;
    reg [3:0] ALU_Flags;
    reg [3:0] Rd;
    reg [1:0] Op;
    reg Clk;
    wire [1:0] ImmSrc;
    wire [1:0] RegSrc;
    wire [1:0] ALUControl;
    wire PCSrc;
    wire RegWrite;
    wire MemWrite;
    wire MemtoReg;
    wire ALUSrc;

    Control_Unit C_U_T
    (
        .Funct(Funct),
        .Cond(Cond),
        .ALU_Flags(ALU_Flags),
        .Rd(Rd),
        .Op(Op),
        .Clk(Clk),
        .ImmSrc(ImmSrc),
        .RegSrc(RegSrc),
        .ALUControl(ALUControl),
        .PCSrc(PCSrc),
        .RegWrite(RegWrite),
        .MemWrite(MemWrite),
        .MemtoReg(MemtoReg),
        .ALUSrc(ALUSrc)
    );

    always
    begin
        #5 Clk = ~Clk;
    end

    initial
    begin
        $dumpfile("TB.vcd");
        $dumpvars(0, C_U_T);

        Clk = 0;
        Funct = 6'b0;
        Cond = 4'b0;
        ALU_Flags = 4'b0;
        Rd = 4'b0;
        Op = 2'b0;

        #10 Funct = 6'b101010; Cond = 4'b0001; ALU_Flags = 4'b1001; Rd = 4'b0011; Op = 2'b01;

        #10 Funct = 6'b111100; Cond = 4'b1010; ALU_Flags = 4'b0110; Rd = 4'b1111; Op = 2'b10;

        #10 Funct = 6'b000011; Cond = 4'b0101; ALU_Flags = 4'b1110; Rd = 4'b1000; Op = 2'b00;

        #10 Funct = 6'b110011; Cond = 4'b1100; ALU_Flags = 4'b0100; Rd = 4'b1010; Op = 2'b11;

        #10 Funct = 6'b010101; Cond = 4'b0011; ALU_Flags = 4'b1011; Rd = 4'b0101; Op = 2'b01;

        #10 Funct = 6'b111111; Cond = 4'b1111; ALU_Flags = 4'b1111; Rd = 4'b1111; Op = 2'b11;

        #10 Funct = 6'b000000; Cond = 4'b0000; ALU_Flags = 4'b0000; Rd = 4'b0000; Op = 2'b00;

        #10 Funct = 6'b101101; Cond = 4'b0100; ALU_Flags = 4'b1100; Rd = 4'b0110; Op = 2'b10;

        #10 Funct = 6'b011110; Cond = 4'b1001; ALU_Flags = 4'b0011; Rd = 4'b0010; Op = 2'b01;

        #10 Funct = 6'b100100; Cond = 4'b1110; ALU_Flags = 4'b0001; Rd = 4'b1001; Op = 2'b10;

        #10 Funct = 6'b011011; Cond = 4'b1011; ALU_Flags = 4'b0111; Rd = 4'b0111; Op = 2'b00;

        #10 Funct = 6'b110110; Cond = 4'b1101; ALU_Flags = 4'b1000; Rd = 4'b0011; Op = 2'b10;

        #10 Funct = 6'b010010; Cond = 4'b0010; ALU_Flags = 4'b0101; Rd = 4'b1110; Op = 2'b01;

        #10 Funct = 6'b101010; Cond = 4'b0110; ALU_Flags = 4'b1001; Rd = 4'b1100; Op = 2'b11;

        #10 Funct = 6'b100101; Cond = 4'b0101; ALU_Flags = 4'b0110; Rd = 4'b1011; Op = 2'b00;

        #10 Funct = 6'b111000; Cond = 4'b1100; ALU_Flags = 4'b1101; Rd = 4'b0111; Op = 2'b10;

        #10 Funct = 6'b101111; Cond = 4'b1010; ALU_Flags = 4'b1000; Rd = 4'b1000; Op = 2'b11;

        #10 Funct = 6'b010001; Cond = 4'b1000; ALU_Flags = 4'b0010; Rd = 4'b0011; Op = 2'b01;

        #10 Funct = 6'b000101; Cond = 4'b0111; ALU_Flags = 4'b1110; Rd = 4'b1101; Op = 2'b11;

        #10 Funct = 6'b110001; Cond = 4'b0100; ALU_Flags = 4'b0110; Rd = 4'b0101; Op = 2'b10;

        #10 $finish;
    end

endmodule
