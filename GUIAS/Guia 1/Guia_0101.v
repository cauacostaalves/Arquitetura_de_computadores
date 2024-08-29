/*
Guia_0103.v
999999 - Xxx Yyy Zzz
*/
module Guia_0103;
// define data
integer x;
reg [15:0] b; // increased bit-width to handle larger values

// actions
initial
begin : main
  $display ( "Guia_0103 - Tests" );

  // Conversion 61(10)
  x = 61;
  b = x;
  $display ( "61(10) = %b (2) = %o (8) = %x (16) = %X (16)", b, b, b, b );

  // Conversion 53(10)
  x = 53;
  b = x;
  $display ( "53(10) = %b (2) = %o (8) = %x (16) = %X (16)", b, b, b, b );

  // Conversion 77(10)
  x = 77;
  b = x;
  $display ( "77(10) = %b (2) = %o (8) = %x (16) = %X (16)", b, b, b, b );

  // Conversion 153(10)
  x = 153;
  b = x;
  $display ( "153(10) = %b (2) = %o (8) = %x (16) = %X (16)", b, b, b, b );

  // Conversion 753(10)
  x = 753;
  b = x;
  $display ( "753(10) = %b (2) = %o (8) = %x (16) = %X (16)", b, b, b, b );

end // main
endmodule // Guia_0103