// ------------------------- 
// Nome: Cauã Costa Alves 
// Matricula: 855926 
// ------------------------- 

module Rec0101c (output s, 
                 input  x, 
                 input  y, 
                 input  w, 
                 input  z);
    wire term1, term2, term3; // Saídas dos termos

    // Termos da expressão
    assign term1 = x & ~w;                 // x . not(w)
    assign term2 = y & ~w & ~z;            // y . not(w) . not(z)
    assign term3 = x & y & ~z;             // x . y . not(z)

    // Saída da expressão
    assign s = term1 | term2 | term3;      // (x . not(w)) + (y . not(w) . not(z)) + (x . y . not(z))
endmodule 

module test_Rec0101c; 
// ------------------------- definir dados 
    reg  x; 
    reg  y; 
    reg  w; 
    reg  z; 
    wire s;  

    Rec0101c modulo06 (s, x, y, w, z); 

// ------------------------- parte principal 
    initial 
    begin : main 
        $display("Rec0101c - Cauã Costa Alves - 855926"); 
        $display("   x    y    w    z    s"); 
        
        $monitor("%4b %4b %4b %4b %4b", x, y, w, z, s); 

        x = 1'b0;  y = 1'b0;  w = 1'b0;  z = 1'b0;
        #1      x = 1'b0;  y = 1'b0;  w = 1'b0;  z = 1'b1;
        #1      x = 1'b0;  y = 1'b0;  w = 1'b1;  z = 1'b0;
        #1      x = 1'b0;  y = 1'b0;  w = 1'b1;  z = 1'b1;
        #1      x = 1'b0;  y = 1'b1;  w = 1'b0;  z = 1'b0;
        #1      x = 1'b0;  y = 1'b1;  w = 1'b0;  z = 1'b1;
        #1      x = 1'b0;  y = 1'b1;  w = 1'b1;  z = 1'b0;
        #1      x = 1'b0;  y = 1'b1;  w = 1'b1;  z = 1'b1;
        #1      x = 1'b1;  y = 1'b0;  w = 1'b0;  z = 1'b0;
        #1      x = 1'b1;  y = 1'b0;  w = 1'b0;  z = 1'b1;
        #1      x = 1'b1;  y = 1'b0;  w = 1'b1;  z = 1'b0;
        #1      x = 1'b1;  y = 1'b0;  w = 1'b1;  z = 1'b1;
        #1      x = 1'b1;  y = 1'b1;  w = 1'b0;  z = 1'b0;
        #1      x = 1'b1;  y = 1'b1;  w = 1'b0;  z = 1'b1;
        #1      x = 1'b1;  y = 1'b1;  w = 1'b1;  z = 1'b0;
        #1      x = 1'b1;  y = 1'b1;  w = 1'b1;  z = 1'b1;
    end 

endmodule  
