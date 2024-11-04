// -----------------------
// Autor: Cauã Costa Alves
// Matrícula: 855926
// -----------------------
`include "jkff.v"
module Guia_1302 (output [4:0] count, input clk, input clear);
    wire [4:0] qnot;

    jkff FF0 (count[0], qnot[0], 1'b1, 1'b1, clk, clear);
    jkff FF1 (count[1], qnot[1], 1'b1, 1'b1, count[0], clear);
    jkff FF2 (count[2], qnot[2], 1'b1, 1'b1, count[1], clear);
    jkff FF3 (count[3], qnot[3], 1'b1, 1'b1, count[2], clear);
    jkff FF4 (count[4], qnot[4], 1'b1, 1'b1, count[3], clear);

endmodule
