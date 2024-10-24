// ------------------------------
// --- Memória RAM 8x8
// Autor: Cauã Costa Alves
// Matrícula: 855926
// -----------------------------

`include "Guia_1204.v"  
`include "mux2x1.v"  
`include "demux1x2.v" 

module Guia_1205 (
    output [7:0] o,    
    input [2:0] address, 
    input rw,          
    input clock,        
    input clear,       
    input [7:0] i       
);

    wire [7:0] o1, o2; 
    wire dm;           

    demux1x2 DM1x2_1 (dm, address[2], address[1:0]);

    Guia_1204 RAM4x8_1 (o1, address[1:0], rw, clock, clear, i);
    Guia_1204 RAM4x8_2 (o2, address[1:0], rw, clock, clear, i);

    mux2x1 MUX_1 (
        o, 
        o1, o2, 
        dm       
    );

endmodule // ram8x8
