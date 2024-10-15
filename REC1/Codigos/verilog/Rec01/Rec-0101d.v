// ------------------------- 
// Nome: Cauã Costa Alves 
// Matricula: 855926 
// ------------------------- 

module Rec0101d (output s, 
                 input  X, 
                 input  Y, 
                 input  W, 
                 input  Z);
    wire term1, term2, term3, term4, term5; // Saídas dos termos

    // Termos da expressão
    assign term1 = X | Y;                   // X + Y
    assign term2 = X | ~Z;                  // X + not(Z)
    assign term3 = X | ~W;                  // X + not(W)
    assign term4 = ~W | ~Z;                 // not(W) + not(Z)
    assign term5 = Y | ~W;                  // Y + not(W)

    // Saída da expressão
    assign s = term1 & term2 & term3 & term4 & term5; // (X + Y) . (X + not(Z)) . (X + not(W)) . (not(W) + not(Z)) . (Y + not(W))
endmodule 

module test_Rec0101d; 
// ------------------------- definir dados 
    reg  X; 
    reg  Y; 
    reg  W; 
    reg  Z; 
    wire s;  

    Rec0101d modulo06 (s, X, Y, W, Z); 

// ------------------------- parte principal 
    initial 
    begin : main 
        $display("Rec0101d - Cauã Costa Alves - 855926"); 
        $display("   X    Y    W    Z    s"); 
        
        $monitor("%4b %4b %4b %4b %4b", X, Y, W, Z, s); 

        X = 1'b0;  Y = 1'b0;  W = 1'b0;  Z = 1'b0;
        #1      X = 1'b0;  Y = 1'b0;  W = 1'b0;  Z = 1'b1;
        #1      X = 1'b0;  Y = 1'b0;  W = 1'b1;  Z = 1'b0;
        #1      X = 1'b0;  Y = 1'b0;  W = 1'b1;  Z = 1'b1;
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
