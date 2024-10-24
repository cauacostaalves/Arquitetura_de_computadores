// mux2x1.v
module mux2x1 (
    output reg [7:0] o,  // Saída de 8 bits
    input [7:0] i0,      // Entrada 0
    input [7:0] i1,      // Entrada 1
    input sel            // Seleção (1 bit)
);
    
    always @(*) begin
        if (sel)
            o = i1;  // Seleciona a entrada 1
        else
            o = i0;  // Seleciona a entrada 0
    end

endmodule // mux2x1
