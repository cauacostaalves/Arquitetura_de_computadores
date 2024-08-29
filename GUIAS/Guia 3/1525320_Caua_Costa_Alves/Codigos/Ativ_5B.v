/*
 Guia_0305.v
 999999 - Xxx Yyy Zzz
*/
module Guia_0305;
// define data
 reg [5:0] a = 6'b110101; // 110101(2)
 reg [3:0] b = 4'b1011;  // 1011(2)
 reg [7:0] c = 8'b1011001; // 1011001(2)
 reg [4:0] d = 5'hC5;    // C5(16)
 reg [7:0] e = 8'd126;   // 7E(10) em decimal

// actions
 initial
 begin : main
   $display ( "Guia_0305 - Tests" );
   
   // a) 110101(2) – 1011(2)
   $display("a) 110101(2) - 01011(2) = %b = %d", a - {2'b00, b}, a - {2'b00, b});
   
   // b) 101,1001(2) – 3,1(8)
   // Convertendo 3,1(8) para binário, alinhando vírgula
   $display("b) 1011001(2) - 0010100(2) = %b = %d", a - 7'b0010100, a - 7'b0010100);
   
   // c) 213(4) – 3D(16)
   // Convertendo 213(4) e 3D(16) para decimal
   $display("c) 213(4) = %d (decimal)", 2*16 + 1*4 + 3); // 2*16 + 1*4 + 3 = 35
   $display("   3D(16) = %d (decimal)", 3*16 + 13); // 3*16 + 13 = 61
   $display("   Result = %d (decimal)", 35 - 61); // -26
   
   // d) C5(16) – 1011001(2)
   // Convertendo C5(16) para decimal
   $display("d) C5(16) = %d (decimal)", 12*16 + 5); // 12*16 + 5 = 197
   $display("   1011001(2) = %d (decimal)", 1*64 + 1*32 + 1*16 + 0*8 + 0*4 + 1*2 + 1*1); // 64 + 32 + 16 + 2 + 1 = 115
   $display("   Result = %d (decimal)", 197 - 115); // 82
   
   // e) 7E(10) – 2D(16)
   // Convertendo 2D(16) para decimal
   $display("e) 7E(10) = %d (decimal)", 126); // 7E em decimal é 126
   $display("   2D(16) = %d (decimal)", 2*16 + 13); // 2*16 + 13 = 45
   $display("   Result = %d (decimal)", 126 - 45); // 81
 end // main
endmodule // Guia_0305
