// ------------------------- 
// Nome: Cauã Costa Alves 
// Matricula: 855926 
// ------------------------- 

module Rec0102b (output s, 
                 input  a, 
                 input  b, 
                 input  c);
    wire mux_a; // Saída do MUX interno

    // MUX interno: (a, not(a), b)
    assign mux_a = a ? ~a : b; // Se a é 1, s = not(a); senão, s = b

    // MUX externo: (c, not(c), mux_a)
    assign s = c ? ~c : mux_a; // Se c é 1, s = not(c); senão, s = mux_a
endmodule 

module test_Rec0102b; 
// ------------------------- definir dados 
    reg  a; 
    reg  b; 
    reg  c; 
    wire s;  

    Rec0102b modulo06 (s, a, b, c); 

// ------------------------- parte principal 
    initial 
    begin : main 
        $display("Rec0102b - Cauã Costa Alves - 855926"); 
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
