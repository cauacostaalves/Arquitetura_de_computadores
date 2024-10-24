// demux1x4.v
module demux1x4 (
    output reg o0,          // Saída 0
    output reg o1,          // Saída 1
    output reg o2,          // Saída 2
    output reg o3,          // Saída 3
    input sel0,             // Seleção 0
    input sel1,             // Seleção 1
    input d                 // Entrada de dados
);

    always @(*) begin
        // Inicializa todas as saídas como 0
        o0 = 0;
        o1 = 0;
        o2 = 0;
        o3 = 0;

        case ({sel1, sel0})  // Combina os sinais de seleção
            2'b00: o0 = d;   // Direciona a entrada para a saída 0
            2'b01: o1 = d;   // Direciona a entrada para a saída 1
            2'b10: o2 = d;   // Direciona a entrada para a saída 2
            2'b11: o3 = d;   // Direciona a entrada para a saída 3
            default: begin
                o0 = 0;
                o1 = 0;
                o2 = 0;
                o3 = 0; // Saídas padrão
            end
        endcase
    end

endmodule // demux1x4
