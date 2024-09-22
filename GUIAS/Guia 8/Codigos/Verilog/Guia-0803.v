// -------------------------
// Guia_0803 - COMPARADOR DE IGUALDADE
// Nome: Cauã Costa Alves
// Matricula: 855926
// -------------------------

// -------------------------
// Comparador de Igualdade para 5 bits
// -------------------------
module equalityComparator (
    output equal,      // Sinal de igualdade
    input [4:0] x,     // Primeiro vetor de 5 bits
    input [4:0] y      // Segundo vetor de 5 bits
);
    wire n1, n2, n3, n4, n5; // Interconexões

    // Comparando cada bit usando portas XNOR
    xnor (n1, x[0], y[0]); // Comparação do bit 0
    xnor (n2, x[1], y[1]); // Comparação do bit 1
    xnor (n3, x[2], y[2]); // Comparação do bit 2
    xnor (n4, x[3], y[3]); // Comparação do bit 3
    xnor (n5, x[4], y[4]); // Comparação do bit 4

    // Sinal de igualdade será verdadeiro se todos os bits forem iguais
    and (equal, n1, n2, n3, n4, n5);
endmodule // equalityComparator

// -------------------------
// Testbench
// -------------------------
module test_equalityComparator;
    reg [4:0] a; // Primeiro vetor
    reg [4:0] b; // Segundo vetor
    wire equal;   // Sinal de igualdade

    equalityComparator EC (.equal(equal), .x(a), .y(b));

    initial begin
        // Exibir cabeçalho
        $display("Guia_0803 - Cauã Costa Alves - 855926");
        $display("Testando o comparador de igualdade");

        // Testes
        a = 5'b00000; b = 5'b00000; #10;
        $display("a = %b, b = %b => equal = %b", a, b, equal);

        a = 5'b00001; b = 5'b00001; #10;
        $display("a = %b, b = %b => equal = %b", a, b, equal);

        a = 5'b00010; b = 5'b00001; #10;
        $display("a = %b, b = %b => equal = %b", a, b, equal);

        a = 5'b11011; b = 5'b11011; #10;
        $display("a = %b, b = %b => equal = %b", a, b, equal);

        a = 5'b11111; b = 5'b00000; #10;
        $display("a = %b, b = %b => equal = %b", a, b, equal);

        $finish; // Finalizar simulação
    end
endmodule // test_equalityComparator
