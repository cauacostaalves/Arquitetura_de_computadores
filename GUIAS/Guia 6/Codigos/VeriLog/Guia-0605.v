// ------------------------- 
// Guia_0605.v  
// Nome: Cauã Costa Alves 
// Matricula: 855926 
// ------------------------- 

module Guia0605 (output s, 
                 input  x, 
                 input  y,
                 input  z);
    assign s = (x & ~z) | (x & ~y);
endmodule 

module test_Guia0605; 
// ------------------------- definir dados 
    reg  x; 
    reg  y; 
    reg  z; // Adicionando o sinal z
    wire s;  // Corrigido para wire s 

    Guia0605 modulo05 (s, x, y, z); 

// ------------------------- parte principal 
    initial 
    begin : main 
        $display("Guia_0605 - Cauã Costa Alves - 855926"); 
        $display("Modulo da questão 5"); 
        $display("   x    y    z    s"); 
        
        $monitor("%4b %4b %4b %4b", x, y, z, s); 

        x = 1'b0;  y = 1'b0;  z = 1'b0;
        #1      x = 1'b0;  y = 1'b1;  z = 1'b0;
        #1      x = 1'b1;  y = 1'b0;  z = 1'b0;
        #1      x = 1'b1;  y = 1'b1;  z = 1'b0;
        #1      x = 1'b0;  y = 1'b0;  z = 1'b1;
        #1      x = 1'b0;  y = 1'b1;  z = 1'b1;
        #1      x = 1'b1;  y = 1'b0;  z = 1'b1;
        #1      x = 1'b1;  y = 1'b1;  z = 1'b1;
    end 

endmodule  
