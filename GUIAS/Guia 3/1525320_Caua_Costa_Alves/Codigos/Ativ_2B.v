/*
 Guia_0302.v
 999999 - Xxx Yyy Zzz
*/
module Guia_0302;
// define data
 reg [7:0] a = 8'h21 ; // hexadecimal para 321(4)
 reg [7:0] b = 8'hB2 ; // hexadecimal para B2(16)
 reg [5:0] c = 6'o23 ; // octal para 231(4)
 reg [7:0] d = 0 ; // binary
 reg [7:0] e = 0 ; // binary
 reg [5:0] f = 0 ; // binary
// actions
 initial
 begin : main
   $display ( "Guia_0302 - Tests" );
 
   // C1,6 (321(4))
   // 321(4) = 21 (decimal)
   d = ~21 + 1; // 6 bits
   $display ( "321(4) = %6b -> C1,6(321(4)) = %6b -> C2,6(321(4)) = %6b", 21, ~21[5:0], d );
 
   // C1,8 (B2(16))
   // B2(16) = 178 (decimal)
   e = ~178 + 1; // 8 bits
   $display ( "B2(16) = %8b -> C1,8(B2(16)) = %8b -> C2,8(B2(16)) = %8b", 178, ~178[7:0], e );
 
   // C2,6 (231(4))
   // 231(4) = 39 (decimal)
   f = ~39 + 1; // 6 bits
   $display ( "231(4) = %6b -> C1,6(231(4)) = %6b -> C2,6(231(4)) = %6b", 39, ~39[5:0], f );
 
 end // main
endmodule // Guia_0302
