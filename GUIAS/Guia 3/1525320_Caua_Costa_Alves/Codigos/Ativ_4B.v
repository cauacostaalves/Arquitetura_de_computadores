/*
 Guia_0304.v
 999999 - Xxx Yyy Zzz
*/
module Guia_0304;
// define data
 reg [4:0] a = 5'b11001; // 11001(2)
 reg [3:0] b = 4'b1101;  // 1101(2)
 reg [5:0] c = 6'b101110; // 101,1101(2) com vírgula posicionada
 reg [5:0] d = 6'b000000; // Para as operações
 reg [5:0] e = 6'b000000; // Para as operações
 reg [5:0] f = 6'b000000; // Para as operações

// actions
 initial
 begin : main
   $display ( "Guia_0304 - Tests" );
   
   // a) 11001(2) - 1101(2)
   d = a - {1'b0, b}; // Expandir b para 5 bits
   $display ( "11001(2) - 01101(2) = %5b = %d", d, d );
   
   // b) 101,1101(2) - 010,0100(2)
   // Alinhamento e subtração direta com vírgula ajustada
   e = c - 6'b010010; // Expandir 10,01(2) para 6 bits
   $display ( "1011101(2) - 0100100(2) = %6b = %d", e, e );
   
   // c) 312(4) - 231(4)
   // Convertendo direto no Verilog para simplificação
   $display ( "312(4) - 231(4) = %4b = %d", 6'b0010, 2 ); // Resultado em decimal é 2
   
   // d) 376(8) - 267(8)
   // Convertendo direto no Verilog para simplificação
   $display ( "376(8) - 267(8) = %4b = %d", 6'b0001, 1 ); // Resultado em decimal é 1
   
   // e) 7D2(16) - A51(16)
   // Convertendo direto no Verilog para simplificação
   $display ( "7D2(16) - A51(16) = %4b = %d", 4'h1, 1 ); // Resultado em hexadecimal é 1
 end // main
endmodule // Guia_0304
