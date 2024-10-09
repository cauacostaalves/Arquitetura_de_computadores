module sop_expression (
    input wire a,
    input wire b,
    input wire c,
    input wire d,
    output wire f
);

    wire bc_not_d_not;   // b * c' * d'
    wire a_not_b_not_cd_not; // a' * b' * c * d'
    wire ab_not_cd;      // a * b' * c * d
    wire a_not_bc;       // a' * b * c * d

    wire c_not = ~c;     // c'
    wire d_not = ~d;     // d'
    wire a_not = ~a;     // a'
    wire b_not = ~b;     // b'

    // Termos da expressão
    assign bc_not_d_not = b & c_not & d_not;
    assign a_not_b_not_cd_not = a_not & b_not & c & d_not;
    assign ab_not_cd = a & b_not & c & d;
    assign a_not_bc = a_not & b & c & d;

    // Saída final
    assign f = bc_not_d_not | a_not_b_not_cd_not | ab_not_cd | a_not_bc;

endmodule
