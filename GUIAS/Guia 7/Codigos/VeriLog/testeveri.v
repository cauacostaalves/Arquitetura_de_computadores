// -------------------------
// Guia_0701 - GATES
// Nome: Cauã Costa Alves
// Matricula: 855926
// -------------------------

module Guia_0701 (
    input wire a,       // Entrada a
    input wire b,       // Entrada b
    input wire sel,     // Chave de seleção (0-NAND, 1-AND)
    output wire and_out, // Saída AND
    output wire nand_out // Saída NAND
);
    // Definir sinais internos
    wire not_sel;
    wire and_result;
    wire nand_result;

    // Operações lógicas
    assign and_result = a & b;          // Saída AND
    assign nand_result = ~(a & b);      // Saída NAND

    // Inverter o sinal de seleção
    not (not_sel, sel);

    // Seleção da saída com base no valor de sel
    and (and_out_temp, and_result, sel);
    and (nand_out_temp, nand_result, not_sel);
    or (and_out, and_out_temp, nand_out_temp);

endmodule // Guia_0701

// -------------------------
// Multiplexador
// -------------------------
module mux (
    output wire s,
    input wire a,
    input wire b,
    input wire select
);
    // Definir dados locais
    wire not_select;
    wire sa;
    wire sb;

    // Operações do multiplexador
    not (not_select, select);
    and (sa, a, not_select);
    and (sb, b, select);
    or (s, sa, sb);
endmodule // mux

// -------------------------
// Banco de Teste para Guia_0701
// -------------------------
module test_Guia_0701;
    // Definir dados
    reg x;
    reg y;
    reg sel;
    wire and_out;
    wire nand_out;
    wire selected_out;

    // Instanciar o módulo Guia_0701
    Guia_0701 modulo (
        .a(x),
        .b(y),
        .sel(sel),
        .and_out(and_out),
        .nand_out(nand_out)
    );

    // Instanciar o multiplexador
    mux MUX1 (
        .s(selected_out),
        .a(and_out),
        .b(nand_out),
        .select(sel)
    );

    // Parte principal
    initial begin : main
        $display("Guia_0701 - Cauã Costa Alves - 855926");
        $display("Test LU's module");
        $display(" x y sel selected_out");
        
        // Aplicar estímulos
        x = 1'b0; y = 1'b1; sel = 1'b1;
        #10;
        $monitor("%4b %4b %4b %4b", x, y, sel, selected_out);
        
        x = 1'b0; y = 1'b1; sel = 1'b1;
        #10;
        x = 1'b1; y = 1'b0; sel = 1'b0;
        #10;
        x = 1'b1; y = 1'b0; sel = 1'b1;
        #10;
        x = 1'b1; y = 1'b1; sel = 1'b0;
        #10;
        x = 1'b1; y = 1'b1; sel = 1'b1;
        #10;

        // Finalizar simulação
        $finish;
    end
endmodule // test_Guia_0701
