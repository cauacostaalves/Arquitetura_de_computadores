// ------------------------- 
// Guia_0905.v
// Pulse Generator with Width of 4 Time Units 
// Nome: Cauã Costa Alves 
// Matricula: 855926
// ------------------------- 

`include "clock.v"

module pulse ( signal, clock ); 
    input  clock; 
    output signal; 
    reg    signal; 
    
    always @ ( posedge clock ) 
    begin : pulse_gen
        signal = 1'b1;   // Define o sinal como alto
        #4 signal = 1'b0; // Aguarda 4 unidades de tempo antes de definir como baixo
    end // pulse_gen
endmodule // pulse

module Guia_0905; 
    wire  clock; 
    clock clk ( clock ); 
    
    wire  p; 
    pulse pls ( p, clock ); 
    
    initial begin : main 
        $dumpfile ( "Guia_0905.vcd" ); 
        $dumpvars ( 1, clock, p ); 
        
        #480 $finish; 
    end // main
endmodule // Guia_0905
