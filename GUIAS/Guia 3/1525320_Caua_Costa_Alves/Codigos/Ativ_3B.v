/*
 Guia_0303.v
 999999 - Xxx Yyy Zzz
*/
module Guia_0303;
// define data
 reg [6:0] a = 7'b101_10 ; // 10110(2) em binário
 reg [5:0] b = 6'b110011 ; // 110011(2) em binário
 reg [5:0] c = 6'b100100 ; // 100100(2) em binário
 reg [6:0] d = 7'b1011011 ; // 1011011(2) em binário
 reg [6:0] e = 7'b1110011 ; // 1110011(2) em binário

// actions
 initial
 begin : main
   $display ( "Guia_0303 - Tests" );
   // a) 10110(2) = X(10)
   $display ( "10110(2) = %d (decimal)", a );

   // b) 110011(2) = X(10)
   $display ( "110011(2) = %d (decimal)", b );

   // c) 100100(2) = X(2)
   $display ( "100100(2) = %b (binary)", c );

   // d) 1011011(2) = X(2)
   $display ( "1011011(2) = %b (binary)", d );

   // e) 1110011(2) = X(16)
   $display ( "1110011(2) = %h (hexadecimal)", e );
 end // main
endmodule // Guia_0303
