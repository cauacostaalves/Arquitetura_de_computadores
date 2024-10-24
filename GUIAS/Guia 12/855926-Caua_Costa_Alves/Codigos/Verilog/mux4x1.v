// mux4x1.v
module mux4x1 (
    output reg [7:0] o,     // Saída de 8 bits
    input [7:0] i0,         // Entrada 0
    input [7:0] i1,         // Entrada 1
    input [7:0] i2,         // Entrada 2
    input [7:0] i3,         // Entrada 3
    input [1:0] sel         // Seleção (2 bits)
);
    
    always @(*) begin
        case (sel)
            2'b00: o = i0;  // Seleciona a entrada 0
            2'b01: o = i1;  // Seleciona a entrada 1
            2'b10: o = i2;  // Seleciona a entrada 2
            2'b11: o = i3;  // Seleciona a entrada 3
            default: o = 8'b00000000; // Saída padrão
        endcase
    end

endmodule // mux4x1
