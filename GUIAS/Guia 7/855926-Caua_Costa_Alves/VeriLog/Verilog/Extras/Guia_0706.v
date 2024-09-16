// -------------------------
// Guia_0706 - Comparador de Bits com XOR e XNOR
// Nome: Cauã Costa Alves
// Matricula: 855926
// -------------------------

module LU (
    output wire Y,          // Saída resultante da comparação
    input wire [2:0] A,     // Entrada A (3 bits)
    input wire [2:0] B,     // Entrada B (3 bits)
    input wire Sel          // Sinal de Seleção (0-igual, 1-diferente)
);

// Descrição das operações lógicas
wire xnor1, xnor2, xnor3;
wire xor1, xor2, xor3;

// Comparações usando XNOR (igualdade) e XOR (desigualdade)
xnor XNOR1 (xnor1, A[0], B[0]);
xnor XNOR2 (xnor2, A[1], B[1]);
xnor XNOR3 (xnor3, A[2], B[2]);

xor XOR1 (xor1, A[0], B[0]);
xor XOR2 (xor2, A[1], B[1]);
xor XOR3 (xor3, A[2], B[2]);

// Resultado de igualdade: todas as comparações XNOR devem ser verdadeiras
wire equality;
and AND1 (equality, xnor1, xnor2, xnor3);

// Resultado de desigualdade: pelo menos uma comparação XOR deve ser verdadeira
wire inequality;
or OR1 (inequality, xor1, xor2, xor3);

// Seleção da operação
assign Y = (Sel == 1'b0) ? equality : inequality;

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
    $display("Guia_0706 - Cauã Costa Alves - 855926");
    $display(" a   b  sel y");

    // Aplicar estímulos e monitorar resultados
    a = 3'b000; b = 3'b000; sel = 1'b0;
    #1 $monitor("%3b %3b  %1b  %1b", a, b, sel, y);
    
    // Testes para igualdade
    #1 a = 3'b000; b = 3'b000; sel = 1'b0; // Igual
    #1 a = 3'b001; b = 3'b001; sel = 1'b0; 
    #1 a = 3'b111; b = 3'b111; sel = 1'b0; 
    #1 a = 3'b010; b = 3'b101; sel = 1'b0; // Diferente

    // Testes para desigualdade
    #1 a = 3'b000; b = 3'b000; sel = 1'b1; // Igual
    #1 a = 3'b001; b = 3'b000; sel = 1'b1; // Diferente
    #1 a = 3'b111; b = 3'b101; sel = 1'b1; 
    #1 a = 3'b010; b = 3'b101; sel = 1'b1; // Igual

    // Encerrar simulação
    #1 $finish;
end

endmodule // test_LU
