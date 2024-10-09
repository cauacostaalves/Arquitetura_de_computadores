module logic_function_nor (
    input A,
    input B,
    input C,
    input D,
    output F
);

wire not_A, not_B, not_C, not_D;
wire term1, term2, term3, term4, term5, term6;
wire nor_terms;

// Negações usando NOR
nor (not_A, A, A);
nor (not_B, B, B);
nor (not_C, C, C);
nor (not_D, D, D);

// Cálculo dos termos usando NOR
nor (term1,B, C,D);           // B + C + D
nor (term2, C,not_D);             // C + D'
nor (term3, A, B, not_D);         // A + B + D'
nor (term4, not_A,not_B, not_C);     // A' + B' + C'
nor (term5, not_B, not_C,D);          // B' + C' + D
nor (term6, not_A, not_C, D);       // A' + C' + D


nor (F, term1,term2,term3,term4,term5,term6); // F = NOR(...)'

endmodule

module testbench;
    reg A, B, C, D;  // Entradas
    wire F;         // Saída

    // Instância do módulo com a função lógica
    logic_function_nor uut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .F(F)
    );

    initial begin
        // Cabeçalho da tabela verdade
        $display("A B C D | F");
        $display("---------------");

        // Combinações de entradas
        A = 0; B = 0; C = 0; D = 0; #1; $display("%b %b %b %b | %b", A, B, C, D, F);
        A = 0; B = 0; C = 0; D = 1; #1; $display("%b %b %b %b | %b", A, B, C, D, F);
        A = 0; B = 0; C = 1; D = 0; #1; $display("%b %b %b %b | %b", A, B, C, D, F);
        A = 0; B = 0; C = 1; D = 1; #1; $display("%b %b %b %b | %b", A, B, C, D, F);
        A = 0; B = 1; C = 0; D = 0; #1; $display("%b %b %b %b | %b", A, B, C, D, F);
        A = 0; B = 1; C = 0; D = 1; #1; $display("%b %b %b %b | %b", A, B, C, D, F);
        A = 0; B = 1; C = 1; D = 0; #1; $display("%b %b %b %b | %b", A, B, C, D, F);
        A = 0; B = 1; C = 1; D = 1; #1; $display("%b %b %b %b | %b", A, B, C, D, F);
        A = 1; B = 0; C = 0; D = 0; #1; $display("%b %b %b %b | %b", A, B, C, D, F);
        A = 1; B = 0; C = 0; D = 1; #1; $display("%b %b %b %b | %b", A, B, C, D, F);
        A = 1; B = 0; C = 1; D = 0; #1; $display("%b %b %b %b | %b", A, B, C, D, F);
        A = 1; B = 0; C = 1; D = 1; #1; $display("%b %b %b %b | %b", A, B, C, D, F);
        A = 1; B = 1; C = 0; D = 0; #1; $display("%b %b %b %b | %b", A, B, C, D, F);
        A = 1; B = 1; C = 0; D = 1; #1; $display("%b %b %b %b | %b", A, B, C, D, F);
        A = 1; B = 1; C = 1; D = 0; #1; $display("%b %b %b %b | %b", A, B, C, D, F);
        A = 1; B = 1; C = 1; D = 1; #1; $display("%b %b %b %b | %b", A, B, C, D, F);

        // Finaliza a simulação
        $finish;
    end
endmodule
