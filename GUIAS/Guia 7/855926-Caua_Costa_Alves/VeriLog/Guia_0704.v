// -------------------------
// Guia_0704 - OR, NOR, XOR e XNOR com seleção de 4x1
// Nome: Cauã Costa Alves
// Matricula: 855926
// -------------------------

module LU (
    output wire Y,          // Saída selecionada
    input wire A,           // Entrada A
    input wire B,           // Entrada B
    input wire [1:0] Sel    // Sinal de Seleção (00-NOR, 01-OR, 10-XOR, 11-XNOR)
);

// Descrição das operações lógicas
wire or_result;
wire nor_result;
wire xor_result;
wire xnor_result;
wire selected_result;

// Operações OR, NOR, XOR e XNOR
or OR1 (or_result, A, B);
nor NOR1 (nor_result, A, B);
xor XOR1 (xor_result, A, B);
xnor XNOR1 (xnor_result, A, B);

// Seleção da operação
// Usando a seleção de 2 bits para escolher a operação
assign selected_result = (Sel == 2'b00) ? nor_result : // NOR
                         (Sel == 2'b01) ? or_result :  // OR
                         (Sel == 2'b10) ? xor_result : // XOR
                         xnor_result;                  // XNOR

// Saída final
assign Y = selected_result;

endmodule // LU

// -------------------------
// Banco de Testes para LU
// -------------------------
module test_LU;

// Definir dados
reg x;
reg y;
reg [1:0] sel;
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
    $display("Guia_0704 - Cauã Costa Alves - 855926");
    $display("     x    y    sel   z");

    // Aplicar estímulos e monitorar resultados
    x = 1'b0; y = 1'b0; sel = 2'b00;
    #1 $monitor("  %4b %4b    %2b %4b", x, y, sel, z);
    
    // Testes para cada operação
    #1 x = 1'b0; y = 1'b1; sel = 2'b00; // NOR
    #1 x = 1'b1; y = 1'b0; sel = 2'b00; 
    #1 x = 1'b1; y = 1'b1; sel = 2'b00; 

    #1 x = 1'b0; y = 1'b1; sel = 2'b01; // OR
    #1 x = 1'b1; y = 1'b0; sel = 2'b01; 
    #1 x = 1'b1; y = 1'b1; sel = 2'b01; 

    #1 x = 1'b0; y = 1'b1; sel = 2'b10; // XOR
    #1 x = 1'b1; y = 1'b0; sel = 2'b10; 
    #1 x = 1'b1; y = 1'b1; sel = 2'b10; 

    #1 x = 1'b0; y = 1'b1; sel = 2'b11; // XNOR
    #1 x = 1'b1; y = 1'b0; sel = 2'b11; 
    #1 x = 1'b1; y = 1'b1; sel = 2'b11; 

    // Encerrar simulação
    #1 $finish;
end

endmodule // test_LU
