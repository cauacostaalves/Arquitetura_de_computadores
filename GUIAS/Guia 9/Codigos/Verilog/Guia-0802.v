// -------------------------
// Guia_0802 - SUBTRATOR COMPLETO
// Nome: Cauã Costa Alves
// Matricula: 855926
// -------------------------

// -------------------------
// half difference
// -------------------------
module halfDifference (
    output d,          // diferença
    output borrow,     // empréstimo
    input a,           // minuendo
    input b            // subtraendo
);
    xor (d, a, b);      // diferença
    not (a_not, a);     // a invertido
    and (borrow, a_not, b); // empréstimo
endmodule // halfDifference

// -------------------------
// full subtractor
// -------------------------
module fullSubtractor (
    output d,          // diferença
    output borrowOut,  // empréstimo de saída
    input a,           // minuendo
    input b,           // subtraendo
    input borrowIn     // empréstimo de entrada
);
    wire d_half, b1, b2; // interconexões

    // Instanciando meia-diferença
    halfDifference HD1 (.d(d_half), .borrow(b1), .a(a), .b(b));
    halfDifference HD2 (.d(d), .borrow(b2), .a(d_half), .b(borrowIn));
    
    // Calculando o empréstimo de saída
    or (borrowOut, b1, b2);
endmodule // fullSubtractor

// -------------------------
// 5-bit subtractor
// -------------------------
module fiveBitSubtractor (
    output [4:0] diff,   // diferença
    output borrowOut,     // empréstimo de saída
    input [4:0] a,       // minuendo
    input [4:0] b        // subtraendo
);
    wire [4:0] borrow; // empréstimos entre os subtratores

    fullSubtractor FS0 (.d(diff[0]), .borrowOut(borrow[0]), .a(a[0]), .b(b[0]), .borrowIn(1'b0));
    fullSubtractor FS1 (.d(diff[1]), .borrowOut(borrow[1]), .a(a[1]), .b(b[1]), .borrowIn(borrow[0]));
    fullSubtractor FS2 (.d(diff[2]), .borrowOut(borrow[2]), .a(a[2]), .b(b[2]), .borrowIn(borrow[1]));
    fullSubtractor FS3 (.d(diff[3]), .borrowOut(borrow[3]), .a(a[3]), .b(b[3]), .borrowIn(borrow[2]));
    fullSubtractor FS4 (.d(diff[4]), .borrowOut(borrowOut), .a(a[4]), .b(b[4]), .borrowIn(borrow[3]));
endmodule // fiveBitSubtractor

// -------------------------
// Testbench
// -------------------------
module test_fiveBitSubtractor;
    reg [4:0] x; // minuendo
    reg [4:0] y; // subtraendo
    wire [4:0] diff; // diferença
    wire borrowOut; // empréstimo de saída

    fiveBitSubtractor FBS (.diff(diff), .borrowOut(borrowOut), .a(x), .b(y));

    initial begin
        // Exibir cabeçalho
        $display("Guia_0802 - Cauã Costa Alves - 855926");
        $display("Testando o subtrator de 5 bits");

        // Testes
        x = 5'b00000; y = 5'b00000; #10;
        $display("x = %b, y = %b => diff = %b, borrowOut = %b", x, y, diff, borrowOut);

        x = 5'b00001; y = 5'b00001; #10;
        $display("x = %b, y = %b => diff = %b, borrowOut = %b", x, y, diff, borrowOut);

        x = 5'b00010; y = 5'b00001; #10;
        $display("x = %b, y = %b => diff = %b, borrowOut = %b", x, y, diff, borrowOut);

        x = 5'b10011; y = 5'b01010; #10;
        $display("x = %b, y = %b => diff = %b, borrowOut = %b", x, y, diff, borrowOut);

        x = 5'b00000; y = 5'b00001; #10;
        $display("x = %b, y = %b => diff = %b, borrowOut = %b", x, y, diff, borrowOut);
        
        $finish; // Finalizar simulação
    end
endmodule // test_fiveBitSubtractor
