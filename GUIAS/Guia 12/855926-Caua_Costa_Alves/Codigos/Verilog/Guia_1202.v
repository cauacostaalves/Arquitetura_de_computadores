// ------------------------------
// --- Memória RAM 1x8
// Autor: Cauã Costa Alves 
// Matrícula: 855926
// -----------------------------

`include "Guia_1201.v"

module Guia_1202 ( output o1, output o2, output o3, output o4, output o5, output o6, output o7, output o8,
                input address, input rw, input clock, input clear,
                input i1, input i2, input i3, input i4, input i5, input i6, input i7, input i8 );
    // descrição por portas lógicas
    Guia_1201 RAM1x4_1 ( o1, o2, o3, o4, address, rw, clock, clear, i1, i2, i3, i4 );
    Guia_1201 RAM1x4_2 ( o5, o6, o7, o8, address, rw, clock, clear, i5, i6, i7, i8 );
endmodule // ram1x8