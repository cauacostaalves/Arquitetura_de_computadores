// -----------------------
// Autor: Cauã Costa Alves
// Matrícula: 855926
// -----------------------
`include "jkff.v"

module Guia_1306 (output [4:0] count, input clk, input clear);
    wire [4:0] qnot;

    // Primeira posição do contador em anel, começa com 1
    jkff FF0 (count[0], qnot[0], 1'b1, 1'b0, clk, clear);
    jkff FF1 (count[1], qnot[1], count[0], ~count[0], clk, clear);
    jkff FF2 (count[2], qnot[2], count[1], ~count[1], clk, clear);
    jkff FF3 (count[3], qnot[3], count[2], ~count[2], clk, clear);
    jkff FF4 (count[4], qnot[4], count[3], ~count[3], clk, clear);

    // Conectando a última saída de volta para o primeiro flip-flop
    assign FF0.j = count[4];
    assign FF0.k = ~count[4];

    // Inicializando o contador com o bit 1 no primeiro flip-flop
    initial begin
        assign clear = 1; 
        #5 clear = 0; 
        count = 5'b00001; 
    end
endmodule
