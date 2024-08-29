// Guia_0301.v
// 999999 - Xxx Yyy Zzz

module Guia_0301;
// define data
 reg [5:0] a = 6'b101010; // 6 bits, extends to 6 bits
 reg [7:0] b = 8'b00001101; // 8 bits, 1101 (4 bits) extended to 8 bits
 reg [5:0] c = 6'b101001; // 6 bits
 reg [6:0] d = 7'b101111; // 7 bits
 reg [7:0] e = 8'b11010000; // 8 bits

 reg [5:0] C1_a, C2_a; // Storage for results
 reg [7:0] C1_b, C2_b; // Storage for results
 reg [5:0] C1_c, C2_c; // Storage for results
 reg [6:0] C1_d, C2_d; // Storage for results
 reg [7:0] C1_e, C2_e; // Storage for results

// actions
 initial
 begin : main
   $display("Guia_0301 - Tests");
   
   // For a = 101010 (6 bits)
   C1_a = ~a;
   C2_a = C1_a + 1;
   $display("a = %6b -> C1(a) = %6b -> C2(a) = %6b", a, C1_a, C2_a);
   
   // For b = 00001101 (8 bits)
   C1_b = ~b;
   C2_b = C1_b + 1;
   $display("b = %8b -> C1(b) = %8b -> C2(b) = %8b", b, C1_b, C2_b);
   
   // For c = 101001 (6 bits)
   C1_c = ~c;
   C2_c = C1_c + 1;
   $display("c = %6b -> C1(c) = %6b -> C2(c) = %6b", c, C1_c, C2_c);
   
   // For d = 101111 (7 bits)
   C1_d = ~d;
   C2_d = C1_d + 1;
   $display("d = %7b -> C1(d) = %7b -> C2(d) = %7b", d, C1_d, C2_d);
   
   // For e = 11010000 (8 bits)
   C1_e = ~e;
   C2_e = C1_e + 1;
   $display("e = %8b -> C1(e) = %8b -> C2(e) = %8b", e, C1_e, C2_e);
 end // main
endmodule // Guia_0301
