// -------------------------
// Guia_0705 - NOT, AND, NAND, OR, NOR, XOR e XNOR com seleção de 7x1
// Nome: Cauã Costa Alves
// Matricula: 855926
// -------------------------

module LU (
    output wire Y,          // Saída selecionada
    input wire A,           // Entrada A
    input wire B,           // Entrada B
    input wire [2:0] Sel    // Sinal de Seleção (3 bits)
);

// Descrição das operações lógicas
wire not_a;
wire and_result;
wire nand_result;
wire or_result;
wire nor_result;
wire xor_result;
wire xnor_result;

// Operações lógicas
not NOT1 (not_a, A);
and AND1 (and_result, A, B);
nand NAND1 (nand_result, A, B);
or OR1 (or_result, A, B);
nor NOR1 (nor_result, A, B);
xor XOR1 (xor_result, A, B);
xnor XNOR1 (xnor_result, A, B);

// Seleção da operação
// Usando a seleção de 3 bits para escolher a operação
assign Y = (Sel == 3'b000) ? not_a :     // NOT A
          (Sel == 3'b001) ? and_result : // AND
          (Sel == 3'b010) ? nand_result : // NAND
          (Sel == 3'b011) ? or_result :  // OR
          (Sel == 3'b100) ? nor_result : // NOR
          (Sel == 3'b101) ? xor_result : // XOR
          xnor_result;                  // XNOR

endmodule // LU

// -------------------------
// Banco de Testes para LU
// -------------------------
module test_LU;

// Definir dados
reg x;
reg y;
reg [2:0] sel;
wire z;

// Instanciar o módulo LU
LU modulo (
    .Y(z),
    .A(x),
    .B(y),
    .Sel(sel)
);

// Parte principal
initial begin : main
    // Exibir cabeçalho
    $display("Guia_0705 - Cauã Costa Alves - 855926");
    $display("     x    y   sel   z");

    // Aplicar estímulos e monitorar resultados
    x = 1'b0; y = 1'b0; sel = 3'b000;
    #1 $monitor("  %4b %4b   %3b%4b", x, y, sel, z);
    
    // Testes para cada operação
    #1 x = 1'b0; y = 1'b0; sel = 3'b000; // NOT A
    #1 x = 1'b1; y = 1'b0; sel = 3'b000; 
    #1 x = 1'b0; y = 1'b1; sel = 3'b000; 
    #1 x = 1'b1; y = 1'b1; sel = 3'b000; 

    #1 x = 1'b0; y = 1'b0; sel = 3'b001; // AND
    #1 x = 1'b1; y = 1'b0; sel = 3'b001; 
    #1 x = 1'b0; y = 1'b1; sel = 3'b001; 
    #1 x = 1'b1; y = 1'b1; sel = 3'b001; 

    #1 x = 1'b0; y = 1'b0; sel = 3'b010; // NAND
    #1 x = 1'b1; y = 1'b0; sel = 3'b010; 
    #1 x = 1'b0; y = 1'b1; sel = 3'b010; 
    #1 x = 1'b1; y = 1'b1; sel = 3'b010; 

    #1 x = 1'b0; y = 1'b0; sel = 3'b011; // OR
    #1 x = 1'b1; y = 1'b0; sel = 3'b011; 
    #1 x = 1'b0; y = 1'b1; sel = 3'b011; 
    #1 x = 1'b1; y = 1'b1; sel = 3'b011; 

    #1 x = 1'b0; y = 1'b0; sel = 3'b100; // NOR
    #1 x = 1'b1; y = 1'b0; sel = 3'b100; 
    #1 x = 1'b0; y = 1'b1; sel = 3'b100; 
    #1 x = 1'b1; y = 1'b1; sel = 3'b100; 

    #1 x = 1'b0; y = 1'b0; sel = 3'b101; // XOR
    #1 x = 1'b1; y = 1'b0; sel = 3'b101; 
    #1 x = 1'b0; y = 1'b1; sel = 3'b101; 
    #1 x = 1'b1; y = 1'b1; sel = 3'b101; 

    #1 x = 1'b0; y = 1'b0; sel = 3'b110; // XNOR
    #1 x = 1'b1; y = 1'b0; sel = 3'b110; 
    #1 x = 1'b0; y = 1'b1; sel = 3'b110; 
    #1 x = 1'b1; y = 1'b1; sel = 3'b110; 

    // Encerrar simulação
    #1 $finish;
end

endmodule // test_LU
