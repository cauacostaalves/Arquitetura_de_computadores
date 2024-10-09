module sop_nand (
    input wire a,
    input wire b,
    input wire c,
    input wire d,
    output wire f
);

    wire not_b = ~b;
    wire not_a = ~a;
    wire not_c = ~c;
    wire not_d = ~d;

    wire term1 = not_b | c | d;
    wire term2 = not_a | not_b | not_c | d;
    wire term3 = not_a | not_b | c | d;
    wire term4 = not_a | not_b | not_c | not_d;

    assign f = ~(term1 & term2 & term3 & term4);

endmodule
