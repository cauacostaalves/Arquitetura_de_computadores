module pos_expression (
    input wire A,
    input wire B,
    input wire C,
    input wire D,
    output wire f
);

    wire not_A = ~A; // A'
    wire not_B = ~B; // B'
    wire not_C = ~C; // C'
    wire not_D = ~D; // D'

    // Termos da expressão
    wire term1 = B | C;                  // (B + C)
    wire term2 = C | not_D;              // (C + D')
    wire term3 = A | B | not_D;          // (A + B + D')
    wire term4 = not_A | not_B | not_C;  // (A' + B' + C')
    wire term5 = B | not_C | D;          // (B + C' + D)
    wire term6 = not_A | not_C | D;      // (A' + C' + D)

    // Saída final
    assign f = ~(term1 & term2 & term3 & term4 & term5 & term6);

endmodule
