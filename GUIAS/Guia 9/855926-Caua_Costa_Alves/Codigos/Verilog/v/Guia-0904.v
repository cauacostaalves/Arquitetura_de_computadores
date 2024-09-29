// ------------------------- 
// Guia_0904.v
// Pulse Generator with Frequency 4x of the Clock 
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
        #3 signal = 1'b0; 
        #3 signal = 1'b1; 
        #3 signal = 1'b0; 
    end // pulse_gen
endmodule // pulse

module Guia_0904; 
    wire  clock; 
    clock clk ( clock ); 
    
    wire  p; 
    pulse pls ( p, clock ); 
    
    initial begin : main 
        $dumpfile ( "Guia_0904.vcd" ); 
        $dumpvars ( 1, clock, p ); 
        
        #480 $finish; 
    end // main
endmodule // Guia_0904
