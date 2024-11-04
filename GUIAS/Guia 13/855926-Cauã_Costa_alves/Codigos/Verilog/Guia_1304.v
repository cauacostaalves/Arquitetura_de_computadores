// -----------------------
// Autor: Cauã Costa Alves
// Matrícula: 855926
// -----------------------
`include "jkff.v"
module Guia_1304 (output [3:0] count, input clk, input clear);
    wire [3:0] qnot;
    
    jkff FF0 (count[0], qnot[0], 1'b1, 1'b1, clk, clear);
    jkff FF1 (count[1], qnot[1], 1'b1, 1'b1, qnot[0], clear);
    jkff FF2 (count[2], qnot[2], 1'b1, 1'b1, qnot[1], clear);
    jkff FF3 (count[3], qnot[3], 1'b1, 1'b1, qnot[2], clear);

    always @(posedge clk) begin
        if (count == 4'b0000) // Se contagem chegar a 0
            assign clear = 1;
        else
            assign clear = 0;
    end
endmodule
