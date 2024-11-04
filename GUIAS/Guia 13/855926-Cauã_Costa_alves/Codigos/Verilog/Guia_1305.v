// -----------------------
// Autor: Cauã Costa Alves
// Matrícula: 855926
// -----------------------
module tff (output reg q, input t, input clk, input clear);
    always @(posedge clk or posedge clear) begin
        if (clear)
            q <= 0;
        else if (t)
            q <= ~q;
    end
endmodule

module Guia_1305 (output [2:0] count, input clk, input clear);
    wire [2:0] t;
    
    tff TFF0 (count[0], 1'b1, clk, clear);
    tff TFF1 (count[1], count[0], clk, clear);
    tff TFF2 (count[2], count[1] & count[0], clk, clear);

    always @(posedge clk) begin
        if (count == 3'b111) // Se contagem chegar a 7 (111 em binário)
            assign clear = 1;
        else
            assign clear = 0;
    end
endmodule
