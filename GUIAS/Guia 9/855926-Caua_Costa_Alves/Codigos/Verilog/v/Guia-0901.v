// ------------------------- 
// Guia_0901.v 
// Pulse and Trigger Generator 
// Nome: Cauã Costa Alves 
// Matricula: 855926
// ------------------------- 

module pulse_generator ( output pulse );
    reg pulse;
    
    initial begin : start
        pulse = 1'b0; 
    end // start

    always begin : pulse_gen 
        #25 pulse = 1'b1; 
        #25 pulse = 1'b0; 
    end // pulse_gen
endmodule // pulse_generator

module trigger_generator ( output trigger );
    reg trigger;
    
    initial begin : start
        trigger = 1'b0; 
    end // start

    always begin : trigger_gen 
        #100 trigger = 1'b1; 
        #10 trigger = 1'b0; 
        #90 trigger = 1'b1; 
        #10 trigger = 1'b0; 
    end // trigger_gen
endmodule // trigger_generator

module Guia_0901; 
    wire pulse; 
    wire trigger; 
    
    pulse_generator PG1 ( pulse ); 
    trigger_generator TG1 ( trigger ); 
    
    initial begin : main 
        $dumpfile ( "Guia_0901.vcd" ); 
        $dumpvars; 
        #500 $finish; 
    end // main
endmodule // Guia_0901
