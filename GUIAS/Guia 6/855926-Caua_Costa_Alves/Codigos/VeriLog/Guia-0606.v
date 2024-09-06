// ------------------------- 
// Guia_0606.v  
// Nome: Cauã Costa Alves 
// Matricula: 855926 
// ------------------------- 

module Guia0606 (output s, 
                 input  X, 
                 input  Y,
                 input  W,
                 input  Z);
    assign s = (X | W) & (X | ~W) & (~Y | ~W | ~Z);
endmodule 

module test_Guia0606; 
// ------------------------- definir dados 
    reg  X; 
    reg  Y; 
    reg  W;
    reg  Z;
    wire s;  

    Guia0606 modulo06 (s, X, Y, W, Z); 

// ------------------------- parte principal 
    initial 
    begin : main 
        $display("Guia_0606 - Cauã Costa Alves - 855926"); 
        $display("Modulo da questão 6"); 
        $display("   X    Y    W    Z   s"); 
        
        $monitor("%4b %4b %4b %4b %4b", X, Y, W, Z, s); 

        X = 1'b0;  Y = 1'b0;  W = 1'b0;  Z = 1'b0;
        #1      X = 1'b0;  Y = 1'b0;  W = 1'b0;  Z = 1'b1;
        #1      X = 1'b0;  Y = 1'b1;  W = 1'b0;  Z = 1'b0;
        #1      X = 1'b0;  Y = 1'b1;  W = 1'b0;  Z = 1'b1;
        #1      X = 1'b0;  Y = 1'b1;  W = 1'b1;  Z = 1'b0;
        #1      X = 1'b0;  Y = 1'b1;  W = 1'b1;  Z = 1'b1;
        #1      X = 1'b1;  Y = 1'b0;  W = 1'b0;  Z = 1'b0;
        #1      X = 1'b1;  Y = 1'b0;  W = 1'b0;  Z = 1'b1;
        #1      X = 1'b1;  Y = 1'b0;  W = 1'b1;  Z = 1'b0;
        #1      X = 1'b1;  Y = 1'b0;  W = 1'b1;  Z = 1'b1;
        #1      X = 1'b1;  Y = 1'b1;  W = 1'b0;  Z = 1'b0;
        #1      X = 1'b1;  Y = 1'b1;  W = 1'b0;  Z = 1'b1;
        #1      X = 1'b1;  Y = 1'b1;  W = 1'b1;  Z = 1'b0;
        #1      X = 1'b1;  Y = 1'b1;  W = 1'b1;  Z = 1'b1;
    end 

endmodule  
