// -------------------------
// Guia_0707 - Comparador de Magnitude usando portas básicas
// Nome: Cauã Costa Alves
// Matricula: 855926
// -------------------------

module LU (
    output wire Y,          // Saída indicando menor ou maior
    input wire [2:0] A,     // Entrada A (3 bits)
    input wire [2:0] B,     // Entrada B (3 bits)
    input wire Sel          // Sinal de Seleção (0-menor, 1-maior)
);

// Descrição das operações lógicas
wire [2:0] notA, notB;
wire [2:0] andAB, andBA;
wire orAB, orBA;

// Calcular NOT de A e B
not (notA[0], A[0]);
not (notA[1], A[1]);
not (notA[2], A[2]);
not (notB[0], B[0]);
not (notB[1], B[1]);
not (notB[2], B[2]);

// Calcular AND de A e B e AND de B e A (para comparação)
and (andAB[0], A[0], notB[0]);
and (andAB[1], A[1], notB[1]);
and (andAB[2], A[2], notB[2]);

and (andBA[0], notA[0], B[0]);
and (andBA[1], notA[1], B[1]);
and (andBA[2], notA[2], B[2]);

// Calcular OR das comparações AND
or (orAB, andAB[0], andAB[1], andAB[2]);
or (orBA, andBA[0], andBA[1], andBA[2]);

// Seleção da operação
assign Y = (Sel == 1'b0) ? orAB : orBA;

endmodule // LU

// -------------------------
// Banco de Testes para LU
// -------------------------
module test_LU;

// Definir dados
reg [2:0] a;
reg [2:0] b;
reg sel;
wire y;

// Instanciar o módulo LU
LU modulo (
    .Y(y),
    .A(a),
    .B(b),
    .Sel(sel)
);

// Parte principal
initial begin : main
    // Exibir cabeçalho
    $display("Guia_0707 - Cauã Costa Alves - 855926");
    $display(" a   b  sel y");

    // Aplicar estímulos e monitorar resultados
    a = 3'b000; b = 3'b000; sel = 1'b0;
    #1 $monitor("%3b %3b  %1b  %1b", a, b, sel, y);
    
    // Testes para menor
    #1 a = 3'b000; b = 3'b001; sel = 1'b0; // 0 < 1
    #1 a = 3'b010; b = 3'b001; sel = 1'b0; // 2 > 1
    #1 a = 3'b100; b = 3'b101; sel = 1'b0; // 4 < 5
    #1 a = 3'b111; b = 3'b011; sel = 1'b0; // 7 > 3

    // Testes para maior
    #1 a = 3'b000; b = 3'b001; sel = 1'b1; // 0 < 1
    #1 a = 3'b010; b = 3'b001; sel = 1'b1; // 2 > 1
    #1 a = 3'b100; b = 3'b101; sel = 1'b1; // 4 < 5
    #1 a = 3'b111; b = 3'b011; sel = 1'b1; // 7 > 3

    // Encerrar simulação
    #1 $finish;
end

endmodule // test_LU
