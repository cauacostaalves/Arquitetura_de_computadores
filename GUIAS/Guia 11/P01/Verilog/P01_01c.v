// Módulo da expressão
module sop_expression (
    input wire a,
    input wire b,
    input wire c,
    input wire d,
    output wire f
);

    wire b_and_not_c_and_not_d;    // b * c' * d'
    wire not_a_and_b_and_c_and_d;   // a' * b * c * d
    wire a_and_not_b_and_c_and_d;   // a * b' * c * d
    wire not_a_and_not_b_and_c_and_not_d; // a' * b' * c * d'

    // Termos da expressão
    assign b_and_not_c_and_not_d = b & ~c & ~d;
    assign not_a_and_b_and_c_and_d = ~a & b & c & d;
    assign a_and_not_b_and_c_and_d = a & ~b & c & d;
    assign not_a_and_not_b_and_c_and_not_d = ~a & ~b & c & ~d;

    // Saída final
    assign f = b_and_not_c_and_not_d | not_a_and_b_and_c_and_d | a_and_not_b_and_c_and_d | not_a_and_not_b_and_c_and_not_d;

endmodule

// Testbench para imprimir a tabela verdade
module testbench;
    reg a, b, c, d;          // Entradas como registros
    wire f;                  // Saída

    // Instanciando o módulo
    sop_expression my_expression(a, b, c, d, f);

    initial begin
        // Impressão do cabeçalho
        $display(" a | b | c | d | f ");
        $display("--------------------");
        
        // Testando todas as combinações de a, b, c e d
        {a, b, c, d} = 4'b0000; #1; $display(" %b | %b | %b | %b | %b ", a, b, c, d, f);
        {a, b, c, d} = 4'b0001; #1; $display(" %b | %b | %b | %b | %b ", a, b, c, d, f);
        {a, b, c, d} = 4'b0010; #1; $display(" %b | %b | %b | %b | %b ", a, b, c, d, f);
        {a, b, c, d} = 4'b0011; #1; $display(" %b | %b | %b | %b | %b ", a, b, c, d, f);
        {a, b, c, d} = 4'b0100; #1; $display(" %b | %b | %b | %b | %b ", a, b, c, d, f);
        {a, b, c, d} = 4'b0101; #1; $display(" %b | %b | %b | %b | %b ", a, b, c, d, f);
        {a, b, c, d} = 4'b0110; #1; $display(" %b | %b | %b | %b | %b ", a, b, c, d, f);
        {a, b, c, d} = 4'b0111; #1; $display(" %b | %b | %b | %b | %b ", a, b, c, d, f);
        {a, b, c, d} = 4'b1000; #1; $display(" %b | %b | %b | %b | %b ", a, b, c, d, f);
        {a, b, c, d} = 4'b1001; #1; $display(" %b | %b | %b | %b | %b ", a, b, c, d, f);
        {a, b, c, d} = 4'b1010; #1; $display(" %b | %b | %b | %b | %b ", a, b, c, d, f);
        {a, b, c, d} = 4'b1011; #1; $display(" %b | %b | %b | %b | %b ", a, b, c, d, f);
        {a, b, c, d} = 4'b1100; #1; $display(" %b | %b | %b | %b | %b ", a, b, c, d, f);
        {a, b, c, d} = 4'b1101; #1; $display(" %b | %b | %b | %b | %b ", a, b, c, d, f);
        {a, b, c, d} = 4'b1110; #1; $display(" %b | %b | %b | %b | %b ", a, b, c, d, f);
        {a, b, c, d} = 4'b1111; #1; $display(" %b | %b | %b | %b | %b ", a, b, c, d, f);

        // Finalizando a simulação
        $finish;
    end
endmodule
