// Módulo para a expressão dada
module expression (
    input wire a,
    input wire b,
    output wire f
);
    wire xor_out;  // Saída do XOR
    wire not_a;    // NOT a
    wire not_b;    // NOT b
    wire nor_out;  // Saída do NOR

    // Operações lógicas
    assign not_a = ~a;                // NOT a
    assign not_b = ~b;                // NOT b
    assign xor_out = a ^ b;           // XOR(a, b)
    assign nor_out = ~(not_a | not_b); // NOR(NOT(a), NOT(b))
    
    // NAND da saída do XOR e do NOR
    assign f = ~(xor_out & nor_out);  // NAND(XOR(a, b), NOR(NOT(a), NOT(b)))
endmodule

// Testbench para o módulo
module testbench;
    reg a, b;          // Entradas
    wire f;           // Saída

    // Instancia o módulo principal
    expression uut (
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
