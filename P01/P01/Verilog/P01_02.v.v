// Módulo principal
module f (
    output s,
    input x,
    input y
);
    wire w1, w2, w3, w4, w5;

    // Inversões
    not NOT_1 (w1, x);         // w1 = ~x
    not NOT_2 (w2, y);         // w2 = ~y

    // Operações lógicas
    and AND_1 (w3, y, w1);     // w3 = y AND ~x
    or OR_1 (w4, w2, x);       // w4 = ~y OR x
    not NOT_3 (w5, w4);        // w5 = ~(~y OR x)

    // Saída final
    and AND_2 (s, w3, w5);     // s = w3 AND w5
endmodule

// Testbench para o módulo
module testbench;
    reg x, y;                // Entradas
    wire s;                 // Saída

    // Instancia o módulo
    f uut (
        .s(s),
        .x(x),
        .y(y)
    );

    initial begin
        // Cabeçalho da tabela-verdade
        $display("x y | s");
        $display("-------");

        // Testa todas as combinações de x e y
        for (x = 0; x <= 1; x = x + 1) begin
            for (y = 0; y <= 1; y = y + 1) begin
                #10; // Delay para observar a saída
                $display("%b %b | %b", x, y, s);
            end
        end
    end
endmodule
