// ----------------
// --- Mealy_1001
// ----------------
module Mealy_1001 (
    output reg y, // Saída indicando se a sequência foi encontrada
    input x,      // Entrada de dados (0 ou 1)
    input clk,    // Sinal de clock
    input reset   // Sinal de reset
);

    // Constantes para os estados
    parameter start = 2'b00;
    parameter id1   = 2'b01;
    parameter id10  = 2'b10;
    parameter id100 = 2'b11;

    // Variáveis de estado
    reg [1:0] E1;
    reg [1:0] E2;

    // Lógica da máquina de estados
    always @( posedge clk or negedge reset ) begin
        if ( reset == 1'b0 ) begin
            E1 <= start;
            y <= 1'b0;
        end else begin
            E1 <= E2;
            case( E1 )
                start: begin
                    if ( x == 1'b1 ) begin
                        E2 = id1;
                        y = 1'b0;
                    end else begin
                        E2 = start;
                    end
                end
                id1: begin
                    if ( x == 1'b0 ) begin
                        E2 = id10;
                    end else begin
                        E2 = start;
                    end
                end
                id10: begin
                    if ( x == 1'b0 ) begin
                        E2 = id100;
                    end else begin
                        E2 = start;
                    end
                end
                id100: begin
                    if ( x == 1'b1 ) begin
                        E2 = start;
                        y = 1'b1; // Sequência "1001" encontrada
                    end else begin
                        E2 = start;
                    end
                end
                default: begin
                    E2 = start;
                end
            endcase
        end
    end

endmodule // Mealy_1001

// ----------------
// --- Teste
// ----------------
module Guia_1102; 
    reg   clk, reset, x; 
    wire  m1; 

    Mealy_1001 mealy1 ( m1, x, clk, reset ); 

    initial begin
        $display ( "Time     X   Mealy" ); 
        // initial values 
        clk   = 1; 
        reset = 0; 
        x     = 0; 

        // input signal changing 
        #5   reset = 1; 
        #10  x = 1; 
        #10  x = 0; 
        #10  x = 0; 
        #10  x = 1; 
        #20  x = 0; 
        #10  x = 1; 
        #10  x = 0; 
        #10  x = 1; 

        #30 $finish; 
    end // initial 

    always 
        #5 clk = ~clk; 

    always @( posedge clk ) begin 
        $display ( "%4d  %4b  %4b", $time, x, m1 ); 
    end // always at positive edge clocking changing 

endmodule // Guia_1102
