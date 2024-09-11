// -------------------------
// Guia_0701 - AND e NAND
// Nome: Cauã Costa Alves
// Matricula: 855926
// -------------------------

module LU (
    output wire Y,          // Saída selecionada
    output wire AND_Out,    // Saída AND
    output wire NAND_Out,   // Saída NAND
    input wire A,           // Entrada A
    input wire B,           // Entrada B
    input wire Sel          // Sinal de Seleção
);

// Descrição das operações lógicas
wire and_result;
wire nand_result;

// Operações AND e NAND
and AND1 (and_result, A, B);
nand NAND1 (nand_result, A, B);

// Multiplexador para selecionar a saída
assign Y = Sel ? and_result : nand_result;

// Saídas independentes
assign AND_Out = and_result;
assign NAND_Out = nand_result;

endmodule // LU

module test_LU;

// Definir dados
reg x;
reg y;
reg s;
wire z;
wire and_out;
wire nand_out;

// Instanciar o módulo LU
LU modulo (
    .Y(z),
    .AND_Out(and_out),
    .NAND_Out(nand_out),
    .A(x),
    .B(y),
    .Sel(s)
);

// Parte principal
initial begin : main
    // Exibir cabeçalho
    $display("Guia_0701 - Cauã Costa Alves - 855926");
    $display("     x    y    s    z  and_out  nand_out");

    // Aplicar estímulos e monitorar resultados
    x = 1'b0; y = 1'b0; s = 1'b0;
    #1 $monitor("  %4b %4b %4b %4b %4b   %4b", x, y, s, z, and_out, nand_out);
    
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
