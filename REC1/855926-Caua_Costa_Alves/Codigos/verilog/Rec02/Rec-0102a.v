// ------------------------- 
// Nome: Cauã Costa Alves 
// Matricula: 855926 
// ------------------------- 

module Rec0102a (output s, 
                 input  a, 
                 input  c);
    assign s = a ? ~a : c; // Se a é 1, s = not(a); senão, s = c
endmodule 

module test_Rec0102a; 
// ------------------------- definir dados 
    reg  a; 
    reg  c; 
    wire s;  

    Rec0102a modulo06 (s, a, c); 

// ------------------------- parte principal 
    initial 
    begin : main 
        $display("Rec-0102a - Cauã Costa Alves - 855926"); 
        $display("   a    c    s"); 
        
        $monitor("%4b %4b %4b", a, c, s); 

        a = 1'b0;  c = 1'b0;
        #1      a = 1'b0;  c = 1'b1;
        #1      a = 1'b1;  c = 1'b0;
        #1      a = 1'b1;  c = 1'b1;
    end 

endmodule  
