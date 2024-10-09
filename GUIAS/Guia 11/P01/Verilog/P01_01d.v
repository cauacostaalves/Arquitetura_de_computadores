module logic_function (
    input A,
    input B,
    input C,
    input D,
    output F
);

wire not_A, not_B, not_C, not_D;
wire term1, term2, term3, term4, term5, term6;
wire and_terms;

// Negação das entradas
not (not_A, A);
not (not_B, B);
not (not_C, C);
not (not_D, D);

// Cálculo dos termos
or (term1, B, C, D);           // B + C + D
or (term2, C, not_D);          // C + D'
or (term3, A, B, not_D);       // A + B + D'
or (term4, not_A, not_B, not_C); // A' + B' + C'
or (term5, not_B, not_C, D);   // B' + C' + D
or (term6, not_A, not_C, D);    // A' + C' + D

// AND dos termos
and (and_terms, term1, term2, term3, term4, term5, term6);

// Resultado final
assign F = and_terms;

endmodule

module testbench;
    reg A, B, C, D;  // Entradas
    wire F;         // Saída

    // Instância do módulo com a função lógica
    logic_function uut (
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
