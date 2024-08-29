/*
* Guia_0205.v
*/
module Guia_0205;
// define data
    reg [8:0] a = 9'b10111011; // 101,11 (2) em binário com ponto decimal
    reg [8:0] b = 9'b01000101; // 10,011 (2) em binário com ponto decimal
    reg [8:0] c; 

    // actions
    initial
    begin : main
        $display("Guia_0205 - Tests");
        
        // Adição
        c = a + b; 
        $display("101,11 + 10,011 = %8b", c); // Resultado da soma
        
        // Subtração
        c = 9'b1000101 - 9'b0001001; // 1000,101 - 10,01
        $display("1000,101 - 10,01 = %8b", c); // Resultado da subtração

        // Multiplicação
        c = 9'b101101 * 9'b010101; // 101,101 * 10,101
        $display("101,101 * 10,101 = %8b", c); // Resultado da multiplicação
        
        // Divisão
        c = 9'b1011101 / 9'b1011; // 10111,01 / 11,011
        $display("10111,01 / 11,011 = %8b", c); // Resultado da divisão
        
        // Módulo
        c = 9'b1101011 % 9'b1101; // 1101011 % 1101
        $display("1101011 % 1101 = %8b", c); // Resultado do módulo
    end // main
endmodule // Guia_0205
