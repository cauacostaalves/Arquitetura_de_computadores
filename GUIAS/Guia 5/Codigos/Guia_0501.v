
module f5b_nor (output s, input a, input b);
    wire not_a;

    // NOR para ~a, que é a negação de a
    nor (not_a, a, a);      // not_a = ~a

    // NOR para ~a e b, inversão direta da operação
    nor (s, not_a, b);     // s = ~(~a OR b) = ~ (~a & b)
    
endmodule // f5b_nor

module test_f5; 
    // ------------------------- definir dados 
    reg  x; 
    reg  y; 
    wire s; 
    
    // Instância do módulo f5b_nor
    f5b_nor moduloB (s, x, y); 
    
    // ------------------------- parte principal 
    initial begin : main
        $display("Guia_0500 - xxx yyy zzz - 999999"); 
        $display("Test module"); 
        $display("   x     y     s"); 
        
        // Projetar testes do módulo 
        $monitor("%4b %4b %4b", x, y, s); 
        
        // Testar o módulo
        x = 1'b0;  y = 1'b0; 
        #1 x = 1'b0;  y = 1'b1; 
        #1 x = 1'b1;  y = 1'b0; 
        #1 x = 1'b1;  y = 1'b1; 
        
        // Finalizar a simulação
        #1 $finish;
    end 
    
endmodule // test_f5
