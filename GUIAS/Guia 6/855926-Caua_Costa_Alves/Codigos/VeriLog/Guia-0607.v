// ------------------------- 
// Guia_0607.v  
// Nome: Cauã Costa Alves 
// Matricula: 855926 
// ------------------------- 

module Guia0607 (output s, 
                 input  X, 
                 input  Y,
                 input  Z);
    assign s = ( X | ~Y |  Z ) & (~X | Y |  Z) & ( X | ~Y | Z );
endmodule 

module Guia0607Simplificado (output s, 
                             input  X, 
                             input  Y,
                             input  Z);
    assign s = (X | ~Y | Z) & (~X | Y | Z);
endmodule 

module test_Guia0607; 
// ------------------------- definir dados 
    reg  X; 
    reg  Y; 
    reg  Z;
    wire s;   

    Guia0607 modulo07 (s, X, Y, Z); 

// ------------------------- parte principal 
    initial 
    begin : main 
        $display("Guia_0607 - Cauã Costa Alves - 855926"); 
        $display("Modulo da questão 7"); 
        $display("   X    Y    Z    s");
        
        $monitor("%4b %4b %4b %4b", X, Y, Z, s); 

        // Gerar a tabela verdade para Guia0607
        X = 1'b0;  Y = 1'b0;  Z = 1'b0;
        #1      X = 1'b0;  Y = 1'b1;  Z = 1'b0;
        #1      X = 1'b1;  Y = 1'b0;  Z = 1'b0;
        #1      X = 1'b1;  Y = 1'b1;  Z = 1'b0;
        #1      X = 1'b0;  Y = 1'b0;  Z = 1'b1;
        #1      X = 1'b0;  Y = 1'b1;  Z = 1'b1;
        #1      X = 1'b1;  Y = 1'b0;  Z = 1'b1;
        #1      X = 1'b1;  Y = 1'b1;  Z = 1'b1;
    end 

endmodule

module test_Guia0607Simplificado; 
// ------------------------- definir dados 
    reg  X; 
    reg  Y; 
    reg  Z;
    wire s;   
    
    Guia0607Simplificado modulo07S(s, X, Y, Z);  

// ------------------------- parte principal 
    initial 
    begin : main 
        $display("Guia_0607 - Cauã Costa Alves - 855926"); 
        $display("Modulo Simplificado da questão 7"); 
        $display("   X    Y    Z    s");
        
        $monitor("%4b %4b %4b %4b", X, Y, Z, s); 

        // Gerar a tabela verdade para Guia0607Simplificado
        X = 1'b0;  Y = 1'b0;  Z = 1'b0;
        #1      X = 1'b0;  Y = 1'b1;  Z = 1'b0;
        #1      X = 1'b1;  Y = 1'b0;  Z = 1'b0;
        #1      X = 1'b1;  Y = 1'b1;  Z = 1'b0;
        #1      X = 1'b0;  Y = 1'b0;  Z = 1'b1;
        #1      X = 1'b0;  Y = 1'b1;  Z = 1'b1;
        #1      X = 1'b1;  Y = 1'b0;  Z = 1'b1;
        #1      X = 1'b1;  Y = 1'b1;  Z = 1'b1;
    end 

endmodule
