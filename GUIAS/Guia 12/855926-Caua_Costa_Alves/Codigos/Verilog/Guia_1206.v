// ------------------------------
// --- Memória RAM 4x16
// Autor: Cauã Costa Alves
// Matrícula: 855926
// -----------------------------

`include "Guia_1204.v"  
`include "mux2x1.v"  
`include "demux1x2.v" 

module Guia_1206 (
    output [15:0] o,     
    input [1:0] address, 
    input rw,           
    input clock,         
    input clear,         
    input [15:0] i       
);

    wire [7:0] o1, o2; 
    wire dm;          

    demux1x2 DM1x2_1 (dm, address[1], address[0]);

    Guia_1204 RAM4x8_1 (
        o1, 
        address[0],    
        rw, 
        clock, 
        clear, 
        i[7:0]        
    );

    Guia_1204 RAM4x8_2 (
        o2, 
        address[0],   
        rw, 
        clock, 
        clear, 
        i[15:8]      
    );

    assign o = {o2, o1};

endmodule // ram4x16
