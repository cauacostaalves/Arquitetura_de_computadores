module minterm_expression (
    input wire a,
    input wire b,
    output wire f
);
    wire xor_ab;
    wire not_a;
    wire not_b;
    wire nor_ab;

    // NOT gates
    not NOT_A(not_a, a);
    not NOT_B(not_b, b);

    // XOR gate
    xor XOR_AB(xor_ab, a, b);

    // NOR gate
    nor NOR_AB(nor_ab, not_a, not_b);

    // NAND gate
    nand NAND_F(f, xor_ab, nor_ab);
endmodule

// Testbench para verificar a implementação
module testbench;
    reg a, b;
    wire f;

    // Instancia o módulo
    minterm_expression uut (
        .a(a),
        .b(b),
        .f(f)
    );

    initial begin
        // Cabeçalho da tabela-verdade
        $display("a b | f");
        $display("-------");

        // Testa todas as combinações de a e b
        for (a = 0; a <= 1; a = a + 1) begin
            for (b = 0; b <= 1; b = b + 1) begin
                #10; // Delay para observar a saída
                $display("%b %b | %b", a, b, f);
            end
        end
    end
endmodule
