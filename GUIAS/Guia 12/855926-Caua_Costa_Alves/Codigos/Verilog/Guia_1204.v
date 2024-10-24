// ------------------------------
// --- Memória RAM 4x8
// Autor: Cauã Costa Alves
// Matrícula: 855926
// -----------------------------

`include "Guia_1203.v"  
`include "mux4x1.v" 
`include "demux1x4.v" 

module Guia_1204 (
    output [7:0] o,  
    input [1:0] address, 
    input rw,        
    input clock,      
    input clear,      
    input [7:0] i     
);

    wire [7:0] o1, o2; 
    wire [1:0] dm;     

    demux1x4 DM1x4_1 (dm[0], dm[1], dm[2], dm[3], address[1], address[0]);

    Guia_1203 RAM2x8_1 (o1, address[0], rw, clock, clear, i);
    Guia_1203 RAM2x8_2 (o2, address[0], rw, clock, clear, i);

    mux4x1 MUX_1 (
        o, 
        o1, o2,   
        {8{dm[0]}}, 
        {8{dm[1]}}, 
        {8{dm[2]}}, 
        {8{dm[3]}}  
    );

endmodule // ram4x8
