module logic_function_nand (
    input a,
    input b,
    input c,
    input d,
    output f
);

// Declaração de wires
wire not_a, not_b, not_c, not_d;
wire term1, term2, term3, term4;
wire nand_term1, nand_term2, nand_term3, nand_term4;
wire and_terms;

// Negação das entradas usando NAND
nand (not_a, a, a);
nand (not_b, b, b);
nand (not_c, c, c);
nand (not_d, d, d);

// Cálculo dos termos usando NAND
nand (term1, b, not_c, not_d); // b · ¬c · ¬d
nand (term2, not_a, b, c, d);  // ¬a · b · c · d
nand (term3, a, not_b, c, d);  // a · ¬b · c · d
nand (term4, not_a, not_b, c, not_d); // ¬a · ¬b · c · ¬d

nand(f,term1,term2,term3,term4);

endmodule

module testbench;
    reg a, b, c, d;  // Entradas
    wire f;          // Saída

    // Instância do módulo com a função lógica
    logic_function_nand uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .f(f)
    );

    initial begin
        // Cabeçalho da tabela verdade
        $display("A B C D | F");
        $display("---------------");

        // Combinações de entradas
        a = 0; b = 0; c = 0; d = 0; #1; $display("%b %b %b %b | %b", a, b, c, d, f);
        a = 0; b = 0; c = 0; d = 1; #1; $display("%b %b %b %b | %b", a, b, c, d, f);
        a = 0; b = 0; c = 1; d = 0; #1; $display("%b %b %b %b | %b", a, b, c, d, f);
        a = 0; b = 0; c = 1; d = 1; #1; $display("%b %b %b %b | %b", a, b, c, d, f);
        a = 0; b = 1; c = 0; d = 0; #1; $display("%b %b %b %b | %b", a, b, c, d, f);
        a = 0; b = 1; c = 0; d = 1; #1; $display("%b %b %b %b | %b", a, b, c, d, f);
        a = 0; b = 1; c = 1; d = 0; #1; $display("%b %b %b %b | %b", a, b, c, d, f);
        a = 0; b = 1; c = 1; d = 1; #1; $display("%b %b %b %b | %b", a, b, c, d, f);
        a = 1; b = 0; c = 0; d = 0; #1; $display("%b %b %b %b | %b", a, b, c, d, f);
        a = 1; b = 0; c = 0; d = 1; #1; $display("%b %b %b %b | %b", a, b, c, d, f);
        a = 1; b = 0; c = 1; d = 0; #1; $display("%b %b %b %b | %b", a, b, c, d, f);
        a = 1; b = 0; c = 1; d = 1; #1; $display("%b %b %b %b | %b", a, b, c, d, f);
        a = 1; b = 1; c = 0; d = 0; #1; $display("%b %b %b %b | %b", a, b, c, d, f);
        a = 1; b = 1; c = 0; d = 1; #1; $display("%b %b %b %b | %b", a, b, c, d, f);
        a = 1; b = 1; c = 1; d = 0; #1; $display("%b %b %b %b | %b", a, b, c, d, f);
        a = 1; b = 1; c = 1; d = 1; #1; $display("%b %b %b %b | %b", a, b, c, d, f);

        // Finaliza a simulação
        $finish;
    end
endmodule

