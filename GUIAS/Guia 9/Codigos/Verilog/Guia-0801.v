// -------------------------
// Guia_0801 - SOMADOR COMPLETO
// Nome: Cauã Costa Alves
// Matricula: 855926
// -------------------------

// -------------------------
// half adder
// -------------------------
module halfAdder (
    output s0,
    output s1,
    input a,
    input b
);
    xor (s0, a, b);  // soma
    and (s1, a, b);  // carry
endmodule // halfAdder

// -------------------------
// full adder
// -------------------------
module fullAdder (
    output s0,
    output s1,
    input a,
    input b,
    input carryIn
);
    wire s1_half, c1, c2; // interconexões

    // Instanciando uma meia-soma
    halfAdder HA1 (.s0(s0), .s1(s1_half), .a(a), .b(b));
    halfAdder HA2 (.s0(s1), .s1(c1), .a(s0), .b(carryIn));
    
    // Calculando o carry
    or (s1, c1, s1_half);
endmodule // fullAdder

// -------------------------
// 5-bit adder
// -------------------------
module fiveBitAdder (
    output [4:0] soma,
    output carryOut,
    input [4:0] a,
    input [4:0] b
);
    wire [4:0] carry; // carries entre os somadores

    fullAdder FA0 (.s0(soma[0]), .s1(carry[0]), .a(a[0]), .b(b[0]), .carryIn(1'b0));
    fullAdder FA1 (.s0(soma[1]), .s1(carry[1]), .a(a[1]), .b(b[1]), .carryIn(carry[0]));
    fullAdder FA2 (.s0(soma[2]), .s1(carry[2]), .a(a[2]), .b(b[2]), .carryIn(carry[1]));
    fullAdder FA3 (.s0(soma[3]), .s1(carry[3]), .a(a[3]), .b(b[3]), .carryIn(carry[2]));
    fullAdder FA4 (.s0(soma[4]), .s1(carryOut), .a(a[4]), .b(b[4]), .carryIn(carry[3]));
endmodule // fiveBitAdder

// -------------------------
// Testbench
// -------------------------
module test_fiveBitAdder;
    reg [4:0] x;
    reg [4:0] y;
    wire [4:0] soma;
    wire carryOut;

    fiveBitAdder FBA (.soma(soma), .carryOut(carryOut), .a(x), .b(y));

    initial begin
        // Exibir cabeçalho
        $display("Guia_0801 - Seu Nome Aqui - 999999");
        $display("Testando o somador de 5 bits");

        // Testes
        x = 5'b00000; y = 5'b00000; #10;
        $display("x = %b, y = %b => soma = %b, carryOut = %b", x, y, soma, carryOut);

        x = 5'b00001; y = 5'b00001; #10;
        $display("x = %b, y = %b => soma = %b, carryOut = %b", x, y, soma, carryOut);

        x = 5'b11111; y = 5'b00001; #10;
        $display("x = %b, y = %b => soma = %b, carryOut = %b", x, y, soma, carryOut);

        x = 5'b10011; y = 5'b01010; #10;
        $display("x = %b, y = %b => soma = %b, carryOut = %b", x, y, soma, carryOut);

        x = 5'b11111; y = 5'b11111; #10;
        $display("x = %b, y = %b => soma = %b, carryOut = %b", x, y, soma, carryOut);
        
        $finish; // Finalizar simulação
    end
endmodule // test_fiveBitAdder
