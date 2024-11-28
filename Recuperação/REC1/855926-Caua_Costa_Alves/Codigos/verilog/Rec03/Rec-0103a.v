// -------------------------  
// Nome: Cauã Costa Alves 
// Matricula: 855926 
// ------------------------- 

module Rec0103a (output s, 
                 input  a, 
                 input  b,
                 input  c);
    assign s = (~a | b) & (b | ~c);
endmodule 

module test_Rec0103a; 
// ------------------------- definir dados 
    reg  a; 
    reg  b; 
    reg  c;
    wire s;  

    Rec0103a modulo06 (s, a, b, c); 

// ------------------------- parte principal 
    initial 
    begin : main 
        $display("Rec0103a - Cauã Costa Alves - 855926"); 
        $display("   a    b    c    s"); 
        
        $monitor("%4b %4b %4b %4b", a, b, c, s); 

        a = 1'b0;  b = 1'b0;  c = 1'b0;
        #1      a = 1'b0;  b = 1'b0;  c = 1'b1;
        #1      a = 1'b0;  b = 1'b1;  c = 1'b0;
        #1      a = 1'b0;  b = 1'b1;  c = 1'b1;
        #1      a = 1'b1;  b = 1'b0;  c = 1'b0;
        #1      a = 1'b1;  b = 1'b0;  c = 1'b1;
        #1      a = 1'b1;  b = 1'b1;  c = 1'b0;
        #1      a = 1'b1;  b = 1'b1;  c = 1'b1;
    end 

endmodule  
