module ALU_Decoder
(
    input wire [4:0] Funct,
    input wire ALUOp,
    output reg [1:0] ALUControl,
    output reg [1:0] FlagW,
    output reg NoWrite
);

    always @(posedge ALUOp)
    begin
        NoWrite = 0;
        ALUControl = 2'b00;
        FlagW = 2'b00;

        case (Funct)
            5'b00000:
            begin
                ALUControl = 2'b00;
                FlagW = 2'b00;
                NoWrite = 0;
            end
            5'b00001:
            begin
                ALUControl = 2'b01;
                FlagW = 2'b00;
                NoWrite = 1;
            end
            5'b00010:
            begin
                ALUControl = 2'b10;
                FlagW = 2'b00;
                NoWrite = 0;
            end
            5'b00100:
            begin
                ALUControl = 2'b00;
                FlagW = 2'b01;
                NoWrite = 1;
            end
            5'b01000:
            begin
                ALUControl = 2'b00;
                FlagW = 2'b10;
                NoWrite = 0;
            end
            5'b10000:
            begin
                ALUControl = 2'b11;
                FlagW = 2'b11;
                NoWrite = 1;
            end
            default:
            begin
                ALUControl = 2'bxx;
                FlagW = 2'bxx;
                NoWrite = 1'bx;
            end
        endcase
    end
endmodule
