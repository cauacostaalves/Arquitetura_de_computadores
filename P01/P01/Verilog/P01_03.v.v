// Módulo para MUX
module mux (
    output wire out,
    input wire a,
    input wire b,
    input wire sel
);
    assign out = (sel == 0) ? a : b; // Se sel = 0, saída = a; senão, saída = b
endmodule

// Módulo principal que implementa a expressão
module main (
    output wire s,
    input wire a,
    input wire b,
    input wire c
);
    wire mux1_out; // Saída do primeiro MUX
    wire mux2_out; // Saída do segundo MUX
    wire not_a, not_b, not_c; // Negações

    // Negações das entradas
    not NOT1(not_a, a);
    not NOT2(not_b, b);
    not NOT3(not_c, c);

    // Primeiro MUX
    mux mux1 (
        .out(mux1_out),
        .a(b),
        .b(a),
        .sel(c)
    );

    // Segundo MUX
    mux mux2 (
        .out(mux2_out),
        .a(not_a),
        .b(not_b),
        .sel(c)
    );

    // Terceiro MUX
    mux mux3 (
        .out(s),
        .a(mux1_out),
        .b(mux2_out),
        .sel(not_c)
    );

endmodule

// Testbench para o módulo
module testbench;
    reg a, b, c;          // Entradas
    wire s;              // Saída

    // Instancia o módulo principal
    main uut (
        .s(s),
        .a(a),
        .b(b),
        .c(c)
    );

    initial begin
        // Cabeçalho da tabela-verdade
        $display("a b c | s");
        $display("-------");

        // Testa todas as combinações de a, b e c
        for (a = 0; a <= 1; a = a + 1) begin
            for (b = 0; b <= 1; b = b + 1) begin
                for (c = 0; c <= 1; c = c + 1) begin
                    #10; // Delay para observar a saída
                    $display("%b %b %b | %b", a, b, c, s);
                end
            end
        end
    end
endmodule
