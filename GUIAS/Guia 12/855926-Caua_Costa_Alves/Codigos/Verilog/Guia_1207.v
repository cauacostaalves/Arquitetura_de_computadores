// ------------------------------
// --- Memória RAM 8x8
// Autor: Cauã Costa Alves
// Matrícula: 855926
// -----------------------------

`include "Guia_1204.v"  
`include "mux4x1.v"  
`include "demux1x2.v" 

module Guia_1207 (
    output [15:0] o,      
    input [2:0] address,  
    input rw,             
    input clock,          
    input clear,         
    input [15:0] i       
);

    wire [3:0] enable; 
    wire [7:0] outputs[0:1]; 

    demux1x2 DM1x2_1 (enable[0], enable[1], address[2], rw); 

    Guia_1204 RAM4x8_0 (
        outputs[0], enable[0], clock, clear, i[7:0] 
    );
    
    Guia_1204 RAM4x8_1 (
        outputs[1], enable[1], clock, clear, i[15:8] 
    );

    assign o = (address[2] == 0) ? {outputs[0], outputs[1]} : 
               (address[2] == 1) ? {outputs[0], outputs[1]} :
               (address[2] == 2) ? {outputs[0], outputs[1]} :
               (address[2] == 3) ? {outputs[0], outputs[1]} :
               (address[2] == 4) ? {outputs[0], outputs[1]} :
               (address[2] == 5) ? {outputs[0], outputs[1]} :
               (address[2] == 6) ? {outputs[0], outputs[1]} :
               {outputs[0], outputs[1]}; 

endmodule // ram8x16
