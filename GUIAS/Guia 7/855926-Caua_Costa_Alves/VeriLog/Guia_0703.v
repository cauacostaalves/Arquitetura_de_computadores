// -------------------------
// Guia_0703 - AND, NAND, OR e NOR com seleção dupla
// Nome: Cauã Costa Alves
// Matricula: 855926
// -------------------------

module LU (
    output wire Y,          // Saída selecionada
    input wire A,           // Entrada A
    input wire B,           // Entrada B
    input wire Sel_Group,   // Seleção do grupo (0-AND/NAND, 1-OR/NOR)
    input wire Sel_Op       // Seleção da operação (0-NAND/NOR, 1-AND/OR)
);

// Descrição das operações lógicas
wire and_result;
wire nand_result;
wire or_result;
wire nor_result;
wire selected_group_result;

// Operações AND e NAND
and AND1 (and_result, A, B);
nand NAND1 (nand_result, A, B);

// Operações OR e NOR
or OR1 (or_result, A, B);
nor NOR1 (nor_result, A, B);

// Seleção do grupo (AND/NAND ou OR/NOR)
assign selected_group_result = Sel_Group ? (Sel_Op ? or_result : nor_result) : (Sel_Op ? and_result : nand_result);

// Saída final
assign Y = selected_group_result;

endmodule // LU

// -------------------------
// Banco de Testes para LU
// -------------------------
module test_LU;

// Definir dados
reg x;
reg y;
reg group_sel;
reg op_sel;
wire z;

// Instanciar o módulo LU
LU modulo (
    .Y(z),
    .A(x),
    .B(y),
    .Sel_Group(group_sel),
    .Sel_Op(op_sel)
);

// Parte principal
initial begin : main
    // Exibir cabeçalho
    $display("Guia_0703 - Cauã Costa Alves - 855926");
    $display("     x    y    group_sel   op_sel    z");

    // Aplicar estímulos e monitorar resultados
    x = 1'b0; y = 1'b0; group_sel = 1'b0; op_sel = 1'b0;
    #1 $monitor("  %4b %4b     %4b      %4b    %4b", x, y, group_sel, op_sel, z);
    
    // Teste 1: Seleção do grupo 0 (AND/NAND), Seleção da operação 0 (NAND)
    #1 x = 1'b0; y = 1'b1; group_sel = 1'b0; op_sel = 1'b0; 
    #1 x = 1'b1; y = 1'b1; group_sel = 1'b0; op_sel = 1'b0; 
    #1 x = 1'b0; y = 1'b1; group_sel = 1'b0; op_sel = 1'b1; 
    #1 x = 1'b1; y = 1'b1; group_sel = 1'b0; op_sel = 1'b1; 

    // Teste 2: Seleção do grupo 1 (OR/NOR), Seleção da operação 0 (NOR)
    #1 group_sel = 1'b1; op_sel = 1'b0; 
    #1 x = 1'b0; y = 1'b1; group_sel = 1'b1; op_sel = 1'b0; 
    #1 x = 1'b1; y = 1'b1; group_sel = 1'b1; op_sel = 1'b0; 
    #1 x = 1'b0; y = 1'b1; group_sel = 1'b1; op_sel = 1'b1; 
    #1 x = 1'b1; y = 1'b1; group_sel = 1'b1; op_sel = 1'b1; 

    // Encerrar simulação
    #1 $finish;
end

endmodule // test_LU
