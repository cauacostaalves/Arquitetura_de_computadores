
module f5_nand (
    output s,
    input a,
    input b
);
    wire not_b;
    wire a_and_not_b;
    wire a_or_not_b;

    // Inverter b para obter ~b usando NAND
    nand (not_b, b, b);
    
    // Calcular a & ~b usando NAND
    nand (s,  a, not_b);
    
  
endmodule // f5_nand


module test_f5; 
    // ------------------------- definir dados 
    reg x; 
    reg y; 
    wire s; 
    
    // Instância do módulo f5_nand
    f5_nand moduloB (s, x, y); 
    
    // ------------------------- parte principal 
    initial begin : main
        $display("Guia_0502 - Cauã Costa ALves -855926"); 
        $display("Test module Nand"); 
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
