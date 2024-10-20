// ----------------
// --- Mealy_Alternating_Seq (Reconhece 010 ou 101)
// ----------------
module Mealy_Alternating_Seq (
    output reg y, // Saída indicando se a sequência foi encontrada
    input x,      // Entrada de dados (0 ou 1)
    input clk,    // Sinal de clock
    input reset   // Sinal de reset
);

    // Definição de estados
    parameter start = 3'b000;
    parameter id0   = 3'b001; // Detectou 0
    parameter id01  = 3'b010; // Detectou 01
    parameter id1   = 3'b011; // Detectou 1
    parameter id10  = 3'b100; // Detectou 10

    // Variáveis de estado
    reg [2:0] E1;  // Estado atual
    reg [2:0] E2;  // Próximo estado

    // Lógica da máquina de estados
    always @(posedge clk or negedge reset) begin
        if (reset == 1'b0) begin
            E1 <= start;
            y  <= 1'b0; // Saída inicial é 0
        end else begin
            E1 <= E2;
        end
    end

    // Lógica de transição de estados
    always @(E1 or x) begin
        case (E1)
            start: begin
                if (x == 1'b0) begin
                    E2 = id0;
                    y  = 1'b0;
                end else begin
                    E2 = id1;
                    y  = 1'b0;
                end
            end
            id0: begin
                if (x == 1'b1) begin
                    E2 = id01;
                    y  = 1'b0;
                end else begin
                    E2 = id0;
                    y  = 1'b0;
                end
            end
            id01: begin
                if (x == 1'b0) begin
                    E2 = id0;
                    y  = 1'b1; // Detectou a sequência 010
                end else begin
                    E2 = start;
                    y  = 1'b0;
                end
            end
            id1: begin
                if (x == 1'b0) begin
                    E2 = id10;
                    y  = 1'b0;
                end else begin
                    E2 = id1;
                    y  = 1'b0;
                end
            end
            id10: begin
                if (x == 1'b1) begin
                    E2 = id1;
                    y  = 1'b1; // Detectou a sequência 101
                end else begin
                    E2 = start;
                    y  = 1'b0;
                end
            end
            default: begin
                E2 = start;
                y  = 1'b0;
            end
        endcase
    end
endmodule // Mealy_Alternating_Seq

// ----------------
// --- Teste
// ----------------
module Guia_1105; 
    reg   clk, reset, x; 
    wire  m1; 

    Mealy_Alternating_Seq mealy_seq (m1, x, clk, reset); 

    initial begin
        $display ("Time     X   Mealy"); 
        // Valores iniciais 
        clk   = 1; 
        reset = 0; 
        x     = 0; 

        // Mudança no sinal de entrada 
        #5   reset = 1; 
        #10  x = 0;  // Inicia a sequência com 0
        #10  x = 1;  // Detecta 01
        #10  x = 0;  // Detecta 010
        #10  x = 1;  // Reinicia com 1
        #10  x = 0;  // Detecta 10
        #10  x = 1;  // Detecta 101
        #10  x = 0;  // Reinicia com 0
        #10  x = 1; 
        #10  x = 0; 

        #30 $finish; 
    end // initial 

    always 
        #5 clk = ~clk; 

    always @(posedge clk) begin 
        $display ("%4d  %4b  %4b", $time, x, m1); 
    end // always at positive edge clocking changing 

endmodule // Guia_1105
