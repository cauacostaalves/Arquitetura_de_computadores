// ------------------------- 
// Guia_0903.v
// Pulse Generator with Frequency 1/3 of the Clock 
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
        signal = 1'b1; 
        #12 signal = 1'b0; 
        #12 signal = 1'b1; 
        #12 signal = 1'b0; 
    end // pulse_gen
endmodule // pulse

module Guia_0903; 
    wire  clock; 
    clock clk ( clock ); 
    
    wire  p; 
    pulse pls ( p, clock ); 
    
    initial begin : main 
        $dumpfile ( "Guia_0903.vcd" ); 
        $dumpvars ( 1, clock, p ); 
        
        #480 $finish; 
    end // main
endmodule // Guia_0903
