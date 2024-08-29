
module Guia_0204;
    // define data
    reg [7:0] b1 = 8'b00101000;
    reg [7:0] b2 = 8'b00110011;
    reg [7:0] b3 = 8'b01111101; 
    reg [7:0] b4 = 8'b11111000; 
    reg [15:0] b5 = 16'b1111101010111110;

    // actions
    initial
        begin : main
            $display("Exercicio 04");

            $display("b = 0.%b (2)", b1);

            $display("b = 0.%o (4)", b2);

            $display("b = 0.%b (2)", b3);

            $display("b = %o.%o (4)", b4[7:5], b4[4:2]);

            $display("b = %x (16)", b5);
        end // main
endmodule // Guia_0204
