// -------------------------
// Guia_0702 - OR e NOR
// Nome: Cauã Costa Alves
// Matricula: 855926
// -------------------------

module LU (
    output wire Y,          // Saída selecionada
    output wire OR_Out,     // Saída OR
    output wire NOR_Out,    // Saída NOR
    input wire A,           // Entrada A
    input wire B,           // Entrada B
    input wire Sel          // Sinal de Seleção
);

// Descrição das operações lógicas
wire or_result;
wire nor_result;

// Operações OR e NOR
or OR1 (or_result, A, B);
nor NOR1 (nor_result, A, B);

// Multiplexador para selecionar a saída
assign Y = Sel ? or_result : nor_result;

// Saídas independentes
assign OR_Out = or_result;
assign NOR_Out = nor_result;

endmodule // LU

// -------------------------
// Banco de Testes para LU
// -------------------------
module test_LU;

// Definir dados
reg x;
reg y;
reg s;
wire z;
wire or_out;
wire nor_out;

// Instanciar o módulo LU
LU modulo (
    .Y(z),
    .OR_Out(or_out),
    .NOR_Out(nor_out),
    .A(x),
    .B(y),
    .Sel(s)
);

// Parte principal
initial begin : main
    // Exibir cabeçalho
    $display("Guia_0702 - Cauã Costa Alves - 855926");
    $display("     x    y    s    z  or_out  nor_out");

    // Aplicar estímulos e monitorar resultados
    x = 1'b0; y = 1'b0; s = 1'b0;
    #1 $monitor("  %4b %4b %4b %4b %4b   %4b", x, y, s, z, or_out, nor_out);
    
    #1 x = 1'b0; y = 1'b1; s = 1'b0; 
    #1 s = 1'b1;                     
    #1 x = 1'b1; y = 1'b0; s = 1'b0; 
    #1 s = 1'b1;                     
    #1 x = 1'b1; y = 1'b1; s = 1'b0; 
    #1 s = 1'b1;                     

    // Encerrar simulação
    #1 $finish;
end

endmodule // test_LU
