module pos_nor (
    input wire A,
    input wire B,
    input wire C,
    input wire D,
    output wire f
);

    wire not_a = ~A;
    wire not_b = ~B;
    wire not_c = ~C;
    wire not_d = ~D;

    wire term1 = not_b | not_c;
    wire term2 = not_c | not_d;
    wire term3 = not_a | not_b | not_d;
    wire term4 = not_a | not_b | not_c;
    wire term5 = not_b | not_c | not_d;
    wire term6 = not_a | not_c | not_d;

    assign f = ~(term1 & term2 & term3 & term4 & term5 & term6);

endmodule
