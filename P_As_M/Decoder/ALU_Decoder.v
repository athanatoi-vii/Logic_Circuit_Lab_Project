module ALU_Decoder
(
    input wire [4:0] Funct,
    input wire ALUOp,
    output reg [1:0] ALUControl,
    output reg [1:0] FlagW,
    output reg NoWrite
);

    always @(*)
    begin
        NoWrite = 0;
        ALUControl = 2'b00;
        FlagW = 2'b00;

        case (ALUOp)
            2'b00:
            begin
                ALUControl = 2'b10;
                NoWrite = 0;
            end
            2'b01:
            begin
                ALUControl = 2'b11;
                FlagW = 2'b10;
                NoWrite = 1;
            end
            2'b10:
            begin
                case (Funct)
                    5'b00000: ALUControl = 2'b10;
                    5'b00010: ALUControl = 2'b11;
                    5'b00100: ALUControl = 2'b00;
                    5'b00101: ALUControl = 2'b01;
                    5'b01010:
                    begin
                        ALUControl = 2'b11;
                        FlagW = 2'b10;
                        NoWrite = 1;
                    end
                    5'b01011:
                    begin
                        ALUControl = 2'b11;
                        FlagW = 2'b10;
                        NoWrite = 1;
                    end
                    default:
                    begin
                        ALUControl = 2'bxx;
                        FlagW = 2'b00;
                        NoWrite = 1;
                    end
                endcase
            end
            default:
            begin
                ALUControl = 2'bxx;
                FlagW = 2'b00;
                NoWrite = 1;
            end
        endcase
    end
    
endmodule
