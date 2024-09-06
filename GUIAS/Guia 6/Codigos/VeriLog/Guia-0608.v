// ------------------------- 
// Guia_0608.v  
// Nome: Cauã Costa Alves 
// Matricula: 855926 
// ------------------------- 

module Guia0608 (output s, 
                 input  w, 
                 input  x,
                 input  y,
                 input  z);
    assign s =  (~w & ~x & y & ~z) | (w & x & z) | (w & ~y & z);
endmodule 

module test_Guia0608; 
// ------------------------- definir dados 
    reg  w; 
    reg  x; 
    reg  y;
    reg  z;
    wire s;   

    Guia0608 modulo08 (s, w, x, y, z); 

// ------------------------- parte principal 
    initial 
    begin : main 
        $display("Guia_0608 - Cauã Costa Alves - 855926"); 
        $display("Modulo da questão 8"); 
        $display("   w    x    y    z    s");
        
        $monitor("%4b %4b %4b %4b %4b", w, x, y, z, s); 

         w = 1'b0;  x = 1'b0;  y = 1'b0;  z = 1'b0;
        #1      w = 1'b0;  x = 1'b0;  y = 1'b0;  z = 1'b1;
        #1      w = 1'b0;  x = 1'b0;  y = 1'b1;  z = 1'b0;
        #1      w = 1'b0;  x = 1'b0;  y = 1'b1;  z = 1'b1;
        #1      w = 1'b0;  x = 1'b1;  y = 1'b0;  z = 1'b0;
        #1      w = 1'b0;  x = 1'b1;  y = 1'b0;  z = 1'b1;
        #1      w = 1'b0;  x = 1'b1;  y = 1'b1;  z = 1'b0;
        #1      w = 1'b0;  x = 1'b1;  y = 1'b1;  z = 1'b1;
        #1      w = 1'b1;  x = 1'b0;  y = 1'b0;  z = 1'b0;
        #1      w = 1'b1;  x = 1'b0;  y = 1'b0;  z = 1'b1;
        #1      w = 1'b1;  x = 1'b0;  y = 1'b1;  z = 1'b0;
        #1      w = 1'b1;  x = 1'b0;  y = 1'b1;  z = 1'b1;
        #1      w = 1'b1;  x = 1'b1;  y = 1'b0;  z = 1'b0;
        #1      w = 1'b1;  x = 1'b1;  y = 1'b0;  z = 1'b1;
        #1      w = 1'b1;  x = 1'b1;  y = 1'b1;  z = 1'b0;
        #1      w = 1'b1;  x = 1'b1;  y = 1'b1;  z = 1'b1;
    end 

endmodule

