// ------------------------- 
// Nome: Cauã Costa Alves 
// Matricula: 855926 
// ------------------------- 

module Rec0101f (output s, 
                 input  X, 
                 input  Y, 
                 input  W, 
                 input  Z);
    wire term1, term2, term3, term4, term5; // Saídas dos termos intermediários

    // Implementação das NORs
    nor n1(term1, X, Y);                // (X + Y)'
    nor n2(term2, X, ~Z);               // (X + ~Z)'
    nor n3(term3, X, ~W);               // (X + ~W)'
    nor n4(term4, ~W, ~Z);              // (~W + ~Z)'
    nor n5(term5, Y, ~W);               // (Y + ~W)'

    // Saída da expressão usando NOR
    nor n6(s, term1, term2, term3, term4, term5); // ((term1 + term2 + term3 + term4 + term5)')

endmodule 

module test_Rec0101f; 
// ------------------------- definir dados 
    reg  X; 
    reg  Y; 
    reg  W; 
    reg  Z; 
    wire s;  

    Rec0101f modulo06 (s, X, Y, W, Z); 

// ------------------------- parte principal 
    initial 
    begin : main 
        $display("Rec0101f - Cauã Costa Alves - 855926"); 
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
