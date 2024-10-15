// ------------------------- 
// Nome: Cauã Costa Alves 
// Matricula: 855926 
// ------------------------- 

module Rec0101e (output s, 
                 input  x, 
                 input  y, 
                 input  w, 
                 input  z);
    wire term1, term2, term3, cout; // Saídas dos termos intermediários

    // Implementação das NANDs
    nand n1(term1, x, ~w);                // (x . not(w))'
    nand n2(term2, y, ~w, ~z);            // (y . not(w) . not(z))'
    nand n3(term3, x, y, ~z);             // (x . y . not(z))'
    nand n4(cout, term1, term2, term3);  // (term1 . term2 . term3)'
    nand n5(s, cout, cout);               // Saída final (cout)'

endmodule 

module test_Rec0101e; 
// ------------------------- definir dados 
    reg  x; 
    reg  y; 
    reg  w; 
    reg  z; 
    wire s;  

    Rec0101e modulo06 (s, x, y, w, z); 

// ------------------------- parte principal 
    initial 
    begin : main 
        $display("Rec0101e - Cauã Costa Alves - 855926"); 
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
